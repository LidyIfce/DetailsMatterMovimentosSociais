//
//  DescricaoMovimentoViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 16/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class DescricaoMovimentoViewController: UITableViewController {
    
    let movimento = MulheresMock().catolicasPeloDireitoDeDecidir
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
    
    private lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.minimumLineSpacing = 0
      layout.minimumInteritemSpacing = 0
        
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.isScrollEnabled = false
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      return collectionView
    }()
    
    let calendar = Calendar(identifier: .gregorian)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        checkButtonsRedes()
        setupImageCapa()
        setupDescricao()
        for mov in movimento.eventos {
            datas.append(mov.getDataHora())
        }
     
        movimentoTitle.text = movimento.nome
        navigationController?.navigationBar.shadowImage = UIImage()
        collectionView.backgroundColor = .systemGroupedBackground
        calendarView.addSubview(collectionView)
    
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
          //1
          collectionView.leadingAnchor.constraint(
            equalTo: calendarView.readableContentGuide.leadingAnchor),
          collectionView.trailingAnchor.constraint(
            equalTo: calendarView.readableContentGuide.trailingAnchor),
          //2
          collectionView.centerYAnchor.constraint(
            equalTo: calendarView.centerYAnchor,
            constant: 10),
          //3
          collectionView.heightAnchor.constraint(
            equalTo: calendarView.heightAnchor,
            multiplier: 0.5)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
          CalendarDateCollectionViewCell.self,
          forCellWithReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier
        )
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
