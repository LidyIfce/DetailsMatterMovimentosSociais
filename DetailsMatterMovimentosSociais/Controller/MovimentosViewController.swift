//
//  MovimentosViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 10/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
//swiftlint:disable line_length

class MovimentosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: ColetivosDelegate?
    let categorias = MockCategorias.mock
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Movimentos"
        navigationController?.navigationBar.backgroundColor = .backGroundColor
        self.view.insertSubview(UIView(frame: .zero), at: 0)
    }

    func configCollectionView() {
        //Set delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Register Cell
        let cellNib = UINib(nibName: MovimentosCollectionViewCell.xibName, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: MovimentosCollectionViewCell.identifier)
    }

}

extension MovimentosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockCategorias.mock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovimentosCollectionViewCell.identifier, for: indexPath) as? MovimentosCollectionViewCell else {
            fatalError()
        }
        let cellWidth = calculateCellSize().width
        let cellHeight = calculateCellSize().height
        cell.configuraGradient(size: CGSize(width: cellWidth, height: cellHeight))
        let image = categorias[indexPath.row].imagem
        let name = categorias[indexPath.row].nome
        cell.setData(image: image, title: name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewC = storyboard?.instantiateViewController(withIdentifier: "ColetivosViewController") as? ColetivosViewController else {
            fatalError()
        }
        self.delegate = viewC
        delegate?.didSelected(categoria: categorias[indexPath.row])
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}

extension MovimentosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        calculateCellSize()
    }
}

func calculateCellSize() -> CGSize {
    let cell = CellSize()
    let witdth = cell.calculateWidth(view: UIScreen.main.bounds.width)
    return CGSize(width: witdth, height: witdth)
}
