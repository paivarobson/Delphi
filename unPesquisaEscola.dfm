object frmPesquisaEscola: TfrmPesquisaEscola
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pesquisar'
  ClientHeight = 500
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
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
    Width = 184
    Height = 33
    Caption = 'Consulta Escola'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object DBGridListaEscola: TDBGrid
    Left = 0
    Top = 184
    Width = 778
    Height = 316
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
        Title.Caption = 'Descri'#231#227'o'
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
    OnClick = rgEscolaPesquisarClick
  end
  object dtpEscolaBuscarData: TDateTimePicker
    Left = 77
    Top = 126
    Width = 105
    Height = 21
    Date = 43444.631400567130000000
    Time = 43444.631400567130000000
    Enabled = False
    TabOrder = 3
    OnKeyPress = dtpEscolaBuscarDataKeyPress
  end
  object edtEscolaBuscarCodigo: TEdit
    Left = 21
    Top = 126
    Width = 48
    Height = 21
    ParentShowHint = False
    ShowHint = True
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
    TabOrder = 7
  end
  object btnEscolaImprimir: TButton
    Left = 680
    Top = 153
    Width = 90
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 8
    OnClick = btnEscolaImprimirClick
  end
  object btnEscolaNovoCadastro: TButton
    Left = 335
    Top = 153
    Width = 83
    Height = 25
    Caption = 'Novo cadastro'
    TabOrder = 6
    OnClick = btnEscolaNovoCadastroClick
  end
  object btnEscolaConsultaFechar: TButton
    Left = 688
    Top = 8
    Width = 82
    Height = 25
    Caption = 'Tela principal'
    TabOrder = 9
    OnClick = btnEscolaConsultaFecharClick
  end
end
