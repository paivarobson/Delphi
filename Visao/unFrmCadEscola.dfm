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
  end
  object lblEscolaEndBairro: TLabel
    Left = 327
    Top = 177
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object lblEscolaEndCidade: TLabel
    Left = 520
    Top = 177
    Width = 37
    Height = 13
    Caption = 'Cidade:'
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
  object edtEscolaNome: TEdit
    Tag = 1
    Left = 159
    Top = 105
    Width = 381
    Height = 21
    Hint = 'ESCOLA'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 2
    Text = 'EDTESCOLANOME'
    OnKeyPress = AvancarCampo
  end
  object edtEscolaCodigo: TEdit
    Tag = 1
    Left = 96
    Top = 105
    Width = 57
    Height = 21
    Hint = 'C'#211'DIGO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 1
    Text = 'EDTESCOLACODIGO'
    OnKeyPress = AvancarCampo
  end
  object cxDateEditEscolaDataCadastro: TcxDateEdit
    Tag = 1
    Left = 546
    Top = 105
    Hint = 'DATA'
    Enabled = False
    TabOrder = 3
    OnKeyPress = AvancarCampo
    Width = 121
  end
  object maskEditEscolaEndCEP: TMaskEdit
    Tag = 1
    Left = 96
    Top = 150
    Width = 68
    Height = 21
    Hint = 'CEP'
    CharCase = ecUpperCase
    Enabled = False
    EditMask = '00000\-999;1;_'
    MaxLength = 9
    TabOrder = 4
    Text = '     -   '
    OnKeyPress = edtEscolaEndNumeroKeyPress
  end
  object edtEscolaEndRua: TEdit
    Tag = 1
    Left = 171
    Top = 150
    Width = 425
    Height = 21
    Hint = 'RUA'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 5
    Text = 'EDTESCOLAENDRUA'
    OnKeyPress = AvancarCampo
  end
  object edtEscolaEndNumero: TEdit
    Tag = 1
    Left = 602
    Top = 150
    Width = 65
    Height = 21
    Hint = 'N'#218'MERO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 6
    Text = 'EDTESCOLACODIGO'
    OnKeyPress = edtEscolaEndNumeroKeyPress
  end
  object edtEscolaEndComplemento: TEdit
    Left = 96
    Top = 193
    Width = 225
    Height = 21
    Hint = 'COMPLEMENTO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 7
    Text = 'EDTESCOLAENDCOMPLEMENTO'
    OnKeyPress = AvancarCampo
  end
  object edtEscolaEndBairro: TEdit
    Tag = 1
    Left = 327
    Top = 193
    Width = 187
    Height = 21
    Hint = 'BAIRRO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 8
    Text = 'EDTESCOLAENDBAIRRO'
    OnKeyPress = AvancarCampo
  end
  object edtEscolaEndCidade: TEdit
    Tag = 1
    Left = 520
    Top = 193
    Width = 147
    Height = 21
    Hint = 'CIDADE'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 9
    Text = 'EDTESCOLAENDCIDADE'
    OnKeyPress = AvancarCampo
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
