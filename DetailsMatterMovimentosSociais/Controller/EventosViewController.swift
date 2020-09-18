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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var eventos: [Evento] = []
    var todosEventos: [Evento] = []
    var partEventos: [Evento] = []
    var tableSegmentedControl: [[Evento]] = []

    func populateTodosEvents() -> [Evento] {
        var eventos: [Evento] = []
    
        var evento = EventosMulheresMock.eventosCatolicas
        eventos.append(contentsOf: evento)
        evento = EventosMulheresMock.eventosMulher360
        eventos.append(contentsOf: evento)
        evento = EventosMulheresMock.eventosPyLadies
        eventos.append(contentsOf: evento)
        evento = EventosMulheresMock.eventosSempreviva
        eventos.append(contentsOf: evento)
        
        return eventos
    }
    
    func populatePartEvents() -> [Evento] {
        var eventos: [Evento] = []
    
        var evento = EventosMulheresMock.eventosPyLadies
        eventos.append(contentsOf: evento)
        evento = EventosMulheresMock.eventosSempreviva
        eventos.append(contentsOf: evento)
        
        return eventos
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.todosEventos = self.populateTodosEvents()
            self.partEventos = self.populatePartEvents()
            self.tableSegmentedControl.append(self.todosEventos)
            self.tableSegmentedControl.append(self.partEventos)
            self.eventos = self.todosEventos
            self.eventsTableView.reloadData()
        }
        
        view.backgroundColor = UIColor.backGroundColor
        eventsTableView.backgroundColor = UIColor.backGroundColor
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
            UIColor.textColor],
            for: UIControl.State.selected)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
        UIColor.textColor],
        for: UIControl.State.normal)
        
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentedChangedValue(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        eventos = tableSegmentedControl[sender.selectedSegmentIndex]
        print(eventos[0].nome)
        eventsTableView.reloadData()
    }
    
}

extension EventosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let evento = eventos[indexPath.row]
        
        guard let cell = eventsTableView.dequeueReusableCell(withIdentifier: "EventCell") as? EventTableViewCell
            else { return UITableViewCell() }
        
        cell.eventNameLabel.text = evento.nome
        cell.dateEventLabel.text = evento.dataHora
        cell.placeEventLabel.text = evento.localizacao
        
        return cell
    }
    
}
