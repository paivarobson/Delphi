inherited frmPesquisaAluno: TfrmPesquisaAluno
  Caption = 'Pesquisar Aluno'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblTituloLista: TLabel
    Width = 177
    Caption = 'Consulta Aluno'
    ExplicitWidth = 177
  end
  inherited DBGridLista: TDBGrid
    DataSource = fmdados.dsAluno
    OnDblClick = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'ALUCOD'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUMAT'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNOME'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUDATACAD'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUCPF'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNOMEMAE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNOMEPAI'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDCEP'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDRUA'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDNUM'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDCOMP'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDBAIRRO'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDCIDADE'
        Width = 120
        Visible = True
      end>
  end
end
