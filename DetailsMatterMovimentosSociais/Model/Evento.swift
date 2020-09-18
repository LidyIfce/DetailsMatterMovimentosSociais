//
//  Evento.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 11/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class Evento {
    let eventoId: UUID
    let nome: String
    let movimento: String
    let descricao: String
    let dataHora: String
    let localizacao: String
    
    init(eventoId: UUID = UUID(), nome: String, movimento: String, descricao: String, dataHora: String, localizacao: String) {
        self.eventoId = eventoId
        self.nome = nome
        self.movimento = movimento
        self.descricao = descricao
        self.dataHora = dataHora
        self.localizacao = localizacao
    }
    
    func getDataHora() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
       
        return dateFormatter.date(from: dataHora) ?? Date()
    }
    
    func getDataHoraString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.setLocalizedDateFormatFromTemplate("E, d MMMM aaaa HH: mm")
        return dateFormatter.string(from: getDataHora())
    }
}
