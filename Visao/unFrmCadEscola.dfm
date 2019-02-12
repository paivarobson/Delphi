inherited frmCadEscola: TfrmCadEscola
  Caption = 'Cadastro de Escola'
  ClientHeight = 269
  OnShow = FormShow
  ExplicitWidth = 806
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblFrmTitulo: TLabel
    Width = 224
    Caption = 'Cadastro de Escola'
    ExplicitWidth = 224
  end
  inherited btnGravar: TButton
    Enabled = True
    OnClick = btnGravarClick
  end
  inherited btnAlterar: TButton
    OnClick = btnAlterarClick
  end
  inherited btnExcluir: TButton
    TabOrder = 6
    OnClick = btnExcluirClick
  end
  inherited btnCancelar: TButton
    Enabled = True
    OnClick = btnCancelarClick
  end
  inherited btnLimpar: TButton
    Enabled = True
    TabOrder = 4
    OnClick = btnLimparClick
  end
  inherited btnFechar: TButton
    OnClick = btnFecharClick
  end
  inherited edtCodigo: TEdit
    OnKeyPress = edtEndNumeroKeyPress
  end
  inherited cxDateEditDataCadastro: TcxDateEdit
    TabOrder = 10
  end
  inherited edtNome: TEdit
    TabOrder = 9
    OnKeyPress = edtNomeKeyPress
  end
  inherited maskEditEndCEP: TMaskEdit
    OnKeyPress = edtEndNumeroKeyPress
  end
  inherited edtEndRua: TEdit
    OnKeyPress = edtNomeKeyPress
  end
  inherited edtEndNumero: TEdit
    OnKeyPress = edtEndNumeroKeyPress
  end
  inherited edtEndComplemento: TEdit
    OnKeyPress = edtNomeKeyPress
  end
  inherited edtEndBairro: TEdit
    OnKeyPress = edtNomeKeyPress
  end
  inherited edtEndCidade: TEdit
    OnKeyPress = edtNomeKeyPress
  end
  inherited btnConsultar: TButton
    OnClick = btnConsultarClick
  end
end
