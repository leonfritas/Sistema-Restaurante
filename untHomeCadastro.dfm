object frmHomeCadastro: TfrmHomeCadastro
  Left = 0
  Top = 0
  Caption = 'frmHomeCadastro'
  ClientHeight = 441
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Produtos: TButton
    Left = 16
    Top = 24
    Width = 97
    Height = 81
    Caption = 'Produtos'
    TabOrder = 0
    OnClick = ProdutosClick
  end
  object Button1: TButton
    Left = 128
    Top = 24
    Width = 97
    Height = 81
    Caption = 'Categorias'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 24
    Width = 97
    Height = 81
    Caption = 'Mesa'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 352
    Top = 24
    Width = 97
    Height = 81
    Caption = 'Funcion'#225'rio'
    TabOrder = 3
    OnClick = Button3Click
  end
end
