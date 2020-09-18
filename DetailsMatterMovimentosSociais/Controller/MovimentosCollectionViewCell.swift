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
    
    func setData(image: String, title: String) {
        self.cardImage.image = UIImage(named: image)
        self.cardTitle.text = title
    }
}
