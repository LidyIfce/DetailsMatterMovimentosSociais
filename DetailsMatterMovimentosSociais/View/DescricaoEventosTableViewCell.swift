//
//  DescricaoEventosTableViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 29/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
class CellOne: UITableViewCell {
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var movimentTitle: UILabel!
    
    @IBOutlet weak var buttonParticipar: UIButton!
    
    func createCell(evento: Evento?) {
        eventTitle.text = evento?.nome
        movimentTitle.text = evento?.movimento
    }
}

class CellTwo: UITableViewCell {
    
    @IBOutlet weak var eventDescription: UILabel!
    func createCell(evento: Evento?) {
        eventDescription.text = evento?.descricao
    }
    
}

class CellThree: UITableViewCell {
    
    @IBOutlet weak var eventDate: UILabel!
    func createCell(evento: Evento?) {
        eventDate.text = evento?.getDataHoraString()[0]
    }
}

class CellFour: UITableViewCell {
    
    @IBOutlet weak var buttonMaps: UIButton!
    @IBOutlet weak var eventLocal: UILabel!
    
    func createCell(evento: Evento?) {
        eventLocal.text = evento?.localizacao
    }
}
