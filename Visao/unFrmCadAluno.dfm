inherited frmCadAluno: TfrmCadAluno
  Caption = 'Cadastro de Aluno'
  ClientHeight = 422
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblDataCadastro: TLabel
    Left = 618
    ExplicitLeft = 618
  end
  inherited lblFrmTitulo: TLabel
    Width = 180
    Caption = 'Cadastro Aluno'
    ExplicitWidth = 180
  end
  inherited lbDescricao: TLabel
    Left = 263
    Width = 77
    Caption = 'Nome completo:'
    ExplicitLeft = 263
    ExplicitWidth = 77
  end
  inherited lblEndRua: TLabel
    Top = 203
    ExplicitTop = 203
  end
  inherited lbEndNumero: TLabel
    Left = 674
    Top = 203
    ExplicitLeft = 674
    ExplicitTop = 203
  end
  inherited lbEndComplemento: TLabel
    Top = 246
    ExplicitTop = 246
  end
  inherited lblEndBairro: TLabel
    Top = 246
    ExplicitTop = 246
  end
  inherited lblEndCidade: TLabel
    Top = 246
    ExplicitTop = 246
  end
  inherited lblEndCep: TLabel
    Top = 203
    ExplicitTop = 203
  end
  object Label1: TLabel [10]
    Left = 88
    Top = 150
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object lblMatricula: TLabel [11]
    Left = 151
    Top = 102
    Width = 47
    Height = 13
    Caption = 'Matr'#237'cula:'
  end
  object Label2: TLabel [12]
    Left = 175
    Top = 150
    Width = 69
    Height = 13
    Caption = 'Nome da m'#227'e:'
  end
  object Label3: TLabel [13]
    Left = 463
    Top = 150
    Width = 63
    Height = 13
    Caption = 'Nome da pai:'
  end
  object maskEditCPF: TMaskEdit [14]
    Tag = 1
    Left = 88
    Top = 166
    Width = 90
    Height = 21
    Hint = 'CPF'
    CharCase = ecUpperCase
    Enabled = False
    EditMask = '000\.000\.000\-00;1;_'
    MaxLength = 14
    TabOrder = 12
    Text = '   .   .   -  '
  end
  inherited edtNome: TEdit [15]
    Left = 263
    Width = 349
    Hint = 'NOME COMPLETO'
    ExplicitLeft = 263
    ExplicitWidth = 349
  end
  object edtMatricula: TEdit [16]
    Tag = 1
    Left = 151
    Top = 118
    Width = 106
    Height = 21
    Hint = 'MATR'#205'CULA'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 9
    Text = 'EDTMATRICULA'
  end
  object edtNomeMae: TEdit [17]
    Tag = 1
    Left = 184
    Top = 166
    Width = 273
    Height = 21
    Hint = 'NOME DA M'#195'E'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 13
    Text = 'EDTNOMEMAE'
  end
  object edtNomePai: TEdit [18]
    Tag = 1
    Left = 463
    Top = 166
    Width = 276
    Height = 21
    Hint = 'NOME DO PAI'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 14
    Text = 'EDTNOMEPAI'
  end
  inherited btnNovoCadastro: TButton [19]
  end
  inherited btnGravar: TButton [20]
    OnClick = btnGravarClick
  end
  inherited btnAlterar: TButton [21]
  end
  inherited btnExcluir: TButton [22]
    TabOrder = 6
  end
  inherited btnCancelar: TButton [23]
  end
  inherited btnLimpar: TButton [24]
    TabOrder = 4
    OnClick = btnLimparClick
  end
  inherited btnFechar: TButton [25]
  end
  inherited btnConsultar: TButton [26]
    OnClick = btnConsultarClick
  end
  inherited edtEndNumero: TEdit [27]
    Left = 674
    Top = 219
    TabOrder = 17
    Text = 'EDTNUMERO'
    ExplicitLeft = 674
    ExplicitTop = 219
  end
  inherited edtEndRua: TEdit [28]
    Top = 219
    Width = 505
    TabOrder = 16
    ExplicitTop = 219
    ExplicitWidth = 505
  end
  inherited maskEditEndCEP: TMaskEdit [29]
    Top = 219
    Width = 69
    TabOrder = 15
    ExplicitTop = 219
    ExplicitWidth = 69
  end
  inherited edtCodigo: TEdit [30]
  end
  inherited cxDateEditDataCadastro: TcxDateEdit [31]
    Left = 618
    TabOrder = 11
    ExplicitLeft = 618
  end
  inherited edtEndComplemento: TEdit [32]
    Top = 262
    TabOrder = 18
    ExplicitTop = 262
  end
  inherited edtEndBairro: TEdit [33]
    Top = 262
    TabOrder = 19
    ExplicitTop = 262
  end
  inherited edtEndCidade: TEdit [34]
    Top = 262
    TabOrder = 20
    ExplicitTop = 262
  end
end
