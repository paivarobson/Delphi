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
  Menu = mMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 320
    object intgrfldTempESCCOD: TIntegerField
      FieldName = 'ESCCOD'
    end
    object strngfldTempESCNOME: TStringField
      FieldName = 'ESCNOME'
    end
    object dtmfldTempESCDATACAD: TDateTimeField
      FieldName = 'ESCDATACAD'
    end
    object strngfldTempESCEND: TStringField
      FieldName = 'ESCEND'
    end
  end
  object mMenu: TMainMenu
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
end
