unit untHomeCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmHomeCadastro = class(TForm)
    Produtos: TButton;
    Button1: TButton;
    procedure ProdutosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHomeCadastro: TfrmHomeCadastro;

implementation

{$R *.dfm}

uses untCadastroProduto, untCadastroCategoria;

procedure TfrmHomeCadastro.Button1Click(Sender: TObject);
begin
      frmCadastroCategoria := TfrmCadastroCategoria.Create(Self);


  frmCadastroCategoria.Show;
end;

procedure TfrmHomeCadastro.ProdutosClick(Sender: TObject);
begin
  frmCadastroProduto := TfrmCadastroProduto.Create(Self);


  frmCadastroProduto.Show;
end;

end.
