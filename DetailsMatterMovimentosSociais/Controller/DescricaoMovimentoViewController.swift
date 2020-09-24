//
//  DescricaoMovimentoViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 16/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
protocol CellEventosDelegate: class {
    func updateHeightOfRow()
}

protocol MovimentoDelegate: class {
    func didSelectedMovimento(movimento: Movimento)
}
class DescricaoMovimentoViewController: UIViewController {
 
    var movimento: Movimento?
    var eventos: [Evento] = []
    var datas: [Date] = []
    @IBOutlet weak var tableView: UITableView!
    let calendar = Calendar(identifier: .gregorian)
    @IBOutlet weak var buttonSeguir: UIBarButtonItem!
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    @IBAction func seguirMovimento(_ sender: Any) {
        if let movimento = movimento {
            if Persistence.containsMovimento(movimentoId: movimento.movimentoId) {
                Persistence.unfollow(movimentoId: movimento.movimentoId)
                buttonSeguir.title = "Seguir"
                buttonSeguir.tintColor = .actionColor
            } else {
                Persistence.follow(movimentoId: movimento.movimentoId)
                buttonSeguir.title = "Seguindo"
                buttonSeguir.tintColor = .confirmedColor
            }
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
      
        Persistence.setInitialValues()
        view.backgroundColor = .backGroundColor
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .backGroundColor
    
        tableView.tableHeaderView = nil
        configureTable()

        if let movimento = movimento {
            eventos = movimento.eventos
            
            if Persistence.containsMovimento(movimentoId: movimento.movimentoId) {
                buttonSeguir.title = "Seguindo"
                buttonSeguir.tintColor = .confirmedColor
            } else {
                buttonSeguir.title = "Seguir"
                buttonSeguir.tintColor = .actionColor
            }
        }
        for mov in eventos {
            let date = mov.getData()
            for date in date {
                datas.append(date)
            }
        }
    }
  
    override func viewWillAppear(_ animated: Bool) {
        view.reloadInputViews()
        tableView.reloadData()
    }
    
    func configureTable() {
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
    }
}

extension DescricaoMovimentoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    //swiftlint:disable cyclomatic_complexity
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellImageCapa") as? CellImageCapa else {
                return UITableViewCell()
            }
            if let movimento = movimento {
                cell.setupImageCapa(movimento: movimento)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellSobre") as? CellSobre else {
                return UITableViewCell()
            }
            if let movimento = movimento {
                cell.setupDescricao(movimento: movimento)
            }
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
            cell.delegate = self
            cell.createCell(datas: datas, eventos: eventos)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView()
    }
}

extension DescricaoMovimentoViewController: CellEventosDelegate {
    func updateHeightOfRow() {
            UIView.setAnimationsEnabled(false)
            tableView.beginUpdates()
            tableView.endUpdates()
            UIView.setAnimationsEnabled(true)
        }
}

extension DescricaoMovimentoViewController: MovimentoDelegate {
    func didSelectedMovimento(movimento: Movimento) {
        self.movimento = movimento
    }
}
