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
    
    var selectedSegmentIndex: Int?
    
    var eventos: [Evento] = []
    
    func getEventosFromMeusMovimentos() -> [Evento] {
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
        return eventos
    }

    func getAllEventos() -> [Evento] {
        var eventos: [Evento] = []
        let categorias = MockCategorias.mock
        var movimentos: [Movimento] = []
        for categoria in categorias {
               movimentos += categoria.movimentos
        }
        
        for movimento in movimentos {
            eventos += movimento.eventos
        }
        return eventos
    }
    
    func populateTodosEvents() -> [Evento] {
        var eventos = getEventosFromMeusMovimentos()
        eventos.sort(by: { $0.getData()[0] <= $1.getData()[0] })
        return eventos.filter({ $0.getData()[0] >= Date() })
     
    }
    
    func populatePartEvents() -> [Evento] {
        var eventos: [Evento] = []
    
        let allEventos = getAllEventos()
        let participando = Persistence.getArrayParticipando()
        
        for evento in allEventos where participando.contains(evento.eventoId) {
            eventos.append(evento)
        }
      
        eventos.sort(by: { $0.getData()[0] <= $1.getData()[0] })
        return eventos.filter({ $0.getData()[0] >= Date() })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventos = populateTodosEvents()
        
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
        super.viewWillAppear(true)
        eventos = populateTodosEvents()
        if let selectedSegmentIndex = selectedSegmentIndex {
            if selectedSegmentIndex == 0 {
                eventos = populateTodosEvents()
            } else {
                eventos = populatePartEvents()
            }
        }
        eventsTableView.reloadData()
    }

    @IBAction func segmentedChangedValue(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            selectedSegmentIndex = sender.selectedSegmentIndex
            eventos = populateTodosEvents()
        } else {
            selectedSegmentIndex = sender.selectedSegmentIndex
            eventos = populatePartEvents()
        }
        
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
        cell.delegate = self
        cell.createCell(evento: evento)
    
        return cell
    }
    
}

extension EventosViewController: EventoTableViewDelegate {
 
    func updateEventosViewController() {
        eventos = populateTodosEvents()
        if let selectedSegmentIndex = selectedSegmentIndex {
            if selectedSegmentIndex == 0 {
                eventos = populateTodosEvents()
            } else {
                eventos = populatePartEvents()
            }
        }
        eventsTableView.reloadData()
    }
}
