//
//  MovimentosCollectionViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Helaine Pontes on 17/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class MovimentosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardGradientView: UIView!
    @IBOutlet weak var view: UIView!
    
    static let identifier = "identifier"
    static let xibName = "CardMovimentos_Coletivos"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardImage.clipsToBounds = true
        cardImage.contentMode = .scaleAspectFill
        cardImage.layer.cornerRadius = 8
        view.layer.cornerRadius = 8
        cardGradientView.layer.cornerRadius = 8
//        let gradient = CAGradientLayer()
//        gradient.colors = [UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0).cgColor,
//                           UIColor(red: 177/255, green: 174/255, blue: 174/255, alpha: 43).cgColor,
//                           UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 31).cgColor]
//        gradient.frame = cardGradientView.bounds
//        cardGradientView.layer.addSublayer(gradient)

    }
    
    func setData(image: String, title: String) {
        self.cardImage.image = UIImage(named: image)
        self.cardTitle.text = title
    }
    
}
