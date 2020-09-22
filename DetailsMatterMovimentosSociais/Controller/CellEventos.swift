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
    var calendarView = UIView()
    var datas: [Date] = []
    
    let keyViewMode = "currentView"
    
    var currentMode: String? {
        didSet {
            UserDefaults.standard.setValue(currentMode, forKey: keyViewMode)
        }
    }
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.layer.borderWidth  = 3
        collectionView.layer.borderColor = UIColor.white.cgColor
        return collectionView
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

    func createCell(datas: [Date]) {
        setInitialModeView()
        currentMode = UserDefaults.standard.string(forKey: keyViewMode)
        toggleInformations()
        
        self.datas = datas
        contentView.addSubview(calendarView)
        setupCalendarView()
        collectionView.backgroundColor = .systemGroupedBackground
        calendarView.addSubview(collectionView)
        setupCollection()
        calendarView.addSubview(calendarHeaderView)
        calendarHeaderView.baseDate = baseDate
        setupCalendarHeader()
        calendarView.addSubview(calendarFooterView)
        setupCalendarFooter()
    }
    
    func setInitialModeView() {
        if UserDefaults.standard.object(forKey: keyViewMode) == nil {
            UserDefaults.standard.setValue("list", forKey: keyViewMode)
        }
    }
    
    func toggleInformations() {
        if currentMode == "list"{
            currentMode = "calendar"
            labelAlternarVisualizacao.setTitle("Ver calendário", for: .normal)
            buttonAlternarVisualizacao.setBackgroundImage(UIImage(systemName: "calendar"), for: .normal)
        } else {
            currentMode = "list"
            labelAlternarVisualizacao.setTitle("Ver lista", for: .normal)
            buttonAlternarVisualizacao.setBackgroundImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        }
    }
    
    func setupCalendarView() {
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            calendarView.topAnchor.constraint(
                equalTo: buttonAlternarVisualizacao.bottomAnchor, constant: 8),
          calendarView.leftAnchor.constraint(
            equalTo: contentView.leftAnchor, constant: 16),
          calendarView.rightAnchor.constraint(
            equalTo: contentView.rightAnchor, constant: -16),
          calendarView.heightAnchor.constraint(
            equalToConstant: 300),
            contentView.bottomAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 32)
        ])
       
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CalendarDateCollectionViewCell.self,
                                forCellWithReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier)
        
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
          collectionView.leftAnchor.constraint(
            equalTo: calendarView.leftAnchor),
          collectionView.rightAnchor.constraint(
            equalTo: calendarView.rightAnchor),
          collectionView.centerYAnchor.constraint(
            equalTo: calendarView.centerYAnchor,
            constant: 10),
          collectionView.heightAnchor.constraint(
            equalTo: calendarView.heightAnchor,
            multiplier: 0.5)
        ])
       
        NSLayoutConstraint.activate(constraints)
    }
    
    @IBAction func buttonAlternarVisualizacao(_ sender: Any) {
        toggleInformations()
        layoutIfNeeded()
    }
    
    @IBAction func labelAlternarVisualizacao(_ sender: Any) {
        toggleInformations()
        layoutIfNeeded()
    }
    func setupCalendarHeader() {
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            calendarHeaderView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            calendarHeaderView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            calendarHeaderView.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            calendarHeaderView.heightAnchor.constraint(equalToConstant: 85)
        ])
       
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupCalendarFooter() {
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            calendarFooterView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            calendarFooterView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            calendarFooterView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            calendarFooterView.heightAnchor.constraint(equalToConstant: 60)
        ])
       
        NSLayoutConstraint.activate(constraints)
    }
       
}
