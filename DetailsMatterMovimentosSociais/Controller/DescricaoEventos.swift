//
//  DescricaoEventos.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Gustavo Lemos on 17/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
protocol DescricaoEventosDelegate: class {
    func updateValues(tableView: UITableView?)
}
class DescricaoEventos: UIViewController {
    var evento: Evento?
    var tableView: UITableView?
    @IBOutlet weak var descricaoEventosTableView: UITableView!
    weak var delegate: EventoTableViewDelegate?
    weak var descricaoEventosDelegate: DescricaoEventosDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        descricaoEventosTableView.delegate = self
        descricaoEventosTableView.dataSource = self

    }

    @IBAction func dismissModal(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        delegate?.updateEventosViewController()
        descricaoEventosDelegate?.updateValues(tableView: tableView)
    }

}

extension DescricaoEventos: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = descricaoEventosTableView.dequeueReusableCell(withIdentifier: "cell1",
                                                                           for: indexPath) as?
                    CellOne else {return UITableViewCell()}
            cell.createCell(evento: evento)
            return cell
        }
        
        if indexPath.row == 1 {
            guard let cell = descricaoEventosTableView.dequeueReusableCell(withIdentifier: "cell2",
                                                                           for: indexPath) as?
                    CellTwo else {return UITableViewCell()}
            cell.createCell(evento: evento)
            return cell
        }
        if indexPath.row == 2 {
            guard let cell = descricaoEventosTableView.dequeueReusableCell(withIdentifier: "cell3",
                                                                           for: indexPath) as?
                    CellThree else {return UITableViewCell()}
            cell.createCell(evento: evento)
            return cell
        } else {
            guard let cell = descricaoEventosTableView.dequeueReusableCell(withIdentifier: "cell4",
                                                                           for: indexPath) as?
                    CellFour else {return UITableViewCell()}
            cell.createCell(evento: evento)
            return cell
        }
        
    }
    
}
