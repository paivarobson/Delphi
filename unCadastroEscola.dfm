object frmCadastroEscola: TfrmCadastroEscola
  Left = 0
  Top = 0
  Caption = 'Cadastro de Escola'
  ClientHeight = 355
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = cliente
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
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
    Top = 67
    Width = 418
    Height = 21
    TabOrder = 2
    Text = 'edtEscolaEndRua'
  end
  object edtEscolaEndNumero: TEdit
    Left = 464
    Top = 67
    Width = 113
    Height = 21
    TabOrder = 3
    Text = 'edtEscolaEndNumero'
  end
  object edtEscolaEndComplemento: TEdit
    Left = 40
    Top = 94
    Width = 225
    Height = 21
    TabOrder = 4
    Text = 'edtEscolaEndComplemento'
  end
  object edtEscolaEndCidade: TEdit
    Left = 271
    Top = 94
    Width = 187
    Height = 21
    TabOrder = 5
    Text = 'edtEscolaEndCidade'
  end
  object edtEscolaEndCep: TEdit
    Left = 464
    Top = 94
    Width = 113
    Height = 21
    TabOrder = 6
    Text = 'edtEscolaEndCep'
  end
  object cliente: TMainMenu
    Left = 448
    Top = 320
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
    Left = 496
    Top = 320
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
end
