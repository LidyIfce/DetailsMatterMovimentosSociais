//
//  DescricaoMovimentoViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 16/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class DescricaoMovimentoViewController: UITableViewController {
    
    let movimento = MulheresMock().catolicasPeloDireitoDeDecidir
    
    @IBOutlet weak var buttonSeguir: UIBarButtonItem!
    @IBOutlet weak var imageCapa: UIImageView!
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var buttonInstagram: UIButton!
    @IBOutlet weak var buttonWeb: UIButton!
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonAlternarVisualizacao: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        checkButtonsRedes()
        setupImageCapa()
        setupDescricao()
        navigationController?.navigationItem.title = movimento.nome

    }
    @IBAction func goToInstagram(_ sender: Any) {
        if let url = URL(string: movimento.urlInstagram ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToWeb(_ sender: Any) {
        if let url = URL(string: movimento.urlWebSite ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToFacebook(_ sender: Any) {
        if let url = URL(string: movimento.urlFacebook ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    func configureTable() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
    }
    
    func checkButtonsRedes() {
        if movimento.urlFacebook == nil {
            buttonFacebook.removeFromSuperview()
        }
        if movimento.urlInstagram == nil {
            buttonInstagram.removeFromSuperview()
            let filteredConstraints = buttonWeb.constraints.filter { $0.identifier == "webLeftButton" }
            if let yourConstraint = filteredConstraints.first {
                print(yourConstraint)
                for (ind, const) in buttonWeb.constraints.enumerated() where const == yourConstraint {
                    print(const)
                    buttonWeb.constraints[ind].isActive = false
                    buttonWeb.translatesAutoresizingMaskIntoConstraints = false
                    buttonWeb.leadingAnchor.constraint(equalTo: buttonWeb.superview!.leadingAnchor,
                                                    constant: 16).isActive = true
                }
            }
        }
        if movimento.urlWebSite == nil {
            buttonWeb.removeFromSuperview()
        }
    }
    
    func setupImageCapa() {
        imageCapa.image = UIImage(named: movimento.imagem)
        imageCapa.contentMode = .scaleAspectFit
        imageCapa.backgroundColor = .white
    }
    
    func setupDescricao() {
        descricao.text = movimento.descricao
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 145
        }
        if indexPath.row == 1 {
            return calcDescricaoHeigth()
        }
        
        if indexPath.row == 2 {
            return 50
        }
        return 200
    }
    
    func calcDescricaoHeigth() -> CGFloat {
        let size = movimento.descricao.count
        return CGFloat(size - (size / 4))
    }
}
