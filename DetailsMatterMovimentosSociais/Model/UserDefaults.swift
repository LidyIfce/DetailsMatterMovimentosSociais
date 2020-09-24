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
    let defaults = UserDefaults.standard

    func setInitialValues() {
        if defaults.object(forKey: "seguindo") == nil {
            defaults.setValue([], forKey: "seguindo")
        }
    }
    
    func getArraySeguindo() -> [UUID] {
        defaults.array(forKey: "seguindo") as? [UUID] ?? []
    }
    
    func deixarDeSeguir(movimentoId: UUID) {
        var movimentos = getArraySeguindo()
        for (indice, movimentoId) in movimentos.enumerated() where movimentoId == movimentoId {
            movimentos.remove(at: indice)
        }
        
        defaults.setValue(movimentos, forKey: "seguindo")
    }
    
    func removerAllMovimentos() {
        defaults.setValue([], forKey: "seguindo")
    }
    
    func seguir(movimentoId: UUID) {
        var movimentos = getArraySeguindo()
        movimentos.append(movimentoId)
        defaults.setValue(movimentos, forKey: "seguindo")
    }
}
