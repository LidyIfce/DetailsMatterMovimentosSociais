//
//  CellEventos.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 21/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class CellEventos: UITableViewCell {
    
    @IBOutlet weak var buttonAlternarVisualizacao: UIButton!
    
    @IBOutlet weak var labelAlternarVisualizacao: UIButton!
    
    weak var delegate: CellEventosDelegate?
    var viewAtual: UIView?
    
    var datas: [Date] = []
    var eventos: [Evento] = []
 
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.layer.borderWidth  = 3
        collectionView.layer.borderColor = UIColor.white.cgColor
        return collectionView
    }()
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .backGroundColor
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.alwaysBounceVertical = false
        tableView.alwaysBounceHorizontal = false
        tableView.isScrollEnabled = false
        tableView.tableHeaderView = nil
        tableView.register(EventosTableViewCell.self,
                           forCellReuseIdentifier: EventosTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    let calendar = Calendar(identifier: .gregorian)
    lazy var days = generateDaysInMonth(for: baseDate)
    
    var numberOfWeeksInBaseDate: Int {
      calendar.range(of: .weekOfMonth, in: .month, for: baseDate)?.count ?? 0
    }

    lazy var dateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "d"
      return dateFormatter
    }()

    private var baseDate: Date = Date() {
      didSet {
        days = generateDaysInMonth(for: baseDate)
        collectionView.reloadData()
        calendarHeaderView.baseDate = baseDate
      }
    }
    
    private lazy var calendarHeaderView = CalendarHeaderView()
    private lazy var calendarFooterView = CalendarFooterView(
      didTapLastMonthCompletionHandler: { [weak self] in
      guard let self = self else { return }

      self.baseDate = self.calendar.date(
        byAdding: .month,
        value: -1,
        to: self.baseDate
        ) ?? self.baseDate
      },
      didTapNextMonthCompletionHandler: { [weak self] in
        guard let self = self else { return }

        self.baseDate = self.calendar.date(
          byAdding: .month,
          value: 1,
          to: self.baseDate
          ) ?? self.baseDate
      })

    func createCell(datas: [Date], eventos: [Evento]) {
        viewAtual = tableView
        self.eventos = eventos
        self.eventos.sort(by: { $0.getData()[0] < $1.getData()[0] })
        self.datas = datas
        labelAlternarVisualizacao.setTitle("Ver calendário", for: .normal)
        buttonAlternarVisualizacao.setBackgroundImage(UIImage(systemName: "calendar"), for: .normal)
        setupTableView()
    }
  
    func toggleInformations() {
        if viewAtual == collectionView {
            
            labelAlternarVisualizacao.setTitle("Ver calendário", for: .normal)
            buttonAlternarVisualizacao.setBackgroundImage(UIImage(systemName: "calendar"), for: .normal)
            
            self.calendarHeaderView.removeFromSuperview()
            self.collectionView.removeFromSuperview()
            self.calendarFooterView.removeFromSuperview()
            setupTableView()
            viewAtual = tableView
            
        } else {
         
            labelAlternarVisualizacao.setTitle("Ver lista", for: .normal)
            buttonAlternarVisualizacao.setBackgroundImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
            
            tableView.removeFromSuperview()
            setupCalendarView()
            viewAtual = collectionView
        }
    }
    
    func setupCalendarView() {
        calendarHeaderView.baseDate = baseDate
        setupCalendarHeader()
        setupCollection()
        setupCalendarFooter()
    }
    
    func setupTableView() {
        contentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            tableView.topAnchor.constraint(
                equalTo: labelAlternarVisualizacao.bottomAnchor, constant: 8),
            tableView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor),
            tableView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor),
               tableView.heightAnchor.constraint(
                greaterThanOrEqualToConstant: CGFloat(eventos.count * 280 + 90)),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
    func setupCollection() {
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CalendarDateCollectionViewCell.self,
                                forCellWithReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            collectionView.topAnchor.constraint(equalTo: calendarHeaderView.bottomAnchor),
          collectionView.leftAnchor.constraint(
            equalTo: contentView.leftAnchor, constant: 16),
          collectionView.rightAnchor.constraint(
            equalTo: contentView.rightAnchor, constant: -16),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 155)
        ])
       
        NSLayoutConstraint.activate(constraints)
    }
    
    @IBAction func buttonAlternarVisualizacao(_ sender: Any) {
        toggleInformations()
        delegate?.updateHeightOfRow()
      
    }
    
    @IBAction func labelAlternarVisualizacao(_ sender: Any) {
        toggleInformations()
        delegate?.updateHeightOfRow()
    }

    func setupCalendarHeader() {
        contentView.addSubview(calendarHeaderView)
        calendarHeaderView.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            calendarHeaderView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            calendarHeaderView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            calendarHeaderView.topAnchor.constraint(equalTo: labelAlternarVisualizacao.bottomAnchor, constant: 8),
            calendarHeaderView.heightAnchor.constraint(greaterThanOrEqualToConstant: 85)
        ])
       
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupCalendarFooter() {
        calendarFooterView.delegate = self
        contentView.addSubview(calendarFooterView)
        calendarFooterView.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            calendarFooterView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            calendarFooterView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            calendarFooterView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            calendarFooterView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            calendarFooterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
        ])
       
        NSLayoutConstraint.activate(constraints)
    }
       
}
extension CellEventos: CalendarFooterViewDelegate {
    func didTap(direction: Direction) {
        switch direction {
        case .previous:
            UIView.transition(with: collectionView,
                              duration: 0.8,
                              options: [.transitionCurlDown],
                              animations: nil,
                              completion: nil
            )
        case .next:
            UIView.transition(with: collectionView,
                              duration: 0.8,
                              options: [.transitionCurlUp],
                              animations: nil,
                              completion: nil
            )
        }
       
    }

}
