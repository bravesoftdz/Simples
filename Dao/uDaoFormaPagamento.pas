unit uDaoFormaPagamento;

interface

uses uClassconexao,uClassFormaPagamento,
     Classes,DBClient,SysUtils;

type TDaoFormaPagamento = class
   private
     FConexao : TConexao;
   public
     Constructor Create( conexao : TConexao);
     function Buscar(idFormaPagamento : Integer) : TFormaPagamento;
     function BuscarTodos : TClientDataSet;
     function BuscarTodosAvista : TClientDataSet;
end;


implementation

{ TDaoCliente }

function TDaoFormaPagamento.Buscar(idFormaPagamento: Integer): TFormaPagamento;
var FormaPagamento : TFormaPagamento;
    Parametros : TStringList;
    Dados : TClientDataSet;
begin
  FormaPagamento := TFormaPagamento.Create;
  Parametros := TStringList.Create;
  Parametros.ADD(IntToStr(idFormaPagamento));
  Try
     Dados := FConexao.BuscarDadosSQL('Select * from T_FormasPagamento where Codigo=:parcodigo',Parametros);
     FormaPagamento.Id := Dados.FieldByName('Codigo').AsInteger;
     FormaPagamento.Descricao := Dados.FieldByName('Descricao').AsString;
     FormaPagamento.ImprimeMensagem := Dados.FieldByName('ImprimeMensagem').AsBoolean;
     Result := FormaPagamento;
  Finally
    FreeandNil(Dados);
    FreeandNil(Parametros);
  End;

end;

function TDaoFormaPagamento.BuscarTodos : TClientDataSet;
begin
   Result := FConexao.BuscarDadosSQL('Select * from T_FormasPagamento order by Descricao', Nil);
end;

function TDaoFormaPagamento.BuscarTodosAvista: TClientDataSet;
begin
   Result := FConexao.BuscarDadosSQL('Select * from T_FormasPagamento where TipoPagamento=0 order by Descricao', Nil);
end;

constructor TDaoFormaPagamento.Create(conexao: TConexao);
begin
  Fconexao := conexao;
end;

end.
