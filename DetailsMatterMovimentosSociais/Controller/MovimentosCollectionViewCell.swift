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
    var addedGradient = false
    override func awakeFromNib() {
        super.awakeFromNib()
        cardTitle.textColor = .white
        cardImage.clipsToBounds = true
        cardImage.contentMode = .scaleAspectFill
        cardImage.layer.cornerRadius = 8
        view.layer.cornerRadius = 8
        cardGradientView.layer.cornerRadius = 8
        cardGradientView.clipsToBounds = true 
    }
    
    public func configuraGradient(size: CGSize) {
        
        if !self.addedGradient {
        
            let secondColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
                        
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.clear.cgColor, secondColor]
            gradientLayer.locations = [0.0, 1.0]
            
            gradientLayer.frame = CGRect(origin: .zero, size: size)
            
            cardGradientView.layer.insertSublayer(gradientLayer, at: 0)
            self.addedGradient = true
        }
    }
    
    func setData(image: String, title: String) {
        self.cardImage.image = UIImage(named: image)
        self.cardTitle.text = title
    }
    
}
