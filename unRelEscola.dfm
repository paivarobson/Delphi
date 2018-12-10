object frmRelEscola: TfrmRelEscola
  Left = 0
  Top = 0
  Caption = 'Listagem Escola'
  ClientHeight = 540
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReportEscola: TRLReport
    Left = 0
    Top = 8
    Width = 794
    Height = 1123
    DataSource = frmCadEscola.dsEscola
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Listagem'
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object rlblRelEscolaTitulo: TRLLabel
        Left = 0
        Top = 0
        Width = 173
        Height = 24
        Align = faLeftTop
        Caption = 'Listagem Escola'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 339
        Top = 0
        Width = 39
        Height = 16
        Align = faCenterTop
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 600
        Top = 0
        Width = 118
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'P'#225'g.:'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 40
      BandType = btHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object rlblRelEscolaCod: TRLLabel
        Left = 3
        Top = 6
        Width = 49
        Height = 16
        Caption = 'C'#243'digo'
      end
      object rlblRelEscolaNome: TRLLabel
        Left = 58
        Top = 6
        Width = 175
        Height = 16
        Caption = 'Escola'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 40
      object rldbtxtEscolaNome: TRLDBText
        Left = 58
        Top = 6
        Width = 175
        Height = 16
        AutoSize = False
        DataField = 'ESCNOME'
        DataSource = frmCadEscola.dsEscola
        Transparent = False
      end
      object rldbtxtEscolaCod: TRLDBText
        Left = 3
        Top = 6
        Width = 49
        Height = 16
        AutoSize = False
        DataField = 'ESCCOD'
        DataSource = frmCadEscola.dsEscola
        Transparent = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 40
      BandType = btFooter
    end
  end
end
