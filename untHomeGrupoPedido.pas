unit untHomeGrupoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.Win.ADODB, Vcl.ExtCtrls;

type
  TfrmHomeGrupoPedido = class(TForm)
    gridGrupoPedido: TDBGrid;
    btnNovoPedido: TButton;
    ADOGrupoPedido: TADOStoredProc;
    srcGrupoPedido: TDataSource;
    Button1: TButton;
    ADOGrupoPedidoidGrupoPedido: TAutoIncField;
    ADOGrupoPedidonomeGrupoPedido: TStringField;
    ADOGrupoPedidodataEntrada: TDateTimeField;
    ADOGrupoPedidodataSaida: TDateTimeField;
    btnAtualizarGrupoPedido: TButton;
    btnEditarPedido: TButton;
    DBGrid1: TDBGrid;
    ADOGrupoPedidovalorPedido: TBCDField;
    ADOGrupoPedidobaixaPedido: TBooleanField;
    ADOGrupoPedidoRealizado: TADOStoredProc;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    BCDField1: TBCDField;
    BooleanField1: TBooleanField;
    srcGrupoPedidoRealizado: TDataSource;
    Timer1: TTimer;
    btnCancelar: TButton;
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure btnAtualizarGrupoPedidoClick(Sender: TObject);
    procedure btnEditarPedidoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmHomeGrupoPedido: TfrmHomeGrupoPedido;

implementation

{$R *.dfm}

uses untHomePedido;

procedure TfrmHomeGrupoPedido.btnAtualizarGrupoPedidoClick(Sender: TObject);
begin
  ADOGrupoPedido.Close;
  ADOGrupoPedido.Parameters.ParamByName('@dataEntrada').value := FormatDateTime('dd/mm/yyyy', Date());
  ADOGrupoPedido.Open;
  //
  ADOGrupoPedidoRealizado.Close;
  ADOGrupoPedidoRealizado.Parameters.ParamByName('@dataEntrada').value := FormatDateTime('dd/mm/yyyy', Date());
  ADOGrupoPedidoRealizado.Open;
end;

procedure TfrmHomeGrupoPedido.btnCancelarClick(Sender: TObject);
begin
  ADOGrupoPedido.Delete;
end;

procedure TfrmHomeGrupoPedido.btnEditarPedidoClick(Sender: TObject);
begin
  if ADOGrupoPedido.RecordCount > 0 then
  begin
    frmHomePedido := TfrmHomePedido.Create(Self);
    //
    frmHomePedido.ADOPedido.Close;
    frmHomePedido.ADOPedido.Parameters.ParamByName('@idGrupoPedido').Value := ADOGrupoPedido.FieldByName('idGrupoPedido').AsInteger;
    frmHomePedido.ADOPedido.Open;
    //
    frmHomePedido.ADOGrupoPedido.Close;
    frmHomePedido.ADOGrupoPedido.Parameters.ParamByName('@idGrupoPedido').Value := ADOGrupoPedido.FieldByName('idGrupoPedido').Value;
    frmHomePedido.ADOGrupoPedido.Parameters.ParamByName('@dataEntrada').value := null;
    frmHomePedido.ADOGrupoPedido.Open;
    frmHomePedido.ADOGrupoPedido.Edit;
    //
    frmHomePedido.Show;
  end;
end;

procedure TfrmHomeGrupoPedido.btnNovoPedidoClick(Sender: TObject);
begin
  frmHomePedido := TfrmHomePedido.Create(Self);
  //
  frmHomePedido.ADOPedido.Close;
  frmHomePedido.ADOPedido.Parameters.ParamByName('@idGrupoPedido').Value := 0;
  frmHomePedido.ADOPedido.Open;
  //
  frmHomePedido.ADOGrupoPedido.Open;
  frmHomePedido.ADOGrupoPedido.Insert;
  frmHomePedido.ADOGrupoPedido.FieldByname('dataEntrada').Value := FormatDateTime('dd/mm/yy hh:nn:ss', Now);
  //
  frmHomePedido.Show;
end;

procedure TfrmHomeGrupoPedido.Button1Click(Sender: TObject);
begin

  ADOGrupoPedido.Edit;
  ADOGrupoPedido.FieldByName('dataSaida').Value := FormatDateTime('dd/mm/yy hh:nn:ss', Now);
  ADOGrupoPedido.Post;
  //
  btnAtualizarGrupoPedidoClick(nil);
end;

procedure TfrmHomeGrupoPedido.Timer1Timer(Sender: TObject);
begin
  btnAtualizarGrupoPedidoClick(nil);
end;

end.



