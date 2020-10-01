//
//  EventosTableViewCell.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 22/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

class EventosTableViewCell: UITableViewCell {

    var backView = UIView()
    static let reuseIdentifier = "EventosTableViewCell"
    var evento: Evento?
    var stackView: UIStackView!
    lazy var buttonParticipar: UIButton = {
        var button = UIButton()
        button.setTitle("Participar", for: .normal)
        button.setTitleColor(.textColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.contentVerticalAlignment = .top
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(participarEvento), for: .touchUpInside)
        return button
    }()
    
    let checkButton = AnimationCheckButton(frame: CGRect(x: 50, y: 50, width: 30, height: 30),
                                           image: UIImage(systemName: "checkmark"))
    
    @objc func participarEvento() {
        if let evento = evento {
            
            if Persistence.containsEvento(eventoId: evento.eventoId) {
                Persistence.stopParticipating(eventoId: evento.eventoId)
                checkButton.deselect()
                checkButton.imageColorOn = .confirmedColor
                checkButton.imageColorOff = .actionColor
                checkButton.isHidden =  true
                buttonParticipar.setTitle("Participar", for: .normal)
                buttonParticipar.setTitleColor(.actionColor, for: .normal)
            } else {
                Persistence.participate(eventoId: evento.eventoId)
                checkButton.isHidden = false
                checkButton.select()
                checkButton.imageColorOff = .actionColor
                checkButton.imageColorOn = .confirmedColor
                buttonParticipar.setTitle("Participando", for: .normal)
                buttonParticipar.setTitleColor(.confirmedColor, for: .normal)
            }
        }
    }
        
    lazy var eventTitle: UILabel = {
        var label = UILabel()
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var movimentoName: UILabel = {
        var label = UILabel()
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var eventDate: UILabel = {
        var label = UILabel()
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var eventAddress: UILabel = {
        var label = UILabel()
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func createCell(evento: Evento) {
        self.evento = evento
        checkButton.circleColor = .confirmedColor
        checkButton.lineColor = .confirmedColor
        Persistence.setInitialValues()
        if Persistence.containsEvento(eventoId: evento.eventoId) {
            checkButton.imageColorOff = .confirmedColor
            checkButton.imageColorOn = .confirmedColor
            buttonParticipar.setTitle("Participando", for: .normal)
            buttonParticipar.setTitleColor(.confirmedColor, for: .normal)
        } else {
            checkButton.imageColorOff = .actionColor
            checkButton.imageColorOn = .actionColor
            checkButton.isHidden = true
            buttonParticipar.setTitle("Participar", for: .normal)
            buttonParticipar.setTitleColor(.actionColor, for: .normal)
        }
        
        contentView.backgroundColor = .backGroundColor
        contentView.addSubview(backView)
        setupBackGroundView()
        setupButtonParticipar()
        setupEventDate()
        setupTitle()
        setupMovimentoName()
        setupEventAddress()
    }
    
    func setupBackGroundView() {
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 8
        backView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowRadius = 5
        backView.layer.shadowOpacity = 0.3
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            backView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 8),
            backView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor, constant: 16),
            backView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor, constant: -16),
            backView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func setupButtonParticipar() {
        stackView = UIStackView(arrangedSubviews: [checkButton, buttonParticipar])
        stackView.distribution = .equalSpacing
    
        backView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            stackView.topAnchor.constraint(
                equalTo: backView.topAnchor, constant: 8),
            stackView.rightAnchor.constraint(
                equalTo: backView.rightAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupTitle() {
        eventTitle.text = evento?.nome
        backView.addSubview(eventTitle)
        eventTitle.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            eventTitle.topAnchor.constraint(
                equalTo: eventDate.bottomAnchor, constant: 16),
            eventTitle.leftAnchor.constraint(
                equalTo: backView.leftAnchor, constant: 12),
            eventTitle.rightAnchor.constraint(
                equalTo: backView.rightAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
    func setupMovimentoName() {
        movimentoName.text = evento?.movimento
        backView.addSubview(movimentoName)
        movimentoName.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            movimentoName.topAnchor.constraint(
                equalTo: eventTitle.bottomAnchor, constant: 4),
            movimentoName.leftAnchor.constraint(
                equalTo: backView.leftAnchor, constant: 12),
            eventTitle.rightAnchor.constraint(
                equalTo: backView.rightAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupEventDate() {
        eventDate.text = evento?.getDataHoraString()[0]
        backView.addSubview(eventDate)
        eventDate.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            eventDate.centerYAnchor.constraint(
                equalTo: stackView.centerYAnchor, constant: 0),
            eventDate.leftAnchor.constraint(
                equalTo: backView.leftAnchor, constant: 12),
            eventDate.rightAnchor.constraint(
                equalTo: backView.rightAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupEventAddress() {
        eventAddress.text = evento?.localizacao
        backView.addSubview(eventAddress)
        eventAddress.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(contentsOf: [
            eventAddress.topAnchor.constraint(
                equalTo: movimentoName.bottomAnchor, constant: 12),
            eventAddress.leftAnchor.constraint(
                equalTo: backView.leftAnchor, constant: 12),
            eventAddress.rightAnchor.constraint(
                equalTo: backView.rightAnchor, constant: -12),
            contentView.bottomAnchor.constraint(equalTo: eventAddress.bottomAnchor, constant: 12)
           
        ])
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
