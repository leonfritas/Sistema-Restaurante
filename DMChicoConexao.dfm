object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object ADOConexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=01042018;Persist Security Info=True;' +
      'User ID=root;Data Source=MySQLDelphiSistema;Initial Catalog=sist' +
      'ema'
    LoginPrompt = False
    Left = 96
    Top = 56
  end
end
