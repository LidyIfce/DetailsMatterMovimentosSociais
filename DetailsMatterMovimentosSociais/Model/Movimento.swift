//
//  Movimento.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 11/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
class Movimento {
    let movimentoId: String
    let nome: String
    let descricao: String
    let imagem: String
    let eventos: [Evento]
    let urlInstagram: String?
    let urlWebSite: String?
    let urlFacebook: String?
    
    init(nome: String,
         descricao: String,
         imagem: String,
         eventos: [Evento],
         urlInstagram: String?,
         urlWebSite: String? ,
         urlFacebook: String?) {
        self.nome = nome
        self.descricao = descricao
        self.imagem = imagem
        self.eventos = eventos
        self.urlInstagram = urlInstagram
        self.urlWebSite = urlWebSite
        self.urlFacebook = urlFacebook
        self.movimentoId = self.nome + "\(nome.count)" + "\(descricao.count)"
    }
}
