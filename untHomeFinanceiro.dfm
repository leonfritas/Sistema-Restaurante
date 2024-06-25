object frmHomeFinanceiro: TfrmHomeFinanceiro
  Left = 0
  Top = 0
  Caption = 'frmHomeFinanceiro'
  ClientHeight = 728
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 201
    Height = 28
    Caption = 'Pagamentos Pendentes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 360
    Width = 204
    Height = 28
    Caption = 'Pagamentos Realizados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 656
    Top = 639
    Width = 80
    Height = 15
    Caption = 'Recebido Hoje:'
  end
  object lblValorTotal: TLabel
    Left = 742
    Top = 639
    Width = 64
    Height = 15
    Caption = 'lblValorTotal'
  end
  object gridGrupoPedido: TDBGrid
    Left = 40
    Top = 59
    Width = 769
    Height = 198
    DataSource = srcFinanceiroMovimentoPendente
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idFinanceiroGrupoPedido'
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeGrupoPedido'
        Title.Caption = 'Pedido'
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataMovimento'
        Title.Caption = 'Movimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataPagamento'
        Title.Caption = 'Pagamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ativoBaixa'
        Title.Caption = 'Pago'
        Width = 104
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 464
    Top = 287
    Width = 289
    Height = 50
    Caption = 'Receber'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 394
    Width = 769
    Height = 239
    DataSource = srcFinanceiroMovimentoRealizado
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idFinanceiroGrupoPedido'
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeGrupoPedido'
        Title.Caption = 'Pedido'
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataMovimento'
        Title.Caption = 'Movimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataPagamento'
        Title.Caption = 'Pagamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ativoBaixa'
        Title.Caption = 'Pago'
        Width = 104
        Visible = True
      end>
  end
  object Button2: TButton
    Left = 88
    Top = 287
    Width = 289
    Height = 50
    Caption = 'Estornar Pagamento'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ADOFinanceiroMovimentoPendente: TADOStoredProc
    Connection = DataModule1.ADOConexao
    CursorType = ctStatic
    ProcedureName = 'sp_FinanceiroMovimento_Pendente;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dataMovimento'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 600
    Top = 336
    object ADOFinanceiroMovimentoPendenteidFinanceiroGrupoPedido: TAutoIncField
      FieldName = 'idFinanceiroGrupoPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ADOFinanceiroMovimentoPendenteidGrupoPedido: TIntegerField
      FieldName = 'idGrupoPedido'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ADOFinanceiroMovimentoPendentedataMovimento: TDateTimeField
      FieldName = 'dataMovimento'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object ADOFinanceiroMovimentoPendentedataPagamento: TDateTimeField
      FieldName = 'dataPagamento'
      ProviderFlags = [pfInUpdate]
    end
    object ADOFinanceiroMovimentoPendenteativoBaixa: TBooleanField
      FieldName = 'ativoBaixa'
      ProviderFlags = [pfInUpdate]
      DisplayValues = 'PAGO;PENDENTE'
    end
    object ADOFinanceiroMovimentoPendentenomeGrupoPedido: TStringField
      FieldName = 'nomeGrupoPedido'
      Size = 50
    end
  end
  object srcFinanceiroMovimentoPendente: TDataSource
    DataSet = ADOFinanceiroMovimentoPendente
    Left = 632
    Top = 336
  end
  object ADOFinanceiroMovimentoRealizado: TADOStoredProc
    Connection = DataModule1.ADOConexao
    CursorType = ctStatic
    ProcedureName = 'sp_FinanceiroMovimento_Realizado;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dataMovimento'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 768
    Top = 296
    object AutoIncField1: TAutoIncField
      FieldName = 'idFinanceiroGrupoPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'idGrupoPedido'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'dataMovimento'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'dataPagamento'
      ProviderFlags = [pfInUpdate]
    end
    object BooleanField1: TBooleanField
      FieldName = 'ativoBaixa'
      ProviderFlags = [pfInUpdate]
      DisplayValues = 'PAGO;PENDENTE'
    end
    object ADOFinanceiroMovimentoRealizadonomeGrupoPedido: TStringField
      FieldName = 'nomeGrupoPedido'
      ProviderFlags = []
      Size = 50
    end
    object ADOFinanceiroMovimentoRealizadovalorMovimento: TBCDField
      FieldName = 'valorMovimento'
      Precision = 19
    end
    object ADOFinanceiroMovimentoRealizadovalorPedido: TBCDField
      FieldName = 'valorPedido'
      Precision = 19
    end
  end
  object srcFinanceiroMovimentoRealizado: TDataSource
    DataSet = ADOFinanceiroMovimentoRealizado
    Left = 800
    Top = 296
  end
end
