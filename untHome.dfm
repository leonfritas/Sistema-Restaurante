object frmHome: TfrmHome
  Left = 0
  Top = 0
  Caption = 'frmHome'
  ClientHeight = 439
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 616
    Height = 439
    Align = alClient
    TabOrder = 0
    object btnCadastro: TButton
      Left = 38
      Top = 112
      Width = 147
      Height = 57
      Caption = 'Cadastro'
      TabOrder = 0
      OnClick = btnCadastroClick
    end
    object btnEstoque: TButton
      Left = 38
      Top = 40
      Width = 147
      Height = 57
      Caption = 'Pedidos'
      TabOrder = 1
      OnClick = btnEstoqueClick
    end
    object btnFinanceiro: TButton
      Left = 38
      Top = 184
      Width = 147
      Height = 57
      Caption = 'Financeiro'
      TabOrder = 2
      OnClick = btnCadastroClick
    end
  end
end
