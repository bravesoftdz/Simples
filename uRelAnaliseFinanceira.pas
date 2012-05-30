unit uRelAnaliseFinanceira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinBoxCtrls, Mask, bsSkinCtrls, ExtCtrls, ToolWin,
  ComCtrls,uFormBase, RDprint, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TfrmRelAnaliseFinanceira = class(TFormBase)
    bsSkinCoolBar1: TbsSkinCoolBar;
    bsSkinToolBar1: TbsSkinToolBar;
    btnFechar: TbsSkinSpeedButton;
    bsSkinBevel1: TbsSkinBevel;
    btnok: TbsSkinSpeedButton;
    bsSkinBevel2: TbsSkinBevel;
    PanelConsulta: TbsSkinPanel;
    lblTurma: TbsSkinStdLabel;
    dtpData_Fim: TbsSkinDateEdit;
    dtpData_Ini: TbsSkinDateEdit;
    cmbPeriodo: TbsSkinComboBox;
    Label1: TLabel;
    impMatricial: TRDprint;
    qryRelatorio: TSQLQuery;
    cdsRelatorio: TClientDataSet;
    dspRelatorio: TDataSetProvider;
    procedure btnokClick(Sender: TObject);
    procedure impMatricialNewPage(Sender: TObject; Pagina: Integer);
    procedure btnFecharClick(Sender: TObject);
    procedure cmbPeriodoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    pvilinha : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAnaliseFinanceira: TfrmRelAnaliseFinanceira;

implementation

uses uPrincipal,uFuncoes,SqlTimSt;

{$R *.dfm}

procedure TfrmRelAnaliseFinanceira.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmRelAnaliseFinanceira.btnokClick(Sender: TObject);
Var ldData_Ini : TDatetime;
    ldData_Fim : TDateTime;
    TotalRecebido : Real;
    Participacao : Real;
    TotalReceita : Real;
begin
   gsTituloRel  := 'Relatorio Analise Financeira ';
   gsPeriodoRel := 'Periodo de '+FormatDateTime('dd/mm/yyyy',ldData_Ini)+' a '+FormatDateTime('dd/mm/yyyy',ldData_Fim);

   ldData_Ini := StrToDateTime(DateTimeToStr(dtpData_Ini.Date)+' 00:00:00');
   ldData_Fim := StrToDateTime(DateTimeToStr(dtpData_Fim.Date)+' 23:59:00');

   qryRelatorio.Close;
   qryRelatorio.SQL.text:='select Tipo.Descricao, Sum(Ven.Vlr_total) as Total '+
                          'from T_Vendas  ven '+
                          '     left join T_TipoVendas Tipo on Tipo.codigo=Ven.Cod_tipoVenda '+
                          'where ( Data_Venda>=:parData_vendaini and Data_venda<=:pardata_vendaFim ) '+
                          'group by Ven.Cod_TipoVenda,Tipo.Descricao ';
   qryRelatorio.ParamByName('parData_VendaIni').AsSqlTimeStamp := DatetimeToSqlTimeStamp(ldData_Ini);
   qryRelatorio.ParamByName('pardata_vendaFim').AsSqlTimeStamp := DatetimeToSqlTimeStamp(ldData_Fim);

   cdsRelatorio.Close;
   cdsRelatorio.Open;

   ImpMatricial.PortaComunicacao          := 'LPT1';
   ImpMatricial.OpcoesPreview.Preview     := true;
   ImpMatricial.TamanhoQteLinhas          := 66;
   ImpMatricial.TamanhoQteColunas         := 80;
   ImpMatricial.FonteTamanhoPadrao        := s10cpp;
   ImpMatricial.UsaGerenciadorImpr        := False;
   ImpMatricial.UsaGerenciadorImpr        := True;
   ImpMatricial.Abrir;

   TotalRecebido := 0;
   cdsRelatorio.First;
   while not cdsRelatorio.Eof Do
   Begin
      impmatricial.Imp(pvilinha,001,cdsRelatorio.fieldByname('Descricao').AsString );
      impmatricial.ImpD(pvilinha,060,FormatFloat(',0.00',cdsRelatorio.fieldByname('Total').Asfloat) ,[]);
      pvilinha := pvilinha+1;
      TotalRecebido := TotalRecebido + cdsRelatorio.fieldByname('Total').Asfloat;
      cdsRelatorio.Next;
   End;
   ImpMatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha+1;
   impmatricial.Imp(pvilinha,001,'Venda Bruta do Periodo....');
   impmatricial.ImpD(pvilinha,060,FormatFloat(',0.00',TotalRecebido),[]);
   pvilinha := pvilinha+1;
   ImpMatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha+1;

   qryRelatorio.Close;
   qryRelatorio.SQL.text:='Select mov.Cod_FormaPagamento,max(Pag.Descricao) As Descricao, Sum(mov.Valor) As Total '+
                                           'From T_movCaixa mov '+
                                           '     Left Join T_FormasPagamento Pag on Pag.Codigo=Mov.Cod_FormaPagamento '+
                                           'Where D_C='+QuotedStr('C')+' and mov.estornado<>'+QuotedStr('S')+' and '+
                                           '      Data_Lancamento>=:parData_Ini and Data_Lancamento<=:parData_Fim '+
                                           'Group by mov.Cod_FormaPagamento '+
                                           'Order by 3 desc ';


   qryRelatorio.ParamByName('parData_Ini').AsSqlTimeStamp := DatetimeToSqlTimeStamp(ldData_Ini);
   qryRelatorio.ParamByName('parData_Fim').AsSqlTimeStamp := DatetimeToSqlTimeStamp(ldData_Fim);

   cdsRelatorio.Close;
   cdsRelatorio.Open;

   TotalReceita := 0;
   cdsRelatorio.First;
   while not cdsRelatorio.Eof Do
   Begin
      impmatricial.Imp(pvilinha,001,cdsRelatorio.fieldByname('Descricao').AsString );
      impmatricial.ImpD(pvilinha,060,FormatFloat(',0.00',cdsRelatorio.fieldByname('Total').Asfloat) ,[]);
      pvilinha := pvilinha+1;
      TotalReceita := TotalReceita + cdsRelatorio.fieldByname('Total').Asfloat;
      cdsRelatorio.Next;
   End;
   ImpMatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha+1;
   impmatricial.Imp(pvilinha,001,'Receita do Periodo....');
   impmatricial.ImpD(pvilinha,060,FormatFloat(',0.00',TotalReceita),[]);
   pvilinha := pvilinha+1;
   ImpMatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha+1;

   qryRelatorio.Close;
   qryRelatorio.SQL.text:= 'Select mov.Cod_TipoDespesa,max(Ope.Descricao) As Descricao, Sum(mov.Valor) As Total '+
                                           'From T_movCaixa mov '+
                                           '     Left Join T_operacoes Ope on Ope.Codigo=Mov.cod_tipodespesa '+
                                           'Where D_C='+QuotedStr('D')+' and mov.estornado<>'+QuotedStr('S')+' and '+
                                           '      Data_Lancamento>=:parData_Ini and Data_Lancamento<=:parData_Fim '+
                                           'Group by mov.Cod_TipoDespesa '+
                                           'Order by 1 ';

   qryRelatorio.ParamByName('parData_Ini').AsSqlTimeStamp := DatetimeToSqlTimeStamp(ldData_Ini);
   qryRelatorio.ParamByName('parData_Fim').AsSqlTimeStamp := DatetimeToSqlTimeStamp(ldData_Fim);

   cdsRelatorio.Close;
   cdsRelatorio.Open;

   TotalRecebido := 0;
   cdsRelatorio.First;
   while not cdsRelatorio.Eof Do
   Begin
      impmatricial.Imp(pvilinha,001,cdsRelatorio.fieldByname('Cod_TipoDespesa').AsString+'-'+cdsRelatorio.fieldByname('Descricao').AsString );
      impmatricial.ImpD(pvilinha,060,FormatFloat(',0.00',cdsRelatorio.fieldByname('Total').Asfloat) ,[]);
      pvilinha := pvilinha+1;
      TotalRecebido := TotalRecebido + cdsRelatorio.fieldByname('Total').Asfloat;
      cdsRelatorio.Next;
   End;
   ImpMatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha+1;
   impmatricial.Imp(pvilinha,001,'Total de Despesas no Periodo....');
   impmatricial.ImpD(pvilinha,060,FormatFloat(',0.00',TotalRecebido),[]);
   pvilinha := pvilinha+2;
   impmatricial.Imp(pvilinha,001,'Lucro Operacional....');
   impmatricial.ImpD(pvilinha,060,FormatFloat(',0.00',(TotalReceita-TotalRecebido)),[]);
   pvilinha := pvilinha+2;
   ImpMatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   ImpMatricial.Fechar;
end;

procedure TfrmRelAnaliseFinanceira.cmbPeriodoChange(Sender: TObject);
begin
   ListaPeriodo2( TbsSkinDateEdit( dtpData_Ini ), TbsSkinDateEdit( dtpData_Fim ), cmbperiodo.ItemIndex,gsData_Mov );
end;

procedure TfrmRelAnaliseFinanceira.FormShow(Sender: TObject);
begin
   cmbPeriodoChange(Sender);
   cmbPeriodo.ItemIndex:=14;
end;

procedure TfrmRelAnaliseFinanceira.impMatricialNewPage(Sender: TObject; Pagina: Integer);
begin
   ConfiguraRel( Name, True, TRdPrint( Sender ), Pagina );
   pviLinha := 08;
end;

end.