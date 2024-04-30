object frmHomePedido: TfrmHomePedido
  Left = 0
  Top = 0
  Caption = 'frmHomePedido'
  ClientHeight = 642
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Label7: TLabel
    Left = 432
    Top = 336
    Width = 34
    Height = 15
    Caption = 'Label7'
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 889
    Height = 642
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 885
    ExplicitHeight = 641
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 887
      Height = 48
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 883
      object Label8: TLabel
        Left = 13
        Top = 12
        Width = 93
        Height = 15
        Caption = 'Nome do Pedido:'
      end
      object lblDataPedido: TLabel
        Left = 449
        Top = 12
        Width = 93
        Height = 15
        Caption = 'Nome do Pedido:'
      end
      object btnSalvarPedido: TButton
        Left = 722
        Top = 6
        Width = 156
        Height = 36
        Caption = 'Salvar Pedido'
        TabOrder = 0
        OnClick = btnSalvarPedidoClick
      end
      object editNomePedido: TDBEdit
        Left = 129
        Top = 9
        Width = 270
        Height = 23
        DataField = 'nomeGrupoPedido'
        DataSource = srcGrupoPedido
        TabOrder = 1
      end
      object editDataPedido: TDBEdit
        Left = 569
        Top = 9
        Width = 120
        Height = 23
        DataField = 'dataEntrada'
        DataSource = srcGrupoPedido
        TabOrder = 2
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 49
      Width = 887
      Height = 592
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 883
      ExplicitHeight = 591
      object TabSheet1: TTabSheet
        Caption = 'Pedidos'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 879
          Height = 562
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 875
          ExplicitHeight = 561
          object gridPedidoAtual: TDBGrid
            Left = 1
            Top = 1
            Width = 877
            Height = 406
            Align = alClient
            DataSource = srcPedido
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'idPedido'
                Title.Caption = 'Id'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nomeProduto'
                Title.Caption = 'Produto'
                Width = 215
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nomeCategoria'
                Title.Caption = 'Categoria'
                Width = 146
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Title.Caption = 'Quantidade'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'preco'
                Title.Caption = 'Pre'#231'o'
                Width = 107
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 1
            Top = 432
            Width = 877
            Height = 129
            Align = alBottom
            TabOrder = 1
            ExplicitTop = 431
            ExplicitWidth = 873
            object Label1: TLabel
              Left = 8
              Top = 6
              Width = 43
              Height = 15
              Caption = 'Produto'
            end
            object Label4: TLabel
              Left = 511
              Top = 6
              Width = 51
              Height = 15
              Caption = 'Categoria'
            end
            object Label3: TLabel
              Left = 251
              Top = 3
              Width = 62
              Height = 15
              Caption = 'Quantidade'
            end
            object Label5: TLabel
              Left = 400
              Top = 6
              Width = 30
              Height = 15
              Caption = 'Pre'#231'o'
            end
            object Label6: TLabel
              Left = 379
              Top = 28
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
            object btnSalvar: TButton
              Left = 717
              Top = 68
              Width = 75
              Height = 49
              Caption = 'Salvar'
              TabOrder = 0
              OnClick = btnSalvarClick
            end
            object btnCancelar: TButton
              Left = 798
              Top = 68
              Width = 75
              Height = 49
              Caption = 'Cancelar'
              TabOrder = 1
              OnClick = btnCancelarClick
            end
            object btnInserir: TButton
              Left = 8
              Top = 68
              Width = 75
              Height = 49
              Caption = 'Inserir'
              TabOrder = 2
              OnClick = btnInserirClick
            end
            object btnExcluir: TButton
              Left = 89
              Top = 68
              Width = 75
              Height = 49
              Caption = 'Excluir'
              TabOrder = 3
              OnClick = btnExcluirClick
            end
            object LCBProduto: TDBLookupComboBox
              Left = 8
              Top = 24
              Width = 237
              Height = 23
              DataField = 'idProduto'
              DataSource = srcPedido
              KeyField = 'idProduto'
              ListField = 'nomeProduto'
              ListSource = srcProduto
              TabOrder = 4
            end
            object DBEdit2: TDBEdit
              Left = 511
              Top = 24
              Width = 200
              Height = 23
              DataField = 'nomeCategoria'
              DataSource = srcProduto
              ReadOnly = True
              TabOrder = 5
            end
            object DBEditPreco: TDBEdit
              Left = 400
              Top = 24
              Width = 105
              Height = 23
              DataField = 'preco'
              DataSource = srcProduto
              ReadOnly = True
              TabOrder = 6
            end
            object dbEditQuantidade: TDBEdit
              Left = 251
              Top = 24
              Width = 118
              Height = 23
              DataField = 'Quantidade'
              DataSource = srcProduto
              ReadOnly = True
              TabOrder = 7
            end
            object chkValorCadastrado: TCheckBox
              Left = 251
              Top = 53
              Width = 187
              Height = 20
              Caption = 'Utilizar valores cadastrados'
              TabOrder = 8
              WordWrap = True
              OnClick = chkValorCadastradoClick
            end
            object editQuantidade: TEdit
              Left = 251
              Top = 24
              Width = 118
              Height = 23
              TabOrder = 9
            end
            object editPreco: TEdit
              Left = 400
              Top = 24
              Width = 105
              Height = 23
              TabOrder = 10
            end
            object btnAtualizar: TButton
              Left = 630
              Top = 68
              Width = 75
              Height = 49
              Caption = 'Atualizar'
              TabOrder = 11
              OnClick = btnAtualizarClick
            end
          end
          object Panel5: TPanel
            Left = 1
            Top = 407
            Width = 877
            Height = 25
            Align = alBottom
            TabOrder = 2
            ExplicitTop = 406
            ExplicitWidth = 873
            object lblTotalPreco: TLabel
              Left = 819
              Top = 4
              Width = 68
              Height = 15
              Caption = 'lblTotalPreco'
            end
          end
        end
      end
    end
  end
  object ADOPedido: TADOStoredProc
    Connection = DataModule1.ADOConexao
    CursorType = ctStatic
    ProcedureName = 'sp_Pedido_Selecionar;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@idGrupoPedido'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 216
    Top = 184
    object ADOPedidoidPedido: TAutoIncField
      FieldName = 'idPedido'
      ReadOnly = True
    end
    object ADOPedidoidGrupoPedido: TIntegerField
      FieldName = 'idGrupoPedido'
    end
    object ADOPedidoidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object ADOPedidoquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object ADOPedidopreco: TBCDField
      FieldName = 'preco'
      Precision = 19
    end
    object ADOPedidonomeProduto: TStringField
      FieldName = 'nomeProduto'
      Size = 100
    end
    object ADOPedidonomeCategoria: TStringField
      FieldName = 'nomeCategoria'
      Size = 100
    end
  end
  object srcPedido: TDataSource
    DataSet = ADOPedido
    OnDataChange = srcPedidoDataChange
    Left = 248
    Top = 184
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
    Left = 288
    Top = 304
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
      ProviderFlags = [pfInUpdate]
      Required = True
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
    Left = 320
    Top = 304
  end
  object ADOGrupoPedido: TADOStoredProc
    Connection = DataModule1.ADOConexao
    CursorType = ctStatic
    ProcedureName = 'sp_GrupoPedido_Selecionar;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@idGrupoPedido'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@dataEntrada'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 496
    Top = 200
    object ADOGrupoPedidoidGrupoPedido: TAutoIncField
      FieldName = 'idGrupoPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ADOGrupoPedidonomeGrupoPedido: TStringField
      FieldName = 'nomeGrupoPedido'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object ADOGrupoPedidodataEntrada: TDateTimeField
      FieldName = 'dataEntrada'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'hh:mm'
    end
    object ADOGrupoPedidodataSaida: TDateTimeField
      FieldName = 'dataSaida'
      ProviderFlags = [pfInUpdate]
    end
    object ADOGrupoPedidovalorPedido: TBCDField
      FieldName = 'valorPedido'
      ProviderFlags = [pfInUpdate]
      Precision = 19
    end
    object ADOGrupoPedidobaixaPedido: TBooleanField
      FieldName = 'baixaPedido'
      ProviderFlags = [pfInUpdate]
    end
  end
  object srcGrupoPedido: TDataSource
    DataSet = ADOGrupoPedido
    Left = 528
    Top = 200
  end
end
