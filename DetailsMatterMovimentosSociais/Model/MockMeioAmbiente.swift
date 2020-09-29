//
//  MockMeioAmbiente.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Leonardo Gomes on 21/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//
//swiftlint:disable line_length
import Foundation

struct MockMeioAmbiente {
    let vegano = Movimento(nome: "Veganismo", descricao: """
O veganismo é uma forma de viver que busca excluir, na medida do possível e do praticável, todas as formas de exploração e de crueldade contra animais, seja para a alimentação, para o vestuário ou para qualquer outra finalidade. Dos veganos junk food aos veganos crudívoros – e todos mais entre eles – há uma versão do veganismo para todos os gostos. No entanto, uma coisa que todos nós temos em comum é uma dieta baseada em vegetais, livre de todos os alimentos de origem animal, como: carne, laticínios, ovos e mel, bem como produtos como o couro e qualquer produto testado em animais.
""", imagem: "vegan", eventos: EventosMeioAmbienteMock.eventosVeganismo, urlInstagram: "https://www.instagram.com/uneoficial/", urlWebSite: "https://une.org.br", urlFacebook: "https://www.facebook.com/uneoficial")
}

struct EventosMeioAmbienteMock {
    static let eventosVeganismo: [Evento] = [Evento(nome: "Paraíso Veg", movimento: "Veganismo", descricao: """
Um evento voltado a todos os veganos que querem aproveitar a natureza de forma completa. Vai ter degustação de comidas veganas, palestra sobre o veganismo e muito mais
""", data: ["15-12-2020 00:00:00"], hora: ["09:00"], localizacao: """
Parque Estadual do Rio Cocó
Av. Padre Antônio Tomás, s/n - Cocó,
Fortaleza - CE, 60060-170
""")]
}
