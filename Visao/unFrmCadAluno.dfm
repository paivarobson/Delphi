object frmCadAluno: TfrmCadAluno
  Left = 0
  Top = 0
  Caption = 'Cadastro de Alunos'
  ClientHeight = 287
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblAlunoMatricula: TLabel
    Left = 24
    Top = 11
    Width = 47
    Height = 13
    Caption = 'Matr'#237'cula:'
  end
  object lblAlunoNome: TLabel
    Left = 24
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Aluno:'
  end
  object edtAlunoMatricula: TEdit
    Left = 88
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtAlunoMatricula'
  end
  object edtAlunoNome: TEdit
    Left = 88
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtAlunoNome'
  end
  object dbgrdAluno: TDBGrid
    Left = 8
    Top = 96
    Width = 681
    Height = 183
    DataSource = dsAluno
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object tblAluno: TTable
    Left = 608
    Top = 8
  end
  object dsAluno: TDataSource
    DataSet = cdsAluno
    Left = 384
    Top = 16
  end
  object cdsAluno: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAluno'
    Left = 536
    Top = 40
  end
end
