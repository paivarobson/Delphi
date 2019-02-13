inherited frmPesquisaAluno: TfrmPesquisaAluno
  Caption = 'frmPesquisaAluno'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblTituloLista: TLabel
    Width = 177
    Caption = 'Consulta Aluno'
    ExplicitWidth = 177
  end
  inherited DBGridListaEscola: TDBGrid
    DataSource = fmdados.dsAluno
    OnDblClick = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'ALUCOD'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUMAT'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNOME'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUDATACAD'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUCPF'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNOMEMAE'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNOMEPAI'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDCEP'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDRUA'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDNUM'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDCOMP'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDBAIRRO'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUENDCIDADE'
        Width = 150
        Visible = True
      end>
  end
end
