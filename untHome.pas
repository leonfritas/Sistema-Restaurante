unit untHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmHome = class(TForm)
    Panel1: TPanel;
    btnCadastro: TButton;
    btnEstoque: TButton;
    btnFinanceiro: TButton;
    procedure btnCadastroClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.dfm}

uses untHomeCadastro, untHomeGrupoPedido;

procedure TfrmHome.btnCadastroClick(Sender: TObject);
begin
  try
    frmHomeCadastro := TfrmHomeCadastro.Create(Self);


  finally
    frmHomeCadastro.Show;
  end;
end;

procedure TfrmHome.btnEstoqueClick(Sender: TObject);
begin
  frmHomeGrupoPedido := TfrmHomeGrupoPedido.Create(Self);
  try
    frmHomeGrupoPedido.ADOGrupoPedido.Close;
    frmHomeGrupoPedido.ADOGrupoPedido.Parameters.ParamByName('@dataEntrada').Value := DateToStr(Date());
    frmHomeGrupoPedido.ADOGrupoPedido.Parameters.ParamByName('@idGrupoPedido').value := null;
  finally
    frmHomeGrupoPedido.ADOGrupoPedido.Open;
  end;
  //
  try
    frmHomeGrupoPedido.ADOGrupoPedidoRealizado.Close;
    frmHomeGrupoPedido.ADOGrupoPedidoRealizado.Parameters.ParamByName('@dataEntrada').Value := DateToStr(Date());
    frmHomeGrupoPedido.ADOGrupoPedidoRealizado.Parameters.ParamByName('@idGrupoPedido').value := null;
  finally
    frmHomeGrupoPedido.ADOGrupoPedido.Open;
  end;
  //
  frmHomeGrupoPedido.Show;
end;

end.
