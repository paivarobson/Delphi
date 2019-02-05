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
  inherited cxDateEditDataCadastro: TcxDateEdit
    Left = 618
    ExplicitLeft = 618
  end
  inherited edtNome: TEdit
    Left = 263
    Width = 349
    ExplicitLeft = 263
    ExplicitWidth = 349
  end
  inherited maskEditEndCEP: TMaskEdit
    Top = 219
    Width = 69
    ExplicitTop = 219
    ExplicitWidth = 69
  end
  inherited edtEndRua: TEdit
    Top = 219
    Width = 505
    ExplicitTop = 219
    ExplicitWidth = 505
  end
  inherited edtEndNumero: TEdit
    Left = 674
    Top = 219
    ExplicitLeft = 674
    ExplicitTop = 219
  end
  inherited edtEndComplemento: TEdit
    Top = 262
    ExplicitTop = 262
  end
  inherited edtEndBairro: TEdit
    Top = 262
    ExplicitTop = 262
  end
  inherited edtEndCidade: TEdit
    Top = 262
    ExplicitTop = 262
  end
  object Edit1: TEdit
    Tag = 1
    Left = 88
    Top = 166
    Width = 81
    Height = 21
    Hint = 'C'#211'DIGO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 16
    Text = 'EDTCODIGO'
  end
  object Edit2: TEdit
    Tag = 1
    Left = 151
    Top = 118
    Width = 106
    Height = 21
    Hint = 'C'#211'DIGO'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 17
    Text = 'EDTCODIGO'
  end
  object Edit5: TEdit
    Tag = 1
    Left = 175
    Top = 166
    Width = 282
    Height = 21
    Hint = 'ESCOLA'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 18
    Text = 'EDTDESCRICAO'
  end
  object Edit4: TEdit
    Tag = 1
    Left = 463
    Top = 166
    Width = 276
    Height = 21
    Hint = 'ESCOLA'
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 19
    Text = 'EDTDESCRICAO'
  end
end
