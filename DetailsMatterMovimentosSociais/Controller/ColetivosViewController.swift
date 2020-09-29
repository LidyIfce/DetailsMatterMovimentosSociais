//
//  ColetivosViewController.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Helaine Pontes on 22/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
//swiftlint:disable line_length
protocol ColetivosDelegate: class {
    func didSelected(categoria: Categoria)
}

class ColetivosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var categoria: Categoria?
    weak var delegate: MovimentoDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
      
        Persistence.setInitialValues()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DescricaoMovimento", bundle: nil)
        guard let viewC =  storyboard.instantiateViewController(identifier: "DescricaoMovimentoViewController") as? DescricaoMovimentoViewController else {
            fatalError()
        }
        self.delegate = viewC
        if let categoria = categoria {
            delegate?.didSelectedMovimento(movimento: categoria.movimentos[indexPath.row])
        }
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}

extension ColetivosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = CellSize()
        let witdth = cell.calculateWidth(view: UIScreen.main.bounds.width)
        return CGSize(width: witdth, height: witdth)
    }
    
}
