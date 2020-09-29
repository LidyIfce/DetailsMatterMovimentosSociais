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
    static let keyParticipar = "participando"
    
    static func setInitialValues() {
        if defaults.object(forKey: keySeguir) == nil {
            defaults.set([], forKey: keySeguir)
        }
        
        if defaults.object(forKey: keyParticipar) == nil {
            defaults.set([], forKey: keyParticipar)
        }
    }
    
    static func getArraySeguindo() -> [String] {
        return defaults.object(forKey: keySeguir) as? [String] ?? []
    }
    
    static func getArrayParticipando() -> [String] {
        return defaults.object(forKey: keyParticipar) as? [String] ?? []
    }
    
    static func unfollow(movimentoId: String) {
        var movimentos = getArraySeguindo()
        for (indice, movimento) in movimentos.enumerated() where movimento == movimentoId {
            movimentos.remove(at: indice)
        }
        
        defaults.set(movimentos, forKey: keySeguir)
    }
    
    static func stopParticipating(eventoId: String) {
        var eventos = getArrayParticipando()
        for (indice, evento) in eventos.enumerated() where evento == eventoId {
            eventos.remove(at: indice)
        }
        
        defaults.set(eventos, forKey: keyParticipar)
    }
    
    static func containsMovimento(movimentoId: String) -> Bool {
        let movimentos = getArraySeguindo()
        return movimentos.contains(movimentoId)
    }
    
    static func containsEvento(eventoId: String) -> Bool {
        let eventos = getArrayParticipando()
        return eventos.contains(eventoId)
    }
    
    static func removerAllMovimentos() {
        defaults.set([], forKey: keySeguir)
    }
    
    static func removerAllEventos() {
        defaults.set([], forKey: keyParticipar)
    }
    
    static func follow(movimentoId: String) {
        var movimentos = getArraySeguindo()
        movimentos.append(movimentoId)
        defaults.set(movimentos, forKey: keySeguir)
    }
    
    static func participate(eventoId: String) {
        var eventos = getArrayParticipando()
        eventos.append(eventoId)
        defaults.set(eventos, forKey: keyParticipar)
    }
}
