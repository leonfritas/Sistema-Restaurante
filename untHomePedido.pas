unit untHomePedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, System.UITypes;

type
  TfrmHomePedido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gridPedidoAtual: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnInserir: TButton;
    btnExcluir: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    ADOPedido: TADOStoredProc;
    srcPedido: TDataSource;
    ADOProduto: TADOStoredProc;
    ADOProdutoidProduto: TAutoIncField;
    ADOProdutonomeProduto: TStringField;
    ADOProdutoidCategoria: TIntegerField;
    ADOProdutoQuantidade: TIntegerField;
    ADOProdutonomeCategoria: TStringField;
    srcProduto: TDataSource;
    LCBProduto: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEditPreco: TDBEdit;
    dbEditQuantidade: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    chkValorCadastrado: TCheckBox;
    Label6: TLabel;
    ADOProdutopreco: TBCDField;
    editQuantidade: TEdit;
    editPreco: TEdit;
    Panel5: TPanel;
    Label7: TLabel;
    lblTotalPreco: TLabel;
    btnAtualizar: TButton;
    Label8: TLabel;
    btnSalvarPedido: TButton;
    ADOGrupoPedido: TADOStoredProc;
    ADOGrupoPedidoidGrupoPedido: TAutoIncField;
    ADOGrupoPedidonomeGrupoPedido: TStringField;
    ADOGrupoPedidodataEntrada: TDateTimeField;
    ADOGrupoPedidodataSaida: TDateTimeField;
    srcGrupoPedido: TDataSource;
    ADOPedidoidPedido: TAutoIncField;
    ADOPedidoidGrupoPedido: TIntegerField;
    ADOPedidoidProduto: TIntegerField;
    ADOPedidoquantidade: TIntegerField;
    ADOPedidopreco: TBCDField;
    ADOPedidonomeProduto: TStringField;
    ADOPedidonomeCategoria: TStringField;
    editNomePedido: TDBEdit;
    editDataPedido: TDBEdit;
    lblDataPedido: TLabel;
    ADOGrupoPedidovalorPedido: TBCDField;
    ADOFinanceiroMovimento: TADOStoredProc;
    srcFinanceiroMovimento: TDataSource;
    ADOFinanceiroMovimentoidFinanceiroGrupoPedido: TAutoIncField;
    ADOFinanceiroMovimentoidGrupoPedido: TIntegerField;
    ADOFinanceiroMovimentodataMovimento: TDateTimeField;
    ADOFinanceiroMovimentodataPagamento: TDateTimeField;
    ADOFinanceiroMovimentoativoBaixa: TBooleanField;
    ADOFinanceiroMovimentovalorMovimento: TBCDField;
    LCBMesa: TDBLookupComboBox;
    Label2: TLabel;
    ADOMesa: TADOStoredProc;
    srcMesa: TDataSource;
    ADOGrupoPedidoidMesa: TIntegerField;
    ADOMesaidMesa: TAutoIncField;
    ADOMesanomeMesa: TStringField;
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure srcPedidoDataChange(Sender: TObject; Field: TField);
    procedure btnSalvarClick(Sender: TObject);
    procedure chkValorCadastradoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure calcularTotal;
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     totalPreco: Currency;
     nomePedido: String;
     novoPedido: Boolean;
     valorPedido: Currency;
  end;

var
  frmHomePedido: TfrmHomePedido;

implementation

{$R *.dfm}

procedure TfrmHomePedido.FormShow(Sender: TObject);
begin
   calcularTotal;
   //
   chkValorCadastrado.Checked := True
end;

procedure TfrmHomePedido.calcularTotal;
begin
  ADOPedido.First;
  //
  totalPreco := 0;
  //
  while not ADOPedido.Eof do
  begin
    totalPreco := totalPreco + ADOPedido.FieldByName('preco').AsCurrency;
    ADOPedido.Next;
  end;
  lblTotalPreco.Caption := CurrToStr(totalPreco);
end;

procedure TfrmHomePedido.btnAtualizarClick(Sender: TObject);
begin
   FormShow(nil);
end;

procedure TfrmHomePedido.btnCancelarClick(Sender: TObject);
begin
  ADOPedido.Cancel;
end;

procedure TfrmHomePedido.btnExcluirClick(Sender: TObject);
begin
  case MessageDlg('Deseja excluir registro do Pedido?', mtConfirmation, [mbOK, mbCancel], 0) of
  mrOk:
    begin
      try
        ADOPedido.Delete;
        //
        ShowMessage('Registro exclu�do do com sucesso');
      except
        on E: Exception do
        begin
          ShowMessage('Erro: ' + E.Message );
          Close;
        end;
      end;
    end;
  mrCancel:
    begin

    end;
  end;
  //
  calcularTotal;
end;

procedure TfrmHomePedido.btnInserirClick(Sender: TObject);
begin
    chkValorCadastrado.Checked := True;
    //
    ADOPedido.Insert;
    //
    ADOProduto.Close;
    ADOProduto.Parameters.ParamByName('@nomeProduto').Value := null ;
    ADOProduto.Open;
    //
    ADOMesa.Close;
    ADOMesa.Parameters.ParamByName('@nomeMesa').Value := null ;
    ADOMesa.Open;
    //
    LCBProduto.KeyValue := ADOProduto.FieldByName('idProduto').asInteger;
    LCBMesa.KeyValue := ADOMesa.FieldByName('idMesa').asInteger;
end;

procedure TfrmHomePedido.btnSalvarClick(Sender: TObject);
begin
  if editPreco.Visible and (editPreco.Text = '') then
  begin
    showmessage('� necess�rio informar o pre�o do produto.');
    Exit;
  end;
  //
  if editQuantidade.Visible and (editQuantidade.Text = '') then
  begin
    showmessage('� necess�rio informar a quantidade do produto.');
    Exit;
  end;
  //
  try
    if chkValorCadastrado.Checked then
    begin
      ADOPedido.FieldByName('preco').AsInteger := ADOProduto.FieldByName('preco').AsInteger;
      ADOPedido.FieldByName('quantidade').AsInteger := ADOProduto.FieldByName('quantidade').AsInteger;
    end
    else
    begin
      ADOPedido.FieldByName('preco').Value := StrToCurr(editPreco.Text);
      ADOPedido.FieldByName('quantidade').Value := StrToInt(editQuantidade.Text);
    end;
    //
    ADOPedido.FieldByName('idProduto').AsInteger := ADOProduto.FieldByName('idProduto').AsInteger;
    ADOPedido.FieldByName('idGrupoPedido').AsInteger := ADOGrupoPedido.FieldByName('idGrupoPedido').AsInteger;
    //
    ADOPedido.Post;
    ADOPedido.Close;
    ADOPedido.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message );
     Close;
    end;
  end;
  //
  calcularTotal;
end;

procedure TfrmHomePedido.btnSalvarPedidoClick(Sender: TObject);
begin
  if editNomePedido.Text <> '' then
  begin
    valorPedido := 0;
    //
    ADOPedido.First;
    //
    while not ADOPedido.eof do
    begin
      valorPedido := valorPedido + ADOPedido.FieldByName('preco').AsCurrency;
      ADOPedido.Next;
    end;
    //
    ADOGrupoPedido.FieldByName('idMesa').AsCurrency := LCBMesa.KeyValue;
    ADOGrupoPedido.FieldByName('valorPedido').AsCurrency := valorPedido;
    ADOGrupoPedido.Post;
    //
    ADOPedido.First;
    //
    while not ADOPedido.eof do
    begin
      ADOPedido.Edit;
      ADOPedido.FieldByName('idGrupoPedido').AsInteger := ADOGrupoPedido.FieldByName('idGrupoPedido').AsInteger;
      ADOPedido.Post;
      ADOPedido.Next;
    end;
    //
    if novoPedido then
    begin
      ADOFinanceiroMovimento.Open;
      ADOFinanceiroMovimento.Insert;
      ADOFinanceiroMovimento.FieldByName('idGrupoPedido').AsInteger := ADOGrupoPedido.FieldByName('idGrupoPedido').AsInteger;
      ADOFinanceiroMovimento.FieldByName('dataMovimento').Value :=   FormatDateTime('dd/mm/yyyy', Date());
      if valorPedido = null then
      begin
        ADOFinanceiroMovimento.FieldByName('valorMovimento').Value := 0;
      end
      else ADOFinanceiroMovimento.FieldByName('valorMovimento').Value := valorPedido;
      //
      ADOFinanceiroMovimento.Post;
    end;
    //
    Close;
  end
  else showmessage('Para salvar o pedido � necess�rio informar um nome.');
end;

procedure TfrmHomePedido.chkValorCadastradoClick(Sender: TObject);
begin
  if chkValorCadastrado.checked then
  begin
    dbEditQuantidade.Visible  := True;
    dbEditPreco.Visible       := True;
    //
    editQuantidade.Visible  := False;
    editPreco.Visible       := False;
  end
  else
  begin
    dbEditQuantidade.Visible  := False;
    dbEditPreco.Visible       := False;
    //
    editQuantidade.Visible  := True;
    editPreco.Visible       := True;
    editQuantidade.Text := '';
    editPreco.Text := '';
  end;
end;

procedure TfrmHomePedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ADOProduto.Close;
   ADOProduto.Parameters.ParamByName('@nomeProduto').CleanupInstance;
end;

procedure TfrmHomePedido.srcPedidoDataChange(Sender: TObject;
  Field: TField);
begin
  gridPedidoAtual.Enabled := ADOPedido.State = dsBrowse;
  //
  chkValorCadastrado.Visible := ADOPedido.State = dsInsert;
  //
  btnSalvar.Visible   := (srcPedido.State = dsEdit) or (srcPedido.State = dsInsert);
  btnCancelar.Visible := (srcPedido.State = dsEdit) or (srcPedido.State = dsInsert);
  //
  btnInserir.Visible := not btnSalvar.Visible;
  btnExcluir.Visible := not btnSalvar.Visible;
  btnSalvarPedido.Enabled := ADOPedido.RecordCount > 0;
end;

end.
