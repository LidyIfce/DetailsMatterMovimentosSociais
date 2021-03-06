//
//  Evento.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 11/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

class Evento {
    let eventoId: String
    let nome: String
    let movimento: String
    let descricao: String
    let data: [String]
    let hora: [String]
    let localizacao: String
    
    init(nome: String,
         movimento: String,
         descricao: String,
         data: [String],
         hora: [String],
         localizacao: String) {
        self.eventoId = nome + "\(nome.count)" + "\(descricao.count)"
        self.nome = nome
        self.movimento = movimento
        self.descricao = descricao
        self.data = data
        self.hora = hora
        self.localizacao = localizacao
    }
    
    func getData() -> [Date] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        var dates: [Date] = []
        for date in data {
            dates.append(dateFormatter.date(from: date) ?? Date())
        }
        return dates
    }
    
    func getDataHoraString() -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.setLocalizedDateFormatFromTemplate("d MMMM")
        var dataString: [String] = []
        let datas = getData()
        for (ind, date) in datas.enumerated() {
            dataString.append(dateFormatter.string(from: date) + " " + hora[ind] + "h")
        }
        return dataString
    }
}
