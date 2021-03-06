//
//  CellEventosDelegateExtension.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 21/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit

extension CellEventos: UICollectionViewDataSource, UICollectionViewDelegate {
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
extension CellEventos: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let day = days[indexPath.row]
        if day.hasEvent {
            var myEvento: Evento?
            for evento in eventos where day.date == evento.getData()[0] {
                myEvento = evento
            }
         
            let storyboard = UIStoryboard(name: "DescricaoEventos", bundle: nil)
            guard let viewC =  storyboard.instantiateViewController(identifier: "DescricaoEventos")
                    as? DescricaoEventos else {
                fatalError() }
            if let evento = myEvento {
                viewC.evento = evento
                delegate?.present(viewC: viewC)
            }
        }
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

extension CellEventos: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventosTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? EventosTableViewCell
        else { return UITableViewCell() }

        cell.createCell(evento: eventos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DescricaoEventos", bundle: nil)
        guard let viewC =  storyboard.instantiateViewController(identifier: "DescricaoEventos")
                as? DescricaoEventos else {
            fatalError() }
    
        viewC.tableView = tableView
        viewC.descricaoEventosDelegate = self
        viewC.evento = eventos[indexPath.row]
        delegate?.present(viewC: viewC)
    }
}
extension CellEventos: DescricaoEventosDelegate {
    func updateValues(tableView: UITableView?) {
        tableView?.reloadData()
    }
}
