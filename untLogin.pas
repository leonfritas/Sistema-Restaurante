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
    srcFuncionarioVerificar: TDataSource;
    editUsuario: TEdit;
    editSenha: TEdit;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    ADOQuery1: TADOQuery;
    ADOFuncionarioVerificar: TADOStoredProc;
    ADOQuery1nomeFuncionario: TStringField;
    ADOQuery1ativoFuncionario: TLargeintField;
    ADOQuery1ativoAdm: TLargeintField;
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

uses DMChicoConexao, untHome;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin

  ADOQuery1.Close;
  ADOQuery1.Parameters.ParamByName('nomeUsuario').Value  := editUsuario.Text;
  ADOQuery1.Parameters.ParamByName('nomeSenha').Value  := editUsuario.Text;
  ADOQuery1.Open;
//  ADOQuery1.Close;
//  ADOQuery1.Parameters.ParamByName('nomeUsuario').Value  := editUsuario.Text;
//  ADOQuery1.Parameters.ParamByName('nomeSenha').Value    := editSenha.Text;
//
//  ADOQuery1.Open;

  showmessage('1');

  //
//  if ADOFuncionarioVerificar.FieldByName('acessoLiberado').AsBoolean then
//  begin
//  frmHome := TfrmHome.Create(Self);
//  frmHome.ativoAdministrador := ADOFuncionarioVerificar.FieldByName('administrador').AsBoolean;
//  //
//  frmHome.Show;
//  end
//  else
//  begin
//    showmessage('Usuário ou senha inválidos.');
//    editSenha.Text := '';
//  end;
end;

procedure TfrmLogin.editSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then SpeedButton1Click(nil);
end;

procedure TfrmLogin.SpeedButton1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Parameters.ParamByName('nomeUsuario').Value  := editUsuario.Text;
  ADOQuery1.Parameters.ParamByName('nomeSenha').Value  := editUsuario.Text;
  showmessage(ADOQuery1.Parameters.ParamByName('nomeUsuario').Value);
  ADOQuery1.Open;


  showmessage(ADOQuery1.FieldByName('ativoFuncionario').Value);

  //
  if ADOQuery1.FieldByName('ativoFuncionario').Value = True then
  begin
    frmHome := TfrmHome.Create(Self);
    frmHome.ativoAdministrador := ADOQuery1.FieldByName('ativoAdm').Value;
    //
    frmHome.Show;
  end
  else
  begin
    showmessage('Usuário ou senha inválidos.');
    editSenha.Text := '';
  end;
end;

end.
