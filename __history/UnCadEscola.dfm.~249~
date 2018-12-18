object frmCadEscola: TfrmCadEscola
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Escola'
  ClientHeight = 494
  ClientWidth = 790
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
  object lblEscolaCodigo: TLabel
    Left = 35
    Top = 97
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lblEscolaNome: TLabel
    Left = 98
    Top = 97
    Width = 34
    Height = 13
    Caption = 'Escola:'
    FocusControl = DBEditEscolaNome
  end
  object lblEscolaDataCadastro: TLabel
    Left = 485
    Top = 97
    Width = 87
    Height = 13
    Caption = 'Data de cadastro:'
  end
  object lblEscolaEndRua: TLabel
    Left = 110
    Top = 142
    Width = 23
    Height = 13
    Caption = 'Rua:'
    FocusControl = DBEditEscolaEndRua
  end
  object lblEscolaEndNumero: TLabel
    Left = 541
    Top = 142
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lblEscolaEndComplemento: TLabel
    Left = 35
    Top = 185
    Width = 69
    Height = 13
    Caption = 'Complemento:'
    FocusControl = DBEditEscolaEndComplemento
  end
  object lblEscolaEndBairro: TLabel
    Left = 266
    Top = 185
    Width = 32
    Height = 13
    Caption = 'Bairro:'
    FocusControl = DBEditEscolaEndBairro
  end
  object lblEscolaEndCidade: TLabel
    Left = 459
    Top = 185
    Width = 37
    Height = 13
    Caption = 'Cidade:'
    FocusControl = DBEditEscolaEndCidade
  end
  object lblEscolaendCep: TLabel
    Left = 35
    Top = 142
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lblEscolaFrmTitulo: TLabel
    Left = 280
    Top = 8
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
  object DBEditEscolaNome: TcxDBTextEdit
    Left = 98
    Top = 113
    DataBinding.DataField = 'ESCNOME'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 381
  end
  object DBEditEscolaEndRua: TcxDBTextEdit
    Left = 110
    Top = 158
    DataBinding.DataField = 'ESCENDRUA'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    Width = 425
  end
  object DBEditEscolaEndComplemento: TcxDBTextEdit
    Left = 35
    Top = 201
    DataBinding.DataField = 'ESCENDCOMP'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 9
    Width = 225
  end
  object DBEditEscolaEndBairro: TcxDBTextEdit
    Left = 266
    Top = 201
    DataBinding.DataField = 'ESCENDBAIRRO'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 10
    Width = 187
  end
  object DBEditEscolaEndCidade: TcxDBTextEdit
    Left = 459
    Top = 201
    DataBinding.DataField = 'ESCENDCIDADE'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 11
    Width = 147
  end
  object DBGridListaEscola: TDBGrid
    Left = 0
    Top = 293
    Width = 790
    Height = 201
    Align = alBottom
    DataSource = fmdados.dsEscola
    ReadOnly = True
    TabOrder = 22
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ESCCOD'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCNOME'
        Title.Caption = 'Escola'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCDATACAD'
        Title.Caption = 'Data de cadastro'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDRUA'
        Title.Caption = 'Rua'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDNUM'
        Title.Caption = 'N'#250'mero'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCOMP'
        Title.Caption = 'Complemento'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDBAIRRO'
        Title.Caption = 'Bairro'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCIDADE'
        Title.Caption = 'Cidade'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESCENDCEP'
        Title.Caption = 'CEP'
        Width = 61
        Visible = True
      end>
  end
  object DBEditEscolaEndNumero: TcxDBTextEdit
    Left = 541
    Top = 158
    DataBinding.DataField = 'ESCENDNUM'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    TabOrder = 8
    OnKeyPress = ValidaCampoSomenteInteiro
    Width = 65
  end
  object btnEscolaNovoCadastro: TButton
    Left = 240
    Top = 249
    Width = 83
    Height = 25
    Caption = 'Novo cadastro'
    TabOrder = 12
    OnClick = btnEscolaNovoCadastroClick
  end
  object btnEscolaGravar: TButton
    Left = 329
    Top = 249
    Width = 46
    Height = 25
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 13
    OnClick = btnEscolaGravarClick
  end
  object btnEscolaAlterar: TButton
    Left = 381
    Top = 249
    Width = 54
    Height = 25
    Caption = 'Alterar'
    TabOrder = 14
    OnClick = btnEscolaAlterarClick
  end
  object btnEscolaExcluir: TButton
    Left = 556
    Top = 249
    Width = 50
    Height = 25
    Caption = 'Excluir'
    TabOrder = 17
    OnClick = btnEscolaExcluirClick
  end
  object btnEscolaCancelar: TButton
    Left = 495
    Top = 249
    Width = 55
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 16
    OnClick = btnEscolaCancelarClick
  end
  object btnEscolaLimpar: TButton
    Left = 441
    Top = 249
    Width = 48
    Height = 25
    Caption = 'Limpar'
    Enabled = False
    TabOrder = 15
    OnClick = btnEscolaLimparClick
  end
  object DBEditEscolaCod: TcxDBTextEdit
    Left = 35
    Top = 113
    DataBinding.DataField = 'ESCCOD'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    ParentFont = False
    TabOrder = 3
    Width = 57
  end
  object edtEscolaBuscarCodigo: TEdit
    Left = 35
    Top = 39
    Width = 48
    Height = 21
    TabOrder = 0
    OnChange = edtEscolaBuscarCodigoChange
    OnKeyPress = ValidaCampoSomenteInteiro
  end
  object btnEscolaBuscar: TButton
    Left = 35
    Top = 66
    Width = 135
    Height = 25
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = btnEscolaBuscarClick
  end
  object rgImpressao: TRadioGroup
    Left = 621
    Top = 117
    Width = 101
    Height = 105
    Caption = 'Impress'#227'o'
    TabOrder = 18
  end
  object rbTela: TRadioButton
    Left = 635
    Top = 141
    Width = 64
    Height = 17
    Caption = 'Tela'
    Checked = True
    TabOrder = 19
    TabStop = True
  end
  object rbImpressora: TRadioButton
    Left = 635
    Top = 164
    Width = 73
    Height = 17
    Caption = 'Impressora'
    TabOrder = 20
  end
  object btnEscolaImprimir: TButton
    Left = 632
    Top = 194
    Width = 90
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 21
    OnClick = btnEscolaImprimirClick
  end
  object dtpEscolaBuscarData: TDateTimePicker
    Left = 89
    Top = 39
    Width = 81
    Height = 21
    Date = 43444.631400567130000000
    Time = 43444.631400567130000000
    TabOrder = 1
  end
  object DBDateEditEscolaDataCadastro: TcxDBDateEdit
    Left = 485
    Top = 113
    BeepOnEnter = False
    DataBinding.DataField = 'ESCDATACAD'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    TabOrder = 5
    Width = 121
  end
  object DBMaskEditEscolaEndCEP: TcxDBMaskEdit
    Left = 35
    Top = 158
    DataBinding.DataField = 'ESCENDCEP'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.EditMask = '00000\-999;1;_'
    TabOrder = 6
    Width = 69
  end
end
