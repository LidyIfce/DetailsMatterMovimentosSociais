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
        
        let categorias = MockCategorias.mock
        var movimentos: [Movimento] = []
        for categoria in categorias {
               movimentos += categoria.movimentos
        }

        let meusMovimentos = Persistence.getArraySeguindo()
        
        for movimento in movimentos where meusMovimentos.contains(movimento.movimentoId) {
            eventos += movimento.eventos
        }
        
        eventos.sort(by: { $0.getData()[0] < $1.getData()[0] })
        return eventos.filter({ $0.getData()[0] >= Date() })
     
    }
    
    func populatePartEvents() -> [Evento] {
        var eventos: [Evento] = []
    
        var evento = EventosMulheresMock.eventosPyLadies
        eventos.append(contentsOf: evento)
        evento = EventosMulheresMock.eventosSempreviva
        eventos.append(contentsOf: evento)
        
        return eventos
    }
    
    func showEventos() {
        DispatchQueue.main.async {
            self.todosEventos = self.populateTodosEvents()
            self.partEventos = self.populatePartEvents()
            self.tableSegmentedControl.append(self.todosEventos)
            self.tableSegmentedControl.append(self.partEventos)
            self.eventos = self.todosEventos
            self.eventsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showEventos()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        showEventos()
    }

    @IBAction func segmentedChangedValue(_ sender: UISegmentedControl) {
        eventos = tableSegmentedControl[sender.selectedSegmentIndex]
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
        cell.dateEventLabel.text = evento.getDataHoraString()[0]
        cell.placeEventLabel.text = evento.localizacao
        cell.movimentNameLabel.text = evento.movimento
        
        return cell
    }
    
}
