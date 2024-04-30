unit untCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Win.ADODB;

type
  TfrmCadastroProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    editNomeProduto: TDBEdit;
    Label1: TLabel;
    editQuantProduto: TDBEdit;
    Label2: TLabel;
    LCBCategoria: TDBLookupComboBox;
    Label3: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnInserir: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    ADOProduto: TADOStoredProc;
    ADOProdutoidProduto: TAutoIncField;
    ADOProdutonomeProduto: TStringField;
    ADOProdutoidCategoria: TIntegerField;
    srcProduto: TDataSource;
    ADOProdutoQuantidade: TIntegerField;
    ADOProdutonomeCategoria: TStringField;
    ADOCategoria: TADOStoredProc;
    srcCategoria: TDataSource;
    ADOCategoriaidCategoria: TAutoIncField;
    ADOCategorianomeCategoria: TStringField;
    ADOProdutopreco: TBCDField;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure srcProdutoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

uses DMChicoConexao;

procedure TfrmCadastroProduto.btnCancelarClick(Sender: TObject);
begin
  ADOProduto.Cancel;
end;

procedure TfrmCadastroProduto.btnEditarClick(Sender: TObject);
begin
  ADOProduto.Edit;
end;

procedure TfrmCadastroProduto.btnExcluirClick(Sender: TObject);
begin
  TADOStoredProc(srcProduto.DataSet).Delete;
end;

procedure TfrmCadastroProduto.btnInserirClick(Sender: TObject);
begin
  ADOProduto.Insert;
end;

procedure TfrmCadastroProduto.btnSalvarClick(Sender: TObject);
begin
  ADOProduto.Post;
  //
  ADOProduto.Close;
  ADOProduto.Open;
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  ADOCategoria.Close;
  ADOCategoria.Parameters.ParamByName('@nomeCategoria').value := null;
  ADOCategoria.Open;
  //
  ADOProduto.Close;
  ADOProduto.Parameters.ParamByName('@nomeProduto').Value := null ;
  ADOProduto.Open;

end;

procedure TfrmCadastroProduto.srcProdutoDataChange(Sender: TObject;
  Field: TField);
begin
  btnSalvar.Visible := (srcProduto.State = dsEdit) or (srcProduto.State = dsInsert);
  btnCancelar.Visible := (srcProduto.State = dsEdit) or (srcProduto.State = dsInsert);
  //
  btnInserir.Visible := not btnSalvar.Visible;
  btnEditar.Visible := not btnSalvar.Visible;
  btnExcluir.Visible := not btnSalvar.Visible;
end;

end.
