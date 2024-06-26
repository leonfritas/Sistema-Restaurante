unit untHomeCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmHomeCadastro = class(TForm)
    Produtos: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure ProdutosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ativoAdministrador: Boolean;
  end;

var
  frmHomeCadastro: TfrmHomeCadastro;

implementation

{$R *.dfm}

uses untCadastroProduto, untCadastroCategoria, untCadastroMesa, untCadastroFuncionario;

procedure TfrmHomeCadastro.Button1Click(Sender: TObject);
begin
  frmCadastroCategoria := TfrmCadastroCategoria.Create(Self);


  frmCadastroCategoria.Show;
end;

procedure TfrmHomeCadastro.Button2Click(Sender: TObject);
begin
  frmCadastroMesa := TfrmCadastroMesa.Create(Self);


  frmCadastroMesa.Show;
end;

procedure TfrmHomeCadastro.Button3Click(Sender: TObject);
begin
  if ativoAdministrador then
  begin
    frmCadastroFuncionario := TfrmCadastroFuncionario.Create(Self);
    //
    frmCadastroFuncionario.ADOFuncionario.Close;
    frmCadastroFuncionario.ADOFuncionario.Parameters.ParamByName('@nomeFuncionario').Value := null;
    frmCadastroFuncionario.ADOFuncionario.Parameters.ParamByName('@idFuncionario').Value := null;
    frmCadastroFuncionario.ADOFuncionario.Open;
    //
    frmCadastroFuncionario.Show;
  end
  else
  showmessage('Seu usu�rio n�o tem permiss�o para cadastrar funcion�rios.');
end;

procedure TfrmHomeCadastro.ProdutosClick(Sender: TObject);
begin
  frmCadastroProduto := TfrmCadastroProduto.Create(Self);


  frmCadastroProduto.Show;
end;

end.
