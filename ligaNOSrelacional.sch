table CLUBE
(
  _ Nome _ ,
  DataFund,
Estadio ?,
_ Classificacao _
)

table JOGADORES
(
  _ JogadoresId _,
  Nome,
Clube -->CLUBE.Nome,
  Numero,
Posicao,
País
)

table MARCADORES 
(
  _ JogadoresId _-->JOGADORES.JogadoresId,
  Clube-->CLUBE.Nome,
Golos
)


table JOGOS_CLUBE
( 
  _ JogosClubeId _ --> CLUBE.Nome,
  NumJogos,
Resultados_Vitorias,
Resultados_Empates,
Resultados_Derrotas,
Pontos
)

table CLASSIFICACAO 
(
  _ Lugar _ -->CLUBE.Classificacao,
  _ Clube _ --> CLUBE.Nome
)

table CLAQUE
(
_ Clube _ --> CLUBE.Nome,
_ Claque _
)