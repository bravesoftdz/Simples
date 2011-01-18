{
  Status
         0 -> Areceber
         1 -> Recebido
}


unit uCtasreceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Provider, ADODB, StdCtrls, bsSkinCtrls, Mask,
  bsSkinBoxCtrls, bsSkinGrids, bsDBGrids, ComCtrls, bsSkinTabs, ExtCtrls,
  ToolWin, BusinessSkinForm, Buttons, bsdbctrls, EditNew, Menus,
  bsSkinMenus, RDprint, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FMTBcd, SqlExpr,SqlTimSt, cxPropertiesStore,
  cxGridCustomPopupMenu, cxGridPopupMenu,uformBase, dxSkinsCore;

type
  TfrmCtasReceber = class(TFormBase)
    pagCadastro: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bsSkinPanel1: TbsSkinPanel;
    cmbTipoPesquisa: TbsSkinComboBox;
    EdtPesquisa: TbsSkinEdit;
    chkPesqTodoTexto: TbsSkinCheckRadioBox;
    tabCadastro: TbsSkinTabSheet;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    edtHistorico: TbsSkinEdit;
    srcCadClientes: TDataSource;
    bsSkinStdLabel8: TbsSkinStdLabel;
    edtData_cad: TbsSkinEdit;
    edtCod_Fornecedor: TbsSkinEdit;
    cmbCod_Fornecedor: TbsSkinDBLookupComboBox;
    cmbNome_Fornecedor: TbsSkinDBLookupComboBox;
    bsSkinStdLabel2: TbsSkinStdLabel;
    lblVencimentos: TbsSkinStdLabel;
    edtData_Emissao: TbsSkinDateEdit;
    edtData_Vencimento: TbsSkinDateEdit;
    rdgTipoVencimento: TbsSkinRadioGroup;
    lblDiasa: TbsSkinStdLabel;
    bsSkinStdLabel6: TbsSkinStdLabel;
    edtParcelas: TbsSkinSpinEdit;
    edtDias: TbsSkinSpinEdit;
    EdtVlr_total: TEditN;
    Label1: TLabel;
    srcPesquisa: TDataSource;
    dtpData_Ini: TbsSkinDateEdit;
    lblTurma: TbsSkinStdLabel;
    dtpData_Fim: TbsSkinDateEdit;
    srcRelatorio: TbsSkinStdLabel;
    bsSkinStdLabel7: TbsSkinStdLabel;
    cmbNome_CentroCusto: TbsSkinDBLookupComboBox;
    cmbCod_CentroCusto: TbsSkinDBLookupComboBox;
    edtCod_CentroCusto: TbsSkinEdit;
    srcCadCtoCusto: TDataSource;
    MenuRelatorios: TbsSkinPopupMenu;
    BorderodeEntrega1: TMenuItem;
    ImpMatricial: TRDprint;
    GridCtasReceber: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    QryVariavel: TSQLQuery;
    dspVariavel: TDataSetProvider;
    cdsCadClientes: TClientDataSet;
    cdsCadCtoCusto: TClientDataSet;
    dspPesquisa: TDataSetProvider;
    QryPesquisa: TSQLQuery;
    cdsPesquisa: TClientDataSet;
    QryModific: TSQLQuery;
    GridCtasRecebersequencia: TcxGridDBColumn;
    GridCtasRecebervlr_Areceber: TcxGridDBColumn;
    GridCtasReceberHistorico: TcxGridDBColumn;
    GridCtasReceberData_Vencimento: TcxGridDBColumn;
    GridCtasReceberData_Cad: TcxGridDBColumn;
    GridCtasReceberCod_FormaPagamento: TcxGridDBColumn;
    GridCtasReceberData_Atu: TcxGridDBColumn;
    GridCtasReceberOperador: TcxGridDBColumn;
    GridCtasReceberCod_emp: TcxGridDBColumn;
    GridCtasReceberCod_Cliente: TcxGridDBColumn;
    GridCtasReceberDocumento: TcxGridDBColumn;
    GridCtasReceberseqvenda: TcxGridDBColumn;
    GridCtasReceberData_Emissao: TcxGridDBColumn;
    GrifCtasreceberDescricao: TcxGridDBColumn;
    GridCtasreceberVlr_Recebido: TcxGridDBColumn;
    gridCtasreceberVlr_Desconto: TcxGridDBColumn;
    GridCtasreceberVlr_Comissao: TcxGridDBColumn;
    GridCtasReceberVlr_Devolvido: TcxGridDBColumn;
    GridCtasReceberColumn1: TcxGridDBColumn;
    Columm_Data_Pagamento: TcxGridDBColumn;
    GridCtasReceberColumn2: TcxGridDBColumn;
    btnSelecionar: TbsSkinButton;
    cmbPeriodo: TbsSkinComboBox;
    Columm_Nome_Rota: TcxGridDBColumn;
    CxPropriedades: TcxPropertiesStore;
    cxGridPopupMenu1: TcxGridPopupMenu;
    ExportarExcelCondensado1: TMenuItem;
    ExportarExcelExpandido1: TMenuItem;
    Column_Nome_Status: TcxGridDBColumn;
    MenuGrid: TbsSkinPopupMenu;
    Marcarcomoentregue1: TMenuItem;
    cmbTipoFiltro: TbsSkinComboBox;
    lblLote: TbsSkinLabel;
    bsSkinPopupMenu1: TbsSkinPopupMenu;
    MenuItem1: TMenuItem;
    RecebimentosporLote1: TMenuItem;
    N1: TMenuItem;
    cdsRelatorio: TClientDataSet;
    DataSource1: TDataSource;
    bsSkinCoolBar2: TbsSkinCoolBar;
    bsSkinToolBar2: TbsSkinToolBar;
    btnFechar: TbsSkinSpeedButton;
    btnexcluir: TbsSkinSpeedButton;
    btnalterar: TbsSkinSpeedButton;
    btnincluir: TbsSkinSpeedButton;
    BtnCancela: TbsSkinSpeedButton;
    bsSkinBevel1: TbsSkinBevel;
    btnok: TbsSkinSpeedButton;
    btnSeparador: TbsSkinBevel;
    bsSkinBevel3: TbsSkinBevel;
    bsSkinMenuSpeedButton1: TbsSkinMenuSpeedButton;
    procedure btnincluirClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LimpaCampos();
    procedure rdgTipoVencimentoClick(Sender: TObject);
    procedure cmbCod_FornecedorChange(Sender: TObject);
    procedure cmbNome_FornecedorChange(Sender: TObject);
    procedure edtCod_FornecedorExit(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure qryCtasPagarAfterOpen(DataSet: TDataSet);
    procedure cmbNome_CentroCustoChange(Sender: TObject);
    procedure cmbCod_CentroCustoChange(Sender: TObject);
    procedure edtCod_CentroCustoExit(Sender: TObject);
    procedure ImpMatricialNewPage(Sender: TObject; Pagina: Integer);
    procedure btnexcluirClick(Sender: TObject);
    procedure pagCadastroChange(Sender: TObject);
    procedure EdtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbPeriodoChange(Sender: TObject);
    procedure BorderodeEntrega1Click(Sender: TObject);
    procedure cdsPesquisaAfterOpen(DataSet: TDataSet);
    procedure cdsPesquisaCalcFields(DataSet: TDataSet);
    procedure Marcarcomoentregue1Click(Sender: TObject);
    procedure EdtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure MenuItem1Click(Sender: TObject);
    procedure RecebimentosporLote1Click(Sender: TObject);
  private
   pvQualBotao : String;
   pvilinha    : Integer;
   piTipoRel   : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCtasReceber: TfrmCtasReceber;

implementation

uses uPrincipal,ufuncoes, uBaixaTipo_01_Brinde, uBaixaNormal,
  uselRelContasReceber;

procedure TfrmCtasReceber.LimpaCampos();
Begin
   cmbNome_Fornecedor.KeyValue := Null;
   cmbCod_Fornecedor.KeyValue := Null;
   edtCod_Fornecedor.Text := '';
   edtHistorico.Text := '';
   edtData_Emissao.Date := Now;
   edtData_Vencimento.Date := now;
   edtDias.Text := '30';
   edtParcelas.Text := '1';
   rdgTipoVencimento.ItemIndex := 0;
   EdtVlr_Total.Text := '0,00';
End;

procedure TfrmCtasReceber.Marcarcomoentregue1Click(Sender: TObject);
begin
   if cdsPesquisa.FieldByName('Status').AsInteger=0 then
   Begin
      CaixaMensagem( 'O servi�o n�o esta Pago', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   if cdsPesquisa.FieldByName('Entregue').AsInteger=4 then
   Begin
      CaixaMensagem( 'Servi�o j� entregue', ctAviso, [ cbOk ], 0 );
      Exit;
   End;

   if CaixaMensagem( 'Confirma a entrega do servi�o ???', ctConfirma, [ cbSimNao ], 0 )  Then
   Begin
      qryModific.SQL.Text := 'Update T_Vendas set Status=:parStatus Where seqvenda=:parSeqvenda ';
      qryModific.ParamByName('parSeqVenda').AsInteger := StrToInt(cdsPesquisa.FieldByName('SeqVenda').AsString);
      qryModific.ParamByName('parStatus').AsString    := '4';
      qryModific.ExecSQL;
   End;
end;

procedure TfrmCtasReceber.MenuItem1Click(Sender: TObject);
var lcdsNovoCodigo : TClientDataSet;
begin
   QryVariavel.Close;
   QryVariavel.SQL.text := 'Select Max(Lote) as Lote From T_ctasreceber ';

   lcdsNovoCodigo := TClientDataSet.Create(Self);
   lcdsNovoCodigo.ProviderName := dspVariavel.Name;
   lcdsNovoCodigo.Open;
   If lcdsNovoCodigo.FieldByName('Lote').isNull Then
      lblLote.Caption := '0001'
   Else
   Begin
      lblLote.Caption := inczero(IntToStr(lcdsNovoCodigo.FieldByName('Lote').AsInteger+1),4);
      lblLote.FontColor := clBlue;
   end;

end;

procedure TfrmCtasReceber.pagCadastroChange(Sender: TObject);
begin

end;

{$R *.dfm}

procedure TfrmCtasReceber.btnincluirClick(Sender: TObject);
begin
   pvQualBotao := 'INCLUIR';

   LimpaCampos();

   EdtData_cad.text := FormatDateTime('dd/mm/yyyy',Now);

   BtnIncluir.Enabled  := False;
   BtnAlterar.Enabled  := False;
   BtnExcluir.Enabled  := False;
   BtnOk.Enabled       := True;
   BtnCancela.Enabled  := True;
   edtParcelas.Enabled := True;
   PagCadastro.ActivePageIndex:=1;
   edtCod_Fornecedor.SetFocus;
end;

procedure TfrmCtasReceber.btnokClick(Sender: TObject);
{
Var licont : Integer ;
    lsMes  : String;
    lsDias : String;
    lsDiasant : String;
    lsAno : String;
    liDias  : Integer;
    }
begin
{
   if Trim( edtHistorico.Text ) = '' Then
   Begin
      CaixaMensagem( 'O Historico n�o pode ficar em branco ', ctAviso, [ cbOk ], 0 );
      Exit
   End;
   if Trim( cmbCod_Fornecedor.Text ) = '' Then
   Begin
      CaixaMensagem( 'O Fornecedor n�o pode ficar em branco ', ctAviso, [ cbOk ], 0 );
      Exit
   End;
   if Trim( cmbCod_CentroCusto.Text ) = '' Then
   Begin
      CaixaMensagem( 'O Centro de Custo n�o pode ficar em branco ', ctAviso, [ cbOk ], 0 );
      Exit
   End;

   lsdias    := FormatDateTime('DD',edtdata_Vencimento.Date);
   lsMes     := FormatDateTime('MM',edtdata_Vencimento.Date);
   lsDiasAnt := FormatDateTime('DD',edtdata_Vencimento.Date);
   lsAno     := FormatDateTime('yyyy',edtdata_Vencimento.Date);
   lidias    := 0;

   For licont := 1 to StrToInt(edtParcelas.Text) Do
   Begin
      lidias := liDias + StrToInt(edtdias.Text);
      If pvQualBotao = 'ALTERAR' then
      begin
         QryCtasPagar.Edit;
         QryCtasPagar.FieldByName('Data_Atu').AsDateTime := Now;
      End
      Else
      Begin
         QryCtasPagar.Append;
         QryCtasPagar.FieldByName('Data_Cad').AsDateTime := Now;
      End;
      QryCtasPagar.FieldByName('Historico').AsString          := edtHistorico.Text;
      QryCtasPagar.FieldByName('Operador').AsString           := gsOperador;
      QryCtasPagar.FieldByName('Cod_Fornecedor').AsString     := cmbCod_Fornecedor.Text;
      QryCtasPagar.FieldByName('Data_Emissao').AsDateTime     := edtData_Emissao.Date;
      If rdgTipoVencimento.ItemIndex = 0 Then
         QryCtasPagar.FieldByName('Data_Vencimento').AsDateTime  := StrtoDateTime(lsdias+'/'+lsMes+'/'+lsAno)
      Else
         QryCtasPagar.FieldByName('Data_Vencimento').AsDateTime  := (edtData_Vencimento.Date)+lidias ;

      QryCtasPagar.FieldByName('SeqParcela').AsInteger        := licont;
      QryCtasPagar.FieldByName('Valor').AsFloat               := arredondar(StrToFloat(EdtVlr_total.Text)/StrToInt(edtParcelas.Text),2);
      QryCtasPagar.FieldByName('Status').AsInteger            := 0;
      QryCtasPagar.FieldByName('Cod_tipoDespesa').AsString    := cmbCod_CentroCusto.Text;

      lsmes  := IncZero( IntToStr ( StrToint ( lsMes ) + 1 ),2);
      lsDias :=lsdiasAnt;
      if StrToint(lsMes)>12 Then
      Begin
        lsmes := '01';
        lsAno := IncZero( IntToStr ( StrToint ( lsAno ) + 1 ),2);
      End;
      if ( StrToint(lsMes)=2 ) and ( StrToint(lsDias)>=29 ) Then
      Begin
        lsDias:='28';
      end;

   End;
   QryCtasPagar.Post;

   btnSelecionarClick(btnSelecionar);

   BtnIncluir.Enabled := True;
   BtnAlterar.Enabled := True;
   BtnExcluir.Enabled := True;
   BtnOk.Enabled      := False;
   BtnCancela.Enabled := False;

   PagCadastro.ActivePageIndex:=0;

   LimpaCampos();
 }
end;

procedure TfrmCtasReceber.BorderodeEntrega1Click(Sender: TObject);
begin
   frmselRelContasReceber := TfrmselRelContasReceber.Create(Self);
   frmselRelContasReceber.ShowModal;
end;

procedure TfrmCtasReceber.btnalterarClick(Sender: TObject);
Var liSequencia : Integer;
begin
  {
   IF qryctaspagar.IsEmpty Then
   Begin
      CaixaMensagem( 'N�o existe registro selecionado ', ctAviso, [ cbOk ], 0 );
      Exit
   End;

   pvQualBotao := 'ALTERAR';

   liSequencia := qryCtasPagar.fieldByName('Sequencia').AsInteger;

   qryCtasPagar.Close;
   qryCtasPagar.SQL.text :=' Select * from T_CtasPagar WHERE Sequencia=:parSequencia ';
   qryCtasPagar.Parameters.ParamValues['parSequencia']   := liSequencia;
   qryCtasPagar.Open;

   edtCod_Fornecedor.Text := QryCtasPagar.FieldByName('Cod_Fornecedor').AsString;
   edtCod_FornecedorExit(edtCod_Fornecedor);
   edtCod_CentroCusto.Text := QryCtasPagar.FieldByName('Cod_TipoDespesa').AsString;
   edtCod_CentroCustoExit(edtCod_CentroCusto);
   edtHistorico.Text       := QryCtasPagar.FieldByName('Historico').AsString;
   edtParcelas.Text        := '1';
   edtData_Emissao.Text    := FormatDateTime('dd/mm/yyyy',QryCtasPagar.FieldByName('Data_Emissao').AsDateTime);
   edtData_Vencimento.Text := FormatDateTime('dd/mm/yyyy',QryCtasPagar.FieldByName('Data_Vencimento').AsDateTime);
   EdtVlr_total.Text       := FormatFloat('0.00',QryCtasPagar.FieldByName('Valor').Asfloat);

   edtDias.Enabled := False;
   edtParcelas.Enabled := False;
   rdgTipoVencimento.Enabled := False;

   EdtData_cad.text := FormatDateTime('dd/mm/yyyy',QryCtasPagar.FieldByName('Data_Emissao').AsDateTime);

   pvQualBotao := 'ALTERAR';

   BtnIncluir.Enabled :=False;
   BtnAlterar.Enabled :=False;
   BtnExcluir.Enabled :=False;
   BtnOk.Enabled      :=True;
   BtnCancela.Enabled :=True;
   PagCadastro.ActivePageIndex:=1;

   edtHistorico.SetFocus;
   }
end;

procedure TfrmCtasReceber.BtnCancelaClick(Sender: TObject);
begin
   BtnIncluir.Enabled := True;
   BtnAlterar.Enabled := True;
   BtnExcluir.Enabled := True;
   BtnOk.Enabled      := False;
   BtnCancela.Enabled := False;
   limpaCampos();
   btnSelecionarClick(btnSelecionar);
   PagCadastro.ActivePageIndex:=0;
end;

procedure TfrmCtasReceber.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCtasReceber.FormShow(Sender: TObject);
Var lstmArquivo : TFileStream;
    lcdsNovoCodigo : TClientDataSet;
begin
   Inherited;
   piTipoRel := 0;

   PagCadastro.ActivePageIndex:=0;

   QryVariavel.Close;
   QryVariavel.SQL.Text := 'Select Codigo,Descricao,Cnpjcpf from T_Clientes order by Descricao';
   QryVariavel.Open;

   cdsCadClientes.Close;
   cdsCadClientes.ProviderName := dspVariavel.Name;
   cdsCadClientes.Open;

   QryVariavel.Close;
   QryVariavel.SQL.Text := 'Select * from T_Operacoes where Tipo_Conta=:parTipo_Conta '+
                            'Order by Descricao ';
   QryVariavel.paramByname('parTipo_Conta').AsInteger := 2; // 1 Debito 2 Credito

   cdsCadCtoCusto.Close;
   cdsCadCtoCusto.ProviderName := dspVariavel.Name;
   cdsCadCtoCusto.Open;

   rdgTipoVencimento.ItemIndex:= 0;

   edtDias.Visible            := False;
   lblDiasa.Visible           := False;
   edtData_Vencimento.Visible := True;
   lblVencimentos.Visible     := True;

   ListaPeriodo2( TbsSkinDateEdit( dtpData_Ini ), TbsSkinDateEdit( dtpData_Fim ), cmbperiodo.ItemIndex,gsData_Mov );

   btnSelecionarClick(btnSelecionar);
   tabCadastro.TabVisible := False;
   btnSeparador.Width := 390;

   QryVariavel.Close;
   QryVariavel.SQL.text := 'Select Max(Lote) as Lote From T_ctasreceber ';

   lcdsNovoCodigo := TClientDataSet.Create(Self);
   lcdsNovoCodigo.ProviderName := dspVariavel.Name;
   lcdsNovoCodigo.Open;
   If lcdsNovoCodigo.FieldByName('Lote').isNull Then
      lblLote.Caption := '0001'
   Else
      lblLote.Caption := inczero(IntToStr(lcdsNovoCodigo.FieldByName('Lote').AsInteger),4);
    freeandNil(lcdsNovoCodigo);
end;

procedure TfrmCtasReceber.rdgTipoVencimentoClick(Sender: TObject);
begin
   IF rdgTipoVencimento.ItemIndex = 0  Then
   Begin
       edtDias.Visible            := False;
       lblDiasa.Visible           := False;
       edtData_Vencimento.Visible := True;
       lblVencimentos.Visible     := True;
   end
   Else
   Begin
      edtDias.Visible            := True;
      lblDiasa.Visible           := True;
      edtData_Vencimento.Visible := False;
      lblVencimentos.Visible     := False;
   End;
end;

procedure TfrmCtasReceber.RecebimentosporLote1Click(Sender: TObject);
var lrTotal : Double;
begin
   piTipoRel := 1;
   QryVariavel.Close;
   QryVariavel.SQL.text := 'select Sum(Vlr_areceber)  as Tot_Areceber, '+
                           '       Sum(Vlr_Recebido)  as Tot_Recebido, '+
                           '       Sum(Vlr_Desconto)  as Tot_Desconto, '+
                           '       Sum(Vlr_Devolvido) as Tot_Devolvido,'+
                           '       Sum(Vlr_Comissao)  as Tot_Comissao from T_ctasreceber where lote=:parLote ';
   QryVariavel.ParamByName('parLote').AsInteger := StrToInt(lblLote.Caption);

   cdsRelatorio.Close;
   cdsRelatorio.ProviderName := dspVariavel.Name;
   cdsRelatorio.Open;

   if cdsRelatorio.IsEmpty Then
   Begin
      CaixaMensagem( 'Lote sem inoforma��o para impress�o ', ctAviso, [ cbOk ], 0 );
      Exit
   End;

   GstituloRel  :='Relatorio de Recebimentos por lote';

   ImpMatricial.PortaComunicacao          := 'LPT1';
   ImpMatricial.OpcoesPreview.Preview     := true;
   ImpMatricial.TamanhoQteLinhas          := 66;
   ImpMatricial.TamanhoQteColunas         := 80;
   ImpMatricial.FonteTamanhoPadrao        := s10cpp;
   ImpMatricial.UsaGerenciadorImpr        := True;
   ImpMatricial.Abrir;

   impmatricial.Imp(pvilinha,001,'Total A receber ');
   impmatricial.ImpD(pvilinha,040,FormatFloat(',0.00',cdsRelatorio.FieldByName('Tot_AReceber').AsFloat),[]);
   pvilinha := pvilinha + 1;
   impmatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pviLinha:=Pvilinha+1;
   impmatricial.Imp(pvilinha,001,'Total Recebido ');
   impmatricial.ImpD(pvilinha,040,FormatFloat(',0.00',cdsRelatorio.FieldByName('Tot_Recebido').AsFloat),[]);
   pvilinha := pvilinha + 1;
   impmatricial.Imp(pvilinha,001,'Total Devolvido ');
   impmatricial.ImpD(pvilinha,040,FormatFloat(',0.00',cdsRelatorio.FieldByName('Tot_Devolvido').AsFloat),[]);
   pvilinha := pvilinha + 1;
   impmatricial.Imp(pvilinha,001,'Total De Desconto ');
   impmatricial.ImpD(pvilinha,040,FormatFloat(',0.00',cdsRelatorio.FieldByName('Tot_Desconto').AsFloat),[]);
   pvilinha := pvilinha + 1;
   impmatricial.Imp(pvilinha,001,'Total De Comiss�es ');
   impmatricial.ImpD(pvilinha,040,FormatFloat(',0.00',cdsRelatorio.FieldByName('Tot_Comissao').AsFloat),[]);
   pvilinha := pvilinha + 1;
   impmatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha + 1;
   impmatricial.Imp(pvilinha,001,'Saldo A receber ');
   impmatricial.ImpD(pvilinha,040,FormatFloat(',0.00',cdsRelatorio.FieldByName('Tot_Areceber').AsFloat - (
                                                      cdsRelatorio.FieldByName('Tot_Recebido').AsFloat +
                                                      cdsRelatorio.FieldByName('Tot_Devolvido').AsFloat +
                                                      cdsRelatorio.FieldByName('Tot_Desconto').AsFloat +
                                                      cdsRelatorio.FieldByName('Tot_Comissao').AsFloat ) ),[]);
   pvilinha := pvilinha + 1;


   QryVariavel.Close;
   QryVariavel.SQL.text := 'Select Dev.Cod_Produto,Prod.Descricao, Sum(Dev.Qtde_Devolvida) as Qtde_total, '+
                           '       AVG(Dev.Pco_Venda) as Pco_Medio,Sum(Dev.Qtde_Devolvida*Dev.Pco_Venda) as Total From T_ctasreceber Ctas '+
                           'Left join T_itensdevolucoes dev on dev.Seqvenda=Ctas.Seqvenda '+
                           'Left Join T_Produtos Prod on Prod.codigo=Dev.Cod_Produto '+
                           'where ctas.lote=:parlote and Dev.Lote=:parLote '+
                           'GROUP BY Dev.Cod_Produto,Prod.Descricao ';
   QryVariavel.ParamByName('parLote').AsInteger := StrToInt(lblLote.Caption);

   cdsRelatorio.Close;
   cdsRelatorio.ProviderName := dspVariavel.Name;
   cdsRelatorio.Open;

   pvilinha := pvilinha + 1;
   impmatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha + 1;
   impmatricial.imp(pviLinha,030,'Resumo das devolu��e por produto');
   pvilinha := pvilinha + 1;
   impmatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha + 1;
   lrTotal := 0;
   while not cdsRelatorio.eof do
   Begin
      if not cdsRelatorio.FieldByName('Cod_Produto').IsNull then
      Begin
         impmatricial.Imp(pvilinha,001,cdsRelatorio.FieldByName('Cod_Produto').AsString);
         impmatricial.Imp(pvilinha,005,cdsRelatorio.FieldByName('Descricao').AsString);
         impmatricial.ImpD(pvilinha,060,FormatFloat(',0.00',cdsRelatorio.FieldByName('Qtde_Total').AsFloat),[]);
         impmatricial.ImpD(pvilinha,070,FormatFloat(',0.00',cdsRelatorio.FieldByName('Pco_Medio').AsFloat),[]);
         impmatricial.ImpD(pvilinha,080,FormatFloat(',0.00',cdsRelatorio.FieldByName('Total').AsFloat),[]);
         pvilinha := pvilinha + 1;
         lrTotal := lrTotal +cdsRelatorio.FieldByName('Total').AsFloat
      End;
      cdsRelatorio.Next;
   End;
   impmatricial.imp(pviLinha,001,incdigito( '-','-',80,0));
   pvilinha := pvilinha + 1;
   impmatricial.Imp(pvilinha,001,'Total das devolucoes');
   impmatricial.ImpD(pvilinha,080,FormatFloat(',0.00', lrTotal ),[]);
   ImpMatricial.Fechar;
end;

procedure TfrmCtasReceber.cmbCod_FornecedorChange(Sender: TObject);
begin
  cmbNome_Fornecedor.KeyValue :=  cmbCod_Fornecedor.KeyValue;
  edtCod_fornecedor.Text := cmbcod_Fornecedor.Text;
end;

procedure TfrmCtasReceber.cmbNome_FornecedorChange(Sender: TObject);
begin
  cmbCod_Fornecedor.KeyValue := cmbNome_Fornecedor.KeyValue;
end;

procedure TfrmCtasReceber.cmbPeriodoChange(Sender: TObject);
begin
   ListaPeriodo2( TbsSkinDateEdit( dtpData_Ini ), TbsSkinDateEdit( dtpData_Fim ), cmbperiodo.ItemIndex,gsData_Mov );
end;

procedure TfrmCtasReceber.edtCod_FornecedorExit(Sender: TObject);
begin
   if Trim(edtCod_Fornecedor.text)<> '' Then
   Begin
      cmbCod_Fornecedor.KeyValue := edtCod_Fornecedor.text;
      cmbCod_FornecedorChange(cmbCod_Fornecedor);
      if Trim(cmbNome_Fornecedor.Text) = '' Then
          CaixaMensagem( 'Fornecedor N�o Encontrado ', ctAviso, [ cbOk ], 0 );
   End
   else
      cmbNome_Fornecedor.KeyValue := Null;
end;

procedure TfrmCtasReceber.btnSelecionarClick(Sender: TObject);
var lsCoringa : String;
begin
   lsCoringa := '';
   if chkPesqTodoTexto.Checked Then
      lsCoringa := '%';

   qryPesquisa.Close;
   qryPesquisa.SQL.Text :=  'Select cli.Cod_rota,Rota.Descricao as Nome_Rota, Cli.Descricao, Cli.CnpjCpf, '+
                            '       Ven.Controle, Ven.Tipo_Venda, Ven.Status as Entregue, Rec.* '+
                            'from T_CtasReceber Rec, T_Clientes Cli, T_Vendas ven, T_Rotas Rota '+
                            'where (Rec.Data_Vencimento>=:parDataIni and Rec.Data_Vencimento<=:parDataFim ) And '+
                            '       Rec.Vlr_Areceber>:parVlr_Areceber AND '+
                            '      Cli.Codigo=Rec.Cod_Cliente and ven.Seqvenda=Rec.Seqvenda And Rota.Codigo=Cli.Cod_Rota ';

   Case cmbTipoPesquisa.ItemIndex Of
      0 : qryPesquisa.SQL.Add(' And Cli.Descricao like :parPesquisa ');
      1 : qryPesquisa.SQL.Add(' And Cli.cnpjcpf  =:parPesquisa ');
      2 : qryPesquisa.SQL.Add(' And ven.controle =:parPesquisa ');
      3 : qryPesquisa.SQL.Add(' And Rec.SeqVenda =:parPesquisa ');
      4 : qryPesquisa.SQL.Add(' And Cli.Codigo   =:parPesquisa ');
   End;
   if cmbTipoFiltro.ItemIndex <> 2 then
      qryPesquisa.SQL.Add('And Rec.Status =:parStatus ');
   qryPesquisa.SQL.Add('Order by Rec.data_Vencimento ');

   Case cmbTipoPesquisa.ItemIndex  Of
            0 : qryPesquisa.ParamByName('parPesquisa').AsString := lsCoringa+EdtPesquisa.Text+'%';
      1,2,3,4 : qryPesquisa.ParamByName('parPesquisa').AsString := EdtPesquisa.text;
   End;

   if cmbTipoFiltro.ItemIndex <> 2 Then
      qryPesquisa.ParamByName('parStatus').AsInteger   := cmbTipoFiltro.ItemIndex;

   qryPesquisa.ParamByName('parDatafim').AsSQLTimeStamp   := StrToSQLTimeStamp(dtpData_fim.Text+' 23:59:59');
   qryPesquisa.ParamByName('parDataIni').AsSQLTimeStamp   := StrToSQLTimeStamp(dtpData_Ini.Text+' 00:00:00');
   qryPesquisa.ParamByName('parVlr_Areceber').AsFloat     := 0.01;

   cdsPesquisa.Close;
   cdsPesquisa.ProviderName := dspPesquisa.Name;
   cdsPesquisa.Open;
end;

procedure TfrmCtasReceber.EdtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=13 then
      btnSelecionarclick(btnSelecionar);
end;

procedure TfrmCtasReceber.EdtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
      btnSelecionarclick(btnSelecionar);

end;

procedure TfrmCtasReceber.qryCtasPagarAfterOpen(DataSet: TDataSet);
var licont : Integer ;
begin
   for liCont := 1 To DataSet.FieldCount Do
   begin
      if DataSet.Fields[ liCont - 1 ].DataType = ftFloat Then
         TFloatField( DataSet.Fields[ liCont - 1 ] ).DisplayFormat := '0.00';
   end;
end;

procedure TfrmCtasReceber.cmbNome_CentroCustoChange(Sender: TObject);
begin
   cmbCod_CentroCusto.KeyValue := cmbNome_CentroCusto.KeyValue
end;

procedure TfrmCtasReceber.cdsPesquisaAfterOpen(DataSet: TDataSet);
Var licont : integer;
begin
   CriarCalculado (DataSet,'Nome_Status',ftString,15);
   for liCont := 1 To DataSet.FieldCount Do
   begin
      if DataSet.Fields[ liCont - 1 ].DataType = ftFloat Then
         TFloatField( DataSet.Fields[ liCont - 1 ] ).DisplayFormat := '0.00';
   end;
end;

procedure TfrmCtasReceber.cdsPesquisaCalcFields(DataSet: TDataSet);
begin
   Case  cdsPesquisa.FieldByName('Status').AsInteger Of
     0 : cdsPesquisa.FieldByName('Nome_Status').AsString := 'A Receber';
     1 : cdsPesquisa.FieldByName('Nome_Status').AsString := 'Recebido ';
   End;
end;

procedure TfrmCtasReceber.cmbCod_CentroCustoChange(Sender: TObject);
begin
   cmbNome_CentroCusto.KeyValue := cmbCod_CentroCusto.KeyValue;
   edtCod_CentroCusto.Text := cmbCod_CentroCusto.Text;
end;

procedure TfrmCtasReceber.edtCod_CentroCustoExit(Sender: TObject);
begin
   if Trim(edtCod_CentroCusto.text)<> '' Then
   Begin
      cmbCod_CentroCusto.KeyValue := edtCod_CentroCusto.text;
      cmbCod_CentroCustoChange(cmbCod_CentroCusto);
      if Trim(cmbNome_CentroCusto.Text) = '' Then
          CaixaMensagem( 'Centro de Custo N�o Encontrado ', ctAviso, [ cbOk ], 0 );
   End
   else
      cmbNome_CentroCusto.KeyValue := Null;
end;

procedure TfrmCtasReceber.ImpMatricialNewPage(Sender: TObject;
  Pagina: Integer);
begin
   ConfiguraRel( Name, True, TRdPrint( Sender ), Pagina );
   pviLinha := 06;
   pviLinha:=Pvilinha+1;
   case piTipoRel of
      0 :
      Begin
         TRdPrint( Sender ).imp(pvilinha,001,'Codigo   Descricao Vencimento  Nr.Parcela          Historico                    Total  ');
         pviLinha:=Pvilinha+1;
         TRdPrint( Sender ).imp(pviLinha,001,incdigito( '-','-',135,0));
         pviLinha:=Pvilinha+1;
      End;
      1 :
      Begin
         TRdPrint( Sender ).imp(pvilinha,001,'Descricao                         Total  ');
         pviLinha:=Pvilinha+1;
         TRdPrint( Sender ).imp(pviLinha,001,incdigito( '-','-',80,0));
         pviLinha:=Pvilinha+1;

      End;
   end;
End;

procedure TfrmCtasReceber.btnexcluirClick(Sender: TObject);
begin

   If cdsPesquisa.FieldByName('Status').AsInteger = 1 Then
   Begin
      CaixaMensagem( 'Este Titulo ja foi Pago', ctAviso, [ cbOk ], 0 );
      Exit
   End;

   if cdsPesquisa.IsEmpty Then
   Begin
      CaixaMensagem( 'N�o existe registro selecionado ', ctAviso, [ cbOk ], 0 );
      Exit
   End;

   If gsParametros.ReadString('ACESSODADOS','TipoSistema','0') ='0' Then
   Begin
      frmbaixaBrinde := TfrmbaixaBrinde.Create(Self);
      frmbaixaBrinde.edtDocumento.Text    := cdsPesquisa.FieldByName('Documento').AsString;
      frmbaixaBrinde.edtNomeCliente.Text  := cdsPesquisa.FieldByName('Descricao').AsString;
      frmbaixaBrinde.edtVenciemento.Text  := FormatDateTime('dd/mm/yyyy',cdsPesquisa.FieldByName('Data_Vencimento').AsDateTime);
      frmbaixaBrinde.edtTotalTitulo.Text  := FormatFloat('0.00',cdsPesquisa.FieldByName('Vlr_Areceber').AsFloat);
      frmbaixaBrinde.edtCnpjcpf.Text      := cdsPesquisa.FieldByName('Cnpjcpf').AsString;
      frmbaixaBrinde.edtNrVenda.Text      := cdsPesquisa.FieldByName('Seqvenda').AsString;
      frmbaixaBrinde.edtCod_Cliente.Text  := cdsPesquisa.FieldByName('Cod_Cliente').AsString;
      frmbaixaBrinde.edtData_Emissao.Text := FormatDateTime('dd/mm/yyyy',cdsPesquisa.FieldByName('Data_Emissao').AsDatetime);
      frmbaixaBrinde.edtData_Repasse.Text := FormatDateTime('dd/mm/yyyy',gsData_Mov);
      frmbaixaBrinde.cmbRota.KeyValue     := cdsPesquisa.FieldByName('Cod_Rota').AsString;
      frmbaixaBrinde.pilote               := StrToInt(lblLote.Caption);
      frmbaixaBrinde.pbNovoRepasse        := False;
      if not cdsPesquisa.FieldByName('Data_Repasse').IsNull then
         frmbaixaBrinde.edtData_Repasse.Text := FormatDateTime('dd/mm/yyyy',cdsPesquisa.FieldByName('Data_Repasse').AsDatetime)
      Else
         frmbaixaBrinde.pbNovoRepasse        := True;
      frmbaixaBrinde.edtCod_FormaPagamento.Text := cdsPesquisa.FieldByName('Cod_FormaPagamento').AsString;
      frmbaixaBrinde.Showmodal
   End
   Else if gsParametros.ReadString('ACESSODADOS','TipoSistema','0') ='1' Then
   Begin
      frmBaixaNormal := TfrmBaixaNormal.Create(Self);
      frmBaixaNormal.edtDocumento.Text    := cdsPesquisa.FieldByName('Documento').AsString;
      frmBaixaNormal.edtNomeCliente.Text  := cdsPesquisa.FieldByName('Descricao').AsString;
      frmBaixaNormal.edtVenciemento.Text  := FormatDateTime('dd/mm/yyyy',cdsPesquisa.FieldByName('Data_Vencimento').AsDateTime);
      frmBaixaNormal.edtTotalTitulo.Text  := FormatFloat('0.00',cdsPesquisa.FieldByName('Vlr_Areceber').AsFloat);
      frmBaixaNormal.edtCnpjcpf.Text      := cdsPesquisa.FieldByName('Cnpjcpf').AsString;
      frmBaixaNormal.edtNrVenda.Text      := cdsPesquisa.FieldByName('Seqvenda').AsString;
      frmBaixaNormal.edtControle.Text     := cdsPesquisa.FieldByName('Controle').AsString;
      frmBaixaNormal.Cod_Cliente.Text     := cdsPesquisa.FieldByName('Cod_Cliente').AsString;
      frmBaixaNormal.edtData_Emissao.Text := FormatDateTime('dd/mm/yyyy',cdsPesquisa.FieldByName('Data_Emissao').AsDatetime);
      frmBaixaNormal.edtCod_FormaPagamento.Text := cdsPesquisa.FieldByName('Cod_FormaPagamento').AsString;
      frmBaixaNormal.pbeServico := False;
      if cdspesquisa.FieldByName('Tipo_Venda').AsString='S' then
         frmBaixaNormal.pbeServico := True;
      frmBaixaNormal.Showmodal
   End;
   btnSelecionarClick(btnSelecionar);
end;

end.
