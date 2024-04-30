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
  untHomeFinanceiro in 'untHomeFinanceiro.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmHome, frmHome);
//  Application.CreateForm(TfrmHomePedido, frmHomePedido);
//  Application.CreateForm(TfrmHomeGrupoPedido, frmHomeGrupoPedido);
//  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
