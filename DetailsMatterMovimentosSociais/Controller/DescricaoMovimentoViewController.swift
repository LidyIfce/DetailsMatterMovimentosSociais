//
//  DescricaoMovimentoViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 16/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class DescricaoMovimentoViewController: UIViewController {
    
    let movimento = MulheresMock().semprevivaOrganizacaoFeminista
    var datas: [Date] = []
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var movimentoTitle: UILabel!
    @IBOutlet weak var buttonSeguir: UIBarButtonItem!

    override func viewDidLoad() {

        super.viewDidLoad()
        
        view.backgroundColor = .backGroundColor
        configureTable()
        for mov in movimento.eventos {
            let date = mov.getData()
            for date in date {
                datas.append(date)
            }
        }
     
        movimentoTitle.text = movimento.nome
        navigationController?.navigationBar.shadowImage = UIImage()
      
    }
  
    func configureTable() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
    }
}

extension DescricaoMovimentoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellImageCapa") as? CellImageCapa else {
                return UITableViewCell()
            }
            cell.setupImageCapa(movimento: movimento)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellSobre") as? CellSobre else {
                return UITableViewCell()
            }
            cell.setupDescricao(movimento: movimento)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellRedesSociais") as?
                    CellRedesSociais else {
                return UITableViewCell()
            }
            cell.movimento = movimento
            cell.checkButtonsRedes()
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellEventos") as?
                    CellEventos else {
                return UITableViewCell()
            }
            cell.createCell(datas: datas)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
