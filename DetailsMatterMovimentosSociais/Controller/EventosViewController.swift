//
//  EventosViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 10/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class EventosViewController: UIViewController {
    
    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentedChangedValue(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
}

extension EventosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = eventsTableView.dequeueReusableCell(withIdentifier: "EventCell") as? EventTableViewCell
            else { return UITableViewCell() }
        
        return cell
    }
    
}
