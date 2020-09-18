//
//  MockLgbt.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Helaine Pontes on 17/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//swiftlint:disable line_length

import Foundation

struct MockLgbt {
  
    let todxs = Movimento(nome: "TODXS", descricao: "A TODXS é uma startup social sem fins lucrativos. Somos mais de cem pessoas que trabalham voluntariamente e de maneira remota com uma única missão: empoderar a comunidade LGBTI+ e fazer do Brasil um país inclusivo, sem discriminação.A TODXS atua através de projetos de tecnologia e inovação. Um desses é o TODXS App, aplicativo que reúne leis voltadas para a população LGBTI+ e que recebe denúncias de caso sobre LGBTIfobia. Além do app, temos outros projetos como o Conecta, dia de palestras e conexão com pessoas LGBTI+; outra iniciativa é o Embaixadorxs, voltado para a capacitação de jovens que buscam transformar a realidade de suas comunidades.", imagem: "todxs", eventos: EventosMockLgbt.eventosTodxs, urlInstagram: "", urlWebSite: "", urlFacebook: "")
    
    let maes = Movimento(nome: "Mães Pela Diversidade", descricao: """
A preocupação e a união de mães de LGBTs do Brasil inteiro resultou no coletivo Mães pela Diversidade, ambiente onde, juntas, as mães lutam contra o avanço da homotransfobia e pelos direitos civis de seus filhos e de toda a população LGBTs.

    A partir de encontros anuais entre mães, o coletivo nasceu inicialmente como um movimento político e durante a caminhada, se tornou também um espaço de acolhimento para famílias de LGBTs, que diariamente sofrem com seus direitos violados.

    Para que esse acolhimento ocorra de forma profissional e possa atender cada vez mais pessoas, o coletivo Mães pela Diversidade conta com profissionais de diversas áreas: psiquiatras, psicólogos e advogados. Além de órgãos parceiros: GADVs (Grupo de Advogados pela Diversidade Sexual), a OAB, o IBDFAM, o GPH (grupo de pais de homossexuais), a ABRAFH, o IBRAT e tantos outros.

    O cuidado e o empoderamento das famílias LGBTs é uma pauta atual e urgente, e uma das missões das Mães pela Diversidade é a de tirar essas famílias do armário, para que juntos se unam contra o bullyng, a opressão, a segregação e a discriminação.

    Para que a população LGBTs tenha seus direitos, é preciso que principalmente as famílias os defendam e apoiem. Dentre todas as missões dessas mulheres, uma das que elas mais se orgulham é a de mostrar ao mundo o quanto amam e se orgulham de seus filhos e principalmente, a de mostrar que estão ao lado deles nessa luta!

    As Mães pela Diversidade convidam a todos para que se juntem na construção deste espaço de amor e acolhimento. Sejam bem-vindos e vamos à luta!
""", imagem: "maes", eventos: EventosMockLgbt.eventosMaes, urlInstagram: "", urlWebSite: "", urlFacebook: "")
    
    let abglt = Movimento(nome: "ABGLT", descricao: """
A criação da ABGLT(Associação Brasileira de Lésbicas, Gays, Bissexuais, Travestis, Transexuais e Intersexos) representa um marco importante na história do movimento LGBT brasileiro, pois possibilitou a criação de uma rede nacional de representação com capacidade e legitimidade para levar as reivindicações do segmento até o Governo Federal e a sociedade como um todos, o que até então havia sido impossível. Além disso, contribuiu para a organização das entidades de base país afora, capilarizando o movimento por todos os estados da federação. A ABLGT é, sem dúvida, a grande responsável pela organização do movimento LGBT no país e também por dar voz a um segmento da sociedade tradicionalmente marginalizado.
A ABGLT tem como missão: Promover ações que garantam a cidadania e os direitos humanos de lésbicas, gays, bissexuais, travestis e transexuais (LGBT), contribuindo para a construção de uma sociedade democrática, na qual nenhuma pessoa seja submetida a quaisquer formas de discriminação, coerção e violência, em razão de sua orientação sexual e identidade de gênero.
""", imagem: "abglt", eventos: EventosMockLgbt.eventosAbglt, urlInstagram: "", urlWebSite: "", urlFacebook: "")
    
    static var movimentos: [Movimento] = [MockLgbt().todxs, MockLgbt().maes, MockLgbt().abglt]
}

struct EventosMockLgbt {
    static let eventosTodxs: [Evento] = [Evento(nome: "TODXS Conecta", movimento: "Todxs", descricao: """
 Já está se preparando para a Parada LGBTI+ de São Paulo Então e não aguenta mais esperar? Então, um dia antes do maior evento LGBTI+ do Brasil, venha passar uma tarde conversando e trocando conhecimento sobre pautas da nossa comunidade no TODXS Conecta.
 O Conecta é um evento que une pessoas que se interessam pela causa LGBTI+ e que querem discutir assuntos relevantes para a comunidade. Reunimos estudantes, jovens, artistas, lideranças, acadêmicos, ativistas e aliados em uma tarde para trocar informações sobre algum tema.
 “Resistir é existir. Histórias e vivências da militância LGBTI+ no Brasil”
 Este é o tema dessa edição do Conecta. Por meio de personalidades que estão há muito tempo ou que começaram agora nesta luta, serão abordadas as diferentes formas de resistência dessa comunidade. Seja na internet, na arte ou na política. Discutir o que aconteceu no passado para entender o presente e pensar no futuro.
 """, data: ["22-10-2020 00:00:00"], hora: ["12:00"], localizacao: "Auditório da Nubank. Rua Capote Valente, 39, na zona oeste de São Paulo. O prédio fica bem próximo da estação de metrô Oscar Freire e do Hospital das Clínicas.")]
    
    static let eventosMaes: [Evento] = [Evento(nome: "We Will Rock You - a Live Solídaria", movimento: "Mães Pela Diversidade", descricao: """
A Live da Noitada Solidária deste sábado tem a missão de reconstruir o que o vandalismo destruiu do Espaço Acolher (LGBTQIA+) em Recife/PE.
    Grandes artistas se reunirão para levar aos expectadores o melhor do Rock and Roll clássico e abalar as estruturas com uma levada de amor ao próximo.
    85% da arrecadações serão destinadas à ONG Mães pela Diversidade, através do projeto Espaço Acolher. Toda a doação, seja em dim dim e em especial em energia, é mais que bem vinda!
    Artistas confirmados: Rodrigo Viegas, Bernardo Ritto, Diana Castello e mais.
""", data: ["05-10-2020 00:00:00"], hora: ["19:00"], localizacao: "Facebook"), Evento(nome: "Prosa e Café com Amor", movimento: "Mães Pela Diversidade", descricao: """
Pessoas trans e travesti também têm família e também têm mães incríveis que as apoiam!
E é nesse clima de amor e apoio que, na nossa 3ª Semana de Visibilidade Trans e Travesti de Belo Horizonte, teremos um lindo evento de Prosa e Café com Amor com as Mães pela Diversidade!
As Mães pela Diversidade e convidades estarão no Centro de Referência da Juventude - CRJ, no dia 27/01, segunda-feira, às 19h, esperando por vocês.
Convidamos a todes, filhes e mães, para uma roda de conversa com Sissy Kelly, Cristal e Renê Augusto e, logo após, um delicioso café cheio de amor de mãe!
A entrada é gratuita, é só vir meu bem!
""", data: ["25-10-2020 00:00:00"], hora: ["16:00"], localizacao: "Centro de Referencia da Juventude - CRJ - Rua Guaicurus - Centro, Belo Horizonte"), Evento(nome: "Mães contra o preconceito!", movimento: "Mães Pela Diversidade", descricao: """
Palestra, trocas de experiências, bate-papo e roda de conversa.
Na mesa: Zilda Vermont, Carlos Vinícius Silva Pinheiro, Mayra Ribeiro, Alexandre Mortagua e Majú Giorgi.
""", data: ["15-11-2020 00:00:00"], hora: ["13:00"], localizacao: "")]
    
    static let eventosAbglt: [Evento] = [Evento(nome: "IV Encontro Nacional de Juventude LGBTI em Belém", movimento: "ABGLT", descricao: "Entre os dias 29 a 31 de outubro, a cidade de Belém (PA) recebe o IV Encontro Nacional de Juventude LGBTI (ENJUV LGBTI). Com o objetivo de reunir jovens de todo país para discutir a política brasileira e a luta pela garantia dos direitos LGBTI, o tema desta edição é “Nada sobre nós sem nós: a importância do protagonismo juvenil LGBTI no cenário político brasileiro”. A edição 2020 do ENJUV terá como tema: “Nada sobre nós sem nós: aimportância do protagonismo juvenil LGBTI no cenário político brasileiro”. O tema traz a política como ponto principal, pois é a partir dela que muitos direitos são conquistados ou negados. Com a onda conservadora que se instalou no país a partir das eleições de 2018 e da ascensão do ‘bolsonarismo’, tornou-se ainda mais necessária a participação ativa da população LGBTI nos processos democráticos, nas escolhas de representações e até mesmo se colocando como uma opção de representação. Afinal, ter um LGBTI como representante dá ainda mais legitimidade as questões que atravessam a realidade dos LGBTI.", data: ["29-10-2020 00:00:00"], hora: ["19:00"], localizacao: "Bélem")]
}
