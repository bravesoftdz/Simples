unit uInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, bsSkinCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, bsdbctrls, StdCtrls, Mask, bsSkinBoxCtrls, ComCtrls, bsSkinTabs,uFormBase,
  ExtCtrls, ToolWin, Menus, bsSkinMenus, FMTBcd, Provider, SqlExpr, DBClient,
  RDprint, dxSkinsCore, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TfrmInventario = class(TFormBase)
    bsSkinCoolBar1: TbsSkinCoolBar;
    bsSkinToolBar1: TbsSkinToolBar;
    btnFechar: TbsSkinSpeedButton;
    bsSkinBevel1: TbsSkinBevel;
    btnok: TbsSkinSpeedButton;
    bsSkinBevel2: TbsSkinBevel;
    PagGeral: TbsSkinPageControl;
    TabInventario: TbsSkinTabSheet;
    bsSkinPanel3: TbsSkinPanel;
    bsSkinStdLabel7: TbsSkinStdLabel;
    bsSkinStdLabel8: TbsSkinStdLabel;
    edtProd_inv: TbsSkinEdit;
    cmbNome_ProdutoInv: TbsSkinDBLookupComboBox;
    edtQtde_inv: TbsSkinEdit;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton3: TbsSkinButton;
    cxGrid4: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    bsSkinExPanel1: TbsSkinExPanel;
    bsSkinStdLabel9: TbsSkinStdLabel;
    edtMotivoInventario: TbsSkinEdit;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bsSkinMenuSpeedButton1: TbsSkinMenuSpeedButton;
    cxGrid1: TcxGrid;
    GridDBInventario: TcxGridDBTableView;
    Column_Data_Cad: TcxGridDBColumn;
    Column_Motivo: TcxGridDBColumn;
    Column_Vlr_Total: TcxGridDBColumn;
    Column_Operador: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    bsSkinPanel1: TbsSkinPanel;
    bsSkinButton2: TbsSkinButton;
    cmbtipoconsulta: TbsSkinComboBox;
    EdtPesquisa: TbsSkinEdit;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    Clientes1: TMenuItem;
    ClientesSemCompras1: TMenuItem;
    cdsTempItensInventario: TClientDataSet;
    cdsTempItensInventarioCodigo: TIntegerField;
    cdsTempItensInventarioDescricao: TStringField;
    cdsTempItensInventarioPco_venda: TFloatField;
    cdsTempItensInventarioQuantidade: TIntegerField;
    cdsTempItensInventarioDiferenca: TIntegerField;
    cdsTempItensInventarioSaldo: TIntegerField;
    cdsTempItensInventariovlr_total: TFloatField;
    srcTempItensInventario: TDataSource;
    srcCadProdutos: TDataSource;
    cdsCadProdutos: TClientDataSet;
    qryVariavel: TSQLQuery;
    dspvariavel: TDataSetProvider;
    btnIncluir: TbsSkinSpeedButton;
    bsSkinBevel3: TbsSkinBevel;
    srcInventario: TDataSource;
    cdsInventario: TClientDataSet;
    dspInventario: TDataSetProvider;
    qryInventario: TSQLQuery;
    edtPco_venda: TbsSkinEdit;
    qryItensInventario: TSQLQuery;
    dspItensInventario: TDataSetProvider;
    cdsItensInventario: TClientDataSet;
    srcItensInventario: TDataSource;
    impMatricial: TRDprint;
    qryRelatorio: TSQLQuery;
    dspRelatorio: TDataSetProvider;
    cdsRelatorio: TClientDataSet;
    srcRelatorio: TDataSource;
    cdsPesquisa: TClientDataSet;
    srcPesquisa: TDataSource;
    cmbSetores: TbsSkinDBLookupComboBox;
    cdsSetores: TClientDataSet;
    srcSetores: TDataSource;
    procedure bsSkinButton3Click(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure impMatricialNewPage(Sender: TObject; Pagina: Integer);
    procedure bsSkinButton2Click(Sender: TObject);
    procedure edtProd_invExit(Sender: TObject);
    procedure cmbNome_ProdutoInvChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure ClientesSemCompras1Click(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
  private
    pviLinha : Integer;
    procedure AtualizarSaldoNoProduto(cdsDadosItens: TClientDataSet; SeqInventario : Integer);
    procedure AtualizarSaldoNoSetor(cdsDadosItens: TClientDataSet;
      SeqInventario: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;
var

  frmInventario: TfrmInventario;

implementation

uses uFuncoes,uPrincipal,uClassSaldo,uDaoSaldo;

{$R *.dfm}

procedure TfrmInventario.bsSkinButton1Click(Sender: TObject);
begin
  inherited;
   if CaixaMensagem( 'Deseja Exclir o Produto '+cdsTempItensInventario.FieldByname('Descricao').asString, ctConfirma, [ cbSimNao ], 0 )  Then
      cdsTempItensInventario.Delete;
end;

procedure TfrmInventario.bsSkinButton2Click(Sender: TObject);
begin
  inherited;
   qryVariavel.Close;
   qryVariavel.SQL.Text := 'SELECT Inv.SeqInventario, '+
                           '       Max(Inv.Data_Mov) as Data_Cad,'+
                           '       Max(Inv.Motivo) As Motivo, '+
                           '       Max(Inv.Operador) As Operador,'+
                           '       Sum(Itens.diferenca*Itens.Pco_Venda) as Vlr_Total '+
                           'FROM T_inventario Inv '+
                           '     Left Join T_itensinventario Itens on '+
                           '          Itens.SeqInventario=Inv.SeqInventario '+
                           'Group By Inv.SeqInventario ';

   cdsPesquisa.Close;
   cdsPesquisa.ProviderName := dspvariavel.Name;
   cdsPesquisa.Open;
end;

procedure TfrmInventario.bsSkinButton3Click(Sender: TObject);
var loDaoSaldo : TDaoSaldo;
    lrSaldo : Integer;
begin
   if cmbSetores.keyvalue=null then
   Begin
      CaixaMensagem( 'informe o setor primeiro ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;

   if strToInt(edtQtde_inv.Text)<0 then
   Begin
      CaixaMensagem( 'Valor do saldo n�o pode ser menior que zero ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;

   loDaoSaldo := TDaoSaldo.Create(gconexao);
   if cmbSetores.keyvalue>1 then
      lrSaldo := loDaoSaldo.RetornaSaldo(strToInt(edtProd_inv.Text),cmbSetores.keyvalue)
   else
      lrSaldo := cdsCadProdutos.FieldByName('Saldo').AsInteger;
   cdsTempItensInventario.Append;
   cdsTempItensInventario.FieldByName('Codigo').asInteger       := strToInt(edtProd_inv.Text);
   cdsTempItensInventario.FieldByName('Descricao').asString     := cmbNome_ProdutoInv.Text;
   cdsTempItensInventario.FieldByName('Pco_Venda').asfloat      := strTofloat(edtPco_venda.Text);
   cdsTempItensInventario.FieldByName('Quantidade').asInteger   := strToInt(edtQtde_inv.Text);
   cdsTempItensInventario.FieldByName('Diferenca').asInteger    := (lrSaldo - strToInt(edtQtde_inv.Text))*-1;
   cdsTempItensInventario.FieldByName('Saldo').asInteger        :=  lrSaldo;
   cdsTempItensInventario.FieldByName('Vlr_Total').asfloat      := (lrSaldo - strToInt(edtQtde_inv.Text))*strTofloat(edtPco_venda.Text);
   cdsTempItensInventario.post;
   edtQtde_inv.Text       := '0';
   edtProd_inv.Text       := '';
   cmbNome_ProdutoInv.KeyValue := Null;
   edtProd_inv.SetFocus;
end;

procedure TfrmInventario.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmInventario.btnIncluirClick(Sender: TObject);
begin
  PagGeral.ActivePageIndex := 1;
  btnOk.Enabled            := True;
  TabInventario.Enabled    := True;
  BtnIncluir.Enabled       := False;
  cdsTempItensInventario.EmptyDataSet;
  edtMotivoInventario.SetFocus;
end;

procedure TfrmInventario.btnokClick(Sender: TObject);
var liseqInventario : Integer;
begin
   if Trim(edtMotivoInventario.Text)='' then
   Begin
      CaixaMensagem( 'O motivo n�o pode ser vazio ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;

   if Trim(cmbSetores.Text)='' then
   Begin
      CaixaMensagem( 'O Setor n�o foi informado', ctAviso, [ cbOk ], 0 );
      Exit;
   End;

   liSeqInventario := StrToInt(Sequencia('SeqInventario',True,'T_Sequencias',FrmPrincipal.dbxPrincipal,'',False,8));

   QryInventario.Close;
   QryInventario.SQL.text := 'Select * from T_Inventario where 1=2';

   cdsInventario.Close;
   cdsInventario.ProviderName := dspInventario.Name;
   cdsInventario.Open;
   try


   cdsInventario.Append;
   cdsInventario.FieldByName('Cod_emp').AsString        := GsCod_Emp;
   cdsInventario.FieldByName('Data_Cad').AsDateTime     := Now;
   cdsInventario.FieldByName('Data_mov').AsDateTime     := GsData_mov;
   cdsInventario.FieldByName('SeqInventario').AsInteger := liSeqInventario;
   cdsInventario.FieldByName('Motivo').AsString         := edtMotivoInventario.text;
   cdsInventario.FieldByName('Operador').AsString       := gsOperador;
   cdsInventario.Post;
   cdsInventario.ApplyUpdates(0);

   QryItensInventario.Close;
   QryItensInventario.SQL.text := 'Select * from T_ItensInventario where 1=2';

   cdsItensInventario.Close;
   cdsItensInventario.ProviderName := dspItensInventario.Name;
   cdsItensInventario.Open;

   cdsTempItensInventario.First;
   while not cdsTempItensInventario.eof Do
   Begin
      if cmbSetores.KeyValue=1 then
         AtualizarSaldoNoProduto(cdsTempItensInventario,liSeqInventario)
      else
         AtualizarSaldoNoSetor(cdsTempItensInventario,liSeqInventario);

      cdsTempItensInventario.Next;
   End;

   except on E: Exception do
     CaixaMensagem( 'Um Erro Foi encontrado '+ E.Message, ctAviso, [ cbOk ], 0 );
   end;

   btnOk.Enabled            := False;
   btnIncluir.Enabled       := True;
   TabInventario.Enabled    := False;
   edtMotivoInventario.Text := '';
   PagGeral.ActivePageIndex := 0;                         
   cdsTempItensInventario.EmptyDataSet;
end;

procedure TfrmInventario.AtualizarSaldoNoProduto(cdsDadosItens : TClientDataSet; SeqInventario : Integer);
begin
   cdsItensInventario.Append;
   cdsItensInventario.FieldByName('Cod_emp').AsString          := GsCod_Emp;
   cdsItensInventario.FieldByName('Data_Cad').AsDateTime       := Now;
   cdsItensInventario.FieldByName('Data_mov').AsDateTime       := GsData_mov;
   cdsItensInventario.FieldByName('SeqInventario').AsInteger   := SeqInventario;
   cdsItensInventario.FieldByName('Operador').AsString         := gsOperador;
   cdsItensInventario.FieldByName('Diferenca').AsInteger       := cdsDadosItens.FieldByName('Diferenca').AsInteger;
   cdsItensInventario.FieldByName('Cod_Produto').AsInteger     := cdsDadosItens.FieldByName('Codigo').AsInteger;
   cdsItensInventario.FieldByName('Qtde_Inventario').AsInteger := cdsDadosItens.FieldByName('Quantidade').AsInteger;
   cdsItensInventario.FieldByName('Saldo').AsInteger           := cdsDadosItens.FieldByName('Saldo').AsInteger;
   if cdsDadosItens.FieldByName('Diferenca').AsInteger > 0 then
      cdsItensInventario.FieldByName('E_S').AsString           := 'E'
   Else
      cdsItensInventario.FieldByName('E_S').AsString           := 'S';
   cdsItensInventario.FieldByName('Pco_Venda').AsInteger       := cdsDadosItens.FieldByName('Pco_Venda').AsInteger;
   cdsItensInventario.Post;
   cdsItensInventario.ApplyUpdates(0);
end;
procedure TfrmInventario.AtualizarSaldoNoSetor(cdsDadosItens : TClientDataSet; SeqInventario : Integer);
var loSaldo : TSaldo;
    loDaoSaldo : TDaoSaldo;
begin
   loDaoSaldo := TDaoSaldo.Create(gConexao);
   loSaldo    := TSaldo.Create;
   loSaldo.SetorId   := StrToInt(cmbSetores.KeyValue);
   loSaldo.ProdutoId := cdsDadosItens.FieldByName('Codigo').AsInteger;
   loSaldo.Valor     := cdsDadosItens.FieldByName('Vlr_Total').AsInteger;
   loSaldo.Diferenca := cdsDadosItens.FieldByName('Diferenca').AsInteger;
   loDaoSaldo.AtualizarSaldo(loSaldo);
end;
procedure TfrmInventario.Clientes1Click(Sender: TObject);
var lsNome_Grupo : String;
    ldTotalGeral : Double;
begin

   GstituloRel  :='Relatorio de contagem de produtos';

   ImpMatricial.PortaComunicacao          := 'LPT1';
   ImpMatricial.OpcoesPreview.Preview     := true;
   ImpMatricial.TamanhoQteLinhas          := 66;
   ImpMatricial.TamanhoQteColunas         := 80;
   ImpMatricial.FonteTamanhoPadrao        := s10cpp;
   ImpMatricial.UsaGerenciadorImpr        := True;
   ImpMatricial.Abrir;

   qryRelatorio.Close;
   qryRelatorio.SQL.Text := 'Select Prod.Cod_Grupo, Gru.Descricao as Grupo,Prod.Codigo, Prod.Descricao, Prod.Unid, '+
                            '       Prod.Saldo,Prod.Pco_Venda '+
                            'From T_Produtos Prod '+
                            'Left Join T_Grupos Gru On ' +
                            '     Gru.Codigo=Prod.Cod_Grupo '+
                            'where Tipo_Produto=:parTipo_Produto ' +
                            'Order by Prod.Cod_grupo,Prod.Descricao ';
   qryRelatorio.ParamByName('parTipo_Produto').AsString := '0';

   cdsRelatorio.Close;
   cdsRelatorio.ProviderName := dspRelatorio.Name;
   cdsRelatorio.Open;

   cdsRelatorio.First;
   ldTotalGeral := 0;
   while not cdsRelatorio.Eof do
   Begin
      if lsNome_Grupo<>cdsRelatorio.FieldByName('Grupo').AsString then
      Begin
         pviLinha:=Pvilinha+1;
         impmatricial.Imp(pvilinha,001,inczero(cdsRelatorio.FieldByName('Cod_Grupo').AsString,4)+'-'+cdsRelatorio.FieldByName('Grupo').AsString );
         pviLinha:=Pvilinha+1;
         impmatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
         pviLinha:=Pvilinha+1;
         lsNome_Grupo:=cdsRelatorio.FieldByName('Grupo').AsString;
      End;
      impmatricial.Imp(pvilinha,001,IncZero(cdsRelatorio.FieldByName('Codigo').AsString,5)+' '+cdsRelatorio.FieldByName('Descricao').AsString );
      impmatricial.Imp(pvilinha,050,cdsRelatorio.FieldByName('unid').AsString );
      impmatricial.Impd(pvilinha,080,'----------------------',[] );

      pviLinha:=Pvilinha+1;

      if pvilinha>60 then
         impmatricial.Novapagina;

      if cdsRelatorio.FieldByName('saldo').AsFloat > 0 then
         ldTotalGeral := ldTotalGeral + (cdsRelatorio.FieldByName('saldo').AsFloat*cdsRelatorio.FieldByName('Pco_Venda').AsFloat);

      cdsRelatorio.next;
   End;
   impmatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pviLinha:=Pvilinha+1;
   impmatricial.Fechar;
end;

procedure TfrmInventario.ClientesSemCompras1Click(Sender: TObject);
var vlr_Total : Double;
begin
   qryRelatorio.close;
   qryRelatorio.SQL.Text := 'SELECT Prod.Codigo, Prod.Descricao, Itens.Saldo, Itens.Qtde_Inventario, '+
                            '       itens.E_S, itens.Diferenca, ( itens.Diferenca * Itens.Pco_Venda ) AS Total ' +
                            'FROM T_itensinventario itens          ' +
                            '     LEFT JOIN T_Produtos Prod on' +
                            '          Prod.Codigo = Itens.Cod_Produto '+
                            'WHERE SeqInventario=:parSeqInventario ';
   qryRelatorio.ParamByName('parSeqInventario').asInteger := cdsPesquisa.FieldByName('SeqInventario').AsInteger;

   CdsRelatorio.Close;
   cdsRelatorio.ProviderName := DspRelatorio.Name;
   cdsrelatorio.Open;

   GstituloRel  :='2 - Relatorio de Divergencia';

   ImpMatricial.PortaComunicacao          := 'LPT1';
   ImpMatricial.OpcoesPreview.Preview     := true;
   ImpMatricial.TamanhoQteLinhas          := 66;
   ImpMatricial.TamanhoQteColunas         := 80;
   ImpMatricial.FonteTamanhoPadrao        := s10cpp;
   ImpMatricial.UsaGerenciadorImpr        := True;
   ImpMatricial.Abrir;
   vlr_Total := 0;
   while not cdsrelatorio.Eof do
   begin
      impmatricial.Imp(pvilinha,001,inczero(cdsRelatorio.FieldByName('Codigo').AsString,6)+'-'+cdsRelatorio.FieldByName('Descricao').AsString );
      impMatricial.ImpD( pviLinha, 045, FormatFloat( '#,##0',    cdsRelatorio.FieldByName( 'Saldo').AsFloat), [] );
      impMatricial.ImpD( pviLinha, 055, FormatFloat( '#,##0',    cdsRelatorio.FieldByName( 'Qtde_Inventario').AsFloat), [] );
      impMatricial.ImpD( pviLinha, 060, cdsRelatorio.FieldByName( 'E_S').AsString, [ Comp17 ] );
      impMatricial.ImpD( pviLinha, 067, FormatFloat( '#,##0',    cdsRelatorio.FieldByName( 'Diferenca').AsFloat), [] );
      impMatricial.ImpD( pviLinha, 080, FormatFloat( '#,##0.00',    cdsRelatorio.FieldByName( 'Total').AsFloat), [] );
      pvilinha := pvilinha + 1;
      vlr_Total := vlr_Total + cdsRelatorio.FieldByName( 'Total').AsFloat;
      if pvilinha>=63 then
        impMatricial.Novapagina;
      cdsrelatorio.Next;
   end;
   impMatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha + 1;
   impMatricial.imp(pviLinha,001,'Total......');
   impMatricial.ImpD( pviLinha, 080, FormatFloat( '#,##0.00', vlr_Total), [] );
   ImpMatricial.Fechar;
end;

procedure TfrmInventario.cmbNome_ProdutoInvChange(Sender: TObject);
begin
  inherited;
   if cmbNome_ProdutoInv.KeyValue <> null Then
   Begin
      edtProd_inv.Text := inczero(cmbNome_ProdutoInv.KeyValue,5);
      edtPco_venda.Text   := Formatfloat('0.00',cdsCadProdutos.fieldbyname('Pco_Venda').asFloat);
   End;
end;

procedure TfrmInventario.edtProd_invExit(Sender: TObject);
begin
  inherited;
   if Trim(edtProd_inv.text) <> '' Then
   Begin
      cmbNome_ProdutoInv.KeyValue :=  edtProd_inv.Text;
      if trim(cmbNome_ProdutoInv.text) = '' Then
      Begin
         CaixaMensagem( 'Produto n�o encontrado ', ctAviso, [ cbOk ], 0 );
         edtProd_inv.Setfocus;
      End;
   End;
end;

procedure TfrmInventario.FormShow(Sender: TObject);
begin
   PagGeral.ActivePageIndex := 0;
   TabInventario.Enabled    := False;

   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text :='Select COd_Barras,Unid,Codigo,Descricao,Pco_Venda,Saldo,Tipo_Produto '+
                          'From T_Produtos '+
                          'where tipo_Produto=:parTipo_Produto ';
   qryVariavel.SQL.add(' Order by Descricao  ');
   qryVariavel.ParamByName('parTipo_Produto').AsString := '0';

   cdsCadProdutos.Close;
   cdsCadProdutos.ProviderName := dspVariavel.Name;
   cdsCadProdutos.Open;

   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text :='Select * From Setores ';

   cdsSetores.Close;
   cdsSetores.ProviderName := dspVariavel.Name;
   cdsSetores.Open;
end;

procedure TfrmInventario.impMatricialNewPage(Sender: TObject; Pagina: Integer);
begin
  inherited;
   ConfiguraRel( Name, True, TRdPrint( Sender ), 1 );
   pviLinha := 06;
   if copy(GstituloRel,1,1)= '2' then
      TRdPrint( Sender ).imp(pvilinha,001,'Codigo Descricao                        Saldo Digitado   E/S  Invent      Total')
   Else
      TRdPrint( Sender ).imp(pvilinha,001,'Codigo Descricao                                Unid.               Contagem     ');
   pviLinha:=Pvilinha+1;
   TRdPrint( Sender ).imp(pviLinha,001,incdigito( '-','-',80,0));
   pviLinha:=Pvilinha+1;
end;

end.
