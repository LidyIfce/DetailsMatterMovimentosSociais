//
//  MovimentosUITests.swift
//  DetailsMatterMovimentosSociaisUITests
//
//  Created by Leonardo Gomes on 28/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//swiftlint:disable trailing_whitespace line_length

import UIKit
import XCTest
@testable import DetailsMatterMovimentosSociais

class MovimentosUITests: XCTestCase {
    
    func test_Movimentos_CollectionCellsClick() {
        let app = XCUIApplication()
        
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        XCTAssertNotNil(collectionViewsQuery)
        
        let mulheresCell = collectionViewsQuery.otherElements.containing(.staticText, identifier: "Mulheres").children(matching: .other).element.children(matching: .other).element
        XCTAssertTrue(mulheresCell.isHittable)
        mulheresCell.tap()
        var backToMovimentos = app.navigationBars["Mulheres"].buttons["Movimentos"]
        XCTAssertTrue(backToMovimentos.isHittable)
        backToMovimentos.tap()
        
        let lgbtqiaCell = collectionViewsQuery.otherElements.containing(.staticText, identifier: "LGBTQIA+").children(matching: .other).element.children(matching: .other).element
        XCTAssertTrue(lgbtqiaCell.isHittable)
        lgbtqiaCell.tap()
        backToMovimentos = app.navigationBars["LGBTQIA+"].buttons["Movimentos"]
        XCTAssertTrue(backToMovimentos.isHittable)
        backToMovimentos.tap()
 
        let movimentoNegroCell = collectionViewsQuery.otherElements.containing(.staticText, identifier: "Movimento Negro").children(matching: .other).element.children(matching: .other).element
        XCTAssertTrue(movimentoNegroCell.isHittable)
        movimentoNegroCell.tap()
        backToMovimentos = app.navigationBars["Movimento Negro"].buttons["Movimentos"]
        XCTAssertTrue(backToMovimentos.isHittable)
        backToMovimentos.tap()
        
        let meioAmbienteCell = collectionViewsQuery.otherElements.containing(.staticText, identifier: "Meio Ambiente").children(matching: .other).element.children(matching: .other).element
        XCTAssertTrue(meioAmbienteCell.isHittable)
        meioAmbienteCell.tap()
        backToMovimentos = app.navigationBars["Meio Ambiente"].buttons["Movimentos"]
        XCTAssertTrue(backToMovimentos.isHittable)
        backToMovimentos.tap()
        
        let educacaoCell = collectionViewsQuery.otherElements.containing(.staticText, identifier: "Educação").children(matching: .other).element.children(matching: .other).element
        XCTAssertTrue(educacaoCell.isHittable)
        educacaoCell.tap()
        backToMovimentos = app.navigationBars["Educação"].buttons["Movimentos"]
        XCTAssertTrue(backToMovimentos.isHittable)
        backToMovimentos.tap()
        
       let infanciaCell = collectionViewsQuery.otherElements.containing(.staticText, identifier: "Infância").children(matching: .other).element.children(matching: .other).element
        XCTAssertTrue(infanciaCell.isHittable)
        infanciaCell.tap()
        backToMovimentos = app.navigationBars["Infância"].buttons["Movimentos"]
        XCTAssertTrue(backToMovimentos.isHittable)
        backToMovimentos.tap()
    }
    
    func test_MovimentosMulheres_CollectioCellClikc() {
        let app = XCUIApplication()
        
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.otherElements.containing(.staticText, identifier: "Mulheres").children(matching: .other).element.children(matching: .other).element.tap()
        
        let cellsQuery = collectionViewsQuery.cells
        XCTAssertNotNil(cellsQuery)
        
        let mulher360Cell = cellsQuery.otherElements.containing(.staticText, identifier: "+ Mulher 360").element
        XCTAssertTrue(mulher360Cell.isHittable)
        mulher360Cell.tap()
        
        let mulheresButton = app.navigationBars["DetailsMatterMovimentosSociais.DescricaoMovimentoView"].buttons["Mulheres"]
        XCTAssertTrue(mulheresButton.isHittable)
        mulheresButton.tap()
        
        let pyladiesCell = cellsQuery.otherElements.containing(.staticText, identifier: "PyLadies Brasil").element
        XCTAssertTrue(pyladiesCell.isHittable)
        pyladiesCell.tap()
        XCTAssertTrue(mulheresButton.isHittable)
        mulheresButton.tap()
        
        let catolicasCell = cellsQuery.otherElements.containing(.staticText, identifier: "Católicas pelo direito de decidir").element
        XCTAssertTrue(catolicasCell.isHittable)
        catolicasCell.tap()
        XCTAssertTrue(mulheresButton.isHittable)
        mulheresButton.tap()
        
        let feministaCell = cellsQuery.otherElements.containing(.staticText, identifier: "SOF Sempreviva Organização Feminista").element
        XCTAssertTrue(feministaCell.isHittable)
        feministaCell.tap()
        XCTAssertTrue(mulheresButton.isHittable)
        mulheresButton.tap()
        
    }
}
