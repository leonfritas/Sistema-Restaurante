unit untCadastroMesa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TfrmCadastroMesa = class(TForm)
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
    srcMesa: TDataSource;
    ADOMesa: TADOStoredProc;
    ADOMesaidMesa: TAutoIncField;
    ADOMesanomeMesa: TStringField;
    procedure srcMesaDataChange(Sender: TObject; Field: TField);
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
  frmCadastroMesa: TfrmCadastroMesa;

implementation

{$R *.dfm}

procedure TfrmCadastroMesa.btnCancelarClick(Sender: TObject);
begin
    ADOMesa.Cancel;
end;

procedure TfrmCadastroMesa.btnEditarClick(Sender: TObject);
begin
    ADOMesa.Edit;
end;

procedure TfrmCadastroMesa.btnExcluirClick(Sender: TObject);
begin
    ADOMesa.Delete;
end;

procedure TfrmCadastroMesa.btnInserirClick(Sender: TObject);
begin
  ADOMesa.Insert;
end;

procedure TfrmCadastroMesa.btnSalvarClick(Sender: TObject);
begin
    ADOMesa.Post;
end;

procedure TfrmCadastroMesa.FormShow(Sender: TObject);
begin
  ADOMesa.Close;
  ADOMesa.Parameters.ParamByName('@nomeMesa').value := null;
  ADOMesa.Open;
end;

procedure TfrmCadastroMesa.srcMesaDataChange(Sender: TObject;
  Field: TField);
begin
  btnSalvar.Visible := (srcMesa.State = dsEdit) or (srcMesa.State = dsInsert);
  btnCancelar.Visible := (srcMesa.State = dsEdit) or (srcMesa.State = dsInsert);
  //
  btnInserir.Visible := not btnSalvar.Visible;
  btnEditar.Visible := not btnSalvar.Visible;
  btnExcluir.Visible := not btnSalvar.Visible;
end;

end.
