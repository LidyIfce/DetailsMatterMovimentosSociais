//
//  CellSize.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Helaine Pontes on 24/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
import UIKit

struct CellSize {
    func calculateWidth(view: CGFloat) -> CGFloat {
        let viewWidth = view
        let cellCount = floor(viewWidth/2)
        
        let width = cellCount - 24
        
        return width
    }
}
