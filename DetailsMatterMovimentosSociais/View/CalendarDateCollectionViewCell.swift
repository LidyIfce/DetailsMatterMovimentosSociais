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
        view.backgroundColor = .actionColor
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
    
    static let reuseIdentifier = "CalendarDateCollectionViewCell"
    
    var day: Day? {
        didSet {
            guard let day = day else { return }
            numberLabel.text = day.number
            numberLabel.textColor = day.isWithinDisplayedMonth ? .textColor : .secondaryLabel
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  backgroundColor = .white
        contentView.addSubview(selectionBackgroundView)
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
        ])
        
        setConstraintsBackground()
    }
    
    func setConstraintsBackground() {
        if let day = day, day.hasEvent {
            NSLayoutConstraint.activate([
                selectionBackgroundView.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
                selectionBackgroundView.centerXAnchor.constraint(equalTo: numberLabel.centerXAnchor),
                selectionBackgroundView.widthAnchor.constraint(equalToConstant: 25),
                selectionBackgroundView.heightAnchor.constraint(equalTo: selectionBackgroundView.widthAnchor)
            ])
            
            selectionBackgroundView.layer.cornerRadius = 25 / 2
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        layoutSubviews()
    }
    
}
