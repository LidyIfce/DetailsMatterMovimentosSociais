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

    static func setInitialValues() {
        if UserDefaults.standard.object(forKey: "seguindo") == nil {
            UserDefaults.standard.set([], forKey: "seguindo")
        }
    }
    
    static func getArraySeguindo() -> [String] {
        return UserDefaults.standard.object(forKey: "seguindo") as? [String] ?? []
    }
    
    static func unfollow(movimentoId: String) {
        var movimentos = getArraySeguindo()
        for (indice, movimentoId) in movimentos.enumerated() where movimentoId == movimentoId {
            movimentos.remove(at: indice)
        }
        
        UserDefaults.standard.set(movimentos, forKey: "seguindo")
    }
    
    static func containsMovimento(movimentoId: String) -> Bool {
        let movimentos = getArraySeguindo()
        return movimentos.contains(movimentoId)
    }
    
    static func removerAllMovimentos() {
        UserDefaults.standard.set([], forKey: "seguindo")
    }
    
    static func seguir(movimentoId: String) {
        var movimentos = getArraySeguindo()
        movimentos.append(movimentoId)
        UserDefaults.standard.set(movimentos, forKey: "seguindo")
    }
}
