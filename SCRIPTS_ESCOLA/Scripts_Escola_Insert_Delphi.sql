'INSERT ESCOLA ' +
                              '(ESCCOD, ' +
                              'ESCNOME, ' +
                              'ESCDATACAD, ' +
                              'ESCENDRUA, ' +
                              'ESCENDNUM, ' +
                              'ESCENDCOMP, ' +
                              'ESCENDBAIRRO, ' +
                              'ESCENDCIDADE, ' +
                              'ESCENDCEP) ' +
                              'VALUES ' +
                              '(%d, %s, %s, %s, %s, %s, %s, %s, %s)',
                              [
                              AEscolaModelo.Codigo,
                              AEscolaModelo.Nome,
                              AEscolaModelo.DataCadastro,
                              AEscolaModelo.Cep,
                              AEscolaModelo.Rua,
                              AEscolaModelo.Numero,
                              AEscolaModelo.Complemento,
                              AEscolaModelo.Bairro
                              ]