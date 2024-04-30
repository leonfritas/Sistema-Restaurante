object frmHomeGrupoPedido: TfrmHomeGrupoPedido
  Left = 0
  Top = 0
  Caption = 'frmHomeGrupoPedido'
  ClientHeight = 644
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object gridGrupoPedido: TDBGrid
    Left = 80
    Top = 91
    Width = 709
    Height = 198
    DataSource = srcGrupoPedido
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idGrupoPedido'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeGrupoPedido'
        Title.Caption = 'Pedido'
        Width = 359
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataEntrada'
        Title.Caption = 'Entrada'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataSaida'
        Title.Caption = 'Sa'#237'da'
        Width = 123
        Visible = True
      end>
  end
  object btnNovoPedido: TButton
    Left = 80
    Top = 20
    Width = 137
    Height = 49
    Caption = 'Novo Pedido'
    TabOrder = 1
    OnClick = btnNovoPedidoClick
  end
  object Button1: TButton
    Left = 652
    Top = 20
    Width = 137
    Height = 49
    Caption = 'Entregar Pedido'
    TabOrder = 2
    OnClick = Button1Click
  end
  object btnAtualizarGrupoPedido: TButton
    Left = 509
    Top = 20
    Width = 137
    Height = 49
    Caption = 'Atualizar'
    TabOrder = 3
    OnClick = btnAtualizarGrupoPedidoClick
  end
  object btnEditarPedido: TButton
    Left = 223
    Top = 20
    Width = 137
    Height = 49
    Caption = 'Editar Pedido'
    TabOrder = 4
    OnClick = btnEditarPedidoClick
  end
  object DBGrid1: TDBGrid
    Left = 80
    Top = 371
    Width = 709
    Height = 198
    DataSource = srcGrupoPedidoRealizado
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idGrupoPedido'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeGrupoPedido'
        Title.Caption = 'Pedido'
        Width = 363
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataEntrada'
        Title.Caption = 'Entrada'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataSaida'
        Title.Caption = 'Sa'#237'da'
        Width = 118
        Visible = True
      end>
  end
  object btnCancelar: TButton
    Left = 366
    Top = 20
    Width = 137
    Height = 49
    Caption = 'Cancelar Pedido'
    TabOrder = 6
    OnClick = btnCancelarClick
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
    Left = 216
    Top = 184
    object ADOGrupoPedidoidGrupoPedido: TAutoIncField
      FieldName = 'idGrupoPedido'
      ReadOnly = True
    end
    object ADOGrupoPedidonomeGrupoPedido: TStringField
      FieldName = 'nomeGrupoPedido'
      Size = 50
    end
    object ADOGrupoPedidodataEntrada: TDateTimeField
      FieldName = 'dataEntrada'
      DisplayFormat = 'hh:mm'
    end
    object ADOGrupoPedidodataSaida: TDateTimeField
      FieldName = 'dataSaida'
      DisplayFormat = 'hh:mm'
    end
    object ADOGrupoPedidovalorPedido: TBCDField
      FieldName = 'valorPedido'
      Precision = 19
    end
    object ADOGrupoPedidobaixaPedido: TBooleanField
      FieldName = 'baixaPedido'
    end
  end
  object srcGrupoPedido: TDataSource
    DataSet = ADOGrupoPedido
    Left = 216
    Top = 240
  end
  object ADOGrupoPedidoRealizado: TADOStoredProc
    Connection = DataModule1.ADOConexao
    CursorType = ctStatic
    ProcedureName = 'sp_GrupoPedidoRealizado_Selecionar;1'
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
    Left = 328
    Top = 192
    object AutoIncField1: TAutoIncField
      FieldName = 'idGrupoPedido'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'nomeGrupoPedido'
      Size = 50
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'dataEntrada'
      DisplayFormat = 'hh:mm'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'dataSaida'
      DisplayFormat = 'hh:mm'
    end
    object BCDField1: TBCDField
      FieldName = 'valorPedido'
      Precision = 19
    end
    object BooleanField1: TBooleanField
      FieldName = 'baixaPedido'
    end
  end
  object srcGrupoPedidoRealizado: TDataSource
    DataSet = ADOGrupoPedidoRealizado
    Left = 328
    Top = 248
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 400
    Top = 328
  end
end
