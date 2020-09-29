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

        animateTable()
    }
    
    func animateTable() {
        self.eventsTableView.reloadData()
        self.eventsTableView.isHidden = true
        let cells = eventsTableView.visibleCells
        let tableHeigth: CGFloat = eventsTableView.bounds.size.width
        
        for cell in cells {
            let cell: UITableViewCell = cell as? EventTableViewCell ?? UITableViewCell()
            cell.transform = CGAffineTransform(translationX:0, y: tableHeigth)
        }
        
        var index = 0
        for cell in cells {
            self.eventsTableView.isHidden = false
            let cell: UITableViewCell = cell as? EventTableViewCell ?? UITableViewCell()
            UIView.animate(withDuration: 1.5,
                           delay: 0.05 * Double(index),
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .transitionFlipFromTop,
                           animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
            index += 1
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DescricaoEventos", bundle: nil)
        guard let viewC =  storyboard.instantiateViewController(identifier: "DescricaoEventos")
                as? DescricaoEventos else {
            fatalError() }
        viewC.evento = eventos[indexPath.row]
        self.present(viewC, animated: true, completion: nil)
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
