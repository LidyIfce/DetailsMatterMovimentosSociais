//
//  ButtonExtension.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Leonardo Gomes on 21/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        
        layer.add(flash, forKey: "")
    }
}
