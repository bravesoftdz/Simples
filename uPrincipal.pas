unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxClasses, cxStyles,
  ufuncoes,cl_TPerfil,uClassConexao,uTipos,uClassEmpresa,
  bsSkinShellCtrls, bsSkinCtrls, bsSkinData, ActnList, XPStyleActnCtrls,
  ImgList, bsCategoryButtons,IniFiles, DB, SqlExpr,
  StdCtrls, verslab,
  cxControls, cxGraphics,MIDASLIB, WideStrings, cxPropertiesStore,
  DBClient,  FMTBcd, Provider, RDprint, ExtCtrls,
  SqlTimSt, bsSkinExCtrls, dxGDIPlusClasses, dxSkinsCore, DBXMsSQL, bsSkinGrids,
  bsDBGrids, Menus, jpeg, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxDropDownEdit, SimpleDS, dxBar, dxBarExtItems,
  cxBarEditItem, cxGridTableView, BusinessSkinForm, ActnMan, dxStatusBar,
  dxRibbonStatusBar, dxRibbon ;

type
  TfrmPrincipal = class(TForm)
    actManeger: TActionManager;
    actCadClientes: TAction;
    actCadFornecedores: TAction;
    actVendas: TAction;
    actEntradas: TAction;
    ActConsultaVenda: TAction;
    actCtasPagar: TAction;
    actCaixaDespesas: TAction;
    actCtasReceber: TAction;
    actSair: TAction;
    actCadUsuarios: TAction;
    actParametros: TAction;
    actSkins: TAction;
    SkinPrincipal: TbsSkinData;
    SkinEstorage1: TbsCompressedStoredSkin;
    OD: TbsOpenSkinDialog;
    SkinForm: TbsBusinessSkinForm;
    GrupoEstilos: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    actCadAtividades: TAction;
    actCadFuncionarios: TAction;
    cxLargeImages: TcxImageList;
    cxSmallImages: TcxImageList;
    MenuManeger: TdxBarManager;
    BarAtalhosCustomizados: TdxBar;
    dxBarCadPrincipal: TdxBar;
    dxBarCadFinanceiro: TdxBar;
    dxBarCadSecubdarios: TdxBar;
    BtnClientes: TdxBarLargeButton;
    btnFornecedores: TdxBarLargeButton;
    btnAtividades: TdxBarButton;
    btnPlanoContas: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxRibCadastro: TdxRibbonTab;
    MenuPrincipal: TdxRibbon;
    StatusBar: TdxRibbonStatusBar;
    dxBarButton1: TdxBarButton;
    actCadRotas: TAction;
    actCadFormasPagamento: TAction;
    dxRibbon1Tab1: TdxRibbonTab;
    dxBarManager1Bar1: TdxBar;
    actSequencias: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    MenuPrincipalTab1: TdxRibbonTab;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    GridTableViewStyleSheetWindowsStandard: TcxGridTableViewStyleSheet;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarButton5: TdxBarButton;
    actConsultaServico: TAction;
    dxBarLargeButton10: TdxBarLargeButton;
    Imagebutoes: TcxImageList;
    dxBarButton6: TdxBarButton;
    actCadGrupos: TAction;
    sdtsSequencia: TSimpleDataSet;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    GridTableViewStyleSheetWindowsClassic: TcxGridTableViewStyleSheet;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    imageMenu24x24: TcxImageList;
    ImageMenu32x32: TcxImageList;
    actFiscalReducaoZ: TAction;
    actFiscalLeituraX: TAction;
    actFiscalMemoriaFiscal: TAction;
    actFiscalCancelaCupom: TAction;
    actFiscalCancelaCupomAberto: TAction;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton13: TdxBarButton;
    comboDataIni: TdxBarDateCombo;
    combodatafim: TdxBarDateCombo;
    dxBarLargeButton5: TdxBarLargeButton;
    SkinEntradaDados: TbsSkinData;
    skinStorage2: TbsCompressedStoredSkin;
    MenuPrincipalTab2: TdxRibbonTab;
    MenuManegerBar2: TdxBar;
    dxBarButton12: TdxBarButton;
    actSelRelSaldos: TAction;
    actSelRelVendaRepresentante: TAction;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    MenuManegerBar4: TdxBar;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    actSelRelVendas: TAction;
    dxBarButton14: TdxBarButton;
    qryRelatorio: TSQLQuery;
    dspRelatorio: TDataSetProvider;
    cdsRelatorio: TClientDataSet;
    srcRelatorio: TDataSource;
    MenuManegerBar5: TdxBar;
    dxBarLargeButton6: TdxBarLargeButton;
    MenuPrincipalTab3: TdxRibbonTab;
    dxBarGroup1: TdxBarGroup;
    RibonFiscal: TdxBar;
    MenuManegerBar1: TdxBar;
    dxBarLargeButton12: TdxBarLargeButton;
    actSelRelExtratoEstoque: TAction;
    dxBarButton9: TdxBarButton;
    dxBarLargeButton13: TdxBarLargeButton;
    actCadPerfil: TAction;
    actfechadia: TAction;
    dxBarLargeButton14: TdxBarLargeButton;
    actControleRepasse: TAction;
    dxBarButton17: TdxBarButton;
    actSelRelDevolucoes: TAction;
    actAbreOs: TAction;
    MenuManegerBar7: TdxBar;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    actManutencaoOS: TAction;
    ImagemFundoPet: TbsSkinLinkImage;
    cdsProcedimento: TClientDataSet;
    dspvariavel: TDataSetProvider;
    qryVariavel: TSQLQuery;
    qryModific: TSQLQuery;
    MenuManegerBar9: TdxBar;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    actCadProposta: TAction;
    Action1: TAction;
    MenuManegerBar10: TdxBar;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton20: TdxBarLargeButton;
    actAcessoDados: TAction;
    actConifgMenu: TAction;
    MenuManegerBar11: TdxBar;
    actSelRelEntradas: TAction;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    actCadFabricantes: TAction;
    btnCadFabricante: TdxBarButton;
    Action2: TAction;
    ImpMatricial: TRDprint;
    lblVersao: TVersionLabel;
    actCadTipoVenda: TAction;
    dxBarButton21: TdxBarButton;
    actPlanilhaRecebimento: TAction;
    dxBarLargeButton21: TdxBarLargeButton;
    dbxPrincipal: TSQLConnection;
    tabRelatoriosVendas: TdxBar;
    dxBarButton22: TdxBarButton;
    actCurva_abc_Produto: TAction;
    actCurva_abc_Cliente: TAction;
    dxBarButton23: TdxBarButton;
    actRemessa: TAction;
    dxBarButton24: TdxBarButton;
    acrCaixas: TAction;
    dxBarButton25: TdxBarButton;
    actVendasExternas: TAction;
    dxBarButton20: TdxBarButton;
    actCadastroDeSetores: TAction;
    dxBarButton26: TdxBarButton;
    actTrocaDeUsuario: TAction;
    dxBarButton27: TdxBarButton;
    MenuManegerBar12: TdxBar;
    dxBarButton28: TdxBarButton;
    actAnaliseFinanceira: TAction;
    PanelEventos: TbsSkinExPanel;
    bsSkinDBGrid1: TbsSkinDBGrid;
    srcEventoAnimal: TDataSource;
    tabControleEntrega: TdxBar;
    actRomaneioEntrega: TAction;
    dxBarLargeButton22: TdxBarLargeButton;
    actVendaloja: TAction;
    dxBarButton29: TdxBarButton;
    acrRecebimentoRomaneio: TAction;
    dxBarLargeButton23: TdxBarLargeButton;
    actCadEmpresa: TAction;
    dxBarLargeButton24: TdxBarLargeButton;
    PopupMenu1: TPopupMenu;
    MarcarEventocomRealizado1: TMenuItem;
    actTabeladePreco: TAction;
    dxBarButton31: TdxBarButton;
    actServicoLauro: TAction;
    pnlContasReceber: TPanel;
    pnlContasApagar: TPanel;
    dxBarLargeButton25: TdxBarLargeButton;
    ImagemLogoSistema: TbsSkinLinkImage;
    SkinGrids: TbsSkinData;
    skinStorage3: TbsCompressedStoredSkin;
    dxBarButton33: TdxBarButton;
    actSkinGrid: TAction;
    actSkinDados: TAction;
    dxBarButton34: TdxBarButton;
    dxBarButton35: TdxBarButton;
    TabVendasProdutos: TdxBar;
    tabLocacao: TdxBar;
    actLocacao: TAction;
    actConsultaLocacao: TAction;
    dxBarLargeButton26: TdxBarLargeButton;
    dxBarButton36: TdxBarButton;
    TabEntradas: TdxBar;
    dxBarLargeButton27: TdxBarLargeButton;
    actCadGrade: TAction;
    btnGradeProduto: TdxBarButton;
    actRelLocacoes: TAction;
    dxBarButton38: TdxBarButton;
    TabRelatorioLocacao: TdxBar;
    dxBarButton39: TdxBarButton;
    dxBarButton37: TdxBarButton;
    Action3: TAction;
    MenuServicos: TdxBar;
    dxBarButton40: TdxBarButton;
    dxBarLargeButton28: TdxBarLargeButton;
    dxBarLargeButton29: TdxBarLargeButton;
    dxBarButton41: TdxBarButton;
    actServico01: TAction;
    dxBarLargeButton30: TdxBarLargeButton;
    dxBarButton42: TdxBarButton;
    actDelivery: TAction;
    btnRepasse: TdxBarLargeButton;
    actRelContaCorrente: TAction;
    dxBarButton30: TdxBarButton;
    dxBarButton32: TdxBarButton;
    actSimplesRemessa: TAction;
    dxBarButton43: TdxBarButton;
    actControleCheque: TAction;
    dxBarButton44: TdxBarButton;
    ActCidade: TAction;
    dxBarButton45: TdxBarButton;
    procedure actSkinsExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actCadClientesExecute(Sender: TObject);
    procedure actCadAtividadesExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCadFuncionariosExecute(Sender: TObject);
    procedure actCadOperacoesExecute(Sender: TObject);
    procedure actCadProdutosExecute(Sender: TObject);
    procedure actCadRotasExecute(Sender: TObject);
    procedure actCadFormasPagamentoExecute(Sender: TObject);
    procedure actParametrosExecute(Sender: TObject);
    procedure actSequenciasExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCtasReceberExecute(Sender: TObject);
    procedure actServicosExecute(Sender: TObject);
    procedure ActConsultaVendaExecute(Sender: TObject);
    procedure actConsultaServicoExecute(Sender: TObject);
    procedure actCaixaDespesasExecute(Sender: TObject);
    procedure actCadGruposExecute(Sender: TObject);
    procedure actFiscalReducaoZExecute(Sender: TObject);
    procedure actFiscalLeituraXExecute(Sender: TObject);
    procedure actFiscalMemoriaFiscalExecute(Sender: TObject);
    procedure actFiscalCancelaCupomExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFiscalCancelaCupomAbertoExecute(Sender: TObject);
    procedure actCadFornecedoresExecute(Sender: TObject);
    procedure actEntradasExecute(Sender: TObject);
    procedure actSelRelVendasExecute(Sender: TObject);
    procedure impMatricialNewPage(Sender: TObject; Pagina: Integer);
    procedure actSelRelVendaRepresentanteExecute(Sender: TObject);
    procedure actCadUsuariosExecute(Sender: TObject);
    procedure actSelRelExtratoEstoqueExecute(Sender: TObject);
    procedure actfechadiaExecute(Sender: TObject);
    procedure actCtasPagarExecute(Sender: TObject);
    procedure actControleRepasseExecute(Sender: TObject);
    procedure actSelRelDevolucoesExecute(Sender: TObject);
    procedure actAbreOsExecute(Sender: TObject);
    procedure actManutencaoOSExecute(Sender: TObject);
    procedure actCadPerfilExecute(Sender: TObject);
    procedure actCadPropostaExecute(Sender: TObject);
    procedure actSelRelEntradasExecute(Sender: TObject);
    procedure actCadFabricantesExecute(Sender: TObject);
    procedure actCadTipoVendaExecute(Sender: TObject);
    procedure actPlanilhaRecebimentoExecute(Sender: TObject);
    procedure actCurva_abc_ProdutoExecute(Sender: TObject);
    procedure actCurva_abc_ClienteExecute(Sender: TObject);
    procedure actRemessaExecute(Sender: TObject);
    procedure acrCaixasExecute(Sender: TObject);
    procedure actVendasExternasExecute(Sender: TObject);
    procedure actCadastroDeSetoresExecute(Sender: TObject);
    procedure actTrocaDeUsuarioExecute(Sender: TObject);
    procedure actAnaliseFinanceiraExecute(Sender: TObject);
    procedure actSelRelSaldosExecute(Sender: TObject);
    procedure actRomaneioEntregaExecute(Sender: TObject);
    procedure actVendalojaExecute(Sender: TObject);
    procedure actServicoAlineExecute(Sender: TObject);
    procedure acrRecebimentoRomaneioExecute(Sender: TObject);
    procedure actCadEmpresaExecute(Sender: TObject);
    procedure MarcarEventocomRealizado1Click(Sender: TObject);
    procedure actTabeladePrecoExecute(Sender: TObject);
    procedure actServicoLauroExecute(Sender: TObject);
    procedure actAtendimentoExecute(Sender: TObject);
    procedure actSkinGridExecute(Sender: TObject);
    procedure actSkinDadosExecute(Sender: TObject);
    procedure actLocacaoExecute(Sender: TObject);
    procedure actConsultaLocacaoExecute(Sender: TObject);
    procedure actCadGradeExecute(Sender: TObject);
    procedure actRelLocacoesExecute(Sender: TObject);
    procedure ActAberturaOsExecute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure actServico01Execute(Sender: TObject);
    procedure actDeliveryExecute(Sender: TObject);
    procedure actRelContaCorrenteExecute(Sender: TObject);
    procedure actSimplesRemessaExecute(Sender: TObject);
    procedure actControleChequeExecute(Sender: TObject);
    procedure ActCidadeExecute(Sender: TObject);
  private
    pviLinha : integer;
    procedure ConfiguraAmbiente;
    procedure DefinirDataSistema;
    procedure DefinirVariaveisDeAmbiente;
    procedure ControleDeRepasse;
    procedure VerificarEstrutura;
    procedure VerificarAgendaAnimal;
    procedure CarregarEmpresa;
    procedure AtualizarPainelAReceber;
    procedure AtualizarPainelAPagar;
    procedure EscolheRelatorios;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

  gsOperador     : String;
  gsCod_Operador : String;
  Gsversis       : String;
  GsNomeEmp      : String;
  gsCNPJEmp      : String;
  GstituloRel    : String;
  gsPeriodoRel   : String;
  gsCod_Emp      : String;
  gsData_Mov     : TDateTime;
  gsPath         : String;
  gsParametros   : TIniFile;
  gbMaster       : Boolean;

  gsModeloECF    : String;
  gbECFArredonda : boolean;
  gbAcesso       : boolean;
  gsSerieECF     : String;
  gsHoraECF      : String;
  gsUFEmp        : String;
  gbSenhaMaster  : boolean;
  gsPerfilAcesso : Tperfil;
  gConexao       : TConexao;
  gEmpresa       : TEmpresa;
  gbControleDeSenhaAtivo : Boolean;
  gxLinha         : array[ 1..5 ]  of string;

implementation

uses uCadClientes, uCadAtividades, uCadFuncionarios, uCadOperacoes,
  uCadProdutos, uCadRotas, uCadFormaPagamento, uParametros, usequencias,
  uVendas, uCtasreceber , uConsVendas, uMovCaixa, uCadGrupos,UnitDeclaracoes,
  uCadFornecedores, uEntradas, uselrelvendasVendedor,uDaoContaAPagar,
  ucadUsuarios, uselrelContaCorrenteEstoque, uFechaDia, uCtaspagar,
  uControleRepasse, uSelRelDevolucoes, uAbreOS, uConsultaOrdemServico,
  uCadPerfil, uProposta, uSelRelEntradas, uselrelvendas, uCadFabricantes,
  ucadTipoVenda, uDaoEstrutura, uselRelCurvaAbcProdutos,uDaoContaReceber,
  uselrelCurvaAbcClientes, uRemessaParaVenda, uCadCaixas, uCadSetores, uLogin,
  uRelAnaliseFinanceira, uDaoEventoAnimal, uRelEstoque, uRomaneioDeCarga,
  uRecebimentoRomaneio, uCadEmpresa, uDaoEmpresa, uRelTabelaPreco, uDelivery,
  uLocacao, uConsLocacao, uCadGrade, uAberturaOS, uDeliveryGas, uDtmRelatorios,
  uClassDaoContaCorrente, uDaoCliente, uClassCliente, uRelCheques, uCadCidade;

{$R *.dfm}

procedure TfrmPrincipal.actSkinsExecute(Sender: TObject);
var
  Ext: String;
begin
   OD.SkinData := SkinPrincipal;
   if OD.Execute then
   begin
     Ext := ExtractFileExt(OD.FileName);
     if LowerCase(Ext) = '.ini'
     then
       SkinPrincipal.LoadFromFile(OD.FileName)
     else
     if LowerCase(Ext) = '.skn'
     then
       SkinPrincipal.LoadFromCompressedFile(OD.FileName);
       gsParametros.WriteString('ADM','SkinPadrao',OD.FileName);
   end;
end;

procedure TfrmPrincipal.actTabeladePrecoExecute(Sender: TObject);
begin
   frmrelTabPreco := TfrmrelTabPreco.Create(Self);
   frmrelTabPreco.ShowModal;
end;

procedure TfrmPrincipal.actTrocaDeUsuarioExecute(Sender: TObject);
begin
   frmLogin := TfrmLogin.Create(application);
   frmLogin.Tag := 2;
   frmLogin.ShowModal;
end;

procedure TfrmPrincipal.actSairExecute(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.actCadClientesExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadClientes := TfrmCadClientes.create(Self);
   frmCadClientes.showModal;
end;

procedure TfrmPrincipal.actCadEmpresaExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadEmpresa := TfrmCadEmpresa.create(Self);
   frmCadEmpresa.showModal;
end;

procedure TfrmPrincipal.acrCaixasExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadCaixas := TfrmCadCaixas.create(Self);
   frmCadCaixas.showModal;
end;

procedure TfrmPrincipal.acrRecebimentoRomaneioExecute(Sender: TObject);
begin
   frmRecebimentoRomaneio := TfrmRecebimentoRomaneio.Create(Self);
   frmRecebimentoRomaneio.ShowModal
end;

procedure TfrmPrincipal.ActAberturaOsExecute(Sender: TObject);
begin
   frmAberturaOs := TfrmAberturaOs.create(Self);
   frmAberturaOs.showmodal;
end;

procedure TfrmPrincipal.actAbreOsExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmabreos := tfrmabreos.create(Self);
   frmabreos.showmodal;
end;

procedure TfrmPrincipal.actAnaliseFinanceiraExecute(Sender: TObject);
begin
   frmRelAnaliseFinanceira := TfrmRelAnaliseFinanceira.Create(Application);
   frmRelAnaliseFinanceira.showModal;
end;

procedure TfrmPrincipal.actAtendimentoExecute(Sender: TObject);
begin
   frmDelivery := TFrmDelivery.Create(Self);
   frmDelivery.WindowState := wsMaximized;
   frmDelivery.ShowModal;
end;

procedure TfrmPrincipal.actCadastroDeSetoresExecute(Sender: TObject);
begin
  if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadsetores:= TfrmCadsetores.create(Self);
   frmCadsetores.showModal;
end;

procedure TfrmPrincipal.actCadAtividadesExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadAtividades := TfrmCadAtividades.create(Self);
   frmCadAtividades.showModal;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   gParametros := TParametros.Create;

   DefinirDataSistema;

   DefinirVariaveisDeAmbiente;

   ConfiguraAmbiente;

   ControleDeRepasse;

   VerificarEstrutura;

   VerificarAgendaAnimal;

   CarregarEmpresa;

   AtualizarPainelAReceber;

   AtualizarPainelAPagar;

   EscolheRelatorios;

end;
procedure TfrmPrincipal.EscolheRelatorios;
begin
   if HeLocacao then
   begin
      tabRelatoriosVendas.Visible := False;
      TabRelatorioLocacao.Visible := True;
   end
   else
   begin
      tabRelatoriosVendas.Visible := True;
      TabRelatorioLocacao.Visible := False;
   end;
end;

procedure TfrmPrincipal.AtualizarPainelAReceber;
var uDaoContaReceber : TDaoContaReceber;
    Total : Real;
begin
   if HeDistribuidora then
   begin
      uDaoContaReceber := TDaoContaReceber.Create(gConexao);
      Total := uDaoContaReceber.TotalEmAberto(RetornarDataSistema);
      pnlContasReceber.Visible := False;
      if total>0 then
      begin
         pnlContasReceber.Visible := True;
         pnlContasReceber.Caption := '  Total a Receber..: '+FormatFloat(',0.00',Total);
      end;
      FreeAndNil(uDaoContaReceber);
   end;
end;


procedure TfrmPrincipal.AtualizarPainelAPagar;
var uDaoContaApagar : TDaoContaAPagar;
    Total : Real;
begin
   if HeDistribuidora then
   begin
      uDaoContaApagar := TDaoContaAPagar.Create(gConexao);
      Total := uDaoContaApagar.TotalEmAberto(RetornarDataSistema);
      pnlContasApagar.Visible := False;
      if total>0 then
      begin
         pnlContasApagar.Visible := True;
         pnlContasApagar.Caption := '  Total a Pagar....: '+FormatFloat(',0.00',Total);
      end;
      FreeAndNil(uDaoContaApagar);
   end;
end;

procedure TfrmPrincipal.CarregarEmpresa;
var DaoEmpresa : TDaoEmpresa;
begin
  DaoEmpresa := TDaoEmpresa.Create(gConexao);
  gEmpresa := Daoempresa.carregar;
end;

procedure TfrmPrincipal.ActCidadeExecute(Sender: TObject);
begin
   frmCadCidade := TfrmCadCidade.create(Self);
   frmCadCidade.showModal;
end;

procedure TfrmPrincipal.VerificarAgendaAnimal;
var DaoEventoAnimal : TdaoEventoAnimal;
begin
  DaoEventoAnimal := TdaoEventoAnimal.Create(gConexao);
  srcEventoAnimal.DataSet := DaoEventoAnimal.AgendaPendente;
  FreeAndNil(DaoEventoAnimal);
  PanelEventos.Visible   := ( not srcEventoAnimal.DataSet.IsEmpty);
  PanelEventos.RollState := ( not srcEventoAnimal.DataSet.IsEmpty);
end;

procedure TfrmPrincipal.ConfiguraAmbiente;
begin
   MenuPrincipal.ActiveTab := dxRibCadastro;
   //RibonAtendimentoCliente.Visible := false;

   RibonFiscal.Visible         := False;
   tabLocacao.Visible          := False;
   tabControleEntrega.Visible  := False;
   //actAtendimento.Visible    := False;
   ImagemFundoPet.visible      := False;
   TabVendasProdutos.Visible   := True;
   if HeServicos then
   begin
      //TabServicos.Visible             := True;
      TabVendasProdutos.Visible       := True;
   end;
   if PetShop then
   begin
      //actAtendimento.Visible      := True;
      ImagemFundoPet.visible      := True;
   end;
   if HeLocacao then
   begin
      TabVendasProdutos.Visible := False;
      //TabServicos.Visible := False;
      TabLocacao.Visible := true;
   end;
   if HeDistribuidora then
   Begin
      MenuServicos.Visible := False;
      tabControleEntrega.Visible  := True;
   End;
end;

procedure TfrmPrincipal.DefinirDataSistema;
begin

  sdtsSequencia.Close;
  sdtsSequencia.DataSet.CommandText := 'SELECT * FROM T_Sequencias where Tipo_sequencia=:parTipo_Sequencia';
  sdtsSequencia.DataSet.ParamByName('parTipo_Sequencia').AsString := 'Data_Mov';
  sdtsSequencia.Open;

  if sdtsSequencia.IsEmpty then
    gsData_Mov := Now
  else
    gsData_Mov := StrToDate(sdtsSequencia.FieldByName('sequencia').AsString);
  if Uppercase(gParametros.Ler('', '[CADASTRO]', 'Data_Automatica', 'SIM')) = 'SIM' then
    gsData_Mov := StrToDate(FormatDatetime('dd/mm/yyyy', now));
   StatusBar.Panels[0].Text := 'Data do Movimento .: '+FormatDatetime('dd/mm/yyyy',gsData_Mov);
   
end;

procedure TfrmPrincipal.DefinirVariaveisDeAmbiente;
begin
  GsNomeEmp := gsParametros.ReadString('CONFIG_SISTEMA', 'NomeEmpresa', 'Informe a empresa nos parametros');
  gsCod_Emp := '001';
  lblVersao.Filename := gspath + 'simples.exe';
  lblVersao.Enabled := True;
  StatusBar.Panels[1].Text := 'Operador .: ' + gsOperador;
  StatusBar.Update;
  frmPrincipal.Caption := frmPrincipal.Caption + 'Vers�o ' + lblVersao.InfoString;
  if not DirectoryExists( gsPath + 'Config' ) then
     CreateDir( gsPath + 'Config' );
  MenuPrincipal.BarManager.loadFromIniFile(gspath+'ConfigMenu.ini');
end;

procedure TfrmPrincipal.ControleDeRepasse;
begin
  if formatDateTime('dd/mm/yyyy', now) <> gsParametros.ReadString('AMBIENTE', 'data_repasse', '01/01/2008') then
  begin
    if Uppercase(Formatdatetime('ddd', Now)) = 'QUA' then
    begin
      QryVariavel.Close;
      QryVariavel.Params.Clear;
      QryVariavel.SQL.Text := 'SELECT Documento, Sequencia FROM T_Ctasreceber ' + 'WHERE Status=:parStatus and ' + '      ( Data_Vencimento>=:parData_VencimentoIni and Data_Vencimento<=:parData_VencimentoFim )';
      QryVariavel.ParamByName('parData_VencimentoIni').AsSQLTimeStamp := DateTimeToSQLTimeStamp(gsdata_mov - 7);
      QryVariavel.ParamByName('parData_VencimentoFim').AsSQLTimeStamp := DateTimeToSQLTimeStamp(gsdata_mov - 2);
      QryVariavel.ParamByName('parStatus').AsString := '0';
      cdsProcedimento.Close;
      cdsProcedimento.ProviderName := dspVariavel.name;
      cdsProcedimento.Open;
      while not cdsProcedimento.Eof do
      begin
        qryModific.Close;
        qryModific.Params.Clear;
        qryModific.SQL.Text := 'Update T_Ctasreceber set Repasse=:parRepasse, data_Repasse=:parData_Repasse ' + 'Where Documento=:parDocumento and Sequencia=:parSequencia';
        qryModific.ParamByName('parDocumento').asString := cdsProcedimento.FieldByName('Documento').AsString;
        qryModific.ParamByName('parRepasse').asString := 'S';
        qryModific.ParamByName('parData_Repasse').AsSQLTimeStamp := DateTimeToSQLTimeStamp(now);
        qryModific.ParamByName('parSequencia').asInteger := cdsProcedimento.FieldByName('Sequencia').AsInteger;
        qryModific.ExecSQL;
        cdsProcedimento.Next;
      end;
      gsParametros.WriteString('AMBIENTE', 'data_repasse', formatDateTime('dd/mm/yyyy', now));
    end;
  end;

end;

procedure TfrmPrincipal.VerificarEstrutura;
var Estrutura: TDaoEstrutura;
begin
   Estrutura := TDaoEstrutura.Create(gConexao);
   try
     Estrutura.ExecultarCorrecoes;
   finally
     FreeAndNil(Estrutura);
   end;
end;

procedure TfrmPrincipal.impMatricialNewPage(Sender: TObject; Pagina: Integer);
begin
   ConfiguraRel( Name, True, TRdPrint( Sender ), 1 );
   pviLinha := 06;
   TRdPrint( Sender ).imp(pvilinha,001,'Codigo Descricao                                Unid.  Saldo  pco.Venda     Total');
   pviLinha:=Pvilinha+1;
   TRdPrint( Sender ).imp(pviLinha,001,incdigito( '-','-',80,0));
   pviLinha:=Pvilinha+1;
end;

procedure TfrmPrincipal.MarcarEventocomRealizado1Click(Sender: TObject);
var  DaoEventoAnimal : TdaoEventoAnimal;
begin
   if CaixaMensagem( 'Deseja marcar evento como concluido', ctConfirma, [ cbSimNao ], 0 )  Then
   Begin
      DaoEventoAnimal := TdaoEventoAnimal.Create(gConexao);
      DaoEventoAnimal.RealizarEvento(srcEventoAnimal.DataSet.FieldByName('EventoId').AsInteger,gsOperador);
      FreeAndNil(DaoEventoAnimal);
   end;
   VerificarAgendaAnimal;
end;

procedure TfrmPrincipal.actCadFuncionariosExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadFuncionarios := TfrmCadFuncionarios.create(Self);
   frmCadFuncionarios.showModal;
end;

procedure TfrmPrincipal.actCadGradeExecute(Sender: TObject);
begin
   frmCadGrade := tfrmCadGrade.create(Self);
   frmCadGrade.showmodal;
end;

procedure TfrmPrincipal.actCadGruposExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmcadgrupos := tfrmCadGrupos.create(Self);
   frmcadgrupos.showmodal;
end;

procedure TfrmPrincipal.actCadOperacoesExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadOperacoes := TfrmCadOperacoes.create(Self);
   frmCadOperacoes.showModal;
end;

procedure TfrmPrincipal.actCadPerfilExecute(Sender: TObject);
begin
  if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
  Begin
     CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
     Exit;
  End;
  frmcadperfil := TfrmCadPerfil.create(Self);
  frmcadperfil.showmodal;
end;

procedure TfrmPrincipal.actCadProdutosExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadProdutos := TfrmCadProdutos.create(Self);
   frmCadProdutos.showModal;
end;

procedure TfrmPrincipal.actCadPropostaExecute(Sender: TObject);
begin
   frmProposta := TfrmProposta.Create(Self);
   frmProposta.showmodal;
   freeandNil(frmProposta);
end;

procedure TfrmPrincipal.actCadRotasExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadRotas := TfrmCadRotas.create(Self);
   frmCadRotas.showModal;
end;

procedure TfrmPrincipal.actCadTipoVendaExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmcadTipoVenda := TfrmcadTipoVenda.create(Self);
   frmcadTipoVenda.showmodal;
end;

procedure TfrmPrincipal.actCadUsuariosExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmcadUsuarios := TfrmcadUsuarios.create(Self);
   frmcadUsuarios.showmodal;
end;

procedure TfrmPrincipal.actCaixaDespesasExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmMovCaixa := TfrmMovCaixa.create(self);
   frmmovcaixa.showmodal;
end;

procedure TfrmPrincipal.actConsultaServicoExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmConsVendas := TfrmConsVendas.Create(Nil);
   frmconsvendas.tag := 3;
   frmConsVendas.showmodal;
end;

procedure TfrmPrincipal.actConsultaLocacaoExecute(Sender: TObject);
begin
   frmConsLocacao := TfrmConsLocacao.Create(Nil);
   frmConsLocacao.tag := 3;
   frmConsLocacao.showmodal;
end;

procedure TfrmPrincipal.ActConsultaVendaExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmConsVendas := TfrmConsVendas.Create(Nil);
   frmConsVendas.showmodal;
end;

procedure TfrmPrincipal.actCadFabricantesExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadFabricantes := TfrmCadFabricantes.create(Self);
   frmCadFabricantes.showModal;
end;

procedure TfrmPrincipal.actCadFormasPagamentoExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCadFormaPagamento := TfrmCadFormaPagamento.create(Self);
   frmCadFormaPagamento.showModal;
end;

procedure TfrmPrincipal.actCadFornecedoresExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmcadFornecedores := TFrmCadFornecedores.Create(self);
   frmcadfornecedores.showmodal
end;

procedure TfrmPrincipal.actParametrosExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmParametros := TfrmParametros.Create(Self);
   frmParametros.showmodal;
end;

procedure TfrmPrincipal.actPlanilhaRecebimentoExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmControleRepasse := TfrmControleRepasse.create(Self);
   frmControleRepasse.Tag := 1;
   frmControleRepasse.showmodal;
end;

procedure TfrmPrincipal.actRelContaCorrenteExecute(Sender: TObject);
var cdsDados : TclientDataSet;
    ContaCorrente : TDaoContaCorrente;
    DaoCliente : TDaoCliente;
    Cliente : TCliente;
    Saldo : Real;
    lrTotal : Real;
begin
   dtmRelatorios := TdtmRelatorios.Create(Self);
   cdsDados  := gConexao.BuscarDadosSQL('Select Cod_Cliente from T_ContaCorrente group by Cod_Cliente', nil);
   ContaCorrente := TDaoContaCorrente.Create(gConexao);
   DaoCliente := TDaoCliente.Create(gConexao);

   GstituloRel  := 'Relatorio de saldo de conta corrente ';
   dtmRelatorios.ImpMatricial.PortaComunicacao          := 'LPT1';
   dtmRelatorios.ImpMatricial.OpcoesPreview.Preview     := true;
   dtmRelatorios.ImpMatricial.TamanhoQteLinhas          := 66;
   dtmRelatorios.ImpMatricial.TamanhoQteColunas         := 80;
   dtmRelatorios.ImpMatricial.FonteTamanhoPadrao        := s17cpp;
   dtmRelatorios.ImpMatricial.UsaGerenciadorImpr        := True;
   dtmRelatorios.ImpMatricial.Abrir;
   ConfiguraRel( Name, True, dtmRelatorios.ImpMatricial, 1 );
   pviLinha := 07;
   TRdPrint( Sender ).imp(pviLinha,001,'Codigo Descricao                                                  Total');
   pviLinha:=pviLinha+1;
   TRdPrint( Sender ).imp(pviLinha,001,incdigito( '-','-',80,0));
   pviLinha:=pviLinha+1;
   lrTotal := 0;
   while not cdsDados.eof do
   begin
      Saldo         := ContaCorrente.Saldo(cdsDados.FieldByName('Cod_Cliente').AsInteger);
      if Saldo>0 then
      begin
        Cliente     := DaoCliente.Buscar(cdsDados.FieldByName('Cod_Cliente').AsInteger);
        dtmRelatorios.impmatricial.Imp(pvilinha,001,Cliente.Descricao+' Fone.:'+Cliente.Telefones);
        pviLinha:=Pvilinha+1;
        dtmRelatorios.impmatricial.Imp(pvilinha,001,'Endere�o ('+cliente.Endereco.logradouro+' - '+cliente.Endereco.bairro+')' );
        dtmRelatorios.impmatricial.Impd(pvilinha,80,FormatFloat('0.00', Saldo ),[]);
        pviLinha:=Pvilinha+1;
        lrTotal := lrTotal + Saldo;
      end;
      cdsDados.Next;
   end;
   TRdPrint( Sender ).imp(pviLinha,001,incdigito( '-','-',80,0));
   pviLinha:=Pvilinha+1;
   dtmRelatorios.impmatricial.Imp(pvilinha,001,'Total.');
   dtmRelatorios.impmatricial.Impd(pvilinha,80,FormatFloat('0.00', lrTotal ),[]);
   dtmRelatorios.ImpMatricial.Fechar;
end;

procedure TfrmPrincipal.actRelLocacoesExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmSelRelVendas := TfrmSelRelVendas.create(Self);
   frmSelRelVendas.Tag := 2;
   frmSelRelVendas.showmodal;
end;

procedure TfrmPrincipal.actRemessaExecute(Sender: TObject);
begin
  {if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;}
   frmRemessaParaVenda := TfrmRemessaParaVenda.Create(Self);
   frmRemessaParaVenda.showmodal
end;

procedure TfrmPrincipal.actRomaneioEntregaExecute(Sender: TObject);
begin
   frmRomaneioDeEntrega := TfrmRomaneioDeEntrega.Create(Self);
   frmRomaneioDeEntrega.ShowModal
end;

procedure TfrmPrincipal.actSelRelEntradasExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmSelRelEntradas := TfrmSelRelEntradas.Create(Self);
   frmSelRelEntradas.showmodal;
end;

procedure TfrmPrincipal.actSelRelExtratoEstoqueExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmSelRelContaCorrenteEstoque := TfrmSelRelContaCorrenteEstoque.Create(Self);
   frmSelRelContaCorrenteEstoque.showmodal;
end;

procedure TfrmPrincipal.actSelRelSaldosExecute(Sender: TObject);
begin
   frmRelEstoque := TfrmRelEstoque.create(Self);
   frmRelEstoque.showModaL;
end;

procedure TfrmPrincipal.actSelRelVendaRepresentanteExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmSelRelVendasVendedor := TfrmSelRelVendasVendedor.create(Self);
   frmSelRelVendasVendedor.showmodal;
end;

procedure TfrmPrincipal.actSelRelVendasExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmSelRelVendas := TfrmSelRelVendas.create(Self);
   frmSelRelVendas.showmodal;
end;

procedure TfrmPrincipal.actSequenciasExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmSequencias := TfrmSequencias.create(Self);
   frmSequencias.showmodal;
end;

procedure TfrmPrincipal.actVendalojaExecute(Sender: TObject);
const Venda_Externa = 2;
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   FrmVendas := TfrmVendas.create(Self);
   frmvendas.Tag := Venda_Externa;
   frmVendas.Showmodal;
end;

procedure TfrmPrincipal.actVendasExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   FrmVendas := TfrmVendas.create(Self);
   frmVendas.Showmodal;
end;

procedure TfrmPrincipal.actVendasExternasExecute(Sender: TObject);
const Venda_Externa = 2;
begin
if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   FrmVendas := TfrmVendas.create(Self);
   frmvendas.Tag := Venda_Externa;
   frmVendas.Showmodal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   MenuPrincipal.BarManager.SaveToIniFile(gsPath+'configMenu.ini');
   Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

   gsPath := ExtractFilePath( ParamStr( 0 ) );
   If Copy( gsPath, Length(gsPath), 1) <> '\' Then
     gsPath := gsPath+'\';
   gsParametros := TIniFile.Create(gsPath+'Config.ini');

   dbxPrincipal.Close;
   dbxPrincipal.Params.Values[ 'HostName' ]  := gsParametros.ReadString('ACESSODADOS','HostName','(Local)');
   dbxPrincipal.Params.Values[ 'DataBase' ]  := gsParametros.ReadString('ACESSODADOS','DataBaseName','Controler');
   dbxPrincipal.Params.Values[ 'User_Name' ] := gsParametros.ReadString('ACESSODADOS','Usuario','Controler');
   dbxPrincipal.Params.Values[ 'Password' ]  := gsParametros.ReadString('ACESSODADOS','Senha','remoto');
   dbxPrincipal.LoginPrompt := False;
   dbxPrincipal.Open;

   gConexao := TConexao.Create(tcDBX);

end;

procedure TfrmPrincipal.actControleChequeExecute(Sender: TObject);
begin
   frmcontroleCheques := TfrmcontroleCheques.create(Self);
   frmcontroleCheques.showmodal;
end;

procedure TfrmPrincipal.actControleRepasseExecute(Sender: TObject);
begin
{   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;}
   frmControleRepasse := TfrmControleRepasse.create(Self);
   frmControleRepasse.Tag := 0;
   frmControleRepasse.showmodal;
end;

procedure TfrmPrincipal.actCtasPagarExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCtasPagar := TfrmCtasPagar.create(Self);
   frmCtasPagar.showmodal;
end;

procedure TfrmPrincipal.actCtasReceberExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmCtasReceber := TfrmCtasReceber.create(Self);
   frmCtasReceber.showModal;
end;

procedure TfrmPrincipal.actCurva_abc_ClienteExecute(Sender: TObject);
begin
 if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmselRelCurvaAbcClientes := TfrmselRelCurvaAbcClientes.create(Self);
   frmselRelCurvaAbcClientes.showModal;
end;

procedure TfrmPrincipal.actCurva_abc_ProdutoExecute(Sender: TObject);
begin
 if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmselRelCurvaAbcProdutos := TfrmselRelCurvaAbcProdutos.create(Self);
   frmselRelCurvaAbcProdutos.showModal;
end;

procedure TfrmPrincipal.actDeliveryExecute(Sender: TObject);
begin
   frmDelivery := TFrmDelivery.Create(Self);
   frmDelivery.WindowState := wsMaximized;
   frmDelivery.ShowModal;
end;

procedure TfrmPrincipal.actEntradasExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmentradas := Tfrmentradas.create(Self);
   frmentradas.showModal;
end;

procedure TfrmPrincipal.actfechadiaExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmfechadia := tfrmfechadia.create(self);
   frmfechadia.showmodal;
end;

procedure TfrmPrincipal.actFiscalCancelaCupomAbertoExecute(Sender: TObject);
var liretorno : integer;
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   liRetorno := Bematech_FI_CancelaCupomMFD('','','');
   If liRetorno <> 1 Then
   Begin
      CaixaMensagem( 'Erro "' + IntToStr( liRetorno ) + '" ao tentar Emitir a leitura X "' + '" no ECF!!!', ctErro, [ cbOK ], 0 );
      Exit;
   End;
end;

procedure TfrmPrincipal.actFiscalCancelaCupomExecute(Sender: TObject);
var liretorno : integer;
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   liRetorno := Bematech_FI_CancelaCupomMFD('','','');
   If liRetorno <> 1 Then
   Begin
      CaixaMensagem( 'Erro "' + IntToStr( liRetorno ) + '" ao tentar Emitir a leitura X "' + '" no ECF!!!', ctErro, [ cbOK ], 0 );
      Exit;
   End;
end;

procedure TfrmPrincipal.actFiscalLeituraXExecute(Sender: TObject);
var liretorno : integer;
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   liretorno := Bematech_FI_LeituraX();
   If liRetorno <> 1 Then
   Begin
      CaixaMensagem( 'Erro "' + IntToStr( liRetorno ) + '" ao tentar Emitir a leitura X "' + '" no ECF!!!', ctErro, [ cbOK ], 0 );
      Exit;
   End;
end;

procedure TfrmPrincipal.actFiscalMemoriaFiscalExecute(Sender: TObject);
var liretorno : integer;
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   liretorno := Bematech_FI_LeituraMemoriaFiscalData( FormatDateTime('dd/mm/yyyy',ComboDataIni.Date), FormatDateTime('dd/mm/yyyy',ComboDataFim.Date) );
   If liRetorno <> 1 Then
   Begin
      CaixaMensagem( 'Erro "' + IntToStr( liRetorno ) + '" ao tentar Emitir a leitura X "' + '" no ECF!!!', ctErro, [ cbOK ], 0 );
      Exit;
   End;
end;

procedure TfrmPrincipal.actFiscalReducaoZExecute(Sender: TObject);
var liretorno : integer;
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   liretorno := Bematech_FI_ReducaoZ(FormatDateTime('dd/mm/yyyy',now),formatDateTime('HH:MM:SS',now));
   If liRetorno <> 1 Then
   Begin
      CaixaMensagem( 'Erro "' + IntToStr( liRetorno ) + '" ao tentar Emitir a leitura X "' + '" no ECF!!!', ctErro, [ cbOK ], 0 );
      Exit;
   End;
End;

procedure TfrmPrincipal.Action3Execute(Sender: TObject);
begin
{   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End; }
   frmConsVendas := TfrmConsVendas.Create(Nil);
   frmconsvendas.tag := 3;
   frmConsVendas.showmodal;
end;

procedure TfrmPrincipal.actLocacaoExecute(Sender: TObject);
begin
   frmLocacao := tfrmLocacao.create(self);
   frmLocacao.showmodal;
end;

procedure TfrmPrincipal.actSkinGridExecute(Sender: TObject);
var
  Ext: String;
begin
   OD.SkinData := SkinGrids;
   if OD.Execute then
   begin
     Ext := ExtractFileExt(OD.FileName);
     if LowerCase(Ext) = '.ini'
     then
       SkinGrids.LoadFromFile(OD.FileName)
     else
     if LowerCase(Ext) = '.skn'
     then
       SkinGrids.LoadFromCompressedFile(OD.FileName);
       gsParametros.WriteString('ADM','SkinPadrao',OD.FileName);
   end;
end;

procedure TfrmPrincipal.actSkinDadosExecute(Sender: TObject);
var
  Ext: String;
begin
   OD.SkinData := SkinEntradaDados;
   if OD.Execute then
   begin
     Ext := ExtractFileExt(OD.FileName);
     if LowerCase(Ext) = '.ini'
     then
       SkinEntradaDados.LoadFromFile(OD.FileName)
     else
     if LowerCase(Ext) = '.skn'
     then
       SkinEntradaDados.LoadFromCompressedFile(OD.FileName);
       gsParametros.WriteString('ADM','SkinPadrao',OD.FileName);
   end;
end;

procedure TfrmPrincipal.actServicoLauroExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   FrmVendas := TfrmVendas.create(Self);
   frmvendas.Tag := 3; // venda de servi�os
   frmvendas.liCaixa := 2;
   frmVendas.Showmodal;
end;

procedure TfrmPrincipal.actManutencaoOSExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmConsultaOrdemServico := TfrmConsultaOrdemServico.Create(Self);
   frmConsultaOrdemServico.show;
end;

procedure TfrmPrincipal.actSelRelDevolucoesExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   frmSelRelDevolucoes := TfrmSelRelDevolucoes.create(Self);
   frmSelRelDevolucoes.Showmodal;
end;

procedure TfrmPrincipal.actServico01Execute(Sender: TObject);
begin
   //if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   //Begin
   //   CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
   //   Exit;
   //End;
   FrmVendas := TfrmVendas.create(Self);
   frmvendas.Tag := 3; // venda de servi�os
   frmVendas.Showmodal;
end;

procedure TfrmPrincipal.actServicoAlineExecute(Sender: TObject);
begin
   if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   Begin
      CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
      Exit;
   End;
   FrmVendas := TfrmVendas.create(Self);
   frmvendas.Tag := 3; // venda de servi�os
   frmvendas.liCaixa := 2;
   frmVendas.Showmodal;
end;

procedure TfrmPrincipal.actServicosExecute(Sender: TObject);
begin
   //if not gsPerfilacesso.AcessoForm(TAction(Sender).Category,TAction(Sender).Caption,gbMaster) Then
   //Begin
   //   CaixaMensagem( 'Acesso restrito a senha ', ctAviso, [ cbOk ], 0 );
   //   Exit;
   //End;
   FrmVendas := TfrmVendas.create(Self);
   frmvendas.Tag := 3; // venda de servi�os
   frmVendas.Showmodal;
end;

procedure TfrmPrincipal.actSimplesRemessaExecute(Sender: TObject);
begin
   frmRemessaParaVenda := TfrmRemessaParaVenda.Create(Self);
   frmRemessaParaVenda.showmodal
end;

end.
