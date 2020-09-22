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
    
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Movimentos"
        navigationController?.navigationBar.backgroundColor = .backGroundColor
        self.view.insertSubview(UIView(frame: .zero), at: 0)
    }

    func configCollectionView() {
        //setup()
        //Set delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Register Cell
        let cellNib = UINib(nibName: MovimentosCollectionViewCell.xibName, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: MovimentosCollectionViewCell.identifier)
        
        //Setup GridView
        setupGridView()
    }
    
    func setupGridView() {
        guard let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError()
        }
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
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
        let categoria = MockCategorias.mock[indexPath.row]
        
        cell.setData(image: categoria.imagem, title: categoria.nome)
        return cell
    }
}

extension MovimentosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let witdth = self.calculateWidth()
        return CGSize(width: witdth, height: witdth)
    }
    
    func calculateWidth() -> CGFloat {
        let viewWidth = UIScreen.main.bounds.width
        let cellCount = floor(viewWidth/2)
        
        let width = cellCount - 24
        
        return width
    }
}
