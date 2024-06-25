program Chico;

uses
  Vcl.Forms,
  untCadastroProduto in 'untCadastroProduto.pas' {frmCadastroProduto},
  DMChicoConexao in 'DMChicoConexao.pas' {DataModule1: TDataModule},
  untHome in 'untHome.pas' {frmHome},
  untHomeCadastro in 'untHomeCadastro.pas' {frmHomeCadastro},
  untCadastroCategoria in 'untCadastroCategoria.pas' {frmCadastroCategoria},
  untHomePedido in 'untHomePedido.pas' {frmHomeEstoque},
  untHomeGrupoPedido in 'untHomeGrupoPedido.pas' {frmHomeGrupoPedido},
  untHomeFinanceiro in 'untHomeFinanceiro.pas' {frmHomeFinanceiro},
  untHomeHistorico in 'untHomeHistorico.pas' {frmHomeHistorico},
  untCadastroMesa in 'untCadastroMesa.pas' {frmCadastroMesa},
  untLogin in 'untLogin.pas' {frmLogin},
  untCadastroFuncionario in 'untCadastroFuncionario.pas' {frmCadastroFuncionario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
