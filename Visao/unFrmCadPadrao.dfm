object frmCadPadrao: TfrmCadPadrao
  Left = 0
  Top = 0
  Caption = 'Cadastro Padr'#227'o'
  ClientHeight = 227
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TLabel
    Left = 32
    Top = 78
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lblDataCadastro: TLabel
    Left = 482
    Top = 78
    Width = 87
    Height = 13
    Caption = 'Data de cadastro:'
  end
  object lblFrmTitulo: TLabel
    Left = 197
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
    Left = 95
    Top = 78
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblEndRua: TLabel
    Left = 107
    Top = 123
    Width = 23
    Height = 13
    Caption = 'Rua:'
  end
  object lbEndNumero: TLabel
    Left = 538
    Top = 123
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lbEndComplemento: TLabel
    Left = 32
    Top = 166
    Width = 69
    Height = 13
    Caption = 'Complemento:'
  end
  object lblEndBairro: TLabel
    Left = 263
    Top = 166
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object lblEndCidade: TLabel
    Left = 456
    Top = 166
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object lblEndCep: TLabel
    Left = 32
    Top = 123
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object btnNovoCadastro: TButton
    Left = 164
    Top = 47
    Width = 83
    Height = 25
    Caption = 'Novo cadastro'
    TabOrder = 0
    OnClick = btnNovoCadastroClick
  end
  object btnGravar: TButton
    Left = 253
    Top = 47
    Width = 46
    Height = 25
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 1
  end
  object btnAlterar: TButton
    Left = 305
    Top = 47
    Width = 54
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
  end
  object btnExcluir: TButton
    Left = 480
    Top = 47
    Width = 50
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
  end
  object btnCancelar: TButton
    Left = 419
    Top = 47
    Width = 55
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 4
  end
  object btnLimpar: TButton
    Left = 365
    Top = 47
    Width = 48
    Height = 25
    Caption = 'Limpar'
    Enabled = False
    TabOrder = 5
  end
  object btnFechar: TButton
    Left = 536
    Top = 47
    Width = 67
    Height = 25
    Caption = 'Fechar'
    TabOrder = 6
  end
  object edtCodigo: TEdit
    Tag = 1
    Left = 32
    Top = 94
    Width = 57
    Height = 21
    Hint = 'C'#211'DIGO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 7
    Text = 'EDTCODIGO'
  end
  object cxDateEditDataCadastro: TcxDateEdit
    Tag = 1
    Left = 482
    Top = 94
    Hint = 'DATA'
    Enabled = False
    TabOrder = 8
    Width = 121
  end
  object edtNome: TEdit
    Tag = 1
    Left = 95
    Top = 94
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
    Left = 32
    Top = 139
    Width = 68
    Height = 21
    Hint = 'CEP'
    CharCase = ecUpperCase
    Enabled = False
    EditMask = '00000\-999;1;_'
    MaxLength = 9
    TabOrder = 10
    Text = '     -   '
  end
  object edtEndRua: TEdit
    Tag = 1
    Left = 107
    Top = 139
    Width = 425
    Height = 21
    Hint = 'RUA'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 11
    Text = 'EDTENDRUA'
  end
  object edtEndNumero: TEdit
    Tag = 1
    Left = 538
    Top = 139
    Width = 65
    Height = 21
    Hint = 'N'#218'MERO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 12
    Text = 'EDTCODIGO'
  end
  object edtEndComplemento: TEdit
    Left = 32
    Top = 182
    Width = 225
    Height = 21
    Hint = 'COMPLEMENTO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 13
    Text = 'EDTENDCOMPLEMENTO'
  end
  object edtEndBairro: TEdit
    Tag = 1
    Left = 263
    Top = 182
    Width = 187
    Height = 21
    Hint = 'BAIRRO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 14
    Text = 'EDTENDBAIRRO'
  end
  object edtEndCidade: TEdit
    Tag = 1
    Left = 456
    Top = 182
    Width = 147
    Height = 21
    Hint = 'CIDADE'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 15
    Text = 'EDTENDCIDADE'
  end
end
