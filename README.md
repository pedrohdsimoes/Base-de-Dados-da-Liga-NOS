# Base-de-Dados-da-Liga-NOS

## Requisitos considerados para a BD


•	Um jogador é caracterizado por um id único, um nome, clube em que jogam, número da camisola, posição em que joga, e o seu país de origem. 
•	Um clube é caracterizado por um nome único, a sua data de fundação, seu estádio, que é opcional, e a classificação em que se encontram, que também é única.
•	Um marcador é caracterizado por um id único correspondente ao id de cada jogador, clube em que jogam, e o número de golos que já marcaram.
•	Um clube realiza um certo número de jogos podendo estes serem vitórias, empates ou derrotas, acumulando assim pontos.
•	A claque é constituída por um nome e pelo clube que apoia.
•	A classificação é constituída por um lugar único e por um clube.
•	Um clube pode ter vários jogadores.
•	O jogador apenas representa um clube.
•	Um clube pode ter várias claques.
•	Um jogador pode marcar ou não marcar. Se marcar, pertence aos marcadores.
•	A classificação é constituída por vários clubes, e o seu respetivo lugar único.




## Explicação da tradução dos requisitos em modelo ER

Consideremos o universo de um campeonato de futebol em que temos as seguintes entidades-tipo, respetivos atributos e relacionamentos implícitos:

•	CLUBE: Nome único, Data de Fundação, Estádio opcional, Anos de Existência, Classificação, em que o Ano de existência é derivado da Data de Fundação e a classificação do clube tem que ser única.
•	JOGADORES: JogadoresId, Nome , Clube, Posição, País , em que cada jogador (JogadoresId) tem que ter um clube existente.
•	MARCADORES: JogadoresId, Clube, Golos , todos os jogadores (JogadoresId) pertencentes a um clube têm que ter pelo menos um golo para ser marcador
•	JOGOS_CLUBE: JogosClubeId, Número de Jogos, Resultado_Vitorias, Resultado_Empates, Resultado_Derrotas, Pontos ,  em que os Jogos realizados pelos clubes(JogosClubeId) distribuídos por vitorias, empates e derrotas atribuem os pontos de acordo com os resultados obtidos.
•	CLASSIFICAÇÃO: Lugar, Clube em que o Lugar é único e é atribuído a apenas um Clube existente.
•	CLAQUE: Clube, Claque em que o Clube pode ter várias claques mas uma claque apenas apoia um clube.



E os seguintes relacionamentos:

1.	JOGAM_EM (JOGADORES, CLUBE)
2.	MARCAM (JOGADORES, MARCADORES)
3.	LUGAR_EM (CLUBE , CLASSIFICACAO)
4.	FEITOS_POR (JOGOS_CLUBE , CLUBE)
5.	REPRESENTAM (MARCADORES , CLUBE)
6.	TEM (CLUBE , CLAQUE)


1.	Cada jogador joga apenas em um único clube. Um clube tem pelo menos um jogador que joga por ele.
2.	Um jogador que marque golo pertence a MARCADORES, se não marcar não pertence.
3.	Uma classificação tem vários clubes. Cada clube tem um lugar único na classificação.
4.	Um clube tem vários jogos jogados. Cada clube tem o registo dos seus jogos jogados.
5.	Os marcadores representam apenas um clube podendo haver vários marcadores do mesmo clube.
6.	Uma claque apoia apenas uma equipa, podendo essa equipa ter várias claques.








## Explicação da tradução do modelo ER para o modelo relacional

	Entidades-tipo e relacionamentos passam a ser representados por tabelas. 

Mapeamento de entidades-tipo

Entidade – tipo E >> Tabela T

CLUBE de E >>> nome de T
Nome e Classificação de E >>> chave primárias de T
AnosExist de E não é mapeado
DataFund de E >>> atributo simples de T
Estadio de E, inclui o valor NULL nos seus atributos. Mantemos a notação Estadio?

JOGADORES de E >>> nome de T
JogadoresId de E >>> chave primária de T
Clube de E >>> chave externa de CLUBE
Nome, Numero, Posição, País de E >>> atributos simples de T

MARCADORES de E >>> nome de T
JogadoresId de E >>> chave primária de T, chave externa de JOGADORES
Clube de E >>> chave externa de CLUBE
Golos de E >>> atributo simples de T

JOGOS_CLUBE de E >>> nome de T
JogosClubeId de E >>> chave primária de T, chave externa de CLUBE
NumJogos,Pontos de E >>> atributos simples de T
Vitórias, Empates, Derrotas de Resultados de E >>> atributos de T

CLAQUE de E >>> nome de T
Clube de E >>> chave primária de T, chave externa de CLUBE
Claque de E >>> tabela auxiliar CLAQUE com chave externa referenciando a chave primária de 	                 CLUBE

CLASSIFICACAO de E >>> nome de T
Lugar, Clube de E >>> chaves primárias de T, chaves externas de CLUBE


Foi criada uma tabela Claque.
As vitórias, empates e derrotas foram adicionados a tabela Jogos_Clube, que são derivados dos resultados.

