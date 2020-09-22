//
//  EventTableViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Leonardo Gomes Fernandes on 16/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    var participating : Bool = false
    @IBOutlet weak var participanteButton: UIButton!
    @IBOutlet weak var viewCellToShadow: UIView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var movimentNameLabel: UILabel!
    @IBOutlet weak var dateEventLabel: UILabel!
    @IBOutlet weak var placeEventLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewCellToShadow.layer.cornerRadius = 8
        viewCellToShadow.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewCellToShadow.layer.shadowColor = UIColor.black.cgColor
        viewCellToShadow.layer.shadowRadius = 18
        viewCellToShadow.layer.shadowOpacity = 0.3
        
    }
    
    @IBAction func participandoButton(_ sender: UIButton) {
        if participating {
            sender.flash()
            participanteButton.setTitle("+ Participar", for: .normal)
            participanteButton.setTitleColor(.actionColor, for: .normal)
            participating = false
        } else {
            sender.flash()
            participanteButton.setTitle("✓ Participando", for: .normal)
            participanteButton.setTitleColor(.confirmedColor, for: .normal)
            participating = true
        }
    }

}
