//
//  UserDefaults.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 24/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
import UIKit
class Persistence {
    static let defaults = UserDefaults.standard
    static let keySeguir = "seguindo"
    
    static func setInitialValues() {
        if defaults.object(forKey: keySeguir) == nil {
            defaults.set([], forKey: keySeguir)
        }
    }
    
    static func getArraySeguindo() -> [String] {
        return defaults.object(forKey: keySeguir) as? [String] ?? []
    }
    
    static func unfollow(movimentoId: String) {
        var movimentos = getArraySeguindo()
        for (indice, movimento) in movimentos.enumerated() where movimento == movimentoId {
            movimentos.remove(at: indice)
        }
        
        defaults.set(movimentos, forKey: keySeguir)
    }
    
    static func containsMovimento(movimentoId: String) -> Bool {
        let movimentos = getArraySeguindo()
        return movimentos.contains(movimentoId)
    }
    
    static func removerAllMovimentos() {
        defaults.set([], forKey: keySeguir)
    }
    
    static func seguir(movimentoId: String) {
        var movimentos = getArraySeguindo()
        movimentos.append(movimentoId)
        defaults.set(movimentos, forKey: keySeguir)
    }
}
