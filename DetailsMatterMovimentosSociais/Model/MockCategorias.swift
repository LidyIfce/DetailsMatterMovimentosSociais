//
//  MockCategorias.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 11/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

//swiftlint:disable line_length

struct MockCategorias {
    static var mock: [Categoria] = [Categoria(nome: "Mulheres",
                                              imagem: "mulheres",
                                              movimentos: MulheresMock.movimentos), Categoria(nome: "LGBTQIA+", imagem: "lgbt", movimentos: MockLgbt.movimentos), Categoria(nome: "Movimento Negro", imagem: "negros", movimentos: MockNegros.movimentos), Categoria(nome: "Meio Ambiente", imagem: "meioAmbiente", movimentos: []), Categoria(nome: "Educação", imagem: "educacao", movimentos: []), Categoria(nome: "Infância", imagem: "infancia", movimentos: [])]
}
