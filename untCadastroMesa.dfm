object frmCadastroMesa: TfrmCadastroMesa
  Left = 0
  Top = 0
  Caption = 'frmCadastroMesa'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 433
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 626
      Height = 40
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 620
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 41
      Width = 626
      Height = 271
      Align = alClient
      DataSource = srcMesa
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'idMesa'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomeMesa'
          Title.Caption = 'Mesa'
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 312
      Width = 626
      Height = 129
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 303
      ExplicitWidth = 620
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 51
        Height = 15
        Caption = 'Categoria'
      end
      object editNomeCategoria: TDBEdit
        Left = 8
        Top = 24
        Width = 237
        Height = 23
        DataField = 'nomeMesa'
        DataSource = srcMesa
        TabOrder = 0
      end
      object btnSalvar: TButton
        Left = 461
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = btnSalvarClick
      end
      object btnCancelar: TButton
        Left = 542
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarClick
      end
      object btnInserir: TButton
        Left = 8
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Inserir'
        TabOrder = 3
        OnClick = btnInserirClick
      end
      object btnExcluir: TButton
        Left = 89
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = btnExcluirClick
      end
      object btnEditar: TButton
        Left = 170
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Editar'
        TabOrder = 5
        OnClick = btnEditarClick
      end
    end
  end
  object srcMesa: TDataSource
    DataSet = ADOMesa
    OnDataChange = srcMesaDataChange
    Left = 40
    Top = 224
  end
  object ADOMesa: TADOStoredProc
    Connection = DataModule1.ADOConexao
    CursorType = ctStatic
    ProcedureName = 'sp_Mesa_Selecionar;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@nomeMesa'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = '0'
      end>
    Left = 8
    Top = 224
    object ADOMesaidMesa: TAutoIncField
      FieldName = 'idMesa'
      ReadOnly = True
    end
    object ADOMesanomeMesa: TStringField
      FieldName = 'nomeMesa'
      Size = 10
    end
  end
end