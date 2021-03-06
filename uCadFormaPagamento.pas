{
   0 - Lan�a no caixa
   1 - Lan�a contas a receber
   2 - Lan�a no conta corrente
}

unit uCadFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,sqlTimSt,
  cxDataStorage, cxEdit, DB, cxDBData, bsSkinCtrls, StdCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Mask, bsSkinBoxCtrls,
  Buttons, ComCtrls, bsSkinTabs, ExtCtrls, ToolWin, BusinessSkinForm,
  FMTBcd, SqlExpr, Provider, DBClient, SimpleDS,uFormBase, dxSkinsCore,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, bsSkinGrids, bsDBGrids, bsdbctrls;

type
  TfrmCadFormaPagamento = class(TFormBase)
    pagCadastro: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bsSkinPanel1: TbsSkinPanel;
    btntudo: TSpeedButton;
    bsSkinComboBox1: TbsSkinComboBox;
    EdtPesquisa: TbsSkinEdit;
    chkPesqTodoTexto: TbsSkinCheckRadioBox;
    cxGrid1: TcxGrid;
    GridFormaPagamento: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    bsSkinTabSheet2: TbsSkinTabSheet;
    cdsCadFormasPagamento: TClientDataSet;
    srcCadFormasPagamento: TDataSource;
    dspCadFormasPagamento: TDataSetProvider;
    qryCadFormasPagamento: TSQLQuery;
    sdtsPesquisa: TSimpleDataSet;
    srcPesquisa: TDataSource;
    GridFormaPagamentoCodigo: TcxGridDBColumn;
    GridFormaPagamentoDescricao: TcxGridDBColumn;
    GridFormaPagamentoData_cad: TcxGridDBColumn;
    GridFormaPagamentoData_Atu: TcxGridDBColumn;
    GridFormaPagamentoCod_Emp: TcxGridDBColumn;
    GridFormaPagamentoOperador: TcxGridDBColumn;
    bsSkinGroupBox1: TbsSkinGroupBox;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    edtDescricao: TbsSkinEdit;
    edtCodigo: TbsSkinEdit;
    cmbTipoPagamento: TbsSkinComboBox;
    bsSkinStdLabel3: TbsSkinStdLabel;
    cmbTipoLancamento: TbsSkinComboBox;
    edtPrazo: TbsSkinEdit;
    lblPrazo: TbsSkinStdLabel;
    bsSkinStdLabel8: TbsSkinStdLabel;
    edtData_cad: TbsSkinEdit;
    chkImprimeMensagem: TbsSkinCheckRadioBox;
    tabMensagem: TbsSkinTabSheet;
    MemoMensagem: TMemo;
    chkSomaVendas: TbsSkinCheckRadioBox;
    bsSkinCoolBar2: TbsSkinCoolBar;
    bsSkinToolBar2: TbsSkinToolBar;
    btnFechar: TbsSkinSpeedButton;
    btnexcluir: TbsSkinSpeedButton;
    btnalterar: TbsSkinSpeedButton;
    btnincluir: TbsSkinSpeedButton;
    BtnCancela: TbsSkinSpeedButton;
    bsSkinBevel1: TbsSkinBevel;
    btnok: TbsSkinSpeedButton;
    bsSkinBevel2: TbsSkinBevel;
    bsSkinBevel3: TbsSkinBevel;
    tabprodutos: TbsSkinTabSheet;
    bsSkinPanel2: TbsSkinPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbNome_Produto: TbsSkinDBLookupComboBox;
    edtCod_Produto: TbsSkinEdit;
    btnRemoverDesconto: TbsSkinButton;
    btnAdicionaDesconto: TbsSkinButton;
    edtPerc_Desconto: TbsSkinNumericEdit;
    StatusBar1: TStatusBar;
    bsSkinDBGrid1: TbsSkinDBGrid;
    qryProdutosPagamentos: TSQLQuery;
    dspProdutosPagamentos: TDataSetProvider;
    srcProdutosPagamentos: TDataSource;
    cdsProdutosPagamentos: TClientDataSet;
    pnlPagamentos: TPanel;
    srcCadProdutos: TDataSource;
    cdsCadProdutos: TClientDataSet;
    qryvariavel: TSQLQuery;
    dspVariavel: TDataSetProvider;
    chkRelatorioCheque: TbsSkinCheckRadioBox;
    procedure btnincluirClick(Sender: TObject);
    procedure LimpaCampos();
    procedure btnokClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure EdtPesquisaChange(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure cmbTipoPagamentoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure chkImprimeMensagemClick(Sender: TObject);
    procedure pagCadastroChange(Sender: TObject);
    procedure edtCod_ProdutoExit(Sender: TObject);
    procedure cmbNome_ProdutoChange(Sender: TObject);
    procedure btnAdicionaDescontoClick(Sender: TObject);
    procedure btnRemoverDescontoClick(Sender: TObject);
  private
     pvQualBotao : String;
    procedure AtualizaProdutosPagamentos(PagamentoId: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFormaPagamento: TfrmCadFormaPagamento;

implementation

uses uPrincipal,Ufuncoes;

{$R *.dfm}

procedure TfrmCadFormaPagamento.LimpaCampos();
Begin
   EdtDescricao.Text := '';
End;
procedure TfrmCadFormaPagamento.pagCadastroChange(Sender: TObject);
begin

   IF sdtsPesquisa.IsEmpty Then
   Begin
      CaixaMensagem( 'N�o existe registro selecionado ', ctAviso, [ cbOk ], 0 );
      Exit
   End;

   if pagCadastro.ActivePageIndex = 3 then
   begin
      AtualizaProdutosPagamentos(sdtsPesquisa.FieldByName('Codigo').AsInteger);

      pnlPagamentos.Caption := sdtsPesquisa.FieldByName('Descricao').AsString;
    { qryProdutosPagamentos.Close;
      qryProdutosPagamentos.SQL.Text := 'Select Prod.Codigo, Prod.Descricao, pag.Preco '+
                                             ' from ProdutosPagamentos pag '+
                                             '         left join T_Produtos prod on Prod.Codigo=Pag.ProdutoId '+
                                             'where PagamentoId=:parPagamentoId ';
      qryProdutosPagamentos.ParamByName('parPagamentoID').AsInteger := sdtsPesquisa.FieldByName('Codigo').AsInteger;
      cdsProdutosPagamentos.Close;
      cdsProdutosPagamentos.Open;   }
   end;

end;

procedure TfrmCadFormaPagamento.btnincluirClick(Sender: TObject);
begin
   pvQualBotao := 'INCLUIR';

   LimpaCampos();

   edtCodigo.Text := Sequencia('Codigo',False,'T_FormasPagamento',FrmPrincipal.dbxPrincipal,'',False,3);
   edtData_cad.Text  := FormatDateTime('dd/mm/yyyy',gsData_Mov);

   BtnIncluir.Enabled :=False;
   BtnAlterar.Enabled :=False;
   BtnExcluir.Enabled :=False;
   BtnOk.Enabled      :=True;
   BtnCancela.Enabled :=True;
   PagCadastro.ActivePageIndex:=1;
   edtDescricao.SetFocus;

end;

procedure TfrmCadFormaPagamento.btnokClick(Sender: TObject);
begin
   qryCadFormasPagamento.Close;
   If pvQualBotao = 'ALTERAR' then
   Begin
      qryCadFormasPagamento.SQL.text :=' Select * from T_FormasPagamento WHERE Codigo=:parcodigo ';
      qryCadFormasPagamento.ParamByName('parcodigo').Asinteger := StrtoInt(edtCodigo.Text);
   End
   Else
      qryCadFormasPagamento.SQL.text :=' Select * from T_FormasPagamento WHERE 1=2';

   cdsCadFormasPagamento.Close;
   cdsCadFormasPagamento.ProviderName := dspCadFormasPagamento.Name;
   cdsCadFormasPagamento.Open;

   EdtData_cad.text := FormatDateTime('dd/mm/yyyy',Now);

   If pvQualBotao = 'ALTERAR' then
   begin
      cdsCadFormasPagamento.Edit;
      cdsCadFormasPagamento.FieldByName('Data_Atu').AsDateTime := Now;
   End
   Else
   Begin
      cdsCadFormasPagamento.Append;
      cdsCadFormasPagamento.FieldByName('Codigo').Asinteger        := StrtoInt(edtCodigo.Text);
      cdsCadFormasPagamento.FieldByName('Data_Cad').AsDateTime     := Now;
   End;
   cdsCadFormasPagamento.FieldByName('Descricao').AsString         := edtDescricao.Text;
   cdsCadFormasPagamento.FieldByName('Operador').AsString          := GsOperador;
   cdsCadFormasPagamento.FieldByName('TipoPagamento').AsString     := IntToStr(cmbTipoPagamento.ItemIndex);
   cdsCadFormasPagamento.FieldByName('TipoLancamento').AsString    := IntToStr(cmbTipoLancamento.ItemIndex);
   cdsCadFormasPagamento.FieldByName('ImprimeMensagem').AsBoolean  := chkImprimeMensagem.Checked;
   cdsCadFormasPagamento.FieldByName('Prazo').AsString             := edtPrazo.Text;
   cdsCadFormasPagamento.FieldByName('Cod_Emp').AsString           := gsCod_Emp;
   cdsCadFormasPagamento.FieldByName('SomaVenda').AsString        := '0';
   if chkSomaVendas.Checked then
      cdsCadFormasPagamento.FieldByName('SomaVenda').AsString     := '1';
   cdsCadFormasPagamento.FieldByName('ImprimeRelatorio').AsBoolean := chkRelatorioCheque.Checked;
   cdsCadFormasPagamento.Post;

   If cdsCadFormasPagamento.ChangeCount > 0  Then // se houve mudancas
      cdsCadFormasPagamento.ApplyUpdates(-1);

   if chkImprimeMensagem.Checked then
      MemoMensagem.Lines.SaveToFile(gspath+incZero( IntToStr(sdtsPesquisa.FieldByName('Codigo').AsInteger),3)+'.Men');

   BtnIncluir.Enabled := True;
   BtnAlterar.Enabled := True;
   BtnExcluir.Enabled := True;
   BtnOk.Enabled      := False;
   BtnCancela.Enabled := False;

   LimpaCampos();

   If pvQualBotao = 'ALTERAR' then
      EdtPesquisaChange(EdtPesquisa);

   PagCadastro.ActivePageIndex:=0;

end;

procedure TfrmCadFormaPagamento.btnRemoverDescontoClick(Sender: TObject);
begin
   gConexao.Conection.Execute('Delete from ProdutosPagamentos where '+
                              ' Produtoid='+srcProdutosPagamentos.DataSet.FieldByName('Codigo').AsString+' and '+
                              ' PagamentoID='+sdtsPesquisa.FieldByName('Codigo').AsString,Nil);
   AtualizaProdutosPagamentos(sdtsPesquisa.FieldByName('Codigo').AsInteger);
end;

procedure TfrmCadFormaPagamento.BtnCancelaClick(Sender: TObject);
begin

   BtnIncluir.Enabled := True;
   BtnAlterar.Enabled := True;
   BtnExcluir.Enabled := True;
   BtnOk.Enabled      := False;
   BtnCancela.Enabled := False;

   LimpaCampos();

   PagCadastro.ActivePageIndex:=0;

end;

procedure TfrmCadFormaPagamento.EdtPesquisaChange(Sender: TObject);
var lsCoringa : String;
begin
   lsCoringa := '';
   if chkPesqTodoTexto.Checked Then
      lsCoringa := '%';

   sdtsPesquisa.Close;
   sdtsPesquisa.DataSet.CommandText := 'Select * from T_FormasPagamento '+
                                       'Where Descricao like :parDescricao ';
   sdtsPesquisa.DataSet.ParamByName('parDescricao').AsString := lsCoringa+EdtPesquisa.Text+'%';
   sdtsPesquisa.Open;
end;

procedure TfrmCadFormaPagamento.btnAdicionaDescontoClick(Sender: TObject);
begin
  qryProdutosPagamentos.SQL.Text :=' insert into ProdutosPagamentos ( Preco,ProdutoId,PagamentoId,Operador,Data_Cadastro,Data_movimento) values '+
                                   ' ( :parPreco,:parProdutoId,:parPagamentoId,:parOperador,:parData_Cadastro,:parData_movimento)';
  qryProdutosPagamentos.ParamByName('parPreco').AsFloat := Strtofloat(edtPerc_Desconto.text);
  qryProdutosPagamentos.ParamByName('parProdutoId').AsInteger :=strToInt(edtCod_Produto.Text) ;
  qryProdutosPagamentos.ParamByName('parPagamentoId').AsInteger := sdtsPesquisa.FieldByName('Codigo').AsInteger ;
  qryProdutosPagamentos.ParamByName('parOperador').AsString :=gsOperador ;
  qryProdutosPagamentos.ParamByName('parData_Cadastro').AsSQLTimeStamp := DateTimeToSqlTimeStamp( now );
  qryProdutosPagamentos.ParamByName('parData_movimento').AsSQLTimeStamp := DateTimeToSqlTimeStamp( now );
  qryProdutosPagamentos.Execsql;

  AtualizaProdutosPagamentos(sdtsPesquisa.FieldByName('Codigo').AsInteger);
end;

procedure TfrmCadFormaPagamento.AtualizaProdutosPagamentos(PagamentoId : Integer);
begin
    srcProdutosPagamentos.DataSet := gConexao.BuscarDadosSQL('select prod.Codigo, Prod.descricao, pag.preco from ProdutosPagamentos pag '+
                                                             ' left join T_Produtos prod on prod.Codigo=pag.ProdutoId  where PagamentoId='+IntTOStr(PagamentoId),Nil);

end;


procedure TfrmCadFormaPagamento.btnalterarClick(Sender: TObject);
begin
   pvQualBotao := 'ALTERAR';

   IF sdtsPesquisa.IsEmpty Then
   Begin
      CaixaMensagem( 'N�o existe registro selecionado ', ctAviso, [ cbOk ], 0 );
      Exit
   End;

   Tabmensagem.TabVisible     := False;
   edtcodigo.Text             := incZero( IntToStr(sdtsPesquisa.FieldByName('Codigo').AsInteger),3);
   edtDescricao.Text          := sdtsPesquisa.FieldByName('Descricao').AsString;
   cmbTipoPagamento.ItemIndex := sdtsPesquisa.FieldByName('TipoPagamento').AsInteger;
   cmbTipoLancamento.ItemIndex := sdtsPesquisa.FieldByName('TipoLancamento').AsInteger;
   chkImprimeMensagem.Checked := sdtsPesquisa.FieldByName('ImprimeMensagem').AsBoolean;
   edtPrazo.Text              := sdtsPesquisa.FieldByName('Prazo').AsString;
   EdtData_cad.text           := FormatDateTime('dd/mm/yyyy',sdtsPesquisa.FieldByName('Data_Cad').AsDateTime);
   chkSomaVendas.Checked      := sdtsPesquisa.FieldByName('SomaVenda').AsBoolean;
   if sdtsPesquisa.FieldByName('ImprimeMensagem').AsBoolean then
   Begin
      Tabmensagem.TabVisible  := True;
      if FileExists(gspath+incZero( IntToStr(sdtsPesquisa.FieldByName('Codigo').AsInteger),3)+'.Men') then
         MemoMensagem.Lines.LoadFromFile(gspath+incZero( IntToStr(sdtsPesquisa.FieldByName('Codigo').AsInteger),3)+'.Men');
   End;


   BtnIncluir.Enabled :=False;
   BtnAlterar.Enabled :=False;
   BtnExcluir.Enabled :=False;
   BtnOk.Enabled      :=True;
   BtnCancela.Enabled :=True;
   PagCadastro.ActivePageIndex:=1;

   edtDescricao.SetFocus;

end;

procedure TfrmCadFormaPagamento.btnexcluirClick(Sender: TObject);
begin
   IF sdtsPesquisa.IsEmpty Then
   Begin
      CaixaMensagem( 'N�o existe registro selecionado ', ctAviso, [ cbOk ], 0 );
      Exit
   End;
   if CaixaMensagem( 'Deseja Exclir o Forma de Pagamento '+sdtsPesquisa.FieldByname('Descricao').asString, ctConfirma, [ cbSimNao ], 0 )  Then
   Begin
      sdtsPesquisa.Delete;
      sdtsPesquisa.ApplyUpdates(-1);
   End;

end;

procedure TfrmCadFormaPagamento.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadFormaPagamento.chkImprimeMensagemClick(Sender: TObject);
begin
   if chkImprimeMensagem.Checked then
   Begin
      Tabmensagem.TabVisible  := True;
      if FileExists(gspath+incZero( IntToStr(sdtsPesquisa.FieldByName('Codigo').AsInteger),3)+'.Men') then
         MemoMensagem.Lines.LoadFromFile(gspath+incZero( IntToStr(sdtsPesquisa.FieldByName('Codigo').AsInteger),3)+'.Men');
   End
   Else
      Tabmensagem.TabVisible  := False;
end;

procedure TfrmCadFormaPagamento.cmbNome_ProdutoChange(Sender: TObject);
begin
  inherited;
  if cmbNome_Produto.KeyValue <> null Then
     edtcod_Produto.Text := inczero(cmbNome_Produto.KeyValue,5);

end;

procedure TfrmCadFormaPagamento.cmbTipoPagamentoChange(Sender: TObject);
begin
   lblPrazo.Visible := False;
   edtPrazo.Visible := False;
   case cmbTipoPagamento.ItemIndex of
     1 :
     Begin
        lblPrazo.Visible := True;
        edtPrazo.Visible := True;
     End;
   end;
end;
procedure TfrmCadFormaPagamento.edtCod_ProdutoExit(Sender: TObject);
begin
   if Trim(edtCod_produto.text) <> '' Then
   Begin
      cmbNome_Produto.KeyValue :=  edtCod_Produto.Text;
      if trim(cmbNome_Produto.text) = '' Then
      Begin
         CaixaMensagem( 'Produto n�o encontrado ', ctAviso, [ cbOk ], 0 );
         edtCod_Produto.Setfocus;
      End;
   End;
end;

procedure TfrmCadFormaPagamento.FormShow(Sender: TObject);
begin
   pagCadastro.ActivePageIndex := 0;

   qryvariavel.Close;
   qryvariavel.Params.clear;
   qryvariavel.SQL.Text := 'Select * from T_Produtos where ( Tipo_Produto=:parTipo_Produto  or Tipo_Produto=:parTipo_Produto2 ) ';
   qryvariavel.ParamByName('parTipo_Produto').AsInteger   := 0; // 1 <materia prima
   qryvariavel.ParamByName('parTipo_Produto2').AsInteger  := 1; // 1 <materia prima

   cdsCadProdutos.close;
   cdsCadProdutos.ProviderName := dspvariavel.Name;
   cdsCadProdutos.Open;

end;

end.


