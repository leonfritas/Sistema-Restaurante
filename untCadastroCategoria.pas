unit untCadastroCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TfrmCadastroCategoria = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    editNomeCategoria: TDBEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnInserir: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    srcCategoria: TDataSource;
    ADOCategoria: TADOStoredProc;
    ADOCategoriaidCategoria: TAutoIncField;
    ADOCategorianomeCategoria: TStringField;
    procedure srcCategoriaDataChange(Sender: TObject; Field: TField);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCategoria: TfrmCadastroCategoria;

implementation

{$R *.dfm}

procedure TfrmCadastroCategoria.btnCancelarClick(Sender: TObject);
begin
    ADOCategoria.Cancel;
end;

procedure TfrmCadastroCategoria.btnEditarClick(Sender: TObject);
begin
    ADOCategoria.Edit;
end;

procedure TfrmCadastroCategoria.btnExcluirClick(Sender: TObject);
begin
    ADOCategoria.Delete;
end;

procedure TfrmCadastroCategoria.btnInserirClick(Sender: TObject);
begin
  ADOCategoria.Insert;
end;

procedure TfrmCadastroCategoria.btnSalvarClick(Sender: TObject);
begin
    ADOCategoria.Post;
end;

procedure TfrmCadastroCategoria.FormShow(Sender: TObject);
begin
  ADOCategoria.Close;
  ADOCategoria.Parameters.ParamByName('@nomeCategoria').value := null;
  ADOCategoria.Open;
end;

procedure TfrmCadastroCategoria.srcCategoriaDataChange(Sender: TObject;
  Field: TField);
begin
  btnSalvar.Visible := (srcCategoria.State = dsEdit) or (srcCategoria.State = dsInsert);
  btnCancelar.Visible := (srcCategoria.State = dsEdit) or (srcCategoria.State = dsInsert);
  //
  btnInserir.Visible := not btnSalvar.Visible;
  btnEditar.Visible := not btnSalvar.Visible;
  btnExcluir.Visible := not btnSalvar.Visible;
end;

end.
