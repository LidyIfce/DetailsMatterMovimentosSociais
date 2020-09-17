//
//  CalendarDateCollectionViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 17/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//
import UIKit

class CalendarDateCollectionViewCell: UICollectionViewCell {
  private lazy var selectionBackgroundView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
    view.backgroundColor = .yellow
    return view
  }()

  private lazy var numberLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    label.textColor = .label
    return label
  }()

  private lazy var accessibilityDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMMM d")
    return dateFormatter
  }()

  static let reuseIdentifier = String(describing: CalendarDateCollectionViewCell.self)

  var day: Day? {
    didSet {
      guard let day = day else { return }

      numberLabel.text = day.number
        if day.hasEvent {
            numberLabel.backgroundColor = .yellow
        }
      accessibilityLabel = accessibilityDateFormatter.string(from: day.date)
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    isAccessibilityElement = true
    accessibilityTraits = .button

    //contentView.addSubview(selectionBackgroundView)
    contentView.addSubview(numberLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    
    NSLayoutConstraint.deactivate(selectionBackgroundView.constraints)
    
    NSLayoutConstraint.activate([
      numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor)

//      selectionBackgroundView.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
//      selectionBackgroundView.centerXAnchor.constraint(equalTo: numberLabel.centerXAnchor),
//      selectionBackgroundView.widthAnchor.constraint(equalToConstant: 25),
//      selectionBackgroundView.heightAnchor.constraint(equalTo: selectionBackgroundView.widthAnchor)
    ])

  //  selectionBackgroundView.layer.cornerRadius = 25 / 2
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)

    layoutSubviews()
  }
}
