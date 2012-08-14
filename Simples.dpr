program Simples;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uMensagens in 'uMensagens.pas' {FrmMensagens},
  usequencias in 'usequencias.pas' {frmSequencias},
  uCadAtividades in 'uCadAtividades.pas' {frmCadAtividades},
  uParametros in 'uParametros.pas' {frmParametros},
  uCadProdutos in 'uCadProdutos.pas' {frmCadProdutos},
  uCadOperacoes in 'uCadOperacoes.pas' {frmCadOperacoes},
  uCadFormaPagamento in 'uCadFormaPagamento.pas' {frmCadFormaPagamento},
  uCtasReceber in 'uCtasReceber.pas' {frmCtasReceber},
  uConsVendas in 'uConsVendas.pas' {frmConsVendas},
  uBaixaNormal in 'uBaixaNormal.pas' {frmBaixaNormal},
  uVendeBrinde in 'uVendeBrinde.pas' {frmVendeBrinde},
  uMovCaixa in 'uMovCaixa.pas' {frmMovCaixa},
  uFechaCaixa in 'uFechaCaixa.pas' {frmFechaCaixa},
  uPrePagamento in 'uPrePagamento.pas' {frmPrePagamento},
  uCadFornecedores in 'uCadFornecedores.pas' {frmCadFornecedores},
  uCadClientes in 'uCadClientes.pas' {frmCadClientes},
  uEntradas in 'uEntradas.pas' {frmEntradas},
  uselrelvendasVendedor in 'uselrelvendasVendedor.pas' {frmselrelVendasVendedor},
  uLogin in 'uLogin.pas' {frmLogin},
  uselrelContaCorrenteEstoque in 'uselrelContaCorrenteEstoque.pas' {frmSelRelContaCorrenteEstoque},
  udevolucaoVenda in 'udevolucaoVenda.pas' {frmDevolucaoVenda},
  uBaixaTipo_01_Brinde in 'uBaixaTipo_01_Brinde.pas' {frmBaixaBrinde},
  uFechaDia in 'uFechaDia.pas' {frmFechaDia},
  uCtaspagar in 'uCtaspagar.pas' {frmCtasPagar},
  uControleRepasse in 'uControleRepasse.pas' {frmControleRepasse},
  uSelRelDevolucoes in 'uSelRelDevolucoes.pas' {frmSelRelDevolucoes},
  uAbreOS in 'uAbreOS.pas' {frmabreos},
  uConsultaOrdemServico in 'uConsultaOrdemServico.pas' {frmConsultaOrdemServico},
  ufechaOS in 'ufechaOS.pas' {frmFechaOs},
  uManutencaoOs in 'uManutencaoOs.pas' {frmManutencaoOs},
  uCadRotas in 'uCadRotas.pas' {frmCadRotas},
  uSelMotivoStatus in 'uSelMotivoStatus.pas' {frmMotivoStatus},
  uselRelContasReceber in 'uselRelContasReceber.pas' {frmSelRelContasReceber},
  uSelRelEntradas in 'uSelRelEntradas.pas' {frmselrelEntradas},
  uVendas in 'uVendas.pas' {frmVendas},
  uProposta in 'uProposta.pas' {frmProposta},
  uProdDescricaoComplementar in 'uProdDescricaoComplementar.pas' {frmProdDescricaoComplementar},
  uEstoqueManutencao in 'uEstoqueManutencao.pas' {frmEstoqueManutencao},
  uInventario in 'uInventario.pas' {frmInventario},
  ucadUsuarios in '..\Compartilhados\ucadUsuarios.pas' {frmCadUsuarios},
  uCadPerfil in '..\Compartilhados\uCadPerfil.pas' {frmCadPerfil},
  uFormBase in '..\Compartilhados\uFormBase.pas' {FormBase},
  uFuncoes in '..\Compartilhados\uFuncoes.pas',
  ufechames in 'ufechames.pas' {frmfechames},
  uCalMQuadrado in 'uCalMQuadrado.pas' {frmCalMQuadrado},
  uselrelvendas in 'uselrelvendas.pas' {frmSelRelVendas},
  uselRelEtiquetas in 'uselRelEtiquetas.pas' {frmSelRelEtiquetas},
  uCadFabricantes in 'uCadFabricantes.pas' {frmCadFabricantes},
  uCadGrupos in 'uCadGrupos.pas' {frmCadGrupos},
  uselrelClientes in 'uselrelClientes.pas' {frmSelRelClientes},
  uselrelRepasse in 'uselrelRepasse.pas' {frmselrelRepasse},
  uClassPerfil in '..\Compartilhados\uClassPerfil.pas',
  uClassConexao in '..\Compartilhados\uClassConexao.pas',
  uCadFuncionarios in 'uCadFuncionarios.pas' {frmCadFuncionarios},
  uConsItensDevolvidos in 'uConsItensDevolvidos.pas' {frmConsItensDevolvidos},
  ucadTipoVenda in 'ucadTipoVenda.pas' {frmCadtipoVenda},
  uModelo in 'uModelo.pas' {FrmModelo},
  uTipos in '..\compartilhados\uTipos.pas',
  uDaoPerfil in 'Dao\uDaoPerfil.pas',
  uDaoEstrutura in 'Dao\uDaoEstrutura.pas',
  uAmbienteSistema in '..\Compartilhados\uAmbienteSistema.pas',
  uselRelCurvaAbcProdutos in 'uselRelCurvaAbcProdutos.pas' {frmselRelCurvaAbcProdutos},
  uselrelCurvaAbcClientes in 'uselrelCurvaAbcClientes.pas' {frmselrelcurvaabcclientes},
  uselDatas in 'uselDatas.pas' {frmSelDatas},
  uRemessaParaVenda in 'uRemessaParaVenda.pas' {frmRemessaParaVenda},
  Remessa in 'Modelos\Remessa.pas',
  ItemRemessa in 'Modelos\ItemRemessa.pas',
  DaoRemessa in 'Dao\DaoRemessa.pas',
  Dao in 'Dao\Dao.pas',
  DaoSupervisor in 'Dao\DaoSupervisor.pas',
  uLancarComanda in 'uLancarComanda.pas' {frmLancaComanda},
  uConsultasSemSinalPago in 'uConsultasSemSinalPago.pas' {frmConsultaSemSinalPago},
  uclassContaCorrente in 'Modelos\uclassContaCorrente.pas',
  uClassDaoContaCorrente in 'Modelos\uClassDaoContaCorrente.pas',
  UnitDeclaracoes in 'Funcoes\UnitDeclaracoes.pas',
  uClassEstoque in 'Modelos\uClassEstoque.pas',
  uDaoVenda in 'Dao\uDaoVenda.pas',
  uClassVenda in 'Modelos\uClassVenda.pas',
  uClassCliente in 'Modelos\uClassCliente.pas',
  uClassFuncionario in 'Modelos\uClassFuncionario.pas',
  uDaoFuncionario in 'Dao\uDaoFuncionario.pas',
  uClassEmpresa in 'Modelos\uClassEmpresa.pas',
  uClassFormaPagamento in 'Modelos\uClassFormaPagamento.pas',
  uDaoCliente in 'Dao\uDaoCliente.pas',
  uDaoFormaPagamento in 'Dao\uDaoFormaPagamento.pas',
  uCadCaixas in 'uCadCaixas.pas' {frmCadCaixas},
  uCadSetores in 'uCadSetores.pas' {frmCadsetores},
  uDaoSaldo in 'Dao\uDaoSaldo.pas',
  uClassSaldo in 'Modelos\uClassSaldo.pas',
  uFuncoesMP4000 in 'uFuncoesMP4000.pas',
  uClassEndereco in 'Modelos\uClassEndereco.pas',
  uDaoItemVenda in 'Dao\uDaoItemVenda.pas',
  uClassItemVenda in 'Modelos\uClassItemVenda.pas',
  uDaoCaixaMovimento in 'Dao\uDaoCaixaMovimento.pas',
  uRelAnaliseFinanceira in 'uRelAnaliseFinanceira.pas' {frmRelAnaliseFinanceira},
  uClassCorrecao in 'Modelos\uClassCorrecao.pas',
  uDaoCorrecao in 'Dao\uDaoCorrecao.pas',
  uTransferenciaEntreSetores in 'uTransferenciaEntreSetores.pas' {frmTransferenciaDeSetores},
  uDescontoVenda in 'uDescontoVenda.pas' {FrmDescontoVenda},
  uConfigTabSheet in 'uConfigTabSheet.pas' {frmConfigTabSheet},
  uDaoClienteAnimal in 'Dao\uDaoClienteAnimal.pas',
  uCapturaImagem in '..\AutoEscola\uCapturaImagem.pas' {frmCapturaImagem},
  uClassAnimal in 'Modelos\uClassAnimal.pas',
  uClassEventoAnimal in 'Modelos\uClassEventoAnimal.pas',
  uDaoEventoAnimal in 'Dao\uDaoEventoAnimal.pas',
  uselAnimal in 'uselAnimal.pas' {frmSelAnimal},
  uDaoItemEntrada in 'Dao\uDaoItemEntrada.pas',
  uClassItemEntrada in 'Modelos\uClassItemEntrada.pas',
  uRelEstoque in 'uRelEstoque.pas' {FrmRelEstoque},
  uRomaneioDeCarga in 'uRomaneioDeCarga.pas' {frmRomaneioDeEntrega},
  uClassRomaneio in 'Modelos\uClassRomaneio.pas',
  uDaoRomaneio in 'Dao\uDaoRomaneio.pas',
  uControllerRomaneio in 'Controller\uControllerRomaneio.pas',
  uRecebimentoRomaneio in 'uRecebimentoRomaneio.pas' {frmRecebimentoRomaneio},
  uCadEmpresa in 'uCadEmpresa.pas' {frmcadEmpresa},
  uDaoEmpresa in 'Dao\uDaoEmpresa.pas',
  uRelCLientesVendedorBairro in 'uRelCLientesVendedorBairro.pas' {frmRelClientesVendedoresBairro},
  uRelTabelaPreco in 'uRelTabelaPreco.pas' {frmrelTabPreco},
  uClassCaixa in 'Modelos\uClassCaixa.pas',
  uDaoRota in 'Dao\uDaoRota.pas',
  uDaoCustoProduto in 'Dao\uDaoCustoProduto.pas',
  uClassCustoProduto in 'Modelos\uClassCustoProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Simples - Sistema Simples de Administração';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSelAnimal, frmSelAnimal);
  Application.CreateForm(TFrmRelEstoque, FrmRelEstoque);
  Application.CreateForm(TfrmRomaneioDeEntrega, frmRomaneioDeEntrega);
  Application.CreateForm(TfrmRecebimentoRomaneio, frmRecebimentoRomaneio);
  Application.CreateForm(TfrmcadEmpresa, frmcadEmpresa);
  Application.CreateForm(TfrmRelClientesVendedoresBairro, frmRelClientesVendedoresBairro);
  Application.CreateForm(TfrmrelTabPreco, frmrelTabPreco);
  Frmlogin.ShowModal;
  Application.Run;
end.
