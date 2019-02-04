inherited frmCadEscola: TfrmCadEscola
  Caption = 'Cadastro de Escola'
  ClientHeight = 269
  OnClose = FormClose
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblFrmTitulo: TLabel
    Width = 224
    Caption = 'Cadastro de Escola'
    ExplicitWidth = 224
  end
  inherited btnNovoCadastro: TButton
    OnClick = btnNovoCadastroClick
  end
  inherited btnGravar: TButton
    Enabled = True
    OnClick = btnGravarClick
  end
  inherited btnAlterar: TButton
    OnClick = btnAlterarClick
  end
  inherited btnCancelar: TButton
    Enabled = True
    OnClick = btnCancelarClick
  end
  inherited btnLimpar: TButton
    Enabled = True
    OnClick = btnLimparClick
  end
  inherited btnFechar: TButton
    OnClick = btnFecharClick
  end
  object btnEscolaPesquisar: TButton [17]
    Left = 88
    Top = 71
    Width = 69
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 7
    OnClick = btnEscolaPesquisarClick
  end
  inherited edtCodigo: TEdit
    TabOrder = 8
  end
  inherited cxDateEditDataCadastro: TcxDateEdit
    TabOrder = 9
  end
  inherited edtNome: TEdit
    TabOrder = 10
    OnKeyPress = AvancarCampo
  end
  inherited maskEditEndCEP: TMaskEdit
    TabOrder = 11
  end
  inherited edtEndRua: TEdit
    TabOrder = 12
  end
  inherited edtEndNumero: TEdit
    TabOrder = 13
  end
  inherited edtEndComplemento: TEdit
    TabOrder = 14
  end
  inherited edtEndBairro: TEdit
    TabOrder = 15
  end
  inherited edtEndCidade: TEdit
    TabOrder = 16
  end
end
