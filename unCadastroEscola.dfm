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
