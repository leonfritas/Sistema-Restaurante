unit untHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TfrmHome = class(TForm)
    Panel1: TPanel;
    SBFinanceiro: TSpeedButton;
    SBHistorico: TSpeedButton;
    SBPedido: TSpeedButton;
    SBCadastro: TSpeedButton;
    Image1: TImage;
    procedure btnFinanceiroClick(Sender: TObject);
    procedure btnHistoricoClick(Sender: TObject);
    procedure SBFinanceiroClick(Sender: TObject);
    procedure SBHistoricoClick(Sender: TObject);
    procedure SBPedidoClick(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ativoAdministrador: Boolean;
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.dfm}

uses untHomeCadastro, untHomeGrupoPedido, untHomeFinanceiro, untHomeHistorico;

procedure TfrmHome.btnFinanceiroClick(Sender: TObject);
begin
  try
    frmHomeFinanceiro := TfrmHomeFinanceiro.Create(Self);
    frmHomeFinanceiro.ADOFinanceiroMovimentoPendente.Close;
    frmHomeFinanceiro.ADOFinanceiroMovimentoPendente.Parameters.ParamByName('@dataMovimento').Value := DateToStr(Date());
    frmHomeFinanceiro.ADOFinanceiroMovimentoPendente.Open;
    //
    frmHomeFinanceiro.ADOFinanceiroMovimentoRealizado.Close;
    frmHomeFinanceiro.ADOFinanceiroMovimentoRealizado.Parameters.ParamByName('@dataMovimento').Value := DateToStr(Date());
    frmHomeFinanceiro.ADOFinanceiroMovimentoRealizado.Open;
  finally
    frmHomeFinanceiro.Show;
  end;
end;

procedure TfrmHome.btnHistoricoClick(Sender: TObject);
begin
  try
    frmHomeHistorico := TfrmHomeHistorico.Create(Self);
    //
    frmHomeHistorico.ADOGrupoPedidoHistorico.Close;
    frmHomeHistorico.ADOGrupoPedidoHistorico.Parameters.ParamByName('@dataEntrada').Value := DateToStr(Date());
    frmHomeHistorico.ADOGrupoPedidoHistorico.Parameters.ParamByName('@idGrupoPedido').value := null;
    frmHomeHistorico.ADOGrupoPedidoHistorico.Open;
  finally
    frmHomeHistorico.Show;
  end;
end;

procedure TfrmHome.SBCadastroClick(Sender: TObject);
begin
  try
    frmHomeCadastro := TfrmHomeCadastro.Create(Self);
    frmHomeCadastro.ativoAdministrador := ativoAdministrador;
  finally
    frmHomeCadastro.Show;
  end;
end;

procedure TfrmHome.SBFinanceiroClick(Sender: TObject);
begin
  try
    frmHomeFinanceiro := TfrmHomeFinanceiro.Create(Self);
    frmHomeFinanceiro.ADOFinanceiroMovimentoPendente.Close;
    frmHomeFinanceiro.ADOFinanceiroMovimentoPendente.Parameters.ParamByName('@dataMovimento').Value := DateToStr(Date());
    frmHomeFinanceiro.ADOFinanceiroMovimentoPendente.Open;
    //
    frmHomeFinanceiro.ADOFinanceiroMovimentoRealizado.Close;
    frmHomeFinanceiro.ADOFinanceiroMovimentoRealizado.Parameters.ParamByName('@dataMovimento').Value := DateToStr(Date());
    frmHomeFinanceiro.ADOFinanceiroMovimentoRealizado.Open;
  finally
    frmHomeFinanceiro.Show;
  end;
end;

procedure TfrmHome.SBHistoricoClick(Sender: TObject);
begin
  try
    frmHomeHistorico := TfrmHomeHistorico.Create(Self);
    //
    frmHomeHistorico.ADOGrupoPedidoHistorico.Close;
    frmHomeHistorico.ADOGrupoPedidoHistorico.Parameters.ParamByName('@dataEntrada').Value := DateToStr(Date());
    frmHomeHistorico.ADOGrupoPedidoHistorico.Parameters.ParamByName('@idGrupoPedido').value := null;
    frmHomeHistorico.ADOGrupoPedidoHistorico.Open;
  finally
    frmHomeHistorico.Show;
  end;
end;

procedure TfrmHome.SBPedidoClick(Sender: TObject);
begin
  frmHomeGrupoPedido := TfrmHomeGrupoPedido.Create(Self);
  //
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
    frmHomeGrupoPedido.ADOGrupoPedidoRealizado.Open;
  end;
  //
  frmHomeGrupoPedido.Show;
end;

end.
