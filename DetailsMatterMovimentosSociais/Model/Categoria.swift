//
//  Categoria.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 11/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class Categoria {
    let categoriaId: UUID
    let nome: String
    let imagem: String
    let movimentos: [Movimento]
    
    init(categoriaId: UUID = UUID(), nome: String, imagem: String, movimentos: [Movimento]) {
        self.categoriaId = categoriaId
        self.nome = nome
        self.imagem = imagem
        self.movimentos = movimentos
    }
}
