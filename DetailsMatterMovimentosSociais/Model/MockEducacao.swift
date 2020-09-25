//
//  MockEducacao.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Leonardo Gomes on 21/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//
//swiftlint:disable line_length
import Foundation

struct MockEducacao {
    let estudantil = Movimento(nome: "União Nacional dos Estudantes", descricao: """
A UNE é a entidade máxima dos estudantes brasileiros e representa cerca de seis milhões de universitários de todos os 26 Estados e do Distrito Federal.

A universidade é um ambiente onde a juventude brasileira tradicionalmente se organiza em torno de visões, opiniões e vontades comuns. Movimento estudantil é o nome dessa atividade que envolve tanto a organização de uma festa como a participação numa passeata, a criação de uma empresa júnior ou a representação política para debater o país.

Em meio a esse processo, os estudantes vão se organizando em entidades representativas como DAs (diretórios acadêmicos), CAs (centros acadêmicos), DCEs (diretórios centrais), uniões estaduais de estudantes e executivas nacionais de cursos. A união destas organizações forma, há mais de 70 anos, a UNE.
""", imagem: "estudantil", eventos: EventosEducacaoMock.eventosEstudanil, urlInstagram: "https://www.instagram.com/uneoficial/", urlWebSite: "https://une.org.br", urlFacebook: "https://www.facebook.com/uneoficial")
}

struct EventosEducacaoMock {
    static let eventosEstudanil: [Evento] = [Evento(nome: "Plano Emergencial para a Educação", movimento: "União Nacional dos Estudantes", descricao: """
As entidades estudantis UNE, UBES e ANPG lançaram neste terça-feira (24/3) uma série de diretrizes para o funcionamento das instituições de ensino brasileiras durante a pandemia do corona vírus. São ressalvas sobre o papel da universidade e da pesquisa brasileira na enfrentamento ao Covid-19; exigências sobre a segurança dos estudantes; sobre a qualidade de ensino; sobre o funcionamento da permanência estudantil; das atividades acadêmicas; a participação discente nas decisões durante o período; a atuação dos estudantes da área da saúde e providências para os estudantes no exterior.
""", data: ["09-11-2020 00:00:00"], hora: ["09:00"], localizacao: """
IFCE - Instituto Federal do Ceará | Campus Fortaleza
Av. Treze de Maio, 2081 - Benfica,
Fortaleza - CE, 60040-531
""")]
}
