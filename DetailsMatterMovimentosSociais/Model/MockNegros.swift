//
//  MockNegros.swift
//  DetailsMatterMovimentosSociais
//
//  Created by Helaine Pontes on 18/09/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
//swiftlint:disable line_length

struct MockNegros {
    let almaPreta = Movimento(nome: "Alma Preta", descricao: """
Criado em 2015 por um grupo de jovens comunicadores da UNESP, o Alma Preta é uma agência de jornalismo especializado na temática racial do Brasil. Em nosso conteúdo você encontra reportagens, coberturas, colunas, análises, produções audiovisuais, ilustrações e divulgação de eventos da comunidade afro-brasileira. Nosso objetivo é construir um novo formato de gestão de processos, pessoas e recursos através do jornalismo qualificado e independente.


Nosso dever não é apenas informar, mas também produzir conteúdos de utilidade pública que alcancem os anseios da comunidade afro-brasileira. Por isso, nós assumimos o caráter político de valorização do conhecimento e da cultura negra, bem como de exigência de direitos e questionamento ao Estado em todas as nossas produções.

Nossa linha está dividida em quatro editoriais: em Realidade, traz-se a discussão do racismo na política, economia, cultura e esporte. Na seção Da Ponte Pra Cá, aborda-se a visão da periferia e o que acontece de positivo nas favelas do país. Mama África contêm notícias do continente africano de forma que exponha a complexidade de temas e sua rica diversidade. Por fim, O Quilombo, o espaço da rede de opiniões dos colaboradores e parceiros do Alma Preta.

Buscando sempre inovar na forma de transmitir informação, no nosso site é possível encontrar diversas reportagens, coberturas, colunas, análises, principalmente, em texto, de diversas temáticas sociais. No nosso canal do Youtube, é possível acessar toda nossa produção audiovisual. São dezenas de vídeos de entrevistas e reportagens especiais, voltados para entretenimento e militância negra, que são atualizados semanalmente.

O nosso Spotify concentra boa parte da nossa produção de áudio. Por meio do nosso podcast “Papo Preto” nós abordamos temas como autoestima, bem estar e o dia a dia da população negra e periférica, a fim de inserir neste novo modelo de diálogo da sociedade mais subsídios para o debate social!

Acompanhe o nosso trabalho!

Fortaleça a luta contra o racismo!
""", imagem: "almaPreta", eventos: EventosMockNegros.eventosAlmaPreta, urlInstagram: "https://www.instagram.com/almapretajornalismo/", urlWebSite: "https://almapreta.com/", urlFacebook: "https://www.facebook.com/almapretajornalismo")
    
    let afromack = Movimento(nome: "Coletivo Negro Afromack", descricao: "Manifesto Afromack Coletivo de pretas e pretos do Mackenzie, aqui estudamos, trabalhamos, lecionamos, e antes de tudo resistimos.", imagem: "afromack", eventos: EventosMockNegros.eventosAfromack, urlInstagram: "instagram.com/coletivoafromack", urlWebSite: nil, urlFacebook: "https://www.facebook.com/Afromack")
    
    let conaq = Movimento(nome: "CONAQ", descricao: """
A CONAQ(Coordenação Nacional de Articulação das Comunidades Negras Rurais Quilombolas) é uma organização de âmbito nacional, sem fins lucrativos que representa a grande maioria dos (as) quilombolas do Brasil. Da CONAQ participam representantes das comunidades quilombolas de 23 estados da federação: Alagoas, Amapá, Bahia, Ceará, Espírito Santo, Goiás, Maranhão, Minas Gerais, Mato Grosso, Mato Grosso do Sul, Paraíba, Pará, Pernambuco, Piauí, Paraná, Rio Grande do Sul, Rio Grande do Norte, Rio de Janeiro, Rondônia, Sergipe, São Paulo, Santa Catarina e Tocantins.
Os objetivos da CONAQ é lutar pela garantia de uso coletivo do território, pela implantação de projetos de desenvolvimento sustentável, pela implementação de políticas públicas levando em consideração a organização das comunidades de quilombo; por educação de qualidade e coerente com o modo de viver nos quilombos; o protagonismo e autonomia das mulheres quilombolas; pela permanência do (a) jovem no quilombo e acima de tudo pelo uso comum do Território, dos recursos naturais e pela em harmonia com o meio ambiente.
""", imagem: "conaq", eventos: EventosMockNegros.eventosConaq, urlInstagram: "https://www.instagram.com/conaquilombos/", urlWebSite: "http://conaq.org.br/", urlFacebook: nil)
    
    let marielle = Movimento(nome: "Instituto Marielle Franco", descricao: "O Instituto Marielle Franco é uma organização sem fins lucrativos, criada pela família de Marielle, com a missão de inspirar, conectar e potencializar mulheres negras, LGBTQIA+ e periféricas a seguirem movendo as estruturas da sociedade por um mundo mais justo e igualitário.", imagem: "marielle", eventos: EventosMockNegros.eventosMarielle, urlInstagram: "https://www.instagram.com/institutomariellefranco/", urlWebSite: "https://www.institutomariellefranco.org/", urlFacebook: "https://www.facebook.com/institutomariellefranco/")
    
    let inegra = Movimento(nome: "INEGRA", descricao: "O Instituto Negra do Ceará – INEGRA é uma organização social de mulheres negras que objetiva promover os valores étnicos, políticos, sociais e culturais das populações negras, com prioridade à mulheres negras, atuando em uma perspectiva anti-racista e feminista. Reúne mulheres negras de diferentes áreas de formação e atuação política: militantes dos movimentos negro, feminista e popular; lideranças estudantis; pesquisadoras e profissionais liberais.", imagem: "inegra", eventos: EventosMockNegros.eventosInegra, urlInstagram: nil, urlWebSite: "https://inegrace.wordpress.com/about/", urlFacebook: nil)
    
    static var movimentos: [Movimento] = [MockNegros().almaPreta, MockNegros().afromack, MockNegros().conaq, MockNegros().marielle, MockNegros().inegra]
}

struct EventosMockNegros {
    static let eventosAlmaPreta: [Evento] = [Evento(nome: "Papo Preto Live", movimento: "Alma Preta", descricao: "No Papo Preto Live, nossa editora Nataly Simões recebe Marcelo Carvalho, diretor do Observatório da Discriminação Racial no Futebol, para bater um papo sobre os recentes casos de racismo ocorridos no esporte brasileiro, como o do atacante Neymar Jr. A entrevista será às 19h. Não perca!", data: ["10-10-10 00:00:00"], hora: ["19:00"], localizacao: "Facebook"), Evento(nome: "Papo Preto Live", movimento: "Alma Preta", descricao: "No Papo Preto Live, o repórter Juca Guimarães bate um papo com o advogado Irapuã Santana sobre a decisão do Supremo Tribunal Federal (STF) de antecipar a aplicação do fundo eleitoral proporcional para candidatos negros e brancos para as eleições municipais de 2020. O Tribunal Superior Eleitoral (TSE) havia aprovado a medida com aplicação apenas para a partir de 2022. Irapuã é doutor em Direito Processual e ex-assessor do atual ministro do STF, Luiz Fux. A entrevista acontece às 19h. Não perca!", data: ["20-10-2020"], hora: ["19:00"], localizacao: "Facebook")]
    
    static let eventosAfromack: [Evento] = [Evento(nome: "Coletivo Afromack: IV Semana da Consciência Negra", movimento: "Coletivo Negro Afromack", descricao: """
É com grande alegria que o Coletivo Negro Afromack convida a comunidade para participar da nossa “IV Semana da Consciência Negra” que acontecerá entre os dias 26 e 29 de Novembro na Universidade Presbiteriana Mackenzie.
Com o tema central “Enquilombando pra´ Crescer” contaremos com palestras e debates. Todos ocorrerão no Auditório Benedito Novaes - Prédio 9.
PROGRAMAÇÃO:
26, terça às 19h
Racismo Estrutural
Marcio Black, Tamires Sampaio e Flávio Campos
27, quarta às 19h
Estereótipos Negros na Mídia
Esther Vieira
28, quinta às 19h
A Posição do Negro no Mercado de Trabalho
Gilberto Costa, Vera Honorato e Gustavo de Paula
29, sexta às 19h
Sarau Afromack
""", data: ["26-11-2020", "27-11-2020", "28-11-2020", "29-11-2020"], hora: ["19:00", "19:00", "19:00", "19:00"], localizacao: "Auditório Benedito Novais - Mackenzie, Rua da Consolação, 930 08381 São Paulo, SP"), Evento(nome: "Bate-papo com a Amazon", movimento: "Coletivo Negro Afromack", descricao: "O Coletivo Negro Afromack promove um encontro entre os alunos negros do Mackenzie com a equipe da Amazon Brasil, para falar sobre processos seletivos e ações afirmativas dentro da empresa.", data: ["24-10-2020 00:00:00"], hora: ["18:00", "19:00"], localizacao: "Prédio 45, Sala 403 - Mackenzie, Rua da Consolação, 930 08381 São Paulo, SP")]
    
    static let eventosConaq: [Evento] = [Evento(nome: "DEFESA DE MESTRADO DA QUILOMBOLA APARECIDA MENDES", movimento: "CONAQ", descricao: """
Convidamos toda a comunidade para estar presente nesta importante data!
Defesa de Mestrado: Protagonismo de mulheres, perspectivas de emancipação e o enfrentamento à violência doméstica no Quilombo de Conceição das Crioulas - PE
""", data: ["12-10-2020"], hora: ["14:30"], localizacao: "Auditório Cerrado, Centro de Desenvolvimento Sustentável")]
    
    static let eventosMarielle: [Evento] = [Evento(nome: "Amanhecer de Justiça para Marielle e Anderson", movimento: "Instituto Marielle Franco", descricao: """
Completam-se 2 anos desde aquele 14 de março que nos tiraram Marielle e Anderson. Serão 731 dias sem respostas e sem sabermos quem mandou matar e por quê. Eles tentaram interromper Marielle, mas nós somos sementes. Eles tentaram manchar a sua imagem, mas nós somos memória. Eles tentaram quebrar a sua placa, mas nós já somos mais de 30 mil placas espalhadas pelo mundo dizendo Marielle presente hoje e sempre!
Para preservar a sua memória, multiplicar o seu legado e buscar por justiça, vamos ter um dia inteiro de ações nesse 14M. Ir às ruas em busca de Justiça por Marielle e Anderson é também lutar pela democracia! Não vão calar a voz de uma mulher negra, favelada, bissexual, defensora dos direitos humanos, não vão calar a voz de uma mulher eleita, não vão calar qualquer voz! E a cada barulho antidemocrático que insiste em surgir, nossa voz ecoará ainda mais alto! 14M é todo mundo junta e junto por justiça por Marielle e Anderson e pela democracia!
>> CONFIRA A PROGRAMAÇÃO <<
Por conta da pandemia de Coronavírus tivemos que alterar a programação desse 14 de março. Mas precisamos que esse continue sendo um grande dia de luta por justiça por Marielle! Por isso queremos fazer um grande amanhecer espalhado pelo mundo que irão pendurar faixas amarelas na suas janelas, ruas ou praças!
☀️ Por isso, vamos fazer um Amanhecer por Marielle e Anderson como nunca antes visto!
""", data: ["14-10-2020"], hora: ["07:00", "22:00"], localizacao: "Praça Mauá, Centro, Rio de Janeiro - RJ, 20081-240, Brasil"), Evento(nome: "Cineclube na Casa Marielle :: Filmes + debate", movimento: "Instituto Marielle Franco", descricao: """
Vai ter cineclube na Casa Marielle! 🎬 O Instituto Marielle Franco convida todas e todos pra assistir os filmes "Alfazema", de Sabrina Fidalgo, e "Travessia - Ep. Larissa Luz", de Renata Novaes. Depois vamos ter um debate sobre os filmes com as diretoras.
Atenção, o evento é sujeito a lotação! Chegue cedo pra garantir o lugar.
🎥 Alfazema, escrito e dirigido por Sabrina Fidalgo, traz a história da mulher que, ao esperar o paquera sair do banheiro, se depara com uma série de representações míticas. O filme ganhou o prêmio de Melhor Filme pelo Juri Popular no Festival Internacional de Curtas do Rio de Janeiro e o Festival de Brasília.
🎥 A série Travessia, de Renata Novaes, conta sobre temas urgentes a partir da visão de mulheres que representam um poderoso movimento de mudança. Vamos assistir ao episódio de Larissa Luz.
A #CasaMarielle vai estar aberta durante o mês de março com atividades culturais, encontros e rodas de conversa. Ela também vai contar com a exposição permanente Marielles, que conta a história da vida da Mari. Vamos encher a Casa de vida, arte, resistência e memória!
Chama todo mundo e vem! 💛
""", data: ["25-10-2020"], hora: ["19:00", "22:00"], localizacao: "Largo de São Francisco da Prainha, Saúde, Rio de Janeiro - RJ, 20081-261, Brasil")]
    
    static let eventosInegra: [Evento] = [Evento(nome: "REUNIÃO DA SOCIEDADE CIVIL PARA A CONSTRUÇÃO DO PLANO MUNICIPAL DE PROMOÇÃO DA IGUALDADE RACIAL.", movimento: "INEGRA", descricao: "Segmentos sociais, entidades do movimento de negros (as), entidades de classe estão convidados (as) a participarem da reunião de construção do plano municipal de igualdade racial. PAUTA: ORGANIZAÇÃO E MOBILIZAÇÃO PARA O PLANO MUNICIPAL DE PROMOÇÃO DA IGUALDADE RACIAL.", data: ["22-10-2020 00:00:00"], hora: ["16:00"], localizacao: "Casa Branca – Parque da Liberdade / Cidade da Criança. Rua Pedro I. s/n Centro, Fortaleza – Ce."), Evento(nome: "AUDIÊNCIA PÚBLICA PARA DISCUSSÃO SOBRE O PROCESSO DE ELABORAÇÃO DO  PLANO MUNICIPAL DE PROMOÇÃO DA IGUALDADE RACIAL.", movimento: "Inegra", descricao: "", data: ["22-11-2020"], hora: ["14:30"], localizacao: "Plenário da Câmara Municipal de Fortaleza")]
}
