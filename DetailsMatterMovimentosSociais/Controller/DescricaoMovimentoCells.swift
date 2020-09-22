//
//  DescricaoMovimentoCells.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 21/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CellImageCapa: UITableViewCell {
    @IBOutlet weak var imageCapa: UIImageView!

    func setupImageCapa(movimento: Movimento) {
        imageCapa.image = UIImage(named: movimento.imagem)
        imageCapa.contentMode = .scaleAspectFit
        imageCapa.backgroundColor = .white
    }
    
}

class CellSobre: UITableViewCell {

    @IBOutlet weak var descricao: UILabel!
    
    func setupDescricao(movimento: Movimento) {
          descricao.text = movimento.descricao
      }
    
}

class CellRedesSociais: UITableViewCell {
    @IBOutlet weak var buttonInstagram: UIButton!
    
    @IBOutlet weak var buttonWeb: UIButton!
    
    @IBOutlet weak var buttonFacebook: UIButton!
    
    var movimento: Movimento?
    
    func checkButtonsRedes() {
        if movimento?.urlFacebook == nil {
            buttonFacebook.isHidden = true
        }
        if movimento?.urlInstagram == nil {
            buttonInstagram.isHidden = true
        }
        if movimento?.urlWebSite == nil {
            buttonWeb.isHidden = true
        }
    }
    
    @IBAction func goToInstagram(_ sender: Any) {
        if let url = URL(string: movimento?.urlInstagram ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToWeb(_ sender: Any) {
        if let url = URL(string: movimento?.urlWebSite ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToFacebook(_ sender: Any) {
        if let url = URL(string: movimento?.urlFacebook ?? "") {
            UIApplication.shared.open(url)
        }
    }
}
