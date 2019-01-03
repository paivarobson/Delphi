object frmCadEscola: TfrmCadEscola
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Escola'
  ClientHeight = 500
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEscolaCodigo: TLabel
    Left = 96
    Top = 89
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lblEscolaNome: TLabel
    Left = 159
    Top = 89
    Width = 34
    Height = 13
    Caption = 'Escola:'
    FocusControl = DBEditEscolaNome
  end
  object lblEscolaDataCadastro: TLabel
    Left = 546
    Top = 89
    Width = 87
    Height = 13
    Caption = 'Data de cadastro:'
  end
  object lblEscolaEndRua: TLabel
    Left = 171
    Top = 134
    Width = 23
    Height = 13
    Caption = 'Rua:'
    FocusControl = DBEditEscolaEndRua
  end
  object lblEscolaEndNumero: TLabel
    Left = 602
    Top = 134
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lblEscolaEndComplemento: TLabel
    Left = 96
    Top = 177
    Width = 69
    Height = 13
    Caption = 'Complemento:'
    FocusControl = DBEditEscolaEndComplemento
  end
  object lblEscolaEndBairro: TLabel
    Left = 327
    Top = 177
    Width = 32
    Height = 13
    Caption = 'Bairro:'
    FocusControl = DBEditEscolaEndBairro
  end
  object lblEscolaEndCidade: TLabel
    Left = 520
    Top = 177
    Width = 37
    Height = 13
    Caption = 'Cidade:'
    FocusControl = DBEditEscolaEndCidade
  end
  object lblEscolaendCep: TLabel
    Left = 96
    Top = 134
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lblEscolaFrmTitulo: TLabel
    Left = 253
    Top = 0
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
    Left = 159
    Top = 105
    DataBinding.DataField = 'ESCNOME'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = AvancarCampo
    Width = 381
  end
  object DBEditEscolaEndRua: TcxDBTextEdit
    Left = 171
    Top = 150
    DataBinding.DataField = 'ESCENDRUA'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 5
    OnKeyPress = AvancarCampo
    Width = 425
  end
  object DBEditEscolaEndComplemento: TcxDBTextEdit
    Left = 96
    Top = 193
    DataBinding.DataField = 'ESCENDCOMP'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    OnKeyPress = AvancarCampo
    Width = 225
  end
  object DBEditEscolaEndBairro: TcxDBTextEdit
    Left = 327
    Top = 193
    DataBinding.DataField = 'ESCENDBAIRRO'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 8
    OnKeyPress = AvancarCampo
    Width = 187
  end
  object DBEditEscolaEndCidade: TcxDBTextEdit
    Left = 520
    Top = 193
    DataBinding.DataField = 'ESCENDCIDADE'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.CharCase = ecUpperCase
    TabOrder = 9
    OnKeyPress = AvancarCampo
    Width = 147
  end
  object DBEditEscolaEndNumero: TcxDBTextEdit
    Left = 602
    Top = 150
    DataBinding.DataField = 'ESCENDNUM'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    TabOrder = 6
    OnKeyPress = DBEditEscolaEndNumeroKeyPress
    Width = 65
  end
  object btnEscolaNovoCadastro: TButton
    Left = 228
    Top = 234
    Width = 83
    Height = 25
    Caption = 'Novo cadastro'
    TabOrder = 10
    OnClick = btnEscolaNovoCadastroClick
    OnKeyPress = AvancarCampo
  end
  object btnEscolaGravar: TButton
    Left = 317
    Top = 234
    Width = 46
    Height = 25
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 11
    OnClick = btnEscolaGravarClick
    OnKeyPress = AvancarCampo
  end
  object btnEscolaAlterar: TButton
    Left = 369
    Top = 234
    Width = 54
    Height = 25
    Caption = 'Alterar'
    TabOrder = 12
    OnClick = btnEscolaAlterarClick
    OnKeyPress = AvancarCampo
  end
  object btnEscolaExcluir: TButton
    Left = 544
    Top = 234
    Width = 50
    Height = 25
    Caption = 'Excluir'
    TabOrder = 15
    OnClick = btnEscolaExcluirClick
    OnKeyPress = AvancarCampo
  end
  object btnEscolaCancelar: TButton
    Left = 483
    Top = 234
    Width = 55
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 14
    OnClick = btnEscolaCancelarClick
    OnKeyPress = AvancarCampo
  end
  object btnEscolaLimpar: TButton
    Left = 429
    Top = 234
    Width = 48
    Height = 25
    Caption = 'Limpar'
    Enabled = False
    TabOrder = 13
    OnClick = btnEscolaLimparClick
    OnKeyPress = AvancarCampo
  end
  object DBEditEscolaCod: TcxDBTextEdit
    Left = 96
    Top = 105
    DataBinding.DataField = 'ESCCOD'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    ParentFont = False
    TabOrder = 1
    OnKeyPress = AvancarCampo
    Width = 57
  end
  object btnEscolaPesquisar: TButton
    Left = 96
    Top = 58
    Width = 69
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 0
    OnClick = btnEscolaPesquisarClick
    OnKeyPress = AvancarCampo
  end
  object DBDateEditEscolaDataCadastro: TcxDBDateEdit
    Left = 546
    Top = 105
    BeepOnEnter = False
    DataBinding.DataField = 'ESCDATACAD'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    TabOrder = 3
    OnKeyPress = AvancarCampo
    Width = 121
  end
  object DBMaskEditEscolaEndCEP: TcxDBMaskEdit
    Left = 96
    Top = 150
    DataBinding.DataField = 'ESCENDCEP'
    DataBinding.DataSource = fmdados.dsEscola
    Enabled = False
    Properties.EditMask = '00000\-999;1;_'
    TabOrder = 4
    OnKeyPress = DBEditEscolaEndNumeroKeyPress
    Width = 69
  end
  object btnEscolaFechar: TButton
    Left = 600
    Top = 234
    Width = 67
    Height = 25
    Caption = 'Fechar'
    TabOrder = 16
    OnClick = btnEscolaFecharClick
  end
end
