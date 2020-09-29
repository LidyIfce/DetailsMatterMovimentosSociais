//
//  ColetivosCollectionViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Helaine Pontes on 22/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class ColetivosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var coletivoImage: UIImageView!
    @IBOutlet weak var coletivoTitle: UILabel!
    
    static let identifier = "identifier"
    static let xibName = "CardColetivos"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coletivoTitle.textColor = .textColor
    }
    
    func setData(nome: String, image: String) {
        self.coletivoImage.image = UIImage(named: image)
        self.coletivoTitle.text = nome
        self.view.layer.cornerRadius = 8
    }
    
}
