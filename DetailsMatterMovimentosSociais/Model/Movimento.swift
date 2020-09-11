//
//  Movimento.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 11/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
class Movimento {
    let movimentoId: UUID
    let nome: String
    let descricao: String
    let imagem: String
    let eventos: [Evento]
    
    init(movimentoId: UUID = UUID(), nome: String, descricao: String, imagem: String, eventos: [Evento] ) {
        self.movimentoId = movimentoId
        self.nome = nome
        self.descricao = descricao
        self.imagem = imagem
        self.eventos = eventos
    }
}
