{
 Status
        1 - Contratado
        2 - Em producao
        3 - Finalizado
        4 - Entregue
        5 - Cancelado
 Situacao
        1 - Pendente
        2 - Entregue
 Tag da venda

    Tag = 5 : lancamento de Material Utilizado do Controle de Assistencia Tecnica
    Tag = 4 : Finaliza�ao de OS
    Tag = 3 : Servi�o
    Tag = 0 : Vendas normais

}
unit uVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Provider, ADODB, StdCtrls, bsSkinCtrls, Mask,
  bsSkinBoxCtrls, bsSkinGrids, bsDBGrids, ComCtrls, bsSkinTabs, ExtCtrls,
  ToolWin, BusinessSkinForm, Buttons, bsdbctrls, EditNew, FMTBcd, SqlExpr,
  SimpleDS, sqltimst, RDprint,uFormBase, uClassVenda,uClassItemvenda,uDaoItemVenda,
  uDaoCustoProduto, frxClass, frxDBSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,udtmVendas,
  dxSkinsDefaultPainters, cxImage, dblookup, DBCtrls, Menus;
const
    SERVICOS = 3;
    VENDAS_EXTERNAS = 2;
    VENDAS_NORMAIS = 0;
    OS_FINALIZADA = 4;
    LANCAMENTO_MATERIAL = 5;
    ATENDIMENTO = 6;
    MANUTENCAO_OS = 7;
type
  TfrmVendas = class(TFormBase)
    dspItensVendas: TDataSetProvider;

    cdsCadClientes: TClientDataSet;
    srcCadClientes: TDataSource;
    dspVariavel: TDataSetProvider;
    pnlDadosClientes: TbsSkinPanel;
    bsSkinCoolBar2: TbsSkinCoolBar;
    bsSkinToolBar2: TbsSkinToolBar;
    btnExcluir: TbsSkinSpeedButton;
    btnAdicionar: TbsSkinSpeedButton;
    bsSkinBevel3: TbsSkinBevel;
    bsSkinBevel4: TbsSkinBevel;
    pnlProdutos: TbsSkinPanel;
    bsSkinBevel6: TbsSkinBevel;
    bsSkinPanel3: TbsSkinPanel;
    edtCod_Produto: TbsSkinEdit;
    cmbNome_Produto: TbsSkinDBLookupComboBox;
    edtQtde_Venda: TbsSkinEdit;
    EdtPco_Venda: TbsSkinEdit;
    edtTotal: TbsSkinEdit;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    cdsCadProdutos: TClientDataSet;
    srcCadProdutos: TDataSource;
    cdsItensVendas: TClientDataSet;
    srcItensVendas: TDataSource;
    bsSkinStdLabel7: TbsSkinStdLabel;
    cdsItensVendasTMP: TClientDataSet;
    srcItensVendasTMP: TDataSource;
    cdsItensVendasTMPCodigo: TIntegerField;
    cdsItensVendasTMPDescricao: TStringField;
    cdsItensVendasTMPPco_Venda: TFloatField;
    cdsItensVendasTMPqtde_Venda: TFloatField;
    cdsItensVendasTMPvlr_Total: TFloatField;
    cdsItensVendasTMPComplemento: TStringField;
    dspVenda: TDataSetProvider;
    cdsVenda: TClientDataSet;
    srcVenda: TDataSource;
    edtDesconto: TbsSkinEdit;
    bsSkinStdLabel8: TbsSkinStdLabel;
    edtVlr_Desconto: TbsSkinEdit;
    cdsItensVendasTMPvlr_Desconto: TFloatField;
    edtTotalVenda: TEditN;
    bsSkinStdLabel9: TbsSkinStdLabel;
    edtTotDesconto: TEditN;
    edtTotalLiquido: TEditN;
    bsSkinStdLabel10: TbsSkinStdLabel;
    bsSkinStdLabel11: TbsSkinStdLabel;
    btnCadAlunos: TbsSkinSpeedButton;
    cmbNome_Cliente: TbsSkinDBLookupComboBox;
    cmbCod_Cliente: TbsSkinDBLookupComboBox;
    edtcod_Cliente: TbsSkinEdit;
    bsSkinStdLabel12: TbsSkinStdLabel;
    btnCadProdutos: TbsSkinSpeedButton;
    bsSkinStdLabel6: TbsSkinStdLabel;
    cmbCod_formaPagamento: TbsSkinDBLookupComboBox;
    cmbNome_formaPagamento: TbsSkinDBLookupComboBox;
    lblControle: TbsSkinStdLabel;
    edtControle: TbsSkinEdit;
    lblCNPJCPF: TbsSkinStdLabel;
    edtCnpjCpf: TbsSkinEdit;
    qryVenda: TSQLQuery;
    qryItensVendas: TSQLQuery;
    qryModific: TSQLQuery;
    QryVariavel: TSQLQuery;
    cdsCadFormasPagamento: TClientDataSet;
    srcCadFormasPagamento: TDataSource;
    bsSkinStdLabel15: TbsSkinStdLabel;
    cmbCod_Funcionario: TbsSkinDBLookupComboBox;
    cmbNome_Funcionario: TbsSkinDBLookupComboBox;
    srcCadFuncionarios: TDataSource;
    qryPagamento: TSQLQuery;
    dspPagamento: TDataSetProvider;
    cdsPagamento: TClientDataSet;
    srcPagamento: TDataSource;
    cdsCadFuncionarios: TClientDataSet;
    cmbTipoDesconto: TbsSkinComboBox;
    bsSkinStdLabel16: TbsSkinStdLabel;
    edtDataVenda: TbsSkinDateEdit;
    cmbCNPJCPF: TbsSkinDBLookupComboBox;
    edtCod_FormaPagamento: TbsSkinEdit;
    edtCod_Funcionario: TbsSkinEdit;
    sdtsConsultaCli: TSimpleDataSet;
    btnAlterar: TbsSkinSpeedButton;
    bsSkinBevel7: TbsSkinBevel;
    btnCancelar: TbsSkinSpeedButton;
    edtLimite_Credito: TEditN;
    cdsTempPagamentos: TClientDataSet;
    cdsTempPagamentosCodigo: TStringField;
    cdsTempPagamentosDescricao: TStringField;
    cdsTempPagamentosValor: TFloatField;
    sdtsPesqPrepagamento: TSimpleDataSet;
    impMatricial: TRDprint;
    edtdata_Vencimento: TbsSkinDateEdit;
    lblVencimento: TbsSkinStdLabel;
    edtNome_Cliente: TbsSkinEdit;
    sdtsPesqDescCli: TSimpleDataSet;
    qryItensMateriaPrima: TSQLQuery;
    dspItensMateriaPrima: TDataSetProvider;
    cdsItensMateriaPrima: TClientDataSet;
    srcItensMateriaPrima: TDataSource;
    srcCadFichaTecnica: TDataSource;
    cdsCadFichaTecnica: TClientDataSet;
    sdtsVerSaldos: TSimpleDataSet;
    cmbRota: TbsSkinDBLookupComboBox;
    cdsRotas: TClientDataSet;
    srcRotas: TDataSource;
    edtPco_Tabela: TbsSkinEdit;
    cdsSaldos: TClientDataSet;
    dspSaldos: TDataSetProvider;
    qrySaldos: TSQLQuery;
    cdsItensVendasTMPPco_tabela: TFloatField;
    memoMensagem: TbsSkinMemo;
    cdsItensVendasTMPperc_Comis: TFloatField;
    cmbNome_TipoVenda: TbsSkinDBLookupComboBox;
    cmbCod_tipoVenda: TbsSkinDBLookupComboBox;
    edtCod_TipoVenda: TbsSkinEdit;
    lblNomeTipoVenda: TbsSkinStdLabel;
    cdsTipoVenda: TClientDataSet;
    srcTipoVenda: TDataSource;
    bsSkinCoolBar3: TbsSkinCoolBar;
    bsSkinToolBar3: TbsSkinToolBar;
    btnFechar: TbsSkinSpeedButton;
    btnincluir: TbsSkinSpeedButton;
    BtnCancela: TbsSkinSpeedButton;
    bsSkinBevel1: TbsSkinBevel;
    btnok: TbsSkinSpeedButton;
    bsSkinBevel2: TbsSkinBevel;
    bsSkinBevel5: TbsSkinBevel;
    pnlRemessaAberta: TPanel;
    cdsItensVendasTMPUnidade: TStringField;
    cdsItensVendasTMPqtdeEmbalagem: TIntegerField;
    cdsItensVendasTMPseqVenda: TIntegerField;
    cdsItensVendasTMPSetorId: TIntegerField;
    btnDesconto: TbsSkinSpeedButton;
    cdsItensVendasTMPPesoBruto: TFloatField;
    cdsItensVendasTMPPesoLiquido: TFloatField;
    cdsItensVendasTMPPrecoCusto: TFloatField;
    cdsItensVendasTMPMargemSecundaria: TFloatField;
    cdsItensVendasTMPLucroBruto: TFloatField;
    PanelStatus: TbsSkinStatusPanel;
    frxVenda: TfrxReport;
    frxDbItens: TfrxDBDataset;
    frxDBCliente: TfrxDBDataset;
    frxDbEmpresa: TfrxDBDataset;
    cdsEmpresa: TClientDataSet;
    cdsEmpresaID_Empresa: TIntegerField;
    cdsEmpresaNome_Fantasia: TStringField;
    cdsEmpresaCNPJCPF: TStringField;
    cdsEmpresaEndereco: TStringField;
    cdsEmpresaBairro: TStringField;
    cdsEmpresaCidade: TStringField;
    cdsEmpresaUF: TStringField;
    cdsEmpresaTelefone: TStringField;
    cdsEmpresacelular: TStringField;
    cdsEmpresaOperador: TStringField;
    cdsEmpresaData_Cad: TSQLTimeStampField;
    cdsEmpresaData_Atu: TSQLTimeStampField;
    cdsEmpresaLimite_Credito: TFloatField;
    cdsEmpresaStatus: TStringField;
    cdsEmpresaativo: TStringField;
    cdsEmpresaCod_Atividade: TIntegerField;
    cdsEmpresaCep: TStringField;
    cdsEmpresaCod_Rota: TIntegerField;
    cdsEmpresaQtde_PedAberto: TIntegerField;
    cdsEmpresarazao_Social: TStringField;
    cdsEmpresaPto_Referencia: TStringField;
    cdsEmpresaFax: TStringField;
    cdsEmpresaResponsavel: TStringField;
    cdsEmpresacod_Funcionario: TIntegerField;
    cdsEmpresaemail: TStringField;
    cdsEmpresaDiretorGeral: TStringField;
    cdsEmpresaDiretorEncino: TStringField;
    cdsEmpresaDiretorDetran: TStringField;
    cdsEmpresaLiberado: TBooleanField;
    cdsEmpresaDiretorEnsino: TStringField;
    cdsEmpresaNomeDiretor: TStringField;
    cdsEmpresaHomePage: TStringField;
    cdsEmpresaDiretor: TStringField;
    cdsEmpresaLocal: TStringField;
    cdsItensVendasTMPTipoCalculo: TStringField;
    cdsItensVendasTMPPrevisao_Entrega: TDateField;
    PagVendas: TPageControl;
    TabSheet1: TTabSheet;
    TabGrade: TTabSheet;
    dbgConsulta: TbsSkinDBGrid;
    bsSkinScrollBar2: TbsSkinScrollBar;
    bsSkinScrollBar1: TbsSkinScrollBar;
    gridTamanho: TbsSkinDBGrid;
    bsSkinButton1: TbsSkinButton;
    btnRemover: TbsSkinButton;
    Panel1: TPanel;
    Panel2: TPanel;
    bsSkinLabel1: TbsSkinLabel;
    bsSkinLabel2: TbsSkinLabel;
    lblRestante: TbsSkinLabel;
    lbltotalIncluido: TbsSkinLabel;
    cmbTamanhos: TbsSkinDBLookupComboBox;
    edtQtdeTamanho: TbsSkinEdit;
    bsSkinLabel5: TbsSkinLabel;
    pnlProduto: TPanel;
    cdsItensVendasTMPGradeID: TIntegerField;
    cdsItensTamanhos: TClientDataSet;
    srcItemTamanho: TDataSource;
    cmdNomeTamanho: TDBLookupComboBox;
    cdsItensTamanhosID: TIntegerField;
    cdsItensTamanhosTamanho: TStringField;
    cdsItensTamanhosQtde: TIntegerField;
    bsSkinLabel6: TbsSkinLabel;
    cdsItensTamanhosIdProduto: TStringField;
    Panel3: TPanel;
    imgFrente: TcxImage;
    imgVerso: TcxImage;
    cdsItensTamanhosItenGradeID: TIntegerField;
    frxVendaPersonalizada03: TfrxReport;
    cdsItensVendasTMPTipoProduto: TStringField;
    btnOkProd: TbsSkinSpeedButton;
    MenuCliente: TPopupMenu;
    NovoClienen1: TMenuItem;
    CadastrodeCliente1: TMenuItem;
    cdsItensVendasTMPFuncionarioId: TIntegerField;
    TabSheet3: TTabSheet;
    MemoObs: TMemo;
    AlteraoCliente1: TMenuItem;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCod_ProdutoExit(Sender: TObject);
    procedure cmbNome_ProdutoChange(Sender: TObject);
    procedure EdtPco_VendaExit(Sender: TObject);
    procedure edtQtde_VendaExit(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure edtTotalExit(Sender: TObject);
    procedure btnincluirClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure cdsItensVendasTMPAfterOpen(DataSet: TDataSet);
    procedure edtDescontoExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtcod_ClienteExit(Sender: TObject);
    procedure cmbNome_ClienteChange(Sender: TObject);
    procedure cmbCod_ClienteChange(Sender: TObject);
    procedure limpacampos;
    procedure cmbCod_formaPagamentoChange(Sender: TObject);
    procedure cmbNome_formaPagamentoChange(Sender: TObject);
    procedure cmbCod_FuncionarioChange(Sender: TObject);
    procedure cmbNome_FuncionarioChange(Sender: TObject);
    procedure cmbCNPJCPFClick(Sender: TObject);
    procedure btnCadProdutosClick(Sender: TObject);
    procedure edtCod_FormaPagamentoExit(Sender: TObject);
    procedure edtCod_FuncionarioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnOkProdClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtdata_VencimentoExit(Sender: TObject);
    procedure edtControleExit(Sender: TObject);
    procedure cdsItensVendasTMPBeforeOpen(DataSet: TDataSet);
    procedure edtCod_TipoVendaExit(Sender: TObject);
    procedure cmbCod_tipoVendaChange(Sender: TObject);
    procedure cmbNome_TipoVendaChange(Sender: TObject);
    procedure cmbNome_TipoVendaExit(Sender: TObject);
    procedure btnDescontoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure PagVendasChange(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure CadastrodeCliente1Click(Sender: TObject);
    procedure btnCadAlunosClick(Sender: TObject);
    procedure NovoClienen1Click(Sender: TObject);
    procedure AlteraoCliente1Click(Sender: TObject);

  private
     pvQualBotao      : String;
     pvrvlr_TotalAnt  : Real;
     pviLinha         : Integer;
     pDescontoCliente : Boolean;
     pAnimalId         : Integer;
     procedure MostrarAnimaisCliente;
     procedure VerificarSaldoDevedor(ClienteID : Integer);
     procedure VerLimite();
     procedure AtualizaDesconto(lrPercDesconto : Real);
     procedure TotalizarVenda(lrTotalDesconto: Real);
    function RetornarSelectProdutos: String;
    procedure AtaulizaLucroBruto;
    procedure PedidoPersonalizado(NumeroVenda: String);
    function TotalDigitado(IdProduto: String): Real;
    procedure AtualizaValores;
    procedure PedidoPersonalizado03(NumeroVenda: String);
    procedure AtualizarDadosClientes;
    function RetornarMecanico: Integer;
    { Private declarations }
  public
     liSeqVendaAtu  : Integer;
     liSeqOs        : Integer;
     liCaixa        : Integer;
     liTotalLiquido : Real;
     pAtendimento   : Boolean;
     pliCliente     : Integer;
     qtdeTotal      : Integer;
     procedure PrepararFinalizacaoOS;
     procedure AtualizaTabelas();
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

uses uPrincipal,ufuncoes, uCadClientes, uCadProdutos, uBaixaNormal, DBXCommon, uClassContaCorrente,uClassDaoContaCorrente,
  uCalMQuadrado, DaoRemessa, uDaoVenda, uDaoFuncionario, uDaoClienteAnimal,uDaoCliente,
  uselAnimal, uDescontoVenda, uDelivery, uDaoItensVendaGrade, uDaoProduto,
  uCadastroRapidoCliente, uselFuncionario;

{$R *.dfm}
procedure TfrmVendas.AtualizaDesconto(lrPercDesconto: Real);
var lrVlr_desconto : Real;
begin
   cdsItensVendasTmp.First;
   while not cdsItensVendasTmp.Eof do
   begin
      lrVlr_desconto := ( ( cdsItensVendasTmp.FieldByName('Pco_Venda').asFloat *  cdsItensVendasTmp.FieldByname('Qtde_Venda').AsFloat ) * lrPercDesconto )/100;

      cdsItensVendasTmp.Edit;
      cdsItensVendasTmp.FieldByname('Vlr_desconto').AsFloat := Arredondar( lrVlr_desconto,2);
      cdsItensVendasTmp.FieldByname('Vlr_total').AsFloat    := ( ( cdsItensVendasTmp.FieldByname('Pco_Venda').AsFloat * cdsItensVendasTmp.FieldByname('Qtde_Venda').AsFloat) - lrVlr_desconto );
      cdsItensVendasTmp.Post;
      cdsItensVendasTmp.Next;
   end;
end;

procedure tfrmVendas.AtualizaTabelas();
var precoDeVenda : string;
Begin
   precoDeVenda:= 'Pco_Venda';
   if frmVendas.tag = VENDAS_EXTERNAS then
      precoDeVenda:= 'PrecoVendaExterna as Pco_Venda';


   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text :=RetornarSelectProdutos+' '+
                          'From T_Produtos '+
                          'where  Ativo=1 Order by Descricao ';
   cdsCadProdutos.Close;
   cdsCadProdutos.ProviderName := dspVariavel.Name;
   cdsCadProdutos.Open;
End;

procedure TfrmVendas.AtualizarDadosClientes;
begin
  qryVariavel.Close;
  qryVariavel.Params.Clear;
  qryVariavel.SQL.text := 'Select * from T_Clientes where ativo=:parAtivo order by Descricao ';
  qryVariavel.ParamByName('parativo').AsString := 'S';
  cdsCadClientes.Close;
  cdsCadClientes.ProviderName := dspVariavel.Name;
  cdsCadClientes.Open;
end;

procedure TfrmVendas.VerificarSaldoDevedor(ClienteID : Integer);
var DaoCliente : TDaocliente;
    ValorEmAberto : Real;
begin
   DaoCliente := TDaocliente.Create(gConexao);
   pnlRemessaAberta.Visible:= False;
   pnlRemessaAberta.Caption := 'Vendedor Com Remessa Aberta';
   pnlRemessaAberta.Color := clSkyBlue;
   ValorEmAberto := DaoCliente.SaldoDevedor(ClienteID, RetornarDataSistema );
   IF ValorEmAberto > 0 Then
   begin
      pnlRemessaAberta.Visible:= True;
      pnlRemessaAberta.Caption := 'Valor Em Aberto..: '+Formatfloat(',0.00',ValorEmAberto);
      pnlRemessaAberta.Color := clRed;
   end
end;

procedure tfrmVendas.VerLimite();
Begin

   if StrToFloat(edtTotalLiquido.Text)>StrTOfloat(edtLimite_Credito.Text) then
   Begin
      CaixaMensagem( 'O cliente ultrapassou o limite de credito ', ctAviso, [ cbOk ], 0 );
      if Copy(Trim(cdsCadFormasPagamento.FieldByName('Descricao').AsString),1,7)<>'A VISTA' then
         btnok.Enabled          :=False;
      edtTotalLiquido.Color := clred;
   End
   Else
   Begin
      btnok.Enabled         := True;
      edtTotalLiquido.Color := clInfoBk;
   End;
End;

procedure TfrmVendas.limpacampos();
Begin
   edtcod_Cliente.Text         := '';
   edtTotalVenda.Text          := '0,00';
   edtQtde_Venda.Text          := '0';
   edtPco_Venda.Text           := FormatFloat(RetornarMascaraDoValor(gParametros.Ler( '', '[VENDA]', 'CasasDecimais', '2' )),0);
   edtPco_Tabela.Text          := '0,00';
   edtTotal.Text               := '0,00';
   edtDesconto.Text            := '0,00';
   edtTotDesconto.Text         := '0,00';
   edtVlr_Desconto.Text        := '0,00';
   edtTotalLiquido.Text        := '0,00';
   edtCod_Produto.Text         := '';
   edtCnpjCpf.Text             := '';
   edtControle.Text            := '';
   edtCod_Funcionario.Text     := '';
   edtCod_TipoVenda.Text       := '';
   cmbNome_tipoVenda.KeyValue  := null;
   edtCod_FormaPagamento.Text  := '';
   cmbCod_formaPagamento.keyvalue  := null;
   cmbNome_formaPagamento.KeyValue := Null;
   cmbCod_Funcionario.KeyValue     := Null;
   cmbNome_Funcionario.KeyValue    := Null;
   cmbCod_Cliente.KeyValue         := Null;
   edtLimite_Credito.Text          := '0,00';
   cmbNome_Cliente.KeyValue        := Null;
   edtNome_Cliente.text            := '';
   MemoObs.Text                    := ''; 
End;
procedure TfrmVendas.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
var DaoCliente : TDaoCliente;
begin
   DaoCliente := TDaoCliente.Create(gConexao);
   cdsCadClientes.Data := DaoCliente.BuscarTodos.Data;

   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text :='Select Codigo,Descricao,TipoPagamento,TipoLancamento,ImprimeMensagem,Prazo from T_formasPagamento  ';
   IF Uppercase( gParametros.Ler( '', '[CADASTRO]', 'CondicaoNaVenda', 'NAO' )) = 'SIM' Then
      qryVariavel.SQL.Add('WHERE TipoPagamento=:parTipoPagamento' );
   QryVariavel.SQL.Add(' Order by Descricao ' );
   IF Uppercase( gParametros.Ler( '', '[CADASTRO]', 'CondicaoNaVenda', 'NAO' )) = 'SIM' Then
      qryVariavel.ParamByName('parTipoPagamento').AsInteger := 1;

   cdsCadFormasPagamento.Close;
   cdsCadFormasPagamento.ProviderName := dspVariavel.Name;
   cdsCadFormasPagamento.Open;

   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text :='Select Codigo,Descricao,Cod_Supervisor from T_Funcionarios where ativo=:parAtivo and Funcao<>:parfuncao order by Descricao ';
   qryVariavel.ParamByName('parAtivo').AsString := 'S';
   qryVariavel.ParamByName('parFuncao').AsString := 'Mecanico';

   cdsCadFuncionarios.Close;
   cdsCadFuncionarios.ProviderName := dspVariavel.Name;
   cdsCadFuncionarios.Open;

   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text :='Select * from T_ProdutosFichaTecnica order by Cod_Produto ';

   cdsCadFichaTecnica.Close;
   cdsCadFichaTecnica.ProviderName := dspVariavel.Name;
   cdsCadFichaTecnica.Open;

   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text :='Select Codigo,Descricao from T_Rotas order by Descricao ';

   cdsRotas.Close;
   cdsRotas.ProviderName := dspVariavel.Name;
   cdsRotas.Open;

   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text :='Select Codigo,Descricao from T_TipoVendas order by Descricao ';

   cdsTipoVenda.Close;
   cdsTipoVenda.ProviderName := dspVariavel.Name;
   cdsTipoVenda.Open;

   liseqos := 0;
   licaixa := 0;
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
   AtualizaTabelas();
   PagVendas.ActivePageIndex   := 0;
   lblControle.Visible         := True;
   edtControle.Visible         := True;
   lblVencimento.Visible       := False;
   edtdata_Vencimento.Visible  := False;
   dtmVendas := TdtmVendas.Create(Self);
   TabGrade.TabVisible := False;
   If (frmVendas.tag = SERVICOS)  Then
   Begin
      frmVendas.Caption    := 'Cadastro e manute��o de vendas de servi�os';
      btnincluir.Caption   := '&Novo Servi�o';
      lblControle.Visible  := True;
      edtControle.Visible  := True;
   End
   Else if (frmVendas.tag = OS_FINALIZADA ) OR (frmVendas.tag = MANUTENCAO_OS ) then
   begin
      PrepararFinalizacaoOS;
      frmVendas.Caption  := 'Inclus�o de Material e Servi�os executados ';
   end
   Else if (frmVendas.tag = LANCAMENTO_MATERIAL ) then
   Begin
      frmVendas.Caption  := 'Inclus�o de Material e Servi�os executados ';
      btnincluir.Caption := '&Nova Venda';
   End
   Else
   Begin
      frmVendas.Caption  := 'Cadastro e manute��o de vendas ';
      btnincluir.Caption := '&Nova Venda';
   End;

   cmbRota.Visible            := False;

   lblNomeTipoVenda.Visible   := (Not RetornarVerdadeirOuFalso( Uppercase( gParametros.Ler( '', '[VENDA]', 'NaoMostraTipoDePagamento', 'NAO' ))));
   cmbNome_tipoVenda.Visible  := (Not RetornarVerdadeirOuFalso( Uppercase( gParametros.Ler( '', '[VENDA]', 'NaoMostraTipoDePagamento', 'NAO' ))));
   edtCod_TipoVenda.Visible   := (Not RetornarVerdadeirOuFalso( Uppercase( gParametros.Ler( '', '[VENDA]', 'NaoMostraTipoDePagamento', 'NAO' ))));

   If gsParametros.ReadString('ACESSODADOS','TipoSistema','0') = '0' Then
      cmbRota.Visible            := True;

   if Uppercase(gParametros.Ler('', '[CADASTRO]', 'VendaSemControle', 'NAO')) = 'SIM' then
   begin
      lblControle.Visible        := True;
      edtControle.Visible        := True;
   end;
   if RetornarVerdadeirOuFalso( Uppercase( gParametros.Ler( '', '[VENDA]', 'ExibeVencimento', 'NAO' ))) then
   begin
      lblVencimento.Visible       := True;
      edtdata_Vencimento.Visible  := True;
   end;

   EdtPco_Venda.Enabled := gsPerfilacesso.VerificaAcesso('Movimento','Vendas','Altera Preco de Venda',gbMaster);

   IF Uppercase( gParametros.Ler( '', '[CADASTRO]', 'VendaSemControle', 'NAO' )) = 'SIM' Then
   begin
      edtControle.Visible := False;
      cmbRota.Visible := False;
      lblControle.Visible := False;
   end;
   pAnimalId := 0;
   btnAdicionar.Enabled   := False;
   btnCadProdutos.Enabled := False;

   if (frmVendas.tag = MANUTENCAO_OS ) then
   begin
      btnok.Caption := '&Salvar';
      btnincluir.Visible := False;
   end;

   if pAtendimento then
      btnincluirClick(btnincluir);
end;

procedure TfrmVendas.edtCod_ProdutoExit(Sender: TObject);
var DaoProDuto : TDaoProduto;
    lsCodigo : String;
begin
   if Trim(edtCod_produto.text) <> '' Then
   Begin
      DaoProDuto := TDaoProduto.Create(gConexao);
      lsCodigo := DaoProduto.RetornarCodigoProduto(edtCod_Produto.Text);
      if lsCodigo <> '0' then
         edtCod_produto.text := lsCodigo
      else
      begin
         lsCodigo := DaoProduto.BuscaCodigoProCodigoProprio(edtCod_Produto.Text);
         if lsCodigo <> '0' then
            edtCod_produto.text := lsCodigo
      end;
      cmbNome_Produto.KeyValue :=  edtCod_Produto.Text;
      if trim(cmbNome_Produto.text) = '' Then
      Begin
         CaixaMensagem( 'Produto n�o encontrado ', ctAviso, [ cbOk ], 0 );
         edtCod_Produto.Setfocus;
      End;
      edtQtde_Venda.Text := '1';
   End;
end;

procedure TfrmVendas.edtCod_TipoVendaExit(Sender: TObject);
begin
   if trim(edtCod_TipoVenda.text)<>'' then
   Begin
      cmbCod_TipoVenda.KeyValue := StrToInt(edtCod_TipoVenda.text);
      cmbCod_TipoVendaChange(cmbCod_TipoVenda);
      if Trim(cmbNome_TipoVenda.Text) = '' Then
      Begin
         cmbNome_TipoVenda.KeyValue := Null;
         edtCod_TipoVenda.Text      := '';
         CaixaMensagem( 'Vendedor nao localizado', ctAviso, [ cbOk ], 0 );
      End;
      try
        edtCod_Funcionario.SetFocus;
      Except

      end;
   End;

end;

procedure TfrmVendas.edtControleExit(Sender: TObject);
var lscopia : String;
begin
   lsCopia := VerCopia( edtControle.Text, 'CONTROLE', 'T_Vendas', frmPrincipal.dbxPrincipal, gsCod_Emp, 'SeqVenda' );
   If lsCopia <> '' Then
   Begin
      CaixaMensagem( 'Numero de controle ja inserido na O.S. ' + lsCopia, ctAviso, [ cbOk ], 0 );
      edtControle.SetFocus;
      Exit;
   End;
end;

procedure TfrmVendas.edtdata_VencimentoExit(Sender: TObject);
begin
   if (edtdata_Vencimento.Date) < (edtDataVenda.Date) then
   Begin
      CaixaMensagem( 'A data de Vencimento n�o pode ser menor que a da venda ', ctAviso, [ cbOk ], 0 );
      edtdata_Vencimento.Setfocus;
   End;
End;

procedure TfrmVendas.cmbNome_ProdutoChange(Sender: TObject);
begin
   if cmbNome_Produto.KeyValue <> null Then
   Begin
      edtcod_Produto.Text := inczero(cmbNome_Produto.KeyValue,5);
      edtPco_venda.Text   := Formatfloat('0.00',cdsCadProdutos.fieldbyname('Pco_Venda').asFloat);
      edtPco_Tabela.Text  := Formatfloat('0.00',cdsCadProdutos.fieldbyname('Pco_Venda').asFloat);
      if (cdsCadProdutos.fieldbyname('M2').asString ='S') or (cdsCadProdutos.fieldbyname('MetroLinear').AsBoolean) then
      Begin
         frmCalMQuadrado := TfrmCalMQuadrado.create(Self);
      if (cdsCadProdutos.fieldbyname('M2').asString ='S') then
          frmCalMQuadrado.tag :=  2;
      if cdsCadProdutos.fieldbyname('MetroLinear').AsBoolean then
          frmCalMQuadrado.tag :=  3;

         frmCalMQuadrado.edtVlrMetro.text := edtPco_venda.Text;
         frmCalMQuadrado.ShowModal;
         if frmCalMQuadrado.Tag = 1 then
         Begin
            edtQtde_Venda.Text := '1';
            EdtPco_Venda.Text  := frmCalMQuadrado.edtTotal.text;
         End;
      End;
      edtDesconto.Enabled := True;
      if (( cdsCadProdutos.fieldbyname('Saldo').asInteger <= 0 ) And
         ( ( Uppercase( gParametros.Ler( '', '[CADASTRO]', 'BloqueioEstoque', 'NAO' )) = 'SIM') or
           ( cdsCadProdutos.fieldbyname('BloqueiaNegativo').asBoolean) ) AND
         ( (frmVendas.Tag= 0 ) OR (frmVendas.Tag= 5 ) ) ) And
           (cdsCadProdutos.fieldbyname('Tipo_Produto').asInteger=0) Then
      Begin
         CaixaMensagem( 'Produto Sem Estoque ', ctAviso, [ cbOk ], 0 );
         edtCod_Produto.SetFocus;
         exit;
      End;
   End;
end;

procedure TfrmVendas.cmbNome_TipoVendaChange(Sender: TObject);
begin
   cmbCod_TipoVenda.KeyValue  :=  cmbNome_TipoVenda.KeyValue;
end;

procedure TfrmVendas.cmbNome_TipoVendaExit(Sender: TObject);
begin
  try
    edtCod_Produto.SetFocus;
  Except

  end;
end;

procedure TfrmVendas.PrepararFinalizacaoOS;
begin
  frmVendas.Caption := 'Finaliza��o de Servi�o';
  btnok.Caption := '&Finalizar';
  lblControle.Visible := True;
  edtControle.Visible := True;
  liTotalLiquido := StrtoFloat(edtTotalLiquido.Text);
  pnlDadosClientes.Enabled := True;
  cmbNome_formaPagamento.Enabled := True;
  edtcod_Cliente.Enabled := False;
  cmbNome_Cliente.Enabled := False;
end;

procedure TfrmVendas.TotalizarVenda(lrTotalDesconto : Real);
var TotalDesconto : Real;
    Total : Real;
  lrdiferenca: real;
begin
   TotalDesconto := 0;
   Total := 0;
   cdsItensVendasTmp.First;
   while not cdsItensVendasTmp.Eof do
   begin
      TotalDesconto := TotalDesconto + cdsItensVendasTmp.FieldByname('Vlr_desconto').AsFloat;
      Total := Total + (cdsItensVendasTmp.FieldByname('Vlr_total').AsFloat);
      cdsItensVendasTmp.Next;
   end;
   if (Arredondar(lrTotalDesconto,2) <>  Arredondar(TotalDesconto,2)) then
   begin
      lrdiferenca := (lrTotalDesconto - TotalDesconto);
      cdsItensVendasTmp.Edit;
      cdsItensVendasTmp.FieldByname('Vlr_desconto').AsFloat :=  cdsItensVendasTmp.FieldByname('Vlr_desconto').AsFloat-(lrdiferenca);
      cdsItensVendasTmp.FieldByname('Vlr_total').AsFloat    := ( (cdsItensVendasTmp.FieldByname('Pco_Venda').AsFloat * cdsItensVendasTmp.FieldByname('Qtde_Venda').AsFloat) - cdsItensVendasTmp.FieldByname('Vlr_desconto').AsFloat );
      cdsItensVendasTmp.Post;
   end;
   
   edtTotDesconto.Text  := FormatFloat('0.00', lrTotalDesconto );
   edtTotalVenda.Text   := FormatFloat('0.00', lrTotalDesconto+Total);
   edtTotalLiquido.Text := FormatFloat('0.00', Total );
end;

procedure TfrmVendas.EdtPco_VendaExit(Sender: TObject);
begin
   EdtPco_Venda.text := SubstString(EdtPco_Venda.text,'.', ',', True );
   EdtPco_Venda.text := formatFloat( '0.00',StrTofloat(EdtPco_Venda.text));
   edtTotal.Text     := Formatfloat( '0.00',StrToFloat(edtQtde_Venda.Text) * ( StrToFloat(EdtPco_Venda.text)- StrToFloat(edtVlr_Desconto.text) ));
  // edtTotal.Text     := Formatfloat( '0.00',StrToFloat(edtTotal.Text) - );
end;

procedure TfrmVendas.edtQtde_VendaExit(Sender: TObject);
begin
   edtTotal.Text := Formatfloat ( '0.00',StrToFloat(edtQtde_Venda.Text) * StrToFloat(EdtPco_Venda.text));
   sdtsPesqDescCli.Close;
   sdtsPesqDescCli.DataSet.CommandText := 'Select * from T_ClientesDescontos where Cod_Cliente=:parCod_Cliente and Cod_Produto=:parcod_Produto';
   sdtsPesqDescCli.DataSet.ParamByName('parCod_Cliente').AsInteger := StrToint(edtcod_Cliente.Text);
   sdtsPesqDescCli.DataSet.ParamByName('parCod_Produto').AsInteger := StrToint(edtCod_Produto.Text);
   sdtsPesqDescCli.Open;
   edtDesconto.Enabled := True;
   pDescontoCliente := False;
   if Not sdtsPesqDescCli.IsEmpty then
   Begin
      If sdtsPesqDescCli.FieldByname('Qtde_Minima').asInteger<=StrToint(edtQtde_Venda.text) Then
      Begin
         cmbTipoDesconto.ItemIndex := 1;
         pDescontoCliente := true;
         edtDesconto.Text :=Formatfloat('0.00', sdtsPesqDescCli.FieldByname('Perc_Desconto').asFloat);
         edtDescontoExit(edtDesconto);
         edtDesconto.Enabled := false;
         EdtPco_Venda.SetFocus;
      End;
   End;
   If ( cdsCadProdutos.FieldByname('Saldo').asInteger<StrToFloat(edtQtde_Venda.text))  And
      ( ( Uppercase( gParametros.Ler( '', '[CADASTRO]', 'BloqueioEstoque', 'NAO' )) = 'SIM') OR
      ( cdsCadProdutos.fieldbyname('BloqueiaNegativo').asBoolean) )  AND
      ( (frmVendas.Tag= 0 ) OR (frmVendas.Tag= 5 ) ) And
      (cdsCadProdutos.fieldbyname('Tipo_Produto').asInteger=0) Then
   Begin
      CaixaMensagem( 'Produto com estoque insuficiente ',ctAviso, [ cbOk ], 0 );
      edtCod_Produto.SetFocus;
      exit;
   End;
end;

procedure TfrmVendas.btnOkProdClick(Sender: TObject);
var DaoCustoPtoduto : TdaoCustoProduto;
    PrecoCusto : Real;
    lrPerc_Desconto : Real;
    lrDiferenca :Real;
  liFuncionarioId: Integer;
begin
   DaoCustoPtoduto := TdaoCustoProduto.Create(gConexao);
   if strtofloat(Edttotal.text ) <=0 Then
   Begin
      CaixaMensagem( 'O Valor Total n�o pode ser zero ', ctAviso, [ cbOk ], 0 );
      edtCod_Produto.SetFocus;
      Exit;
   End;
   If pvQualBotao = 'Incluir' Then
   Begin
      if cdsItensVendasTmp.Locate('Codigo',IntToStr( StrtoInt ( EdtCod_Produto.Text ) ),[] ) Then
      Begin
         CaixaMensagem( 'Este produto ja foi includo ', ctAviso, [ cbOk ], 0 );
          edtCod_Produto.SetFocus;
         Exit;
      End;
   End;

   if ( cdsCadProdutos.fieldbyname('Tipo_Produto').asInteger = 1 ) then
   begin
      liFuncionarioId := 0;
      if RetornarVerdadeirOuFalso( Uppercase( gParametros.Ler( '', '[VENDA]', 'ControleComissaoServico', 'NAO' ))) then
         liFuncionarioId := RetornarMecanico;
   end;

   If pvQualBotao = 'Incluir' Then
      cdsItensVendasTmp.Append
   Else
   Begin
      cdsItensVendasTmp.Edit;
      edtTotalVenda.Text := FormatFloat('0.00', StrToFloat(edtTotalVenda.Text)-pvrvlr_TotalAnt);
   End;
   lrPerc_Desconto := 0;
   lrDiferenca     := 0;
   PrecoCusto           := DaoCustoPtoduto.CustoMercadoriaVendida(StrToInt(edtCod_Produto.Text));
   lrDiferenca          := StrToFloat(edtPco_Tabela.Text) - StrToFloat(edtPco_Venda.Text);

   if StrToFloat(edtPco_Tabela.Text)>0 then
      lrPerc_Desconto := Arredondar( ( lrDiferenca / StrToFloat(edtPco_Tabela.Text) * 100),2);
   cdsItensVendasTmp.FieldByName('Perc_Comis').asFloat := cdsCadProdutos.fieldbyname('Perc_Comissao').asFloat;
   if lrPerc_Desconto > StrTofloat( gParametros.Ler( '', '[ADMINISTRATIVO]', 'DescontoMaximo', '0' ))then
      cdsItensVendasTmp.FieldByName('Perc_Comis').asFloat := cdsCadProdutos.fieldbyname('ComissaoSecundaria').asFloat;

   cdsItensVendasTmp.FieldByName('Codigo').asInteger         := StrToInt(edtCod_Produto.Text);
   cdsItensVendasTmp.FieldByName('Qtde_Venda').asFloat       := StrToFloat (edtQtde_Venda.Text);
   cdsItensVendasTmp.FieldByName('Pco_Venda').asFloat        := StrToFloat (edtPco_Venda.Text);
   cdsItensVendasTmp.FieldByName('Pco_Tabela').asFloat       := StrToFloat (edtPco_Tabela.Text);
   cdsItensVendasTmp.FieldByName('vlr_Total').asFloat        := StrToFloat ( edtTotal.Text);
   cdsItensVendasTmp.FieldByName('PrecoCusto').asFloat       := PrecoCusto;
   cdsItensVendasTmp.FieldByName('LucroBruto').asFloat       := Arredondar((( StrToFloat(edtPco_Venda.Text) - PrecoCusto )/StrToFloat(edtPco_Venda.Text))*100,4);
   cdsItensVendasTmp.FieldByName('MargemSecundaria').asFloat := cdsCadProdutos.fieldbyname('MargemSecundaria').asFloat;
   cdsItensVendasTmp.FieldByName('vlr_Desconto').asFloat     := StrToFloat ( edtVlr_Desconto.Text);
   cdsItensVendasTmp.FieldByName('Descricao').asString       := cmbNome_Produto.Text;
   cdsItensVendasTmp.FieldByName('Unidade').asString         := cdsCadProdutos.FieldByName('Unid').AsString;
   cdsItensVendasTmp.FieldByName('TipoProduto').asString     := cdsCadProdutos.FieldByName('TipoProduto').AsString;
   cdsItensVendasTmp.FieldByName('QtdeEmbalagem').asString   := cdsCadProdutos.FieldByName('QtdeEmbalagem').AsString;
   cdsItensVendasTmp.FieldByName('PesoBruto').asFloat        := StrToFloat(edtQtde_Venda.Text) * cdsCadProdutos.FieldByName('PesoBruto').AsFloat;
   cdsItensVendasTmp.FieldByName('PesoLiquido').asFloat      := StrToFloat(edtQtde_Venda.Text) * cdsCadProdutos.FieldByName('PesoLiquido').AsFloat;
   cdsItensVendasTmp.FieldByName('SeqVenda').asInteger       := 1;
   cdsItensVendasTmp.FieldByName('GradeID').asInteger        := cdsCadProdutos.fieldbyname('GradeID').AsInteger;
   cdsItensVendasTmp.FieldByName('SetorId').asInteger        := 1;
   cdsItensVendasTmp.FieldByName('FuncionarioId').asInteger  := liFuncionarioId;

   if cdsCadProdutos.FieldByName('Garantia').AsInteger > 0 then
      cdsItensVendasTmp.FieldByName('Complemento').asString:=' Garantia de '+cdsCadProdutos.fieldbyname('Garantia').AsString+' Dias';


   if frmVendas.Tag=VENDAS_EXTERNAS then
      cdsItensVendasTmp.FieldByName('SetorId').asInteger   := gParametros.Ler( '', '[GERAL]', 'EstoqueVendaExterna', '1' );
   cdsItensVendasTmp.Post;

   edtTotDesconto.Text  := FormatFloat('0.00', StrToFloat(edtTotDesconto.Text)+( StrToFloat(edtVlr_Desconto.Text)*StrTofloat(edtQtde_Venda.Text)) );
   edtTotalVenda.Text   := FormatFloat('0.00', StrToFloat(edtTotalVenda.Text)+ ( StrToFloat(edtTotal.Text) + ( StrToFloat(edtVlr_Desconto.Text)*StrToFloat(edtQtde_Venda.Text))));
   edtTotalLiquido.Text := FormatFloat('0.00', StrToFloat(edtTotalVenda.Text)-StrToFloat(edtTotDesconto.Text));

   edtCod_Produto.Text := '';
   cmbNome_Produto.keyvalue := null;
   edtQtde_Venda.Text  := '0';
   edtPco_Venda.Text   := '0,00';
   edtPco_Tabela.Text  := '0,00';
   edtTotal.Text       := '0,00';
   edtVlr_Desconto.text:= '0,00';
   edtDesconto.text    := '0,00';
   pvrvlr_TotalAnt     := 0;
   edtCod_Produto.Enabled  := True;
   cmbNome_Produto.Enabled := True;
   btnCadProdutos.Enabled  := True;

   btnOkprod.Enabled        := True;
   btnCancelar.Enabled      := True;
   btnExcluir.Enabled       := True;
   btnAdicionar.Enabled     := False;
   btnAlterar.Enabled       := False;
   VerLimite();
   AtaulizaLucroBruto;
   btnadicionarClick(btnadicionar);
end;
function TfrmVendas.RetornarMecanico : Integer;
var Dados : TClientDataSet;
begin
    Result := 0;
    Dados := gConexao.BuscarDadosSQL('Select Codigo,Descricao From T_Funcionarios where Funcao='+QuotedStr('Mecanico'),Nil);
    if not Dados.IsEmpty then
    begin
       frmSelFuncionario := TfrmSelFuncionario.Create(Self);
       frmSelFuncionario.srcMecanico.DataSet := Dados;
       frmSelFuncionario.ShowModal;
       Result := frmSelFuncionario.cmbNome_Funcionario.KeyValue;
    end;
end;
procedure TfrmVendas.btnRemoverClick(Sender: TObject);
begin
   if CaixaMensagem( 'Deseja Excluir o Item '+cdsItensTamanhos.FieldByname('Tamanho').asString, ctConfirma, [ cbSimNao ], 0 )  Then
   begin
      cdsItensTamanhos.Delete;
      AtualizaValores;
   end;
end;

procedure TfrmVendas.CadastrodeCliente1Click(Sender: TObject);
begin
   if PetShop then
   begin
      frmDelivery := TFrmDelivery.Create(Self);
      frmDelivery.ShowModal;
      Exit;
   end;
   frmCadClientes := TfrmCadClientes.Create(Nil);
   frmCadClientes.EdtPesquisa.text := edtCod_Cliente.text;
   frmCadClientes.Tag := 5;
   frmCadClientes.showmodal;

   edtcod_Cliente.Text := '';
   edtcod_ClienteExit(edtcod_Cliente);

    AtualizarDadosClientes;

   if frmCadClientes.piCod_Produto<> 0 Then
   begin
      edtCod_Cliente.Text := intToStr(frmCadClientes.piCod_Produto);
      edtCod_ClienteExit(edtCod_Produto);
   End;
   edtcod_Cliente.SetFocus;

end;

procedure TfrmVendas.AlteraoCliente1Click(Sender: TObject);
begin
  inherited;
   frmCadClientes := TfrmCadClientes.Create(Nil);
   frmCadClientes.EdtPesquisa.text := edtnome_Cliente.text;
   frmCadClientes.Tag := 6;
   frmCadClientes.showmodal;

   edtcod_Cliente.Text := '';
   edtcod_ClienteExit(edtcod_Cliente);

    AtualizarDadosClientes;

   if frmCadClientes.piCod_Produto<> 0 Then
   begin
      edtCod_Cliente.Text := intToStr(frmCadClientes.piCod_Produto);
      edtCod_ClienteExit(edtCod_Produto);
   End;
   edtcod_Cliente.SetFocus;
end;

procedure  TfrmVendas.AtaulizaLucroBruto;
var PerLucroBruto : real;
    LucroBruto : Real;
    ValorTotal : real;
    CustoTotal : Real;
begin
  cdsItensVendasTmp.first;
  ValorTotal := 0;
  CustoTotal := 0;
  while not cdsItensVendasTmp.eof do
  begin
     ValorTotal := ValorTotal +   cdsItensVendasTmp.FieldByName('vlr_Total').asFloat;
     CustoTotal := CustoTotal + ( cdsItensVendasTmp.FieldByName('PrecoCusto').asFloat * cdsItensVendasTmp.FieldByName('Qtde_Venda').asFloat );
     cdsItensVendasTmp.next;
  end;
  PerLucroBruto := 0;
  if ValorTotal>0 then
     PerLucroBruto := ((ValorTotal - CustoTotal)/ ValorTotal)*100;
  LucroBruto := ValorTotal - CustoTotal;
  panelstatus.Caption := ' Lucru Bruto % ..: '+FormatFloat('0.0000', PerLucroBruto)+' | Lucro Bruto R$ ... : '+FormatFloat('0.00', LucroBruto);
end;


procedure TfrmVendas.btnokClick(Sender: TObject);
Var liSeqvenda     : integer;
    I              : Integer;
    liseqParcela   : Integer;
    liCont         : Integer;
    liqtde_Parcelas: Integer;
    lsPrazo        : String;
    ldPrePagamento : Double;
    lrTot_Produtos : Double;
    lrTot_Desconto : Double;
    vlr_anterior   : Double;
    vlr_Atual      : Double;
    lrVlr_DescProd : Double;
    trdNrTransacao : TDBXTransaction;
    DadosContaCorrente : TContaCorrente;
    GravaContaCorrente : TDaoContaCorrente;
    lsContrato : String;
    DaoRemessa : TDaoRemessa;
    Texto: string;
    F: TextFile;
    loVenda : TVenda;
    DaoVenda: TDaoVenda;
    loItemVenda : TItemVenda;
    DaoItemVenda : TDaoItemVenda;
    DaoFuncionario: TdaoFuncionario;
    loItensVendaGrade : TDaoItensVendaGrade;
    liCaixaFinalizado : Integer;
    lbServicoPago : Boolean;
    lrCustoTotal: real;
begin

   {$REGION 'Criticas e Valida��o das Informa��es'}
   lsContrato := '';
   If (frmVendas.tag = 3) OR ( gsParametros.ReadString('ACESSODADOS','TipoSistema','0') ='0' ) Then
   Begin
      IF Uppercase( gParametros.Ler( '', '[CADASTRO]', 'VendaSemControle', 'NAO' )) = 'NAO' Then
      begin
        If trim(edtControle.Text) = '' Then
        Begin
           CaixaMensagem( 'Digite o numero de controle ', ctAviso, [ cbOk ], 0 );
           edtControle.SetFocus;
           Exit;
        End;
      end;
      {
      if Trim(cdsCadClientes.FieldByName('Contrato').AsString) = '' then
      Begin
         if not inputQuery('Digite o Contrato','Digite o Contrato',lsContrato) Then
            Exit;
      End;
      }
   End;
   If cdsItensVendasTMP.IsEmpty Then
   Begin
      CaixaMensagem( 'Venda Sem item digitado ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;

   If cmbCod_Funcionario.KeyValue = Null Then
   Begin
      CaixaMensagem( 'Informe o funcionario ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;

   If cmbCod_Funcionario.KeyValue = Null Then
   Begin
      CaixaMensagem( 'Informe a forma de pagamento ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;

   If (edtCod_TipoVenda.Visible) and (Trim(edtCod_TipoVenda.Text)='') Then
   Begin
      CaixaMensagem( 'Informe o Tipo de venda', ctAviso, [ cbOk ], 0 );
      Exit;
   End;


   sdtsConsultaCli.close;
   sdtsConsultaCli.DataSet.CommandText := 'Select Count(seqvenda) as Qtde, Sum(vlr_areceber) As Total From T_Ctasreceber '+
                                          'where cod_Cliente=:parCod_Cliente and Status=:parStatus';
   sdtsConsultaCli.DataSet.ParamByName('parCod_Cliente').AsInteger := StrToInt(edtcod_Cliente.Text);
   sdtsConsultaCli.DataSet.ParamByName('parStatus').AsInteger      := 0;
   sdtsConsultaCli.Open;
   cdsCadClientes.Locate('codigo',edtcod_Cliente.Text,[]);
   if cdsCadClientes.FieldByName('Status').AsString = '1' then
   Begin
      CaixaMensagem( 'Este Cliente esta em Cobran�a ', ctAviso, [ cbOk ], 0 );
      edtcod_Cliente.SetFocus;
   End;
   if cdsCadClientes.FieldByName('Status').AsString = '2' then
   Begin
      CaixaMensagem( 'Este Cliente foi bloqueado para venda/servi�o ', ctAviso, [ cbOk ], 0 );
      edtcod_Cliente.SetFocus;
   End;
   edtLimite_Credito.Text := FormatFloat('0.00',(cdsCadClientes.FieldByName('Limite_Credito').AsFloat-sdtsConsultaCli.FieldByName('Total').AsFloat));

    VerLimite();

   if (sdtsConsultaCli.FieldByName('Qtde').AsInteger>=cdsCadClientes.FieldByName('Qtde_PedAberto').AsInteger) and ( frmVendas.Tag <> 4 ) then
   begin
      CaixaMensagem( 'O cliente possui '+sdtsConsultaCli.FieldByName('Qtde').asString+' pedidos em aberto !', ctAviso, [ cbOk ], 0 );
      Try
         edtcod_Cliente.SetFocus;
      Except

      End;

      exit;
   end;
{$ENDREGION}

   lrVlr_DescProd := 0;
   if not frmPrincipal.dbxPrincipal.InTransaction then
      trdNrTransacao := frmPrincipal.dbxPrincipal.BeginTransaction;

   {$REGION 'Gravando os Itens da Venda'}

   qryItensVendas.Close;
   qryItensVendas.SQL.Text :='Select * from T_ItensVendas where 1=2';

   If (frmVendas.tag = 4) or  (frmVendas.tag = 7) then
   Begin
      qryModific.Close;
      qryModific.SQL.Text :='Delete from T_ItensVendas Where SeqVenda=:parSeqVenda ';
      qryModific.ParamByName('parSeqVenda').AsInteger := liSeqVendaAtu ;
      qryModific.ExecSql;
      liSeqvenda := liSeqVendaAtu;
   End
   Else
      liSeqvenda := StrToInt(Sequencia('SeqVenda',True,'T_Sequencias',FrmPrincipal.dbxPrincipal,'',False,8));

   cdsItensVendas.Close;
   cdsItensVendas.ProviderName := dspItensVendas.Name;
   cdsItensVendas.Open;

   cdsItensVendasTMP.First;
   if pnlRemessaAberta.Visible then
      DaoRemessa := TDaoRemessa.Create(gCoNexao);
   while not cdsItensVendasTMP.Eof Do
   Begin
      Try
        if pnlRemessaAberta.Visible then
        begin
           DaoRemessa.SomarItemNaRemessaVenda(cdsCadFuncionarios.FieldByName('Cod_Supervisor').AsInteger,
                                              cdsItensVendasTmp.FieldByName('Codigo').asInteger,
                                              cdsItensVendasTmp.FieldByName('Qtde_Venda').AsInteger, gsOperador  );
        end;
        lrCustoTotal := lrCustoTotal + ( cdsItensVendasTmp.FieldByName('Qtde_Venda').Asfloat*cdsItensVendasTmp.FieldByName('PrecoCusto').Asfloat );
      except
         on E: Exception do
         Begin
            frmPrincipal.dbxPrincipal.RollbackFreeAndNil( trdNrTransacao );
            CaixaMensagem( 'Um erro Aconteceu " '+E.Message+'"', ctErro, [ cbOk ], 0 );
            Exit;
         End;

      End;

      {$REGION 'Controle de Saldo de estoque (Valor)'}

      if cdsItensVendasTmp.FieldByName('Pco_Tabela').asFloat > (cdsItensVendasTmp.FieldByName('Pco_Venda').asFloat-cdsItensVendasTmp.FieldByName('Vlr_Desconto').asFloat ) then
      Begin
         vlr_anterior := ( cdsItensVendasTmp.FieldByName('Pco_Tabela').asFloat * cdsItensVendasTmp.FieldByName('Qtde_Venda').asFloat ) ;
         vlr_Atual   := ( (cdsItensVendasTmp.FieldByName('Pco_Venda').asFloat-cdsItensVendasTmp.FieldByName('Vlr_Desconto').asFloat ) * cdsItensVendasTmp.FieldByName('Qtde_Venda').asFloat ) ;
         try
            qrySaldos.Close;
            qrySaldos.Params.Clear;
            qrySaldos.Sql.Text :='Select * from T_saldos where 1=2';

            cdsSaldos.Close;
            cdsSaldos.ProviderName := dspSaldos.Name;
            cdsSaldos.Open;

            cdsSaldos.Append;
            cdsSaldos.FieldByName('Codigo').AsInteger      := StrToInt( Sequencia('Codigo',False,'T_Saldos',FrmPrincipal.dbxPrincipal,'',False,8 ) );
            cdsSaldos.FieldByName('Cod_emp').AsString      := GsCod_Emp;
            cdsSaldos.FieldByName('E_S').AsString          := 'S';
            cdsSaldos.FieldByName('Operador').AsString     := GsOperador;
            cdsSaldos.FieldByName('Cod_Produto').AsInteger := cdsItensVendasTmp.FieldByName('Codigo').asInteger;
            cdsSaldos.FieldByName('Pco_Venda').AsFloat     := (vlr_Anterior-vlr_Atual);
            cdsSaldos.FieldByName('Pco_Custo').AsFloat     := 0;
            cdsSaldos.FieldByName('Data_cad').AsDateTime   := Now;
            cdsSaldos.FieldByName('Data_Mov').AsDateTime   := GsData_Mov;
            cdsSaldos.FieldByName('Qtde').AsInteger        := 1;
            cdsSaldos.FieldByName('Historico').AsString    := 'Baixa de Pre�o de venda de '+FormatFloat('0.00',cdsItensVendasTmp.FieldByName('Pco_Tabela').asFloat)+ ' Para '+FormatFloat(',0.00',cdsItensVendasTmp.FieldByName('Pco_Venda').asFloat-cdsItensVendasTmp.FieldByName('Vlr_Desconto').asFloat);
            cdsSaldos.FieldByName('Tipo_Movimento').AsString := 'DESCONTOS CONCEDIDOS';
            cdsSaldos.Post;
            cdsSaldos.ApplyUpdates(-1);
         except
            on E: Exception do
            Begin
               frmPrincipal.dbxPrincipal.RollbackFreeAndNil( trdNrTransacao );
               CaixaMensagem( 'Um erro Aconteceu " '+E.Message+'"', ctErro, [ cbOk ], 0 );
               Exit;
            End;
         End;
      End;
{$ENDREGION}

      lrVlr_DescProd  := lrVlr_DescProd  + cdsItensVendasTmp.FieldByName('vlr_Desconto').asFloat;

      cdsItensVendasTMP.Next;
   End;



{$ENDREGION}

   {$REGION 'Gravando Registro da venda'}

   qryVenda.Close;
   qryVenda.Params.Clear;
   qryVenda.SQL.Text :='Select * from T_Vendas where 1=2';

   If (frmVendas.tag = 4) or (frmVendas.tag = 7)  then
   Begin
      qryVenda.Close;
      qryVenda.SQL.Text :='Select * from T_Vendas Where SeqVenda=:parSeqVenda ';
      qryVenda.ParamByName('parSeqVenda').AsInteger := liSeqVendaAtu ;
   End;


   cdsVenda.Close;
   cdsVenda.ProviderName := dspVenda.Name;
   cdsVenda.Open;

   If frmVendas.tag = OS_FINALIZADA then
      liCaixaFinalizado := cdsVenda.FieldByname('Cod_Caixa').Asinteger;

   If (frmVendas.tag = 4) or (frmVendas.tag = 7)  then
      cdsVenda.Edit
   else
      cdsVenda.Append;

   cdsVenda.FieldByname('SeqVenda').Asinteger        := liSeqvenda;
   cdsVenda.FieldByname('Cod_Cliente').Asinteger     := StrToInt(cmbCod_Cliente.KeyValue);
   cdsVenda.FieldByname('Cod_Funcionario').Asinteger := StrToInt(cmbCod_Funcionario.KeyValue);
   cdsVenda.FieldByname('Cod_FormaPagamento').Asinteger := StrToInt(cmbCod_formaPagamento.KeyValue);
   cdsVenda.FieldByname('Vlr_Total').AsFloat         := (StrToFloat( edtTotalVenda.Text )-StrToFloat( edtTotDesconto.Text ));
   cdsVenda.FieldByname('CustoTotal').AsFloat        := lrCustoTotal;
   cdsVenda.FieldByname('LucroBruto').AsFloat        := ((( cdsVenda.FieldByname('Vlr_Total').AsFloat - lrCustoTotal ) / cdsVenda.FieldByname('Vlr_Total').AsFloat)*100);
   cdsVenda.FieldByname('Vlr_Desconto').AsFloat      := StrToFloat( edtTotDesconto.Text );
   cdsVenda.FieldByname('Status').AsString           := 'N';
   cdsVenda.FieldByname('Operador').AsString         := gsOperador;
   cdsVenda.FieldByname('Cod_Emp').AsString          := gsCod_emp;
   cdsVenda.FieldByName('Data_Mov').asDateTime       := gsData_Mov;
   cdsVenda.FieldByName('Data_venda').asDateTime     := edtDataVenda.Date;

   If frmVendas.tag <> 4 then
      cdsVenda.FieldByName('Data_Cad').asDateTime       := now;
   cdsVenda.FieldByname('Vlr_DescProd').AsFloat      := lrVlr_DescProd;
   cdsVenda.FieldByname('Controle').AsString         := edtControle.text;
   cdsVenda.FieldByname('Tipo_Venda').AsString       := 'P';
   cdsVenda.FieldByName('Nome_Cliente').asString     := edtNome_Cliente.text;
   cdsVenda.FieldByname('PagouSinal').AsBoolean      := True;
   if liseqOs <> 0 then
      cdsVenda.FieldByname('SeqOs').AsInteger        := liseqos;
   If frmVendas.tag = 4 then
      cdsVenda.FieldByname('Etiqueta').AsInteger     := 1;
   if edtCod_TipoVenda.Visible then
      cdsVenda.FieldByName('Cod_TipoVenda').AsInteger   := Strtoint(edtCod_TipoVenda.text);

   If (frmVendas.tag = SERVICOS) OR (frmVendas.tag=MANUTENCAO_OS ) then
   Begin
      cdsVenda.FieldByname('Tipo_Venda').AsString    := 'S';
      cdsVenda.FieldByname('Status').AsString        := '1';
      cdsVenda.FieldByname('PagouSinal').AsBoolean   := False;
      cdsVenda.FieldByName('Cod_caixa').asInteger    := 1;
      if licaixa<>0 then
         cdsVenda.FieldByname('Cod_Caixa').AsInteger := licaixa;
   End;
 
   If frmVendas.tag = OS_FINALIZADA then
   Begin
      cdsVenda.FieldByname('Tipo_Venda').AsString    := 'S';
      cdsVenda.FieldByname('Status').AsString        := '3';
   End;
   cdsVenda.FieldByname('AnimalID').AsInteger        := pAnimalId;
   cdsVenda.FieldByname('Obs').AsString             := memoObs.text;
   cdsVenda.Post;

   Try
      cdsVenda.ApplyUpdates(-1);
   except
      frmPrincipal.dbxPrincipal.RollbackFreeAndNil( trdNrTransacao );
      CaixaMensagem( 'N�o foi possivel gravar a venda', ctAviso, [ cbOk ], 0 );
      Exit;
   End;


{$ENDREGION}

   {$REGION 'Item da Venda'}
   loItemVenda := TItemVenda.Create;
   loItemVenda.Operador := gsOperador;
   loItemVenda.DataMovimento := gsdata_Mov;
   loItemVenda.CodigoEmpresa := StrTOInt(gsCod_Emp);
   loItemVenda.VendaID := liSeqvenda;
   DaoItemVenda := TdaoItemVenda.Create(gConexao);
   DaoItemVenda.Connection := frmPrincipal.dbxPrincipal;
   DaoItemVenda.Inserir(cdsItensVendasTMP,loItemVenda);

   lbServicoPago := False;

{$ENDREGION}

   {$REGION 'Lancamento do Financeiro'}

   Try
      if ( (frmVendas.Tag<>3) and ( frmVendas.Tag<>5 ) ) then // So Entra nesta rotina se for Venda oi finaliza��o de OS
      Begin
         ldPrepagamento := 0;
         // --> Verifica se teve prepagamento da  OS
         if frmVendas.tag=4 then
         Begin
            sdtsPesqPrepagamento.Close;
            sdtsPesqPrepagamento.Params.Clear;
            sdtsPesqPrepagamento.DataSet.CommandText := 'Select sum(Valor) as Total from t_Movcaixa '+
                                                        'Where PrePagamento=:parPrePagamento and Seqvenda=:parSeqVenda ';
            sdtsPesqPrepagamento.DataSet.ParamByName('parPrePagamento').AsString  := 'S';
            sdtsPesqPrepagamento.DataSet.ParamByName('parSeqvenda').AsInteger     :=  liSeqVendaAtu;
            sdtsPesqPrepagamento.Open;
            ldPrepagamento := sdtsPesqPrepagamento.fieldByName('Total').AsFloat;
         End;
         // <-- Verifica se teve prepagamento da  OS

         QryPagamento.Close;
         qryPagamento.Sql.Text := 'Select * from T_Ctasreceber Where 1=2 ';

         cdsPagamento.Close;
         cdsPagamento.ProviderName := dspPagamento.name;
         cdsPagamento.Open;

         lsPrazo         := '0';
         liseqParcela    := 1;
         if Arredondar(ldPrepagamento,2)<arredondar(StrToFloat(edtTotalLiquido.text),2) then
         Begin
            Case cdsCadFormasPagamento.fieldByName('TipoLancamento').AsInteger Of
               0,1,2 : // 0 - Lancamento no Caixa  1 - Lancamento no contas a recber 2 - Lancamento no conta Corrente
               Begin
                  liqtde_Parcelas := 1;
                  for I := 1 to Length(Trim(cdsCadFormasPagamento.fieldByName('Prazo').AsString)) do
                  Begin
                     if copy(cdsCadFormasPagamento.fieldByName('Prazo').AsString,I,1)= '/' then
                       liqtde_Parcelas := liqtde_Parcelas + 1;
                  End;

                  If (edtdata_Vencimento.Visible) OR ( cdsCadFormasPagamento.fieldByName('TipoLancamento').AsInteger = 0 )
                     OR ( cdsCadFormasPagamento.fieldByName('TipoLancamento').AsInteger = 2 ) then  // se for Vencimento informado so � uma parcela
                     liqtde_Parcelas := 1;

                  for I := 1 to Length(Trim(cdsCadFormasPagamento.fieldByName('Prazo').AsString)) do
                  Begin
                     if copy(cdsCadFormasPagamento.fieldByName('Prazo').AsString,I,1)<>'/' then
                       lsPrazo := lsPrazo + copy(cdsCadFormasPagamento.fieldByName('Prazo').AsString,I,1)
                     Else
                     Begin
                        cdsPagamento.Append;
                        cdsPagamento.FieldByName('Sequencia').AsInteger           := StrToInt(Sequencia('Sequencia',False,'T_CtasReceber',FrmPrincipal.dbxPrincipal,'',False,8));
                        cdsPagamento.FieldByName('Vlr_Areceber').AsFloat          := (StrToFloat( edtTotalLiquido.Text )-ldPrePagamento)/liqtde_Parcelas;
                        cdsPagamento.FieldByName('Vlr_Recebido').AsFloat          := (ldPrePagamento/liqtde_Parcelas);
                        cdsPagamento.FieldByName('Vlr_Original').AsFloat          := (StrToFloat( edtTotalLiquido.Text )-ldPrePagamento)/liqtde_Parcelas;
                        cdsPagamento.FieldByName('Data_Vencimento').AsDateTime    := SoData(edtDataVenda.Date+strtoint(lsPrazo));
                        If edtdata_Vencimento.Visible then
                           cdsPagamento.FieldByName('Data_Vencimento').AsDateTime := SoData(edtdata_Vencimento.Date);
                        cdsPagamento.FieldByName('Data_cad').AsDateTime           := (now);
                        cdsPagamento.FieldByName('Data_Emissao').AsDateTime       := Sodata(edtDataVenda.Date);
                        cdsPagamento.FieldByName('Historico').AsString            := 'Titulo Referente a venda '+IntToStr(liSeqvenda);
                        cdsPagamento.FieldByName('Cod_Cliente').AsInteger         := StrToInt(cmbCod_Cliente.KeyValue);
                        cdsPagamento.FieldByName('Cod_FormaPagamento').AsInteger  := StrToInt(cmbCod_formaPagamento.KeyValue);
                        cdsPagamento.FieldByName('SeqVenda').AsInteger            := liSeqvenda;
                        cdsPagamento.FieldByname('Cod_Emp').AsString              := gsCod_emp;
                        cdsPagamento.FieldByname('Tipo_Baixa').AsString           := 'AB';
                        cdsPagamento.FieldByname('Operador').AsString             := gsOperador;
                        cdsPagamento.FieldByname('Documento').AsString            := inczero(intToStr(liSeqvenda),8)+incZero(intToStr(liseqParcela),3);
                        cdsPagamento.FieldByName('Status').AsInteger              := 0;
                        cdsPagamento.FieldByname('Repasse').AsString              := 'N';
                        cdsPagamento.FieldByname('Cod_Caixa').AsInteger           := gParametros.Ler( '', '[GERAL]', 'CaixaBalcao', '0001' );
                        if frmVendas.Tag = VENDAS_EXTERNAS then
                           cdsPagamento.FieldByname('Cod_Caixa').AsInteger        := gParametros.Ler( '', '[GERAL]', 'CaixaVendasExternas', '0001' );
                        if (frmVendas.Tag = SERVICOS )  then
                           cdsPagamento.FieldByname('Cod_Caixa').AsInteger        := 1;
                        if licaixa<>0 then
                           cdsPagamento.FieldByname('Cod_Caixa').AsInteger        := licaixa;
                        if (frmVendas.Tag = OS_FINALIZADA ) then
                           cdsPagamento.FieldByname('Cod_Caixa').AsInteger        := liCaixaFinalizado;

                        cdsPagamento.Post;
                        cdsPagamento.ApplyUpdates(-1);
                        lsPrazo :='';
                        liseqParcela := liseqParcela+1;
                     End;
                  End;
                  if Trim(lsPrazo)<>'' then
                  Begin
                     cdsPagamento.Append;
                     cdsPagamento.FieldByName('Sequencia').AsInteger           := StrToInt(Sequencia('Sequencia',False,'T_CtasReceber',FrmPrincipal.dbxPrincipal,'',False,8));
                     cdsPagamento.FieldByName('Vlr_Areceber').AsFloat          := (StrToFloat( edtTotalLiquido.Text )-ldPrePagamento)/liqtde_Parcelas;
                     cdsPagamento.FieldByName('Vlr_Original').AsFloat          := (StrToFloat( edtTotalLiquido.Text )-ldPrePagamento)/liqtde_Parcelas;
                     cdsPagamento.FieldByName('Vlr_Recebido').AsFloat          := (ldPrePagamento/liqtde_Parcelas);
                     cdsPagamento.FieldByName('Data_Vencimento').AsDateTime    := SoData(edtDataVenda.Date+strtoint(lsPrazo));
                     If edtdata_Vencimento.Visible then
                        cdsPagamento.FieldByName('Data_Vencimento').AsDateTime := SoData(edtdata_Vencimento.Date);
                     cdsPagamento.FieldByName('Data_cad').AsDateTime          := (now);
                     cdsPagamento.FieldByName('Data_Emissao').AsDateTime      := Sodata(edtDataVenda.Date);
                     cdsPagamento.FieldByName('Historico').AsString           := 'Titulo Referente a venda '+IntToStr(liSeqvenda);
                     cdsPagamento.FieldByName('Cod_Cliente').AsInteger        := StrToInt(cmbCod_Cliente.KeyValue);
                     cdsPagamento.FieldByName('Cod_FormaPagamento').AsInteger := StrToInt(cmbCod_formaPagamento.KeyValue);
                     cdsPagamento.FieldByName('SeqVenda').AsInteger           := liSeqvenda;
                     cdsPagamento.FieldByname('Cod_Emp').AsString             := gsCod_emp;
                     cdsPagamento.FieldByname('Operador').AsString            := gsOperador;
                     cdsPagamento.FieldByname('Documento').AsString           := inczero(intToStr(liSeqvenda),8)+incZero(intToStr(liseqParcela),3);
                     cdsPagamento.FieldByName('Status').AsInteger             := 0;
                     cdsPagamento.FieldByname('Repasse').AsString             := 'N';
                     cdsPagamento.FieldByname('Tipo_Baixa').AsString          := 'AB';
                     If ( cdsCadFormasPagamento.fieldByName('TipoLancamento').AsInteger = 0 ) OR
                        ( cdsCadFormasPagamento.fieldByName('TipoLancamento').AsInteger = 2 ) then  // se for Vencimento informado so � uma parcela
                     Begin
                        cdsPagamento.FieldByName('Status').AsInteger          := 1;
                        cdsPagamento.FieldByName('Historico').AsString        := 'Pagamento A vista';
                        cdsPagamento.FieldByName('Vlr_Recebido').AsFloat      := (StrToFloat( edtTotalLiquido.Text )-ldPrePagamento)/liqtde_Parcelas;
                        cdsPagamento.FieldByName('Data_Pagamento').AsDateTime := Sodata(edtDataVenda.Date);
                        cdsPagamento.FieldByname('Tipo_Baixa').AsString       := 'PT';
                        If ( cdsCadFormasPagamento.fieldByName('TipoLancamento').AsInteger = 2 ) Then
                        Begin
                           cdsPagamento.FieldByName('Historico').AsString        := 'Debitado em Conta Corrente';
                           cdsPagamento.FieldByname('Tipo_Baixa').AsString       := 'DC';
                        End;
                     End;
                     cdsPagamento.FieldByname('Cod_Caixa').AsInteger       := gParametros.Ler( '', '[GERAL]', 'CaixaBalcao', '0001' );
                     if frmVendas.Tag = VENDAS_EXTERNAS then
                        cdsPagamento.FieldByname('Cod_Caixa').AsInteger    := gParametros.Ler( '', '[GERAL]', 'CaixaVendasExternas', '0001' );
                     if (frmVendas.Tag = SERVICOS ) then
                         cdsPagamento.FieldByname('Cod_Caixa').AsInteger    := 1;
                     if licaixa<>0 then
                         cdsPagamento.FieldByname('Cod_Caixa').AsInteger    := licaixa;
                     if (frmVendas.Tag = OS_FINALIZADA ) then
                         cdsPagamento.FieldByname('Cod_Caixa').AsInteger    := liCaixaFinalizado;
                     cdsPagamento.Post;
                     cdsPagamento.ApplyUpdates(-1);
                  End;
               End;
            End;
         End
         Else
         Begin
            cdsPagamento.Append;
            cdsPagamento.FieldByName('Sequencia').AsInteger           := StrToInt(Sequencia('Sequencia',False,'T_CtasReceber',FrmPrincipal.dbxPrincipal,'',False,8));
            cdsPagamento.FieldByName('Vlr_Areceber').AsFloat          := ldPrePagamento;
            cdsPagamento.FieldByName('Vlr_Recebido').AsFloat          := ldPrePagamento;
            cdsPagamento.FieldByName('Vlr_Original').AsFloat          := ldPrePagamento;
            cdsPagamento.FieldByName('Data_Vencimento').AsDateTime    := SoData(edtDataVenda.Date+strtoint(lsPrazo));
            If edtdata_Vencimento.Visible then
               cdsPagamento.FieldByName('Data_Vencimento').AsDateTime := SoData(edtdata_Vencimento.Date);
            cdsPagamento.FieldByName('Data_cad').AsDateTime          := (now);
            cdsPagamento.FieldByName('Data_Emissao').AsDateTime      := Sodata(edtDataVenda.Date);
            cdsPagamento.FieldByName('Historico').AsString           := 'Quita��o por pre-pagamento';
            cdsPagamento.FieldByName('Cod_Cliente').AsInteger        := StrToInt(cmbCod_Cliente.KeyValue);
            cdsPagamento.FieldByName('Cod_FormaPagamento').AsInteger := StrToInt(cmbCod_formaPagamento.KeyValue);
            cdsPagamento.FieldByName('SeqVenda').AsInteger           := liSeqvenda;
            cdsPagamento.FieldByname('Cod_Emp').AsString             := gsCod_emp;
            cdsPagamento.FieldByname('Operador').AsString            := gsOperador;
            cdsPagamento.FieldByname('Documento').AsString           := inczero(intToStr(liSeqvenda),8)+incZero(intToStr(liseqParcela),3);
            cdsPagamento.FieldByName('Status').AsInteger             := 1;
            cdsPagamento.FieldByname('Repasse').AsString             := 'N';
            cdsPagamento.FieldByname('Cod_Caixa').AsInteger       := gParametros.Ler( '', '[GERAL]', 'CaixaBalcao', '0001' );
            if frmVendas.Tag = VENDAS_EXTERNAS then
               cdsPagamento.FieldByname('Cod_Caixa').AsInteger    := gParametros.Ler( '', '[GERAL]', 'CaixaVendasExternas', '0001' );
            if (frmVendas.Tag = SERVICOS )  then
               cdsPagamento.FieldByname('Cod_Caixa').AsInteger    := 1;
            if licaixa<>0 then
                cdsPagamento.FieldByname('Cod_Caixa').AsInteger    := licaixa;
            if (frmVendas.Tag = OS_FINALIZADA ) then
                cdsPagamento.FieldByname('Cod_Caixa').AsInteger    := liCaixaFinalizado;
            cdsPagamento.Post;
            cdsPagamento.ApplyUpdates(-1);
         End;
         Case cdsCadFormasPagamento.fieldByName('TipoLancamento').AsInteger Of
            0 : // Lancamento no caixa
            Begin
               qryModific.Close;
               qryModific.SQL.Text := 'Insert into T_movCaixa ( Cod_Caixa, Valor,Historico,Data_Lancamento,D_C,SeqVenda,Cod_tipoDespesa,Sequencia,Cod_FormaPagamento,Data_Cad ) Values '+
                                      '                       ( :parCod_Caixa, :parValor,:parHistorico,:parData_Lancamento,'+
                                      '                         :parD_C,:parSeqVenda,:parCod_tipoDespesa,:parSeqeuencia,:parCod_FormaPagamento,:parData_Cad ) ';
               qryModific.ParamByName('parCod_Caixa').AsInteger            := gParametros.Ler( '', '[GERAL]', 'CaixaBalcao', '0001' );
               if frmVendas.Tag = VENDAS_EXTERNAS then
                  qryModific.ParamByName('parCod_Caixa').AsInteger         := gParametros.Ler( '', '[GERAL]', 'CaixaVendasExternas', '0001' );
               if (frmVendas.Tag = SERVICOS ) and  (frmVendas.Tag = OS_FINALIZADA )  then
                  qryModific.ParamByName('parCod_Caixa').AsInteger         := 1;
               qryModific.ParamByName('parValor').asFloat                  := (StrTOFloat(edtTotalLiquido.Text)-ldPrePagamento);
               qryModific.ParamByName('parHistorico').asString             := 'Recebimento de Venda A vista n� '+IntToStr(liSeqvenda);
               qryModific.ParamByName('parData_Lancamento').AsSqlTimeStamp := datetimeToSqlTimeStamp(gsData_Mov);
               qryModific.ParamByName('parData_Cad').AsSqlTimeStamp        := datetimeToSqlTimeStamp(now);
               qryModific.ParamByName('parD_C').AsString                   := 'C';
               qryModific.ParamByName('parSeqVenda').asInteger             :=  liSeqvenda;
               qryModific.ParamByName('parCod_tipoDespesa').AsString       := '0101';
               qryModific.ParamByName('parSeqeuencia').AsInteger           := StrToInt(Sequencia('Sequencia',False,'T_MovCaixa',FrmPrincipal.dbxPrincipal,'',False,8));
               qryModific.ParamByName('parCod_FormaPagamento').AsInteger   := strToInt(edtCod_FormaPagamento.Text);
               qryModific.ExecSQL;
               lbServicoPago := True;
            End;
            2 :
            Begin
               DadosContaCorrente := TContaCorrente.Create;
               GravaContaCorrente := TDaoContaCorrente.Create(gConexao);
               DadosContaCorrente.D_C         := 'D';
               DadosContaCorrente.Valor       := (StrTOFloat(edtTotalLiquido.Text)-ldPrePagamento);
               DadosContaCorrente.Cod_Cliente := StrToInt(cmbCod_Cliente.KeyValue);
               DadosContaCorrente.Historico   := 'Debito referente a Venda n� '+IntToStr(liSeqvenda);
               DadosContaCorrente.Documento   := liSeqvenda;
               IF  not GravaContaCorrente.Atualizar(DadosContaCorrente) Then
               Begin
                  CaixaMensagem( 'N�o foi possivel lancar no conta corrente', ctAviso, [ cbOk ], 0 );
                  frmPrincipal.dbxPrincipal.RollbackFreeAndNil( trdNrTransacao );
                  Exit;
               End;
            End;
         End;
      End;
   except
      on E: Exception do
      Begin
         frmPrincipal.dbxPrincipal.RollbackFreeAndNil( trdNrTransacao );
         CaixaMensagem( 'Um erro Aconteceu " '+E.Message+'"', ctErro, [ cbOk ], 0 );
         Exit;
      End;
   End;
{$ENDREGION}

   {$REGION 'Efetuando Registro de Materia Prima'}

   if (frmVendas.tag = 4) or (frmVendas.tag = 5) or (frmVendas.tag = 0)then
   Begin
      qryItensMateriaPrima.Close;
      qryItensMateriaPrima.Params.Clear;
      qryItensMateriaPrima.SQL.Text :='Select * from T_ItensMateriaPrima where 1=2';

      cdsItensMateriaPrima.Close;
      cdsItensMateriaPrima.ProviderName := dspItensMateriaPrima.Name;
      cdsItensMateriaPrima.Open;

      cdsItensVendasTMP.First;
      while not cdsItensVendasTMP.Eof Do
      Begin
         Try
            If cdsCadFichaTecnica.Locate('Cod_Produto',cdsItensVendasTmp.FieldByName('Codigo').asInteger,[]) Then
            Begin
               while (cdsItensVendasTmp.FieldByName('Codigo').asInteger=cdsCadFichaTecnica.FieldByName('Cod_Produto').AsInteger) And (Not cdsCadFichaTecnica.Eof) do
               Begin
                  cdsItensMateriaPrima.Append;
                  cdsItensMateriaPrima.FieldByName('Cod_MateriaPrima').asInteger  := cdsCadFichaTecnica.FieldByName('Cod_MateriaPrima').asInteger;
                  cdsItensMateriaPrima.FieldByName('Qtde_Utilizada').asFloat     := cdsItensVendasTmp.FieldByName('Qtde_Venda').asFloat*cdsCadFichaTecnica.FieldByName('Qtde').asFloat;
                  cdsItensMateriaPrima.FieldByName('Pco_Custo').asFloat          := cdsCadFichaTecnica.FieldByName('Pco_Custo').asFloat;
                  cdsItensMateriaPrima.FieldByName('Custo_Total').asFloat        := ( cdsItensVendasTmp.FieldByName('Qtde_Venda').asFloat*cdsCadFichaTecnica.FieldByName('Qtde').asFloat)*cdsCadFichaTecnica.FieldByName('Pco_Custo').asFloat;

                  cdsItensMateriaPrima.FieldByName('Cod_Produto').asInteger  := cdsItensVendasTmp.FieldByName('Codigo').asInteger;
                  cdsItensMateriaPrima.FieldByName('Qtde_Venda').asFloat     := cdsItensVendasTmp.FieldByName('Qtde_Venda').asFloat;
                  cdsItensMateriaPrima.FieldByName('Pco_Venda').asFloat      := cdsItensVendasTmp.FieldByName('Pco_Venda').asFloat;
                  cdsItensMateriaPrima.FieldByName('vlr_Total').asFloat      := cdsItensVendasTmp.FieldByName('vlr_Total').asFloat;
                  cdsItensMateriaPrima.FieldByName('Operador').asString      := gsOperador;
                  cdsItensMateriaPrima.FieldByName('Data_Cad').asDateTime    := now;
                  cdsItensMateriaPrima.FieldByName('Data_Mov').asDateTime    := gsdata_Mov;
                  cdsItensMateriaPrima.FieldByName('Complemento').asString   := '';
                  cdsItensMateriaPrima.FieldByName('Cod_emp').asString       := gsCod_Emp;
                  cdsItensMateriaPrima.FieldByName('SeqVenda').asInteger     := liSeqvenda;
                  cdsItensMateriaPrima.Post;
                  cdsItensMateriaPrima.ApplyUpdates(-1);

                  cdsCadFichaTecnica.Next;
               End;
            End;
         except
            on E: Exception do
            Begin
               frmPrincipal.dbxPrincipal.RollbackFreeAndNil( trdNrTransacao );
               CaixaMensagem( 'Um erro Aconteceu " '+E.Message+'"', ctErro, [ cbOk ], 0 );
               Exit;
            End;
         End;
         cdsItensVendasTMP.Next;
      End;
   End;
   {$ENDREGION}

   {$REGION 'Atualiza Rota informada'}

   if cmbRota.Visible then
   Begin
      qryModific.Close;
      qryModific.Sql.text                             := 'Update T_Clientes Set Cod_Rota=:parCod_Rota where Codigo=:parCodigo ';
      qryModific.ParamByName('parcod_Rota').asInteger := cmbRota.KeyValue;
      qryModific.ParamByName('parCodigo').AsInteger   := StrToInt(edtcod_Cliente.Text);
      qryModific.ExecSQL;
   End;

   if Trim(lsContrato)<>'' then
   Begin
      qryModific.Close;
      qryModific.Sql.text                             := 'Update T_Clientes Set Contrato=:parContrato where Codigo=:parCodigo ';
      qryModific.ParamByName('parContrato').asString := lsContrato;
      qryModific.ParamByName('parCodigo').AsInteger   := StrToInt(edtcod_Cliente.Text);
      qryModific.ExecSQL;
   End;

{$ENDREGION}

   {$REGION 'Atualizando Valor Total da Ordem de Servico'}
   if liseqOs <> 0 then
   Begin
      qryModific.Close;
      qryModific.Params.Clear;
      qryModific.Sql.text  := 'Update T_OrdemServico Set Vlr_Os = vlr_Os + :parVlr_Os '+
                              'where SeqOs=:parSeqOs ';
      qryModific.ParamByName('parVlr_Os').asFloat  := StrToFloat( edtTotalLiquido.Text );
      qryModific.ParamByName('parSeqOs').AsInteger := liseqOs ;
      qryModific.ExecSQL;
   End;
   {$ENDREGION}

   {$REGION 'Inserir itens da grade '}
   if not cdsItensTamanhos.IsEmpty then
   Begin
    loItensVendaGrade := TDaoItensVendaGrade.Create(gConexao);
    loItensVendaGrade.InserirItens(cdsItensTamanhos,liSeqvenda);
    cdsItensTamanhos.EmptyDataSet;
    cdsItensTamanhos.SaveToFile(gspath+'Dados\GradeTamanho.xml', dfXML)
   End;

   {$ENDREGION}

   frmPrincipal.dbxPrincipal.CommitFreeAndNil( trdNrTransacao );

   {$REGION 'Impressao do comprovante de Venda'}
   IF ( RetornarVerdadeirOuFalso(gParametros.ler( '', '[IMPRESSAO]', 'ImprimeComprovanteVenda','0',gsOperador )) and
       (frmVendas.Tag=VENDAS_NORMAIS) Or (frmVendas.Tag=VENDAS_EXTERNAS) ) or
       ( RetornarVerdadeirOuFalso( Uppercase( gParametros.Ler( '', '[ADMINISTRATIVO]', 'TrabalhaComVeiculo', 'NAO' ))) and ( frmvendas.Tag <> 7 ) ) or
      ( RetornarVerdadeirOuFalso(gParametros.ler( '', '[IMPRESSAO]', 'ImprimeComprovanteServico','0',gsOperador )) and
       (frmVendas.Tag=SERVICOS) )  Then
   Begin
      if StrToint(gsParametros.ReadString('IMPRESSAO', 'TipoImpressora', '0'))=5 then
         PedidoPersonalizado(IntToStr(liSeqvenda))
      else if StrToint(gsParametros.ReadString('IMPRESSAO', 'TipoImpressora', '0'))=7 then
         PedidoPersonalizado03(IntToStr(liSeqvenda))

      else
      begin
         DaoVenda := TDaoVenda.Create(gConexao);
         loVenda  := DaoVenda.CarregarVenda(cdsVenda);
         DaoFuncionario    := TDaoFuncionario.Create(gConexao);
         lovenda.Funcionario := Daofuncionario.Buscar(cdsVenda.FieldByName('Cod_Funcionario').AsInteger);
         lovenda.Empresa := gEmpresa;
         loVenda.VendaID := 1;
         loVenda.Imprimir(cdsVenda,
                          cdsItensVendasTMP,
                          gsParametros.ReadString('IMPRESSAO','CaminhoImpressao','LPT1'),
                          0,
                          StrToint(gsParametros.ReadString('IMPRESSAO', 'TipoImpressora','0')));
         FreeAndNil(DaoVenda);
         FreeAndNil(lovenda);
      end;
   End;
{$ENDREGION}

   DaoVenda := TDaoVenda.Create(gConexao);
   if Formatfloat('0.00',liTotalLiquido)<>FormatFloat('0.00',StrTofloat(edtTotalLiquido.Text)) then
      DaoVenda.MarcarComoNaoServicoPago(liSeqvenda);

   if lbServicoPago then
      DaoVenda.MarcarComoServicoPago(liSeqvenda);
   FreeAndNil(DaoVenda);

   {$REGION 'Mensagem Final ao Usuario'}

   If frmVendas.tag = SERVICOS then
      CaixaMensagem( 'Servi�o Numero  '+IntToStr(liSeqvenda), ctAviso, [ cbOk ], 0 )
   else if frmVendas.tag = OS_FINALIZADA then
   Begin
      CaixaMensagem( 'Servi�o Finalizado', ctAviso, [ cbOk ], 0 );
      Close;
   End
   else if (frmVendas.tag = MANUTENCAO_OS ) then
     CaixaMensagem( 'Servi�o Salvo '+IntToStr(liSeqvenda), ctAviso, [ cbOk ], 0 )
   Else
     CaixaMensagem( 'Venda Numero  '+IntToStr(liSeqvenda), ctAviso, [ cbOk ], 0 );

{$ENDREGION}

   BtnCancelaClick(BtnCancela);
end;

procedure TfrmVendas.edtTotalExit(Sender: TObject);
begin
   btnOkProdClick(btnOkProd);
end;

procedure TfrmVendas.btnincluirClick(Sender: TObject);
begin
   btnok.Enabled            := True;
   BtnCancela.Enabled       := True;
   btnincluir.Enabled       := False;
   btnAdicionar.Enabled     := False;
   btnExcluir.Enabled       := False;
   btnAlterar.Enabled       := False;
   btnDesconto.Enabled      := True;
   btnOk.Enabled            := True;
   pnlProdutos.Enabled      := True;
   pnlDadosClientes.Enabled := True;
   btnCadProdutos.Enabled   := True;
   PagVendas.ActivePageIndex := 0;
   AtualizaTabelas;
   btnadicionarClick(btnadicionar);

   LimpaCampos();

   edtDataVenda.Date        := gsdata_Mov;
   If ( frmVendas.tag <> OS_FINALIZADA ) then
   Begin
      Try
         If edtdata_Vencimento.Visible then
            edtdata_Vencimento.SetFocus
         else
            edtcod_Cliente.SetFocus;
      except
      End;
   End;
   if pAtendimento then
   begin
      edtcod_Cliente.text := intToStr(pliCliente);
      edtcod_ClienteExit(edtcod_Cliente);
   end;
   if RetornarVerdadeirOuFalso( Uppercase( gParametros.Ler( '', '[VENDA]', 'EstiloPDV', 'NAO' ))) then
   begin
      edtcod_Cliente.Text := '1';
      edtcod_ClienteExit(edtcod_Cliente);
      edtCod_FormaPagamento.Text := '1';
      edtCod_FormaPagamentoExit(edtCod_FormaPagamento);
      edtCod_Funcionario.Text := '1';
      edtCod_FuncionarioExit(edtCod_Funcionario);
      Try
        edtCod_Produto.SetFocus;
      except
      End;

   end;

end;

procedure TfrmVendas.BtnCancelaClick(Sender: TObject);
begin

   btnAdicionar.Enabled  := False;
   btnExcluir.Enabled    := False;
   pnlProdutos.Enabled   := False;
   pnlDadosClientes.Enabled := False;
   cdsItensVendasTMP.EmptyDataSet;
   btnCadProdutos.Enabled   := False;

   btnok.Enabled         := False;
   BtnCancela.Enabled    := False;
   btnincluir.Enabled    := True;
   PagVendas.ActivePageIndex := 0;

   LimpaCampos();
   if (frmVendas.tag = 4) or (frmVendas.tag = 5)or (frmVendas.tag = 7) then
      Close;

end;

procedure TfrmVendas.cdsItensVendasTMPAfterOpen(DataSet: TDataSet);
var licont : Integer ;
begin
   for liCont := 1 To DataSet.FieldCount Do
   begin
      if DataSet.Fields[ liCont - 1 ].DataType = ftFloat Then
         TFloatField( DataSet.Fields[ liCont - 1 ] ).DisplayFormat := '0.00';
   end;
end;

procedure TfrmVendas.cdsItensVendasTMPBeforeOpen(DataSet: TDataSet);
var licont : Integer ;
begin
   for liCont := 1 To DataSet.FieldCount Do
   begin
      if DataSet.Fields[ liCont - 1 ].DataType = ftFloat Then
         TFloatField( DataSet.Fields[ liCont - 1 ] ).DisplayFormat := '0.00';
   end;
end;

procedure TfrmVendas.edtDescontoExit(Sender: TObject);
var lrDesconto : Real;
    lrPerc_Desconto : Double;
begin
   edtDesconto.Text :=  SubstString(edtDesconto.Text,'.', ',', True );
   EdtPco_Venda.ReadOnly := False;

   if StrToFloat(edtDesconto.Text)>0 then
   Begin
      if (cmbTipoDesconto.ItemIndex=0) then
         lrPerc_Desconto := arredondar( (StrToFloat(edtDesconto.Text)/StrToFloat(EdtPco_Venda.Text)) * 100,2)
      Else
         lrPerc_Desconto := StrToFloat(edtDesconto.Text);

      if ( lrPerc_Desconto > gsPerfilAcesso.Desc_Maximo )  and (Not pDescontoCliente) then
      Begin
         CaixaMensagem( 'O valor do desconto ultrapassa sua margem de '+formatFloat('0.00',gsPerfilAcesso.Desc_Maximo), ctAviso, [ cbOk ], 0 );
         edtDesconto.SetFocus;
         Exit;
      End;
   End;

  if (Strtofloat(edtDesconto.Text)>0) and (cmbTipoDesconto.ItemIndex=1) Then
  Begin
     lrdesconto := (StrToFloat(EdtPco_Venda.Text)*Strtofloat(edtDesconto.Text)/100);
     edtVlr_Desconto.text    := FormatFloat('0.00',lrdesconto);
     edtDesconto.Text        := FormatFloat('0.00',lrdesconto);
     EdtPco_Venda.ReadOnly   := True;
  End
  else if (Strtofloat(edtDesconto.Text)>0) and (cmbTipoDesconto.ItemIndex=0) Then
  Begin
     lrdesconto := Strtofloat(edtDesconto.Text);
     edtVlr_Desconto.text    := FormatFloat('0.00',lrdesconto);
     edtDesconto.Text        := FormatFloat('0.00',lrdesconto);
     EdtPco_Venda.ReadOnly   := True;
  End
  else
  Begin
     edtVlr_Desconto.text := '0,00';
     edtDesconto.text     := '0,00';
  end;
  if not EdtPco_Venda.Enabled then
     EdtPco_VendaExit(Sender);

end;

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
begin

   edtCod_Produto.Text := '';
   cmbNome_Produto.keyvalue := null;
   edtQtde_Venda.Text  := '0';
   edtPco_Venda.Text   := '0,00';
   edtTotal.Text       := '0,00';
   edtVlr_Desconto.text:= '0,00';
   edtDesconto.text    := '0,00';

   edtCod_Produto.Enabled  := True;
   cmbNome_Produto.Enabled := True;
   btnCadProdutos.Enabled  := True;


   btnAdicionar.Enabled     := True;
   btnExcluir.Enabled       := True;
   btnAlterar.Enabled       := True;
   btnOkProd.Enabled        := False;
   btnCancelar.Enabled      := False;;

end;

procedure TfrmVendas.btnDescontoClick(Sender: TObject);
begin
   FrmDescontoVenda := TFrmDescontoVenda.Create(self);
   FrmDescontoVenda.edtTotalVenda.text := edtTotalVenda.Text;
   FrmDescontoVenda.edtTotalLiquido.text := edtTotalVenda.Text;
   FrmDescontoVenda.showmodal;
   if ( StrToFloat(FrmDescontoVenda.edtTotDesconto.text)<>0 ) and ( FrmDescontoVenda.tag = 1 )then
   begin
      AtualizaDesconto(FrmDescontoVenda.pPercDesconto);
      TotalizarVenda(FrmDescontoVenda.pTotalDesconto);
   end;
end;


procedure TfrmVendas.btnExcluirClick(Sender: TObject);
begin
  IF cdsItensVendasTMP.IsEmpty Then
   Begin
      CaixaMensagem( 'N�o existe registro selecionado ', ctAviso, [ cbOk ], 0 );
      Exit
   End;
   if CaixaMensagem( 'Deseja Excluir o Produto '+cdsItensVendasTMP.FieldByname('Descricao').asString, ctConfirma, [ cbSimNao ], 0 )  Then
   Begin
      edtTotalVenda.Text    := FormatFloat('0.00',StrToFloat(edtTotalVenda.Text) -  ( cdsItensVendasTMP.FieldByname('Vlr_Total').asFloat +
                                                                                    ( cdsItensVendasTMP.FieldByname('Qtde_Venda').AsFloat * cdsItensVendasTMP.FieldByname('Vlr_Desconto').asFloat) ) );
      edtTotDesconto.Text   := FormatFloat('0.00',StrToFloat(edtTotDesconto.Text) -   ( cdsItensVendasTMP.FieldByname('Qtde_Venda').AsFloat * cdsItensVendasTMP.FieldByname('Vlr_Desconto').asFloat));
      edtTotalLiquido.Text  := FormatFloat('0.00',StrToFloat(edtTotalLiquido.Text) -  cdsItensVendasTMP.FieldByname('Vlr_total').asFloat);
      cdsItensVendasTMP.Delete;
   End;
   VerLimite();
   AtaulizaLucroBruto;
end;

function TfrmVendas.TotalDigitado(IdProduto : String) : Real ;
var Total : Real;
begin
   Total := 0;
   cdsItensTamanhos.First;
   while not cdsItensTamanhos.eof do
   begin
     if IdProduto=cdsItensTamanhos.fieldByName('idProduto').AsString then
        Total := Total + cdsItensTamanhos.fieldByName('Qtde').Asfloat;
     cdsItensTamanhos.next;
   end;
   Result := Total;
end;

procedure TfrmVendas.bsSkinButton1Click(Sender: TObject);
begin

   if StrToFloat(edtQtdeTamanho.Text)>StrToFloat(lblRestante.Caption) then
   begin
      CaixaMensagem( 'N�o existe produto disponivel para esta quantidade ', ctAviso, [ cbOk ], 0 );
      exit;
   end;

   if not cdsItensTamanhos.Locate('Tamanho',cmdNomeTamanho.Text,[]) then
   begin
     cdsItensTamanhos.append;
     cdsItensTamanhos.FieldByName('Tamanho').AsString     := cmdNomeTamanho.Text;
     cdsItensTamanhos.FieldByName('Qtde').AsInteger       := StrToInt(edtQtdeTamanho.Text);
     cdsItensTamanhos.FieldByName('IdProduto').AsString   := cdsItensVendasTmp.FieldByName('Codigo').AsString;
     cdsItensTamanhos.FieldByName('ItenGradeId').AsInteger:= dtmVendas.srcTamanhos.dataset.FieldByName('Id').AsInteger;
     cdsItensTamanhos.Post;
     AtualizaValores;
   end
   else
      CaixaMensagem( 'Este Tamanho j� foi adicionado ', ctAviso, [ cbOk ], 0 );
end;

procedure TfrmVendas.btnAdicionarClick(Sender: TObject);
begin

   pvQualBotao := 'Incluir';

   edtCod_Produto.Enabled  := True;
   cmbNome_Produto.Enabled := True;
   btnCadProdutos.Enabled  := True;

   btnAdicionar.Enabled     := False;
   btnExcluir.Enabled       := False;
   btnAlterar.Enabled       := False;
   btnOkProd.Enabled        := True;
   btnCancelar.Enabled      := True;
   btnCadProdutos.Enabled   := True;
   If frmVendas.tag <> 4 then
   Begin
      Try
         edtCod_Produto.SetFocus;
      Except
      End;
   End;

end;

procedure TfrmVendas.btnAlterarClick(Sender: TObject);
begin
   pvQualBotao := 'Alterar';

   edtCod_Produto.Text := cdsItensVendasTMP.FieldByName('Codigo').AsString;
   edtCod_ProdutoExit(edtCod_Produto);
   edtCod_Produto.Enabled := False;
   cmbNome_Produto.Enabled := False;
   btnCadProdutos.Enabled := False;

   edtQtde_Venda.Text  := FormatFloat('0',cdsItensVendasTMP.FieldByName('Qtde_Venda').AsFloat);
   edtDesconto.Text    := FormatFloat('0.00',cdsItensVendasTMP.FieldByName('Vlr_Desconto').AsFloat);
   EdtPco_Venda.Text   := FormatFloat('0.00',cdsItensVendasTMP.FieldByName('pco_Venda').AsFloat);
   pvrvlr_TotalAnt     := cdsItensVendasTMP.FieldByName('Vlr_Total').AsFloat;

   btnOk.Enabled            := True;
   btnCancelar.Enabled      := True;
   btnExcluir.Enabled       := True;
   btnAdicionar.Enabled     := False;
   btnAlterar.Enabled       := False;

   edtQtde_Venda.SetFocus;
   AtaulizaLucroBruto;

end;

procedure TfrmVendas.edtcod_ClienteExit(Sender: TObject);
begin
   if Trim(edtCod_Cliente.text)<> '' Then
   Begin
      IF length(Trim(edtCod_Cliente.Text))<=5 Then
      Begin
         cmbCod_Cliente.KeyValue := edtCod_Cliente.text;
         if Trim(cmbNome_Cliente.Text) = '' Then
         Begin
            cmbNome_Cliente.KeyValue := Null;
            edtCod_Cliente.Text      := '';
            CaixaMensagem( 'Cliente N�o Encontrado ', ctAviso, [ cbOk ], 0 );
            try
              edtCod_Cliente.SetFocus;
            Except

            End;
         End;
      End
      Else
      Begin
         cmbCNPJCPF.KeyValue  := edtCod_Cliente.Text;
         cmbCNPJCPFClick( cmbCNPJCPF );
         If cmbCod_Cliente.Text = '' Then
         Begin
            cmbNome_Cliente.KeyValue := Null;
            edtCod_Cliente.Text      := '';
         End;
     End;
   End
   else
      cmbNome_Cliente.KeyValue := Null;
end;

procedure TfrmVendas.MostrarAnimaisCliente;
var  DaoClienteAnimal : TDaoClienteAnimal;
     cdsDados : TclientDataSet;
begin
   DaoClienteAnimal := TDaoClienteAnimal.create(gConexao);
   cdsDados :=  DaoClienteAnimal.BucarAnimalCliente(cmbNome_Cliente.KeyValue);
   if not cdsDados.IsEmpty then
   begin
      frmSelAnimal := TfrmSelAnimal.Create(application);
      frmSelAnimal.srcAnimais.DataSet := cdsDados;
      frmSelAnimal.showmodal;
      if frmselAnimal.Tag=1 then
         pAnimalId := frmselAnimal.pAnimalId
      else
         BtnCancelaClick(BtnCancela);
      FreeandNil(frmSelAnimal);
   end;
end;

procedure TfrmVendas.NovoClienen1Click(Sender: TObject);
begin
  inherited;
  frmCadastroClienteSimplificado := TfrmCadastroClienteSimplificado.Create(Self);
  frmCadastroClienteSimplificado.showModal;

  AtualizarDadosClientes;

  if StrtoIntDef(frmCadastroClienteSimplificado.ClienteId,0) <> 0 Then
  begin
     edtCod_Cliente.Text := frmCadastroClienteSimplificado.ClienteId;
     edtCod_ClienteExit(edtCod_Cliente);
  End;
  edtcod_Cliente.SetFocus;
  FreeAndNil(frmCadastroClienteSimplificado);
end;

procedure TfrmVendas.cmbNome_ClienteChange(Sender: TObject);
begin
   CmbCod_Cliente.Keyvalue := cmbnome_Cliente.Keyvalue;
   if Trim(cmbNome_Cliente.Text) <> '' Then
   Begin
      edtCod_Cliente.text   :=  cmbCod_Cliente.Text;
      edtNome_Cliente.Text  :=  cmbNome_Cliente.Text;
      try
         edtCod_FormaPagamento.SetFocus
      except
      end;
      MostrarAnimaisCliente;
      VerificarSaldoDevedor(StrTointDef(cmbCod_Cliente.Text,0))
   End;
end;

procedure TfrmVendas.cmbCod_ClienteChange(Sender: TObject);
begin
   cmbnome_Cliente.Keyvalue  :=  CmbCod_Cliente.Keyvalue ;
   if Trim(cmbNome_Cliente.Text) <> '' Then
   Begin
      if trim(cdsCadClientes.FieldByName('Endereco').asString)=EmptyStr then
      begin
         CaixaMensagem( 'O cliente Esta com o endere�o desatualizado ', ctAviso, [ cbOk ], 0 );
         try
            edtcod_Cliente.SetFocus;
         except
         end;
      end;

      edtCod_Cliente.text  :=  cmbCod_Cliente.Text;
      edtCnpjCpf.Text      := Trim(cdsCadClientes.FieldByName('CnpjCpf').asString);
      cmbRota.KeyValue      := cdsCadClientes.FieldByName('Cod_Rota').asString;
      if Length( edtCNPJCPF.Text ) <= 11 then
      begin
        lblCNPJCPF.Caption   := 'C.P.F.';
        edtCNPJCPF.EditMask := '###.###.###-##;0;_';
      End
      Else
      Begin
        lblCNPJCPF.Caption   := 'C.N.P.J.';
        edtCNPJCPF.EditMask  := '##.###.###/####-##;0;_';
      End;
      sdtsConsultaCli.close;
      sdtsConsultaCli.Connection := frmPrincipal.dbxPrincipal;
      sdtsConsultaCli.DataSet.CommandText := 'Select Count(seqvenda) as Qtde, Sum(vlr_areceber) As Total From T_Ctasreceber '+
                                             'where cod_Cliente=:parCod_Cliente and Status=:parStatus';
      sdtsConsultaCli.DataSet.ParamByName('parCod_Cliente').AsInteger := StrToInt(edtcod_Cliente.Text);
      sdtsConsultaCli.DataSet.ParamByName('parStatus').AsInteger      := 0;
      sdtsConsultaCli.Open;
      cdsCadClientes.Locate('codigo',edtcod_Cliente.Text,[]);
      edtNome_Cliente.Enabled := False;
      if StrToInt(gParametros.Ler( '', '[CADASTRO]', 'ClientePadrao', '0' )) = StrToInt(edtCod_Cliente.Text) then
      Begin
          edtNome_Cliente.Enabled := True;
          If frmVendas.tag <> 4 then
          Try
             edtnome_cliente.SetFocus;
         Except
         End;
     End;
      if cdsCadClientes.FieldByName('Status').AsString = '1' then
      Begin
         CaixaMensagem( 'Este Cliente esta em Cobran�a ', ctAviso, [ cbOk ], 0 );
         edtcod_Cliente.SetFocus;
      End;
      if cdsCadClientes.FieldByName('Status').AsString = '2' then
      Begin
         CaixaMensagem( 'Este Cliente foi bloqueado para venda/servi�o ', ctAviso, [ cbOk ], 0 );
         edtcod_Cliente.SetFocus;
      End;
      cdsCadClientes.Locate('Codigo',edtCod_Cliente.text,[]);
      edtLimite_Credito.Text := FormatFloat('0.00',(cdsCadClientes.FieldByName('Limite_Credito').AsFloat-sdtsConsultaCli.FieldByName('Total').AsFloat));
      VerLimite();
      if (sdtsConsultaCli.FieldByName('Qtde').AsInteger>=cdsCadClientes.FieldByName('Qtde_PedAberto').AsInteger) and ( frmVendas.Tag <> 4 ) then
      begin
         CaixaMensagem( 'O cliente possui '+sdtsConsultaCli.FieldByName('Qtde').asString+' pedidos em aberto !', ctAviso, [ cbOk ], 0 );
         Try
           edtcod_Cliente.SetFocus;
         Except
         End;
         exit;
      end;
   End;
end;

procedure TfrmVendas.cmbCod_formaPagamentoChange(Sender: TObject);
begin
   cmbNome_formaPagamento.KeyValue := cmbCod_formaPagamento.KeyValue;
   if Trim(cmbCod_formaPagamento.Text) <> '' Then
      edtCod_FormaPagamento.Text      := inttostr(cmbCod_formaPagamento.KeyValue);
end;

procedure TfrmVendas.cmbNome_formaPagamentoChange(Sender: TObject);
begin
   cmbCod_formaPagamento.KeyValue := cmbNome_formaPagamento.KeyValue;
end;

procedure TfrmVendas.cmbCod_FuncionarioChange(Sender: TObject);
var Daoremessa : TDaoRemessa;
begin
   cmbNome_Funcionario.KeyValue  :=  cmbCod_Funcionario.KeyValue;
   if Trim(cmbCod_Funcionario.Text)<>'' Then
   begin
      Daoremessa := TDaoRemessa.Create(gConexao);
      edtCod_Funcionario.Text := cmbCod_Funcionario.Text;
      pnlRemessaAberta.Visible := DaoRemessa.TemRemessaAberta(cdsCadFuncionarios.FieldByName('Cod_Supervisor').AsInteger);
      FreeAndNil(Daoremessa);
   end;
end;

procedure TfrmVendas.cmbCod_tipoVendaChange(Sender: TObject);
begin
   cmbNome_TipoVenda.KeyValue  :=  cmbCod_TipoVenda.KeyValue;
   if Trim(cmbCod_TipoVenda.Text)<>'' Then
      edtCod_TipoVenda.Text := cmbCod_TipoVenda.Text
end;

procedure TfrmVendas.cmbNome_FuncionarioChange(Sender: TObject);
begin
   cmbCod_Funcionario.KeyValue  :=  cmbNome_Funcionario.KeyValue;
end;

procedure TfrmVendas.cmbCNPJCPFClick(Sender: TObject);
begin
   if Trim( cmbCNPJCPF.Text ) <> '' then
   begin
      cmbNome_Cliente.KeyValue := cmbCNPJCPF.Text;
      cmbNome_ClienteChange(cmbNome_Cliente);
   end
   else
   begin
      CaixaMensagem( 'Cliente ' + Trim( edtCod_Cliente.Text ) + ' n�o encontrado.', ctAviso, [ cbOk ], 0 );
      edtCod_Cliente.SetFocus;
      exit;
   end;
end;

procedure TfrmVendas.btnCadAlunosClick(Sender: TObject);
begin
    TbsSkinSpeedButton( Sender ).PopupMenu.Popup( TbsSkinSpeedButton( Sender ).ClientOrigin.X, TbsSkinSpeedButton( Sender ).ClientOrigin.Y + TbsSkinSpeedButton( Sender ).Height );
end;

procedure TfrmVendas.btnCadProdutosClick(Sender: TObject);
begin
   frmCadProdutos := TfrmCadProdutos.Create(Nil);
   frmCadProdutos.Tag := 5;
   frmCadProdutos.showmodal;

   qryVariavel.Close;
   qryVariavel.Params.Clear;
   qryVariavel.SQL.text := RetornarSelectProdutos+' From T_Produtos where Ativo=1 order by Descricao ';

   cdsCadProdutos.Close;
   cdsCadProdutos.ProviderName := dspVariavel.Name;
   cdsCadProdutos.Open;

   if frmCadProdutos.piCod_Produto<> 0 Then
   begin
      edtCod_Produto.Text := intToStr(frmCadProdutos.piCod_Produto);
      edtCod_ProdutoExit(edtCod_Produto);
   End;
end;
function TfrmVendas.RetornarSelectProdutos : String;
var precoDeVenda : string;
Begin
   precoDeVenda:= 'Pco_Venda';
   if frmVendas.tag = VENDAS_EXTERNAS then
      precoDeVenda:= 'PrecoVendaExterna as Pco_Venda';
   Result :=  'Select case Tipo_Produto when 0 then '+QuotedStr('Produto')+' else '+QuotedStr('Servi�o')+' end As TipoProduto, '+
              '       Garantia,GradeId,BloqueiaNegativo,ComissaoSecundaria,MargemSecundaria,Pco_Custo,PesoBruto,PesoLiquido,Cod_Barras,Unid,Codigo,Descricao,'+precoDeVenda+',Saldo,Tipo_Produto,M2,MetroLinear,Perc_Comissao,QtdeEmbalagem ';
end;
procedure TfrmVendas.edtCod_FormaPagamentoExit(Sender: TObject);
begin
   if trim(edtCod_FormaPagamento.text)<>'' then
   Begin
      cmbCod_FormaPagamento.KeyValue := strToInt(edtCod_FormaPagamento.text);
      cmbCod_FormaPagamentoChange(cmbCod_FormaPagamento);
      if Trim(cmbNome_FormaPagamento.Text) = '' Then
      Begin
         cmbNome_FormaPagamento.KeyValue := Null;
         edtCod_FormaPagamento.Text      := '';
         CaixaMensagem( 'Forma de pagamento n�o encontrada ', ctAviso, [ cbOk ], 0 );
         try
           edtCod_FormaPagamento.SetFocus
         Except

         end;
      End;
   End;
end;

procedure TfrmVendas.edtCod_FuncionarioExit(Sender: TObject);
begin
   if trim(edtCod_Funcionario.text)<>'' then
   Begin
      cmbCod_Funcionario.KeyValue := StrToInt(edtCod_Funcionario.text);
      cmbCod_FuncionarioChange(cmbCod_Funcionario);
      if Trim(cmbNome_Funcionario.Text) = '' Then
      Begin
         cmbNome_Funcionario.KeyValue := Null;
         edtCod_Funcionario.Text      := '';
         CaixaMensagem( 'Vendedor nao localizado', ctAviso, [ cbOk ], 0 );
         try
           edtCod_Funcionario.SetFocus
         Except

         end;
      End;
   End;
end;

procedure TfrmVendas.PagVendasChange(Sender: TObject);
begin
   if pagvendas.ActivePageIndex=1 then
   begin
      if StrTointDef(cdsItensVendasTmp.FieldByName('GradeID').AsString,0)<>0 then
      begin
         pnlProduto.Caption             := cdsItensVendasTmp.FieldByName('Codigo').AsString+' - '+cdsItensVendasTmp.FieldByName('Descricao').AsString;
         dtmVendas.srcTamanhos.Dataset  := gConexao.BuscarDadosSQL('select * from ItensGrade where GradeId='+cdsItensVendasTmp.FieldByName('GradeID').AsString,nil);
      end;
      if PagVendas.ActivePageIndex=0 then
         cdsItensTamanhos.SaveToFile(gspath+'Dados\GradeTamanho.xml', dfXML)
      else
      begin
         if FileExists(gspath+'Dados\GradeTamanho.xml') then
         begin
           cdsItensTamanhos.LoadFromFile(gspath+'Dados\GradeTamanho.xml');
           cdsItensTamanhos.Filtered := False;
           cdsItensTamanhos.Filter := 'IdProduto='+cdsItensVendasTmp.FieldByName('Codigo').AsString;
           cdsItensTamanhos.Filtered := True;
         end;
         cmdNomeTamanho.SetFocus;
      end;
      AtualizaValores;
   end;
end;
procedure TfrmVendas.AtualizaValores;
Begin
   lbltotalIncluido.Caption:= FormatFloat('0.00', TotalDigitado(cdsItensVendasTmp.FieldByName('Codigo').AsString));
   lblRestante.Caption := FormatFloat('0.00', (cdsItensVendasTmp.FieldByName('qtde_Venda').AsFloat - TotalDigitado(cdsItensVendasTmp.FieldByName('Codigo').AsString)));
End;
procedure  TfrmVendas.PedidoPersonalizado(NumeroVenda : String);
begin

  cdsEmpresa.Data := gconexao.BuscarDadosSQL('Select * from Empresa',Nil).Data;

  frxVenda.Variables['CNPJEmpresa']    := QuotedStr( FormatarCNPJ_CPF( cdsEmpresa.fieldByname('cnpjcpf').AsString ) );
  frxVenda.Variables['cnpjCliente']    := QuotedStr(edtCnpjCpf.Text);
  frxVenda.Variables['TotalLocacao']   := QuotedStr( edtTotalLiquido.Text );
  frxVenda.Variables['NumeroVenda']    := QuotedStr( NumeroVenda );
  frxVenda.Variables['FormaPagamento'] := QuotedStr( cmbNome_formaPagamento.text );

  frxVenda.ShowReport(true);
  cdsEmpresa.Close;
end;

procedure  TfrmVendas.PedidoPersonalizado03(NumeroVenda : String);
begin

  cdsEmpresa.Data := gconexao.BuscarDadosSQL('Select * from Empresa',Nil).Data;

  frxVendaPersonalizada03.Variables['CNPJEmpresa']            := QuotedStr( FormatarCNPJ_CPF( cdsEmpresa.fieldByname('cnpjcpf').AsString ) );
  frxVendaPersonalizada03.Variables['cnpjCliente']            := QuotedStr(edtCnpjCpf.Text);
  frxVendaPersonalizada03.Variables['TotalLocacao']           := QuotedStr( edtTotalLiquido.Text );
  frxVendaPersonalizada03.Variables['NumeroVenda']            := QuotedStr( NumeroVenda );
  frxVendaPersonalizada03.Variables['FormaPagamento']         := QuotedStr( cmbNome_formaPagamento.text );
  frxVendaPersonalizada03.Variables['Observacao']             := QuotedStr( MemoObs.Text );
  frxVendaPersonalizada03.Variables['Vendedor']               := QuotedStr( cmbNome_Funcionario.Text );

  frxVendaPersonalizada03.ShowReport(true);
  cdsEmpresa.Close;
end;

end.
