//
//  EventosViewControllerTests.swift
//  DetailsMatterMovimentosSociaisTests
//
//  Created by Leonardo Gomes Fernandes on 23/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//
//swiftlint:disable trailing_whitespace
import UIKit
import XCTest

@testable import DetailsMatterMovimentosSociais

class EventosViewControllerTests: XCTestCase {
    func test_EventosViewController_populateTodosEventos_listEventos() {
        // given
        let sut = EventosViewController()
        //when
        let output = sut.populateTodosEvents()
        //Then
        XCTAssertNotNil(output)
    }
    
    func test_EventosViewController_populatePartEvents_listEventos() {
        // given
        let sut = EventosViewController()
        //when
        let output = sut.populatePartEvents()
        
        //Then
        XCTAssertNotNil(output)
    }
    
    

}
