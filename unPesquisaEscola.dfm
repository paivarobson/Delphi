object frmPesquisaEscola: TfrmPesquisaEscola
  Left = 0
  Top = 0
  Caption = 'Pesquisar'
  ClientHeight = 465
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEscolaConsultaOrdenada: TLabel
    Left = 200
    Top = 138
    Width = 63
    Height = 13
    Caption = 'Ordenar por:'
  end
  object lblEscolaTituloLista: TLabel
    Left = 251
    Top = 6
    Width = 195
    Height = 33
    Caption = 'Pesquisar Escola'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGridListaEscola: TDBGrid
    Left = 0
    Top = 224
    Width = 801
    Height = 241
    Align = alBottom
    DataSource = fmdados.dsEscola
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridListaEscolaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ESCCOD'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCNOME'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCDATACAD'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDRUA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDNUM'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCOMP'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDBAIRRO'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCIDADE'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCEP'
        Width = 61
        Visible = True
      end>
  end
  object ComboBoxEscolaConsultaOrdenada: TComboBox
    Left = 200
    Top = 155
    Width = 110
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = 'C'#243'digo'
    OnChange = ComboBoxEscolaConsultaOrdenadaChange
    Items.Strings = (
      'C'#243'digo'
      'Escola'
      'Data de cadastro')
  end
  object rgEscolaPesquisar: TRadioGroup
    Left = 21
    Top = 61
    Width = 161
    Height = 59
    Caption = 'Pesquisar'
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Data de Cadastro')
    TabOrder = 1
  end
  object dtpEscolaBuscarData: TDateTimePicker
    Left = 77
    Top = 126
    Width = 105
    Height = 21
    Date = 43444.631400567130000000
    Time = 43444.631400567130000000
    TabOrder = 3
    OnKeyPress = dtpEscolaBuscarDataKeyPress
  end
  object edtEscolaBuscarCodigo: TEdit
    Left = 21
    Top = 126
    Width = 48
    Height = 21
    TabOrder = 2
    OnChange = edtEscolaBuscarCodigoChange
    OnKeyPress = edtEscolaBuscarCodigoKeyPress
  end
  object btnEscolaBuscar: TButton
    Left = 21
    Top = 153
    Width = 161
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 4
    OnClick = btnEscolaBuscarClick
  end
  object rgImpressao: TRadioGroup
    Left = 680
    Top = 95
    Width = 90
    Height = 56
    Caption = 'Impress'#227'o'
    ItemIndex = 0
    Items.Strings = (
      'Tela'
      'Impressora')
    TabOrder = 6
  end
  object btnEscolaImprimir: TButton
    Left = 680
    Top = 153
    Width = 90
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 7
    OnClick = btnEscolaImprimirClick
  end
end