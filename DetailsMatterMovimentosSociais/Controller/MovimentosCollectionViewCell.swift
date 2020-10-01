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
        cardTitle.textColor = .white
        cardImage.clipsToBounds = true
        cardImage.contentMode = .scaleAspectFill
        cardImage.layer.cornerRadius = 8
        view.layer.cornerRadius = 8
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor,
                           UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6).cgColor]
        gradient.frame = cardGradientView.bounds
        cardGradientView.layer.addSublayer(gradient)
        cardGradientView.layer.cornerRadius = 8
        cardGradientView.clipsToBounds = true

    }
    
    func setData(image: String, title: String) {
        self.cardImage.image = UIImage(named: image)
        self.cardTitle.text = title
    }
    
}
