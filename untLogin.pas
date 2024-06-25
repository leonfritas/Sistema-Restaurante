unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Data.Win.ADODB, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    btnEntrar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    ADOFuncionarioLogar: TADOStoredProc;
    srcGrupoPedidoRealizado: TDataSource;
    editUsuario: TEdit;
    editSenha: TEdit;
    ADOFuncionarioLogaracessoLiberado: TBooleanField;
    ADOFuncionarioLogaradministrador: TBooleanField;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    procedure btnEntrarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure editSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses untHome;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  ADOFuncionarioLogar.Close;
  ADOFuncionarioLogar.Parameters.ParamByName('@nomeUsuario').Value  := editUsuario.Text;
  ADOFuncionarioLogar.Parameters.ParamByName('@nomeSenha').Value    := editSenha.Text;
  ADOFuncionarioLogar.Open;
  //
  if ADOFuncionarioLogar.FieldByName('acessoLiberado').AsBoolean then
  begin
  frmHome := TfrmHome.Create(Self);
  frmHome.ativoAdministrador := ADOFuncionarioLogar.FieldByName('administrador').AsBoolean;
  //
  frmHome.Show;
  end
  else
  begin
    showmessage('Usu�rio ou senha inv�lidos.');
    editSenha.Text := '';
  end;
end;

procedure TfrmLogin.editSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then SpeedButton1Click(nil);
end;

procedure TfrmLogin.SpeedButton1Click(Sender: TObject);
begin
  ADOFuncionarioLogar.Close;
  ADOFuncionarioLogar.Parameters.ParamByName('@nomeUsuario').Value  := editUsuario.Text;
  ADOFuncionarioLogar.Parameters.ParamByName('@nomeSenha').Value    := editSenha.Text;
  ADOFuncionarioLogar.Open;
  //
  if ADOFuncionarioLogar.FieldByName('acessoLiberado').AsBoolean then
  begin
    frmHome := TfrmHome.Create(Self);
    frmHome.ativoAdministrador := ADOFuncionarioLogar.FieldByName('administrador').AsBoolean;
    //
    frmHome.Show;
  end
  else
  begin
    showmessage('Usu�rio ou senha inv�lidos.');
    editSenha.Text := '';
  end;
end;

end.