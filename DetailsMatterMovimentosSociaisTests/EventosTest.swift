//
//  EventosTest.swift
//  DetailsMatterMovimentosSociaisTests
//
//  Created by Helaine Pontes on 24/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import UIKit
import XCTest
@testable import DetailsMatterMovimentosSociais
//swiftlint:disable line_length

class EventosTest: XCTestCase {
    func test_Eventos_getData_listOfData() {
        //given
        let sut = Evento(nome: "PyLadies Recife & PUG-PE Apresentam: um pedaço de Recife na PyBR 2019", movimento: "Pyladies", descricao: """
Sejam bem vind@s ao Pedaço do Recife na PyBr 2019 !!

Esse evento magnífico está sendo organizado pelo PyLadies Recife e pelo PUG-PE, com o intuito de trazer um pouco do que o que foi mostrado na Python Brasil 2019 que ocorreu entre os dias 23 e 28 de Outubro.

Serão 10 palestras e 2 tutoriais, durante todo o dia.

Como ingresso estamos pedindo um alimento não perecível ou uma roupa em bom estado (esse item vai validar sua entrada no evento, mas caso não tenha, não tem problema).
""", data: ["30-10-2020 00:00:00"], hora: ["16:00"], localizacao: """
UNIFG
Avenida Governador Carlos de Lima Cavalcanti, 155, Boa Vista
Recife, PE
""")
        let data = sut.getData()
        let date = data[0]
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        XCTAssertEqual(day, 30)
        XCTAssertEqual(month, 10)
        XCTAssertEqual(year, 2020)
        XCTAssertEqual(hour, 0)
        XCTAssertEqual(minutes, 0)
        XCTAssertEqual(seconds, 0)
    }
    func test_Eventos_getDataHoraString_listString() {
        let sut = Evento(nome: "PyLadies Recife & PUG-PE Apresentam: um pedaço de Recife na PyBR 2019", movimento: "Pyladies", descricao: """
Sejam bem vind@s ao Pedaço do Recife na PyBr 2019 !!

Esse evento magnífico está sendo organizado pelo PyLadies Recife e pelo PUG-PE, com o intuito de trazer um pouco do que o que foi mostrado na Python Brasil 2019 que ocorreu entre os dias 23 e 28 de Outubro.

Serão 10 palestras e 2 tutoriais, durante todo o dia.

Como ingresso estamos pedindo um alimento não perecível ou uma roupa em bom estado (esse item vai validar sua entrada no evento, mas caso não tenha, não tem problema).
""", data: ["30-10-2020 00:00:00"], hora: ["16:00"], localizacao: """
UNIFG
Avenida Governador Carlos de Lima Cavalcanti, 155, Boa Vista
Recife, PE
""")
        let string = sut.getDataHoraString()
        let result = ["30 de outubro 16:00h"]
        XCTAssertEqual(string, result)
    }
}
