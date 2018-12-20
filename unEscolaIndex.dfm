object frmEscolaIndex: TfrmEscolaIndex
  Left = 0
  Top = 0
  Caption = 'Boas-vindas'
  ClientHeight = 334
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmEscola
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblEscolaBoasVindas: TLabel
    Left = 152
    Top = 104
    Width = 383
    Height = 64
    Caption = 'Seja bem-vindo!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mmEscola: TMainMenu
    Left = 104
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object Novo1: TMenuItem
        Caption = 'Novo'
        object Cadastro2: TMenuItem
          Caption = 'Cadastro'
          object escola1: TMenuItem
            Caption = '&Escola'
            OnClick = escola1Click
          end
        end
      end
      object Cadastro1: TMenuItem
        Caption = 'Sair'
        OnClick = Cadastro1Click
      end
    end
    object Pesquisar1: TMenuItem
      Caption = 'Visualizar'
      object Consultar1: TMenuItem
        Caption = 'Consultar'
        object Escola2: TMenuItem
          Caption = 'Escola'
          OnClick = Escola2Click
        end
      end
    end
  end
end
