object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 303
  Top = 221
  Height = 320
  Width = 473
  object ConGlobal: TMyConnection
    Database = 'jingga'
    Username = 'root'
    Server = 'localhost'
    AfterConnect = ConGlobalAfterConnect
    LoginPrompt = False
    Left = 32
    Top = 24
    EncryptedPassword = '9EFF'
  end
  object qTemp: TMyQuery
    Connection = ConGlobal
    Left = 32
    Top = 80
  end
end
