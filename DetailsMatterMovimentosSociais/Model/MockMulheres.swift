//
//  MockMulheres.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Lidiane Gomes Barbosa on 11/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//
//swiftlint:disable line_length
import Foundation

struct MulheresMock {
    let mulher360 = Movimento(nome: "+ Mulher 360", descricao: """
A Associação Movimento Mulher 360, como uma iniciativa empresarial, visa engajar as empresas em ações concretas com seu público interno, em um primeiro momento, e, gradualmente, expandir essa atuação para mulheres nas comunidades e cadeia de suprimentos.

Em longo prazo, esperamos que o conjunto dessas ações possam promover mudanças na sociedade de uma forma mais ampla.
""", imagem: "mulher360", eventos: EventosMulheresMock.eventosMulher360, urlInstagram: "https://www.instagram.com/movimento.mulher360/", urlWebSite: "https://movimentomulher360.com.br", urlFacebook: "https://www.facebook.com/MovimentoMulher360/")
    
    let pyLadiesBrasil = Movimento(nome: "PyLadies Brasil", descricao: """
O PyLadies é uma comunidade mundial que foi trazida ao Brasil com o propósito de instigar mais mulheres a entrarem na área tecnológica.

Queremos mudar essa realidade de poucas garotas em uma área tão rica e fantástica como a computação.
E olhe que temos muita história nesse campo, viu?!

Nós percebemos que não haviam motivos para sermos poucas em salas de cursos universitários e técnicos de informática e tecnologia pelo Brasil, então resolvemos nos organizar para dar um jeitinho nisso.

Foi então que encontramos outras ladies pelo mundo, que se reuniam em nome da programação e falavam de abstração de um jeito que só ladies sabem falar.
""", imagem: "pyladies", eventos: EventosMulheresMock.eventosPyLadies, urlInstagram: "https://www.instagram.com/pyladiesbrasil/", urlWebSite: "https://brasil.pyladies.com", urlFacebook: "https://www.facebook.com/PyLadiesBrazil/")
    
    let catolicasPeloDireitoDeDecidir = Movimento(nome: "Católicas pelo direito de decidir", descricao: """
Católicas pelo Direito de Decidir foi fundada no Dia Internacional da Mulher de 1993. A ONG apoia-se na prática e teoria feministas para promover mudanças em nossa sociedade, especialmente nos padrões culturais e religiosos.

As religiões são profundamente importantes na história, cultura e imaginário social, portanto influenciam nosso cotidiano, comportamento e decisões.

Consideramos que as religiões devem ajudar as pessoas a terem uma vida digna e saudável, e não dificultar sua autonomia e liberdade, especialmente em relação à sexualidade e reprodução.

Por isso, lutamos pela laicidade do Estado que deve ser livre da interferência religiosa na criação e condução das políticas públicas.
""", imagem: "catolicas", eventos: EventosMulheresMock.eventosCatolicas, urlInstagram: nil, urlWebSite: "http://www.catolicasonline.org.br", urlFacebook: "https://www.facebook.com/catolicasdireitodecidir")
    
    let semprevivaOrganizacaoFeminista = Movimento(nome: "SOF Sempreviva Organização Feminista", descricao: """
A SOF Sempreviva Organização Feminista é uma organização não governamental com sede em São Paulo que faz parte do movimento de mulheres no Brasil e em âmbito internacional.

Uma das contribuições centrais da SOF está no campo da formação que tem sido uma forte campo de atuação desde os anos 1980.

Coordenou atividades educativas desde o âmbito local até regional e América Latina, com um público diverso como mulheres rurais e urbanas, negras, indígenas e jovens, lideranças e ativistas de base, técnicas e técnicos de ONG´s e órgãos públicos.
""", imagem: "sempreviva", eventos: EventosMulheresMock.eventosSempreviva, urlInstagram: nil, urlWebSite: "https://www.sof.org.br", urlFacebook: "https://www.facebook.com/sofsempreviva")
    
    static var movimentos: [Movimento] = [MulheresMock().mulher360, MulheresMock().pyLadiesBrasil, MulheresMock().catolicasPeloDireitoDeDecidir, MulheresMock().semprevivaOrganizacaoFeminista]
}

struct EventosMulheresMock {
    static let eventosMulher360: [Evento] = [Evento(nome: "O inconsciente nas tomadas de decisão", movimento: "+ Mulher 360", descricao: """
O Insper, o Movimento Mulher 360, o PwC e a ONU Mulheres são os responsáveis pelo evento “O inconsciente nas tomadas de decisão”.

A oficina tem o objetivo de apresentar o que são esses vieses e inspirar caminhos para que eles sejam trabalhados nas empresas.

A oficina conta com as palestras dos seguintes especialistas: Ana Carolina Querino, ONU Mulheres; Tatiana Trevisan, Movimento Mulher 360; Professor Antonio Pereira, do Instituto do Cérebro da UFRN; Professora Regina Madalozzo, Insper; Ana Paula Malvestio, PwC; Cláudia Cavalcante, Unilever; Silvia Tyrola, Accenture, Regina Chamma, Google; Gilberto Rigolon, Nestlé; e Daniela Sicoli, Microsoft Brasil.
""", dataHora: "03-10-2020 14:00:00", localizacao: """
Casa da ONU – Complexo Sérgio Vieira de Mello
Setor de Embaixadas Norte – SEN, Quadra 802 – Lote 17
CEP: 70800-400 – Brasília/DF
""")]

    static let eventosPyLadies: [Evento] = [Evento(nome: "PyLadies Recife & PUG-PE Apresentam: um pedaço de Recife na PyBR 2019", movimento: "Pyladies", descricao: """
Sejam bem vind@s ao Pedaço do Recife na PyBr 2019 !!

Esse evento magnífico está sendo organizado pelo PyLadies Recife e pelo PUG-PE, com o intuito de trazer um pouco do que o que foi mostrado na Python Brasil 2019 que ocorreu entre os dias 23 e 28 de Outubro.

Serão 10 palestras e 2 tutoriais, durante todo o dia.

Como ingresso estamos pedindo um alimento não perecível ou uma roupa em bom estado (esse item vai validar sua entrada no evento, mas caso não tenha, não tem problema).
""", dataHora: "30-10-2020 16:00:00", localizacao: """
UNIFG
Avenida Governador Carlos de Lima Cavalcanti, 155, Boa Vista
Recife, PE
"""), Evento(nome: "Gitday - PyLadies Fortaleza (Hacktoberfest 2019)", movimento: "Pyladies", descricao: """
Quer matar a sua fome de Pull Requests, colaborar em projetos e ainda cumprir o desafio da Hacktoberfest? Vem pra o Git Day que a gente te mostra como!

Com duração de quatro horas, este encontro tem o objetivo de compartilhar conhecimentos de Git, propondo um ambiente colaborativo, onde pessoas mais experientes irão ajudar as iniciantes e todas elas, ao final da manhã, terão cumprido a missão proposta pela Hacktoberfest.
""", dataHora: "05-11-2020 15:00:00", localizacao: """
Centro Universitário Farias Brito - FB UNI
Rua Castro Monte, 1364, Varjota
Fortaleza, CE
""")]
    
    static let eventosCatolicas: [Evento] = [Evento(nome: "Café com Luta: Justiça Reprodutiva e Fé", movimento: "Católicas pelo direito de decidir", descricao: """
Dia 31 de Outubro, às 19:00, temos mais uma edição do Café Com Luta.

Desta vez, vamos conversar sobre justiça reprodutiva e fé com Simony Cristina, das Evangélicas pela Igualdade de Gênero, e Letícia Lopes, ativista de Católicas pelo Direito de Decidir.

O bate papo é ao vivo, na nossa sede, e será transmitido pela página de Católicas no Facebook.

A justiça reprodutiva é um assunto que aprofunda a discussão sobre a legalização e descriminalização do aborto.

A expressão, derivada dos temas justiça social e direitos reprodutivos, coloca a dimensão racial e étnica como fator fundamental para refletir sobre a saúde reprodutiva das mulheres.
""", dataHora: "30-09-2020 00:00:00", localizacao: "Sede de Católicas: Rua Martiniano de Carvalho, nº 71, casa 11, Bela Vista, SP"), Evento(nome: "CAFÉministas: Os Corpos Negros na Teologia", descricao: """
Descolonizar a teologia é urgente e, pensando nisso, o próximo bate papo das Café_ministas terá como tema “Os Corpos Negros na Teologia”.

Com a experiência de fé da Pastora Eliad (Igreja Metodista e Evangélicas pela Igualdade de Gênero) , da Daiane Zito (PASTORAL DA JUVENTUDE NACIONAL) e da Isadora Nascimento (Movimento Negro Evangélico do Brasil), queremos pensar contribuições antirracistas para nossas igrejas.

Por acreditarmos que racismo também é pecado porque aniquila o outro, sentimos que é preciso uma nova compreensão teológica para combater esse mal que há tantos anos assombra e assola a vida de diversos pessoas religiosas.

Mobilize sua igreja. Chame seus amigos e  amigas. O convite é aberto, gratuito e indispensável para quem crê ou não.
""", dataHora: "16-09-2020 00:00:00", localizacao: """
Koinonia Presença Ecumênica
Rua do Carmo, 56, Sé
São Paulo – SP
""")]
    
    static let eventosSempreviva: [Evento] = [Evento(nome: "Mostra de Economia Feminista e Solidária", movimento: "Sempreviva Organização Feminista", descricao: """
Nos próximos dias 4 e 5 de dezembro acontece a Mostra de Economia Solidária e Feminista “Mulheres transformando a economia” na Praça das Artes, centro de São Paulo.

O evento é uma realização da SOF Sempreviva Organização Feminista e da Secretaria Municipal de Políticas para Mulheres de São Paulo (SMPM), em parceria com a Secretaria Municipal de Cultura de São Paulo.

A Mostra reunirá mulheres urbanas e rurais do Estado de São Paulo para intercâmbio de experiências na economia solidária e feminista.

Mulheres de diversos grupos e cooperativas debaterão sobre os desafios e aprendizados para as alternativas coletivas de geração de renda e garantia de autonomia econômica.
""", dataHora: "04-12-2020 19:00:00", localizacao: """
Centro Histórico de São Paulo
Av. São João, 281
São Paulo - SP, 01035-000
""")]
}
