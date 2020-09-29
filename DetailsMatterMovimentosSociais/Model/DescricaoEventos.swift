//
//  DescricaoEventos.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Gustavo Lemos on 17/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class DescricaoEventos: UIViewController {

    let one = "Git Day Fortaleza Hacktoberfest 2019"
    var dataSource: [String] = []
    @IBOutlet weak var descricaoEventosTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.append(one)
        descricaoEventosTableView.delegate = self
        descricaoEventosTableView.dataSource = self

    }

    @IBAction func dismissModal(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
extension DescricaoEventos: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("aaaaaA")
    }
}

extension DescricaoEventos: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = descricaoEventosTableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            //cell.textLabel?.text = dataSource[0]
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = descricaoEventosTableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            return cell
        }
        if indexPath.row == 2 {
            let cell = descricaoEventosTableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
            return cell
        } else {
            let cell = descricaoEventosTableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
            return cell
        }
        
    }
    
}
