object fmdados: Tfmdados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 251
  Width = 355
  object conexaoBDEscola: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbxmss30.dll'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=sa.dbo'
      'DriverName=MSSQL'
      'HostName=NCDEV28'
      'DataBase=ESCOLA'
      'User_Name=sa'
      'Password=fcm123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False'
      'Prepare SQL=False')
    VendorLib = 'oledb'
    Connected = True
    Left = 293
    Top = 13
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 152
    Top = 56
  end
  object SQLDataSet1: TSQLDataSet
    SchemaName = 'dbo'
    Active = True
    CommandText = 'ESCOLA'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexaoBDEscola
    Left = 216
    Top = 32
    object SQLDataSet1ESCCOD: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ESCCOD'
    end
    object SQLDataSet1ESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object SQLDataSet1ESCDATACAD: TStringField
      FieldName = 'ESCDATACAD'
      Size = 8
    end
    object SQLDataSet1ESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object SQLDataSet1ESCENDNUM: TStringField
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object SQLDataSet1ESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object SQLDataSet1ESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object SQLDataSet1ESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object SQLDataSet1ESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 8
    end
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 72
    Top = 88
    object ClientDataSet1ESCCOD: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ESCCOD'
    end
    object ClientDataSet1ESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object ClientDataSet1ESCDATACAD: TStringField
      FieldName = 'ESCDATACAD'
      Size = 8
    end
    object ClientDataSet1ESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object ClientDataSet1ESCENDNUM: TStringField
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object ClientDataSet1ESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object ClientDataSet1ESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object ClientDataSet1ESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object ClientDataSet1ESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 8
    end
  end
end
