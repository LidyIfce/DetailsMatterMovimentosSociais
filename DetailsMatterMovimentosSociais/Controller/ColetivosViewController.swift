//
//  ColetivosViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Helaine Pontes on 22/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
//swiftlint:disable line_length

class ColetivosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var categoria: Categoria?

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        guard let nomeColetivo = categoria?.nome else {
            fatalError()
        }
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = nomeColetivo
        navigationController?.navigationBar.backgroundColor = .backGroundColor
        self.view.insertSubview(UIView(frame: .zero), at: 0)
    }
    
    func configCollectionView() {
        //Set Delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Register xib
        let nib = UINib(nibName: ColetivosCollectionViewCell.xibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ColetivosCollectionViewCell.identifier)
    }
}

protocol ColetivosDelegate: class {
    func didSelected(categoria: Categoria)
}

extension ColetivosViewController: ColetivosDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func didSelected(categoria: Categoria) {
        self.categoria = categoria
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = categoria?.movimentos.count else {
            print("Error no guard count")
            return 0
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColetivosCollectionViewCell.identifier, for: indexPath) as? ColetivosCollectionViewCell else {
            fatalError()
        }
        guard let coletivo = categoria?.movimentos else {
            return cell
        }
        cell.setData(nome: coletivo[indexPath.row].nome, image: coletivo[indexPath.row].imagem)
        return cell
    }
}

extension ColetivosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = CellSize()
        let witdth = cell.calculateWidth(view: UIScreen.main.bounds.width)
        return CGSize(width: witdth, height: witdth)
    }
    
}
