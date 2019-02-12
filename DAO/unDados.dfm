object fmdados: Tfmdados
  OldCreateOrder = False
  Height = 349
  Width = 485
  object FConexaoBDEscola: TSQLConnection
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
    Left = 213
    Top = 5
  end
  object dspEscola: TDataSetProvider
    DataSet = tbEscola
    Constraints = False
    UpdateMode = upWhereChanged
    Left = 80
    Top = 144
  end
  object cdsEscola: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    Params = <>
    ProviderName = 'dspEscola'
    Left = 40
    Top = 215
    object cdsEscolaESCCOD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ESCCOD'
      Required = True
    end
    object cdsEscolaESCNOME: TStringField
      Tag = 1
      DisplayLabel = 'Escola'
      FieldName = 'ESCNOME'
      Size = 100
    end
    object cdsEscolaESCDATACAD: TSQLTimeStampField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'ESCDATACAD'
    end
    object cdsEscolaESCENDCEP: TStringField
      Tag = 1
      DisplayLabel = 'CEP'
      FieldName = 'ESCENDCEP'
      Size = 9
    end
    object cdsEscolaESCENDRUA: TStringField
      Tag = 1
      DisplayLabel = 'Rua'
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object cdsEscolaESCENDNUM: TStringField
      Tag = 1
      DisplayLabel = 'N'#250'mero'
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object cdsEscolaESCENDCOMP: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object cdsEscolaESCENDBAIRRO: TStringField
      Tag = 1
      DisplayLabel = 'Bairro'
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object cdsEscolaESCENDCIDADE: TStringField
      Tag = 1
      DisplayLabel = 'Cidade'
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
  end
  object dsEscola: TDataSource
    DataSet = cdsEscola
    Left = 72
    Top = 280
  end
  object tbEscola: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = FConexaoBDEscola
    Left = 40
    Top = 96
    object tbEscolaESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      Required = True
    end
    object tbEscolaESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object tbEscolaESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 9
    end
    object tbEscolaESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object tbEscolaESCENDNUM: TStringField
      FieldName = 'ESCENDNUM'
      Size = 10
    end
    object tbEscolaESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object tbEscolaESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object tbEscolaESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object tbEscolaESCDATACAD: TSQLTimeStampField
      FieldName = 'ESCDATACAD'
    end
  end
  object tbAux: TSQLQuery
    DataSource = dsEscola
    MaxBlobSize = -1
    Params = <>
    SQLConnection = FConexaoBDEscola
    Left = 212
    Top = 57
  end
  object tbAluno: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from aluno')
    SQLConnection = FConexaoBDEscola
    Left = 292
    Top = 97
  end
  object dspAluno: TDataSetProvider
    DataSet = tbAluno
    Constraints = False
    UpdateMode = upWhereChanged
    Left = 352
    Top = 145
  end
  object cdsAluno: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    Params = <>
    ProviderName = 'dspAluno'
    Left = 352
    Top = 217
  end
  object dsAluno: TDataSource
    DataSet = cdsAluno
    Left = 352
    Top = 281
  end
end
