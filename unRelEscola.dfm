object frmRelEscola: TfrmRelEscola
  Left = 0
  Top = 0
  Caption = 's'
  ClientHeight = 458
  ClientWidth = 930
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
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fmdados.dsEscola
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
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object rlblRelEscolaCod: TRLLabel
        Left = 3
        Top = 6
        Width = 30
        Height = 16
        AutoSize = False
        Caption = 'C'#243'd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblRelEscolaNome: TRLLabel
        Left = 39
        Top = 6
        Width = 38
        Height = 14
        Caption = 'Escola'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblRelEscolaDataCadastro: TRLLabel
        Left = 163
        Top = 6
        Width = 70
        Height = 14
        Caption = 'Dt. Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblRelEscolaRua: TRLLabel
        Left = 239
        Top = 6
        Width = 23
        Height = 14
        Caption = 'Rua'
      end
      object rlblRelEscolaNumero: TRLLabel
        Left = 343
        Top = 6
        Width = 14
        Height = 14
        Caption = 'N'#186
      end
      object rlblRelEscolaComplemento: TRLLabel
        Left = 367
        Top = 6
        Width = 60
        Height = 14
        Caption = 'Complem.'
      end
      object rlblRelEscolaBairro: TRLLabel
        Left = 471
        Top = 6
        Width = 36
        Height = 14
        Caption = 'Bairro'
      end
      object rlblRelEscolaCidade: TRLLabel
        Left = 559
        Top = 6
        Width = 41
        Height = 14
        Caption = 'Cidade'
      end
      object rlblRelEscolaCEP: TRLLabel
        Left = 655
        Top = 6
        Width = 24
        Height = 14
        Caption = 'CEP'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 28
      object rldbtxtEscolaNome: TRLDBText
        Left = 39
        Top = 0
        Width = 35
        Height = 14
        Align = faTopOnly
        DataField = 'ESCNOME'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rldbtxtEscolaCod: TRLDBText
        Left = 3
        Top = 0
        Width = 36
        Height = 14
        Align = faTopOnly
        DataField = 'ESCCOD'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLDBText1: TRLDBText
        Left = 163
        Top = 0
        Width = 86
        Height = 14
        DataField = 'ESCDATACAD'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 239
        Top = 0
        Width = 22
        Height = 14
        DataField = 'ESCENDRUA'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 343
        Top = 0
        Width = 40
        Height = 14
        DataField = 'ESCENDNUM'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText4: TRLDBText
        Left = 367
        Top = 0
        Width = 67
        Height = 14
        DataField = 'ESCENDCOMP'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 471
        Top = 0
        Width = 32
        Height = 14
        DataField = 'ESCENDBAIRRO'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText6: TRLDBText
        Left = 559
        Top = 0
        Width = 36
        Height = 14
        DataField = 'ESCENDCIDADE'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText7: TRLDBText
        Left = 655
        Top = 0
        Width = 22
        Height = 14
        DataField = 'ESCENDCEP'
        DataSource = fmdados.dsEscola
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 149
      Width = 718
      Height = 16
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 471
        Top = 0
        Width = 163
        Height = 16
        Text = 'Relat'#243'rio gerado em: '
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 679
        Top = 0
        Width = 39
        Height = 16
        Align = faRightTop
        Info = itHour
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 0
        Width = 225
        Height = 16
        Info = itDetailCount
        Text = 'Quantidade de registros: '
      end
    end
  end
end
