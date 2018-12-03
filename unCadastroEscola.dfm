object frmCadastroEscola: TfrmCadastroEscola
  Left = 0
  Top = 0
  Caption = 'Cadastro de Escola'
  ClientHeight = 560
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menuBarCadastro
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblEscolaCodigo: TLabel
    Left = 40
    Top = 46
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblEscolaNome: TLabel
    Left = 143
    Top = 46
    Width = 79
    Height = 13
    Caption = 'Nome da Escola:'
  end
  object lblEscolaEndRua: TLabel
    Left = 40
    Top = 85
    Width = 23
    Height = 13
    Caption = 'Rua:'
  end
  object lblEscolaEndNumero: TLabel
    Left = 464
    Top = 85
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lblEscolaEndComplemento: TLabel
    Left = 40
    Top = 125
    Width = 69
    Height = 13
    Caption = 'Complemento:'
  end
  object lblEscolaEndCidade: TLabel
    Left = 440
    Top = 125
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object lblEscolaendCep: TLabel
    Left = 40
    Top = 167
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lblEscolaDataCadastro: TLabel
    Left = 496
    Top = 167
    Width = 89
    Height = 13
    Caption = 'Data de Cadastro:'
  end
  object lblEscolaEndBairro: TLabel
    Left = 271
    Top = 125
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object lblEscolaTitulo: TLabel
    Left = 184
    Top = 7
    Width = 224
    Height = 33
    Caption = 'Cadastro de Escola'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtEscolaCodigo: TEdit
    Left = 40
    Top = 61
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = '0'
  end
  object edtEscolaNome: TEdit
    Left = 143
    Top = 61
    Width = 466
    Height = 21
    TabOrder = 1
    Text = 'edtEscolaNome'
  end
  object edtEscolaEndRua: TEdit
    Left = 40
    Top = 100
    Width = 418
    Height = 21
    TabOrder = 2
    Text = 'edtEscolaEndRua'
  end
  object edtEscolaEndNumero: TEdit
    Left = 464
    Top = 100
    Width = 145
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object edtEscolaEndComplemento: TEdit
    Left = 40
    Top = 140
    Width = 225
    Height = 21
    TabOrder = 4
    Text = 'edtEscolaEndComplemento'
  end
  object edtEscolaEndCidade: TEdit
    Left = 440
    Top = 140
    Width = 169
    Height = 21
    TabOrder = 5
    Text = 'edtEscolaEndCidade'
  end
  object edtEscolaEndCep: TEdit
    Left = 40
    Top = 181
    Width = 113
    Height = 21
    TabOrder = 6
    Text = 'edtEscolaEndCep'
  end
  object edtEscolaDataCadastro: TEdit
    Left = 496
    Top = 181
    Width = 113
    Height = 21
    TabOrder = 7
    Text = '03/12/18'
  end
  object edtEscolaEndBairro: TEdit
    Left = 271
    Top = 140
    Width = 163
    Height = 21
    TabOrder = 8
    Text = 'edtEscolaEndCep'
  end
  object dbgrdEscola: TDBGrid
    Left = 40
    Top = 253
    Width = 569
    Height = 265
    DataSource = dsEscola
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ESCOD'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCNOME'
        Title.Caption = 'Escola'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCDATACAD'
        Title.Caption = 'Data de cadastro'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDRUA'
        Title.Caption = 'Rua'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDNUM'
        Title.Caption = 'N'#250'mero'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCOMP'
        Title.Caption = 'Complemento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDBAIRRO'
        Title.Caption = 'Bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCIDADE'
        Title.Caption = 'Cidade'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCEP'
        Title.Caption = 'CEP'
        Visible = True
      end>
  end
  object btnEscolaCadastrar: TButton
    Left = 143
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 10
    OnClick = btnEscolaCadastrarClick
  end
  object btnEscolaAlterar: TButton
    Left = 223
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 11
    OnClick = btnEscolaAlterarClick
  end
  object btnEscolaExcluir: TButton
    Left = 304
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 12
    OnClick = btnEscolaExcluirClick
  end
  object btnEscolaImprimiir: TButton
    Left = 534
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 13
  end
  object menuBarCadastro: TMainMenu
    Left = 248
    Top = 173
    object Cadastros1: TMenuItem
      Caption = 'Arquivo'
      object Cadastros2: TMenuItem
        Caption = 'Cadastro'
        object Escola1: TMenuItem
          Caption = 'Escola'
        end
      end
    end
  end
  object dsEscola: TDataSource
    DataSet = SQLTable1
    Left = 320
    Top = 173
  end
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
    Left = 357
    Top = 173
  end
  object sqlqryescola: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from escola')
    SQLConnection = conexaoBDEscola
    Left = 416
    Top = 184
  end
  object SQLTable1: TSQLTable
    Active = True
    MaxBlobSize = -1
    SQLConnection = conexaoBDEscola
    TableName = 'ESCOLA'
    Left = 456
    Top = 208
  end
end
