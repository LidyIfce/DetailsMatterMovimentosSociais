//
//  DescricaoEventosTableViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 29/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
class CellOne: UITableViewCell {
    
    var myEvento: Evento?
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var movimentTitle: UILabel!
    
    @IBOutlet weak var buttonParticipar: UIButton!
    
    @IBAction func participar(_ sender: Any) {
        if let evento = myEvento {
        
            if Persistence.containsEvento(eventoId: evento.eventoId) {
                Persistence.stopParticipating(eventoId: evento.eventoId)
                buttonParticipar.setTitle("Participar", for: .normal)
                buttonParticipar.setTitleColor(.actionColor, for: .normal)
            } else {
                Persistence.participate(eventoId: evento.eventoId)
                buttonParticipar.setTitle("Participando", for: .normal)
                buttonParticipar.setTitleColor(.confirmedColor, for: .normal)
            }
        }
    }
    
    func createCell(evento: Evento?) {
        self.myEvento = evento
      
        if let evento = myEvento {
            eventTitle.text = evento.nome
            movimentTitle.text = evento.movimento
            
            Persistence.setInitialValues()
            if Persistence.containsEvento(eventoId: evento.eventoId) {
                buttonParticipar.setTitle("Participando", for: .normal)
                buttonParticipar.setTitleColor(.confirmedColor, for: .normal)
            } else {
                buttonParticipar.setTitle("Participar", for: .normal)
                buttonParticipar.setTitleColor(.actionColor, for: .normal)
            }
            
        }
        
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
