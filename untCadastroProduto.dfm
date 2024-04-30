object frmCadastroProduto: TfrmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'frmCadastroProduto'
  ClientHeight = 527
  ClientWidth = 731
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
    Width = 731
    Height = 527
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 727
    ExplicitHeight = 526
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 729
      Height = 40
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 725
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 41
      Width = 729
      Height = 356
      Align = alClient
      DataSource = srcProduto
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'idProduto'
          Title.Caption = 'Id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomeProduto'
          Title.Caption = 'Produto'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomeCategoria'
          Title.Caption = 'Categoria'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 397
      Width = 729
      Height = 129
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 396
      ExplicitWidth = 725
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 43
        Height = 15
        Caption = 'Produto'
      end
      object Label2: TLabel
        Left = 252
        Top = 6
        Width = 62
        Height = 15
        Caption = 'Quantidade'
      end
      object Label3: TLabel
        Left = 473
        Top = 3
        Width = 51
        Height = 15
        Caption = 'Categoria'
      end
      object Label4: TLabel
        Left = 390
        Top = 6
        Width = 30
        Height = 15
        Caption = 'Pre'#231'o'
      end
      object Label6: TLabel
        Left = 369
        Top = 27
        Width = 15
        Height = 15
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editNomeProduto: TDBEdit
        Left = 8
        Top = 24
        Width = 237
        Height = 23
        DataField = 'nomeProduto'
        DataSource = srcProduto
        TabOrder = 0
      end
      object editQuantProduto: TDBEdit
        Left = 252
        Top = 24
        Width = 111
        Height = 23
        DataField = 'Quantidade'
        DataSource = srcProduto
        TabOrder = 1
      end
      object LCBCategoria: TDBLookupComboBox
        Left = 473
        Top = 24
        Width = 248
        Height = 23
        DataField = 'idCategoria'
        DataSource = srcProduto
        KeyField = 'idCategoria'
        ListField = 'nomeCategoria'
        ListSource = srcCategoria
        TabOrder = 2
      end
      object btnSalvar: TButton
        Left = 565
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Salvar'
        TabOrder = 3
        OnClick = btnSalvarClick
      end
      object btnCancelar: TButton
        Left = 646
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Cancelar'
        TabOrder = 4
        OnClick = btnCancelarClick
      end
      object btnInserir: TButton
        Left = 8
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Inserir'
        TabOrder = 5
        OnClick = btnInserirClick
      end
      object btnExcluir: TButton
        Left = 89
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Excluir'
        TabOrder = 6
        OnClick = btnExcluirClick
      end
      object btnEditar: TButton
        Left = 170
        Top = 68
        Width = 75
        Height = 49
        Caption = 'Editar'
        TabOrder = 7
        OnClick = btnEditarClick
      end
      object DBEdit1: TDBEdit
        Left = 390
        Top = 24
        Width = 77
        Height = 23
        DataField = 'preco'
        DataSource = srcProduto
        TabOrder = 8
      end
    end
  end
  object ADOProduto: TADOStoredProc
    Connection = DataModule1.ADOConexao
    CursorType = ctStatic
    ProcedureName = 'sp_Produto;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@nomeProduto'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = '0'
      end>
    Left = 8
    Top = 112
    object ADOProdutoidProduto: TAutoIncField
      FieldName = 'idProduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object ADOProdutonomeProduto: TStringField
      FieldName = 'nomeProduto'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object ADOProdutoidCategoria: TIntegerField
      FieldName = 'idCategoria'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ADOProdutoQuantidade: TIntegerField
      FieldName = 'Quantidade'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ADOProdutonomeCategoria: TStringField
      FieldName = 'nomeCategoria'
      ProviderFlags = []
      Size = 100
    end
    object ADOProdutopreco: TBCDField
      FieldName = 'preco'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 19
    end
  end
  object srcProduto: TDataSource
    DataSet = ADOProduto
    OnDataChange = srcProdutoDataChange
    Left = 40
    Top = 112
  end
  object ADOCategoria: TADOStoredProc
    Connection = DataModule1.ADOConexao
    CursorType = ctStatic
    ProcedureName = 'sp_Categoria;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@nomeCategoria'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = '0'
      end>
    Prepared = True
    Left = 32
    Top = 176
    object ADOCategoriaidCategoria: TAutoIncField
      FieldName = 'idCategoria'
      ReadOnly = True
    end
    object ADOCategorianomeCategoria: TStringField
      FieldName = 'nomeCategoria'
      Size = 100
    end
  end
  object srcCategoria: TDataSource
    DataSet = ADOCategoria
    Left = 32
    Top = 232
  end
end
