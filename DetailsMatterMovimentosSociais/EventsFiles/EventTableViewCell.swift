//
//  EventTableViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Leonardo Gomes Fernandes on 16/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
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
        
//        eventNameLabel.text = "GitDay"
//        movimentNameLabel.text = "Pyladies"
//        dateEventLabel.text = "20 de Setembro de 2020 - 14h"
//        placeEventLabel.text = "Centro Universitário Farias Brito - FB Uni - Fortaleza - Ce"
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
