//
//  DescricaoMovimentoViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 16/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class DescricaoMovimentoViewController: UITableViewController {
    
    let movimento = MulheresMock().pyLadiesBrasil
    var datas: [Date] = []
    
    @IBOutlet weak var movimentoTitle: UILabel!
    @IBOutlet weak var buttonSeguir: UIBarButtonItem!
    @IBOutlet weak var imageCapa: UIImageView!
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var buttonInstagram: UIButton!
    @IBOutlet weak var buttonWeb: UIButton!
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonAlternarVisualizacao: UIButton!
    @IBOutlet weak var calendarView: UIView!
  
    private var baseDate: Date = Date() {
      didSet {
        days = generateDaysInMonth(for: baseDate)
        collectionView.reloadData()
        calendarHeaderView.baseDate = baseDate
      }
    }

    private lazy var days = generateDaysInMonth(for: baseDate)

    private var numberOfWeeksInBaseDate: Int {
      calendar.range(of: .weekOfMonth, in: .month, for: baseDate)?.count ?? 0
    }

    lazy var dateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "d"
      return dateFormatter
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGroundColor
        configureTable()
        checkButtonsRedes()
        setupImageCapa()
        setupDescricao()
        for mov in movimento.eventos {
            let date = mov.getData()
            for date in date {
                datas.append(date)
            }
        }
     
        movimentoTitle.text = movimento.nome
        navigationController?.navigationBar.shadowImage = UIImage()
        collectionView.backgroundColor = .systemGroupedBackground
        calendarView.addSubview(collectionView)
        setupCollection()
        calendarView.addSubview(calendarHeaderView)
        calendarHeaderView.baseDate = baseDate
        setupCalendarHeader()
        calendarView.addSubview(calendarFooterView)
        setupCalendarFooter()
        
    }
    
    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CalendarDateCollectionViewCell.self,
                                forCellWithReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier)
        
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
          collectionView.leadingAnchor.constraint(
            equalTo: calendarView.readableContentGuide.leadingAnchor),
          collectionView.trailingAnchor.constraint(
            equalTo: calendarView.readableContentGuide.trailingAnchor),
          collectionView.centerYAnchor.constraint(
            equalTo: calendarView.centerYAnchor,
            constant: 10),
          collectionView.heightAnchor.constraint(
            equalTo: calendarView.heightAnchor,
            multiplier: 0.5)
        ])
       
        NSLayoutConstraint.activate(constraints)
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
    
    @IBAction func goToInstagram(_ sender: Any) {
        if let url = URL(string: movimento.urlInstagram ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToWeb(_ sender: Any) {
        if let url = URL(string: movimento.urlWebSite ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToFacebook(_ sender: Any) {
        if let url = URL(string: movimento.urlFacebook ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    func configureTable() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
    }
    
    func checkButtonsRedes() {
        if movimento.urlFacebook == nil {
            buttonFacebook.removeFromSuperview()
        }
        if movimento.urlInstagram == nil {
            buttonInstagram.removeFromSuperview()
        }
        if movimento.urlWebSite == nil {
            buttonWeb.removeFromSuperview()
        }
    }
    
    func setupImageCapa() {
        imageCapa.image = UIImage(named: movimento.imagem)
        imageCapa.contentMode = .scaleAspectFit
        imageCapa.backgroundColor = .white
    }
    
    func setupDescricao() {
        descricao.text = movimento.descricao
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return CGFloat(145 + 32 + movimento.nome.count)
        }
        if indexPath.row == 1 {
            return calcDescricaoHeigth()
        }
        
        if indexPath.row == 2 {
            return 50
        }
        return 400
    }
    
    func calcDescricaoHeigth() -> CGFloat {
        let size = movimento.descricao.count
        return CGFloat(size - (size / 4))
    }
}

extension DescricaoMovimentoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
      _ collectionView: UICollectionView,
      numberOfItemsInSection section: Int
    ) -> Int {
      days.count
    }

    func collectionView(
      _ collectionView: UICollectionView,
      cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
      let day = days[indexPath.row]

      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier,
        for: indexPath) as! CalendarDateCollectionViewCell
      // swiftlint:disable:previous force_cast

      cell.day = day
      return cell
    }
  }

  // MARK: - UICollectionViewDelegateFlowLayout
  extension DescricaoMovimentoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
      _ collectionView: UICollectionView,
      didSelectItemAt indexPath: IndexPath
    ) {
        let day = days[indexPath.row]
       
        print(day.hasEvent)
    }

    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
      let width = Int(collectionView.frame.width / 7)
      let height = Int(collectionView.frame.height) / numberOfWeeksInBaseDate
      return CGSize(width: width, height: height)
    }
}
