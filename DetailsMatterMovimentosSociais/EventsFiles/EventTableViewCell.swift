//
//  EventTableViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Leonardo Gomes Fernandes on 16/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

protocol EventoTableViewDelegate: class {
    func updateEventosViewController()
}

class EventTableViewCell: UITableViewCell {
    
    var participating : Bool = false
    @IBOutlet weak var participanteButton: UIButton!
    @IBOutlet weak var viewCellToShadow: UIView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var movimentNameLabel: UILabel!
    @IBOutlet weak var dateEventLabel: UILabel!
    @IBOutlet weak var placeEventLabel: UILabel!
        
    @IBOutlet weak var buttonParticipar: UIButton!
    
    @IBOutlet weak var checkButton: AnimationCheckButton!
    weak var delegate: EventoTableViewDelegate?
    
    var evento: Evento?
    
    @IBAction func chckParticpar(_ sender: AnimationCheckButton) {
//        if sender.isSelected {
//            // deselect
//            sender.deselect()
//        } else {
//            // select with animation
//            sender.select()
//        }
        if let evento = evento {
            if Persistence.containsEvento(eventoId: evento.eventoId) {
                Persistence.stopParticipating(eventoId: evento.eventoId)
                checkButton.deselect()
                checkButton.imageColorOn = .confirmedColor
                checkButton.imageColorOff = .actionColor
                buttonParticipar.setTitle("Participar", for: .normal)
                buttonParticipar.setTitleColor(.actionColor, for: .normal)
                delegate?.updateEventosViewController()
            } else {
                Persistence.participate(eventoId: evento.eventoId)
               
                checkButton.select()
                checkButton.imageColorOff = .actionColor
                checkButton.imageColorOn = .confirmedColor
                buttonParticipar.setTitle("Participando", for: .normal)
                buttonParticipar.setTitleColor(.confirmedColor, for: .normal)
            }
        }
    }
    
    @IBAction func participar() {
        chckParticpar(checkButton)
    }
    
    func createCell(evento: Evento) {
        Persistence.setInitialValues()
        
        if Persistence.containsEvento(eventoId: evento.eventoId) {
            checkButton.imageColorOff = .confirmedColor
            checkButton.imageColorOn = .confirmedColor
            buttonParticipar.setTitle("Participando", for: .normal)
            buttonParticipar.setTitleColor(.confirmedColor, for: .normal)
        } else {
            checkButton.imageColorOff = .actionColor
            checkButton.imageColorOn = .actionColor
            buttonParticipar.setTitle("Participar", for: .normal)
            buttonParticipar.setTitleColor(.actionColor, for: .normal)
        }
        
        self.evento = evento
        self.eventNameLabel.text = evento.nome
        self.dateEventLabel.text = evento.getDataHoraString()[0]
        self.placeEventLabel.text = evento.localizacao
        self.movimentNameLabel.text = evento.movimento
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewCellToShadow.layer.cornerRadius = 8
        viewCellToShadow.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewCellToShadow.layer.shadowColor = UIColor.black.cgColor
        viewCellToShadow.layer.shadowRadius = 18
        viewCellToShadow.layer.shadowOpacity = 0.3
        
        eventNameLabel.adjustsFontSizeToFitWidth = true
        eventNameLabel.minimumScaleFactor = 0.5
    }
}
