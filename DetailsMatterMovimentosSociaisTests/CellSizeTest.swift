//
//  CellSizeTest.swift
//  DetailsMatterMovimentosSociaisTests
//
//  Created by Helaine Pontes on 24/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
import XCTest
@testable import DetailsMatterMovimentosSociais

class CellSizeTest: XCTestCase {
    func test_Cellsize_calculateWidth_width() {
        let sut = CellSize()
        let width = sut.calculateWidth(view: UIScreen.main.bounds.width)
        let result = CGFloat(183)
        XCTAssertEqual(width, result)
    }
}
