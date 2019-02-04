object frmCadPadrao: TfrmCadPadrao
  Left = 0
  Top = 0
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Padr'#227'o'
  ClientHeight = 283
  ClientWidth = 800
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
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TLabel
    Left = 88
    Top = 102
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lblDataCadastro: TLabel
    Left = 538
    Top = 102
    Width = 87
    Height = 13
    Caption = 'Data de cadastro:'
  end
  object lblFrmTitulo: TLabel
    Left = 253
    Top = 0
    Width = 196
    Height = 33
    Caption = 'Cadastro Padr'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbDescricao: TLabel
    Left = 151
    Top = 102
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblEndRua: TLabel
    Left = 163
    Top = 147
    Width = 23
    Height = 13
    Caption = 'Rua:'
  end
  object lbEndNumero: TLabel
    Left = 594
    Top = 147
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lbEndComplemento: TLabel
    Left = 88
    Top = 190
    Width = 69
    Height = 13
    Caption = 'Complemento:'
  end
  object lblEndBairro: TLabel
    Left = 319
    Top = 190
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object lblEndCidade: TLabel
    Left = 512
    Top = 190
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object lblEndCep: TLabel
    Left = 88
    Top = 147
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object btnNovoCadastro: TButton
    Left = 220
    Top = 71
    Width = 83
    Height = 25
    Caption = 'Novo cadastro'
    TabOrder = 0
  end
  object btnGravar: TButton
    Left = 309
    Top = 71
    Width = 46
    Height = 25
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 1
  end
  object btnAlterar: TButton
    Left = 361
    Top = 71
    Width = 54
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
  end
  object btnExcluir: TButton
    Left = 536
    Top = 71
    Width = 50
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
  end
  object btnCancelar: TButton
    Left = 475
    Top = 71
    Width = 55
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 4
  end
  object btnLimpar: TButton
    Left = 421
    Top = 71
    Width = 48
    Height = 25
    Caption = 'Limpar'
    Enabled = False
    TabOrder = 5
  end
  object btnFechar: TButton
    Left = 592
    Top = 71
    Width = 67
    Height = 25
    Caption = 'Fechar'
    TabOrder = 6
    OnClick = btnFecharClick
  end
  object edtCodigo: TEdit
    Tag = 1
    Left = 88
    Top = 118
    Width = 57
    Height = 21
    Hint = 'C'#211'DIGO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 7
    Text = 'EDTCODIGO'
    OnKeyPress = AvancarCampo
  end
  object cxDateEditDataCadastro: TcxDateEdit
    Tag = 1
    Left = 538
    Top = 118
    Hint = 'DATA'
    Enabled = False
    TabOrder = 8
    Width = 121
  end
  object edtNome: TEdit
    Tag = 1
    Left = 151
    Top = 118
    Width = 381
    Height = 21
    Hint = 'ESCOLA'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 9
    Text = 'EDTDESCRICAO'
  end
  object maskEditEndCEP: TMaskEdit
    Tag = 1
    Left = 88
    Top = 163
    Width = 68
    Height = 21
    Hint = 'CEP'
    CharCase = ecUpperCase
    Enabled = False
    EditMask = '00000\-999;1;_'
    MaxLength = 9
    TabOrder = 10
    Text = '     -   '
    OnKeyPress = edtEndNumeroKeyPress
  end
  object edtEndRua: TEdit
    Tag = 1
    Left = 163
    Top = 163
    Width = 425
    Height = 21
    Hint = 'RUA'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 11
    Text = 'EDTENDRUA'
    OnKeyPress = AvancarCampo
  end
  object edtEndNumero: TEdit
    Tag = 1
    Left = 594
    Top = 163
    Width = 65
    Height = 21
    Hint = 'N'#218'MERO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 12
    Text = 'EDTCODIGO'
    OnKeyPress = edtEndNumeroKeyPress
  end
  object edtEndComplemento: TEdit
    Left = 88
    Top = 206
    Width = 225
    Height = 21
    Hint = 'COMPLEMENTO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 13
    Text = 'EDTENDCOMPLEMENTO'
    OnKeyPress = AvancarCampo
  end
  object edtEndBairro: TEdit
    Tag = 1
    Left = 319
    Top = 206
    Width = 187
    Height = 21
    Hint = 'BAIRRO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 14
    Text = 'EDTENDBAIRRO'
    OnKeyPress = AvancarCampo
  end
  object edtEndCidade: TEdit
    Tag = 1
    Left = 512
    Top = 206
    Width = 147
    Height = 21
    Hint = 'CIDADE'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 15
    Text = 'EDTENDCIDADE'
    OnKeyPress = AvancarCampo
  end
end
