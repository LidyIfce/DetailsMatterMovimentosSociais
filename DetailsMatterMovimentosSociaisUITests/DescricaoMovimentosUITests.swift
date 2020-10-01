//
//  DescricaoMovimentosUITests.swift
//  DetailsMatterMovimentosSociaisUITests
//
//  Created by Leonardo Gomes on 28/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//swiftlint:disable trailing_whitespace line_length

import UIKit
import XCTest
@testable import DetailsMatterMovimentosSociais

class DescricaoMovimentosUITests: XCTestCase {
    
    func test_DescricaoEventos_FollowButton() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-noFollowing"]
        app.launch()

        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.otherElements.containing(.staticText, identifier: "Mulheres").children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier: "PyLadies Brasil").element.tap()
        
        let navigationBarDescricaoEvento = app.navigationBars["DetailsMatterMovimentosSociais.DescricaoMovimentoView"]
        let seguirButton = navigationBarDescricaoEvento.buttons["Seguir"]
        XCTAssertTrue(seguirButton.isHittable)
        seguirButton.tap()
        
        let mulheresBack = navigationBarDescricaoEvento.buttons["Mulheres"]
        XCTAssertTrue(mulheresBack.isHittable)
        mulheresBack.tap()
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier: "PyLadies Brasil").element.tap()
        
        let seguindoButton = navigationBarDescricaoEvento.buttons["Seguindo"]
        XCTAssertTrue(seguindoButton.isHittable)
        seguindoButton.tap()
    }
    
    func test_DescricaoEventos_InstaButton() {
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.otherElements.containing(.staticText, identifier: "Mulheres").children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier: "PyLadies Brasil").element.tap()
        
        app.swipeUp()
        
        let tablesQuery = app.tables
        XCTAssertNotNil(tablesQuery)

        let instaButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["instagram"]/*[[".cells.buttons[\"instagram\"]",".buttons[\"instagram\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(instaButton.isHittable)
        instaButton.tap()
    }
    
    func test_DescricaoEventos_FacebookButton() {
        let app = XCUIApplication()
        app.launch()
    
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.otherElements.containing(.staticText, identifier: "Mulheres").children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier: "PyLadies Brasil").element.tap()
        
        let tablesQuery = app.tables
        let element = tablesQuery.cells.containing(.staticText, identifier: "PyLadies Brasil").children(matching: .other).element(boundBy: 1)
        element.swipeUp()
        
        let facebookButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["facebook"]/*[[".cells.buttons[\"facebook\"]",".buttons[\"facebook\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(facebookButton.isHittable)
        facebookButton.tap()
    }
    
    func test_DescricaoEventos_SiteButton() {
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.otherElements.containing(.staticText, identifier: "Mulheres").children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier: "PyLadies Brasil").element.tap()
        
        let tablesQuery = app.tables
        let element = tablesQuery.cells.containing(.staticText, identifier: "PyLadies Brasil").children(matching: .other).element(boundBy: 1)
        element.swipeUp()
        
        let siteButton = tablesQuery.buttons["internet"]
        XCTAssertTrue(siteButton.isHittable)
        siteButton.tap()
    }
    
    func test_DescricaoEventos_ListToCalenderView() {
        let app = XCUIApplication()
        app.launch()

        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.otherElements.containing(.staticText, identifier: "Mulheres").children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier: "PyLadies Brasil").element.tap()
        
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier: "PyLadies Brasil").children(matching: .other).element(boundBy: 1).swipeUp()
        
        let toCalnderButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["calendar"]/*[[".cells.buttons[\"calendar\"]",".buttons[\"calendar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(toCalnderButton.isHittable)
        toCalnderButton.tap()
        
        let toTableListButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["line.horizontal"]/*[[".cells.buttons[\"line.horizontal\"]",".buttons[\"line.horizontal\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(toTableListButton.isHittable)
        toTableListButton.tap()
    }
    
    func test_DescricaoEventos_ClickInEventCell() {
        
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.otherElements.containing(.staticText, identifier: "Mulheres").children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier: "PyLadies Brasil").element.tap()
        
        app.swipeUp()
        let tablesQuery = app.tables
        let elementcell = tablesQuery/*@START_MENU_TOKEN@*/.tables.staticTexts["PyLadies Recife & PUG-PE Apresentam: um pedaço de Recife na PyBR 2019"]/*[[".cells.tables",".cells.staticTexts[\"PyLadies Recife & PUG-PE Apresentam: um pedaço de Recife na PyBR 2019\"]",".staticTexts[\"PyLadies Recife & PUG-PE Apresentam: um pedaço de Recife na PyBR 2019\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(elementcell.isHittable)
        elementcell.tap()
    }
}
