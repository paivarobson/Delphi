object frmCadastroEscola: TfrmCadastroEscola
  Left = 0
  Top = 0
  Caption = 'Cadastro de Escola'
  ClientHeight = 526
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menuBarCadastro
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblEscolaCodigo: TLabel
    Left = 40
    Top = 25
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
    Top = 25
    Width = 79
    Height = 13
    Caption = 'Nome da Escola:'
  end
  object lblEscolaEndRua: TLabel
    Left = 40
    Top = 64
    Width = 23
    Height = 13
    Caption = 'Rua:'
  end
  object lblEscolaEndNumero: TLabel
    Left = 464
    Top = 64
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lblEscolaEndComplemento: TLabel
    Left = 40
    Top = 104
    Width = 69
    Height = 13
    Caption = 'Complemento:'
  end
  object lblEscolaEndCidade: TLabel
    Left = 391
    Top = 104
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object lblEscolaendCep: TLabel
    Left = 40
    Top = 146
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lblEscolaDataCadastro: TLabel
    Left = 464
    Top = 146
    Width = 89
    Height = 13
    Caption = 'Data de Cadastro:'
  end
  object lblEscolaEndBairro: TLabel
    Left = 271
    Top = 104
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object edtEscolaCodigo: TEdit
    Left = 40
    Top = 40
    Width = 97
    Height = 21
    TabOrder = 0
    Text = 'edtEscolaCodigo'
  end
  object edtEscolaNome: TEdit
    Left = 143
    Top = 40
    Width = 434
    Height = 21
    TabOrder = 1
    Text = 'edtEscolaNome'
  end
  object edtEscolaEndRua: TEdit
    Left = 40
    Top = 79
    Width = 418
    Height = 21
    TabOrder = 2
    Text = 'edtEscolaEndRua'
  end
  object edtEscolaEndNumero: TEdit
    Left = 464
    Top = 79
    Width = 113
    Height = 21
    TabOrder = 3
    Text = 'edtEscolaEndNumero'
  end
  object edtEscolaEndComplemento: TEdit
    Left = 40
    Top = 119
    Width = 225
    Height = 21
    TabOrder = 4
    Text = 'edtEscolaEndComplemento'
  end
  object edtEscolaEndCidade: TEdit
    Left = 391
    Top = 119
    Width = 187
    Height = 21
    TabOrder = 5
    Text = 'edtEscolaEndCidade'
  end
  object edtEscolaEndCep: TEdit
    Left = 40
    Top = 160
    Width = 113
    Height = 21
    TabOrder = 6
    Text = 'edtEscolaEndCep'
  end
  object edtEscolaDataCadastro: TEdit
    Left = 464
    Top = 160
    Width = 113
    Height = 21
    TabOrder = 7
    Text = 'edtEscolaEndCep'
  end
  object edtEscolaEndBairro: TEdit
    Left = 271
    Top = 119
    Width = 113
    Height = 21
    TabOrder = 8
    Text = 'edtEscolaEndCep'
  end
  object dbgrdEscola: TDBGrid
    Left = 40
    Top = 232
    Width = 538
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
        FieldName = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Escola'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rua'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N'#250'mero'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Complemento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data de cadastro'
        Width = 90
        Visible = True
      end>
  end
  object menuBarCadastro: TMainMenu
    Left = 240
    Top = 192
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
  object cdsTemp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 192
    Data = {
      070100009619E0BD010000001800000009000000000003000000070106455343
      434F440400010000000000074553434E4F4D4501004900000001000557494454
      480200020064000A45534344415441434144080008000000000009455343454E
      44525541010049000000010005574944544802000200640009455343454E444E
      554D04000100000000000A455343454E44434F4D500100490000000100055749
      445448020002001E000C455343454E4442414952524F01004900000001000557
      494454480200020032000C455343454E44434944414445010049000000010005
      574944544802000200320009455343454E444345500100490000000100055749
      445448020002000A000000}
    object cdsTempESCCOD: TIntegerField
      FieldName = 'ESCCOD'
    end
    object cdsTempESCNOME: TStringField
      FieldName = 'ESCNOME'
      Size = 100
    end
    object cdsTempESCDATACAD: TDateTimeField
      FieldName = 'ESCDATACAD'
    end
    object cdsTempESCENDRUA: TStringField
      FieldName = 'ESCENDRUA'
      Size = 100
    end
    object cdsTempESCENDNUM: TIntegerField
      FieldName = 'ESCENDNUM'
    end
    object cdsTempESCENDCOMP: TStringField
      FieldName = 'ESCENDCOMP'
      Size = 30
    end
    object cdsTempESCENDBAIRRO: TStringField
      FieldName = 'ESCENDBAIRRO'
      Size = 50
    end
    object cdsTempESCENDCIDADE: TStringField
      FieldName = 'ESCENDCIDADE'
      Size = 50
    end
    object cdsTempESCENDCEP: TStringField
      FieldName = 'ESCENDCEP'
      Size = 10
    end
  end
  object dsEscola: TDataSource
    DataSet = cdsTemp
    Left = 328
    Top = 192
  end
end
