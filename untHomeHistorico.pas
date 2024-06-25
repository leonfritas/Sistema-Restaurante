unit untHomeHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.Buttons;

type
  TfrmHomeHistorico = class(TForm)
    Panel1: TPanel;
    DateTimePicker: TDateTimePicker;
    ADOGrupoPedidoHistorico: TADOStoredProc;
    ADOGrupoPedidoHistoricoidGrupoPedido: TAutoIncField;
    ADOGrupoPedidoHistoriconomeGrupoPedido: TStringField;
    ADOGrupoPedidoHistoricodataEntrada: TDateTimeField;
    ADOGrupoPedidoHistoricodataSaida: TDateTimeField;
    ADOGrupoPedidoHistoricovalorPedido: TBCDField;
    srcGrupoPedidoHistorico: TDataSource;
    DBGrid1: TDBGrid;
    ADOGrupoPedidoHistoricoativoBaixa: TBooleanField;
    SBLocalizar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SBLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHomeHistorico: TfrmHomeHistorico;

implementation

{$R *.dfm}

procedure TfrmHomeHistorico.FormCreate(Sender: TObject);
begin
  DateTimePicker.Date := Date();
end;

procedure TfrmHomeHistorico.SBLocalizarClick(Sender: TObject);
begin
  frmHomeHistorico.ADOGrupoPedidoHistorico.Close;
  frmHomeHistorico.ADOGrupoPedidoHistorico.Parameters.ParamByName('@dataEntrada').Value := DateToStr(DateTimePicker.Date);
  frmHomeHistorico.ADOGrupoPedidoHistorico.Parameters.ParamByName('@idGrupoPedido').value := null;
  frmHomeHistorico.ADOGrupoPedidoHistorico.Open;
end;

end.
