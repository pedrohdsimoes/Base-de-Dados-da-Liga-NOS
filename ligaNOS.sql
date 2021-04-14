
/*

Base de Dados

 LIGA NOS

 */

USE guest;

DROP TABLE IF EXISTS JOGADORES,CLUBE,MARCADORES,JOGOS_CLUBE,CLASSIFICACAO,CLAQUE;



CREATE TABLE IF NOT EXISTS 
CLUBE
(
  Nome              VARCHAR(64) UNIQUE NOT NULL,
  DataFund          INT NOT NULL,
  Estadio           VARCHAR(64) DEFAULT NULL,
  Classificacao     INT UNIQUE NOT NULL,
  PRIMARY KEY(Nome,Classificacao)
); 
 
INSERT INTO 
  CLUBE(Nome, DataFund, Estadio, Classificacao)
VALUES
  ('Porto',1893,'Dragão',2),
  ('Benfica',1904,'Luz',1),
  ('Sporting',1906,'Alvalade',6),
  ('Braga',1921,'Pedreira',4),
  ('Guimarães',1922,'D.Afonso Henriques',5),
  ('Belenenses SAD',2018,NULL,14);

CREATE TABLE IF NOT EXISTS 
JOGADORES
(
  JogadoresId       INT PRIMARY KEY AUTO_INCREMENT,
  Nome              VARCHAR(128) NOT NULL,
  Clube             VARCHAR(64) NOT NULL,
  Numero            INT NOT NULL,
  Posicao           VARCHAR(32) NOT NULL,
  País              VARCHAR(64) NOT NULL,
  FOREIGN KEY(Clube) REFERENCES CLUBE(Nome) ON DELETE CASCADE
); 

INSERT INTO 
  JOGADORES(Nome,Clube, Numero, Posicao, País)
VALUES
 ('Moussa Marega','Porto',11,'Avançado','Mali'),
 ('Alex Telles','Porto',13,'Defesa','Brasil'),
 ('Renan Ribeiro','Sporting',1,'Guarda-Redes','Brasil'),
 ('Pizzi','Benfica',21,'Médio','Portugal'),
 ('Ricardo Horta','Braga',21,'Médio','Portugal'),
 ('Ola John','Guimarães',8,'Avançado','Holanda'),
 ('Lord Licá','Belenenses SAD',7,'Avançado','Portugal');

CREATE TABLE IF NOT EXISTS
MARCADORES
(
    JogadoresId INT NOT NULL,
    Clube   VARCHAR(128) NOT NULL,
    Golos   INT NOT NULL,
    PRIMARY KEY(JogadoresId),
    FOREIGN KEY(JogadoresId) REFERENCES JOGADORES(JogadoresId) ON DELETE CASCADE,
    FOREIGN KEY(Clube) REFERENCES CLUBE(Nome) ON DELETE CASCADE
);


INSERT INTO 
  MARCADORES(JogadoresId,Clube,Golos)
VALUES
  (1,'Porto',100),
  (2,'Porto',2),
  (4,'Benfica',10),
  (5,'Braga',7),
  (7,'Belenenses SAD',20);


CREATE TABLE IF NOT EXISTS
JOGOS_CLUBE
(
    JogosClubeId                VARCHAR(128) UNIQUE NOT NULL,
    NumJogos                    INT NOT NULL,
    Resultados_Vitorias         INT NOT NULL,
    Resultados_Empates          INT NOT NULL,
    Resultados_Derrotas         INT NOT NULL,
    Pontos                      INT NOT NULL,
    PRIMARY KEY(JogosClubeId),
    FOREIGN KEY(JogosClubeId) REFERENCES CLUBE(Nome) ON DELETE CASCADE
);

INSERT INTO 
  JOGOS_CLUBE(JogosClubeId,NumJogos,Resultados_Vitorias,Resultados_Empates,Resultados_Derrotas,Pontos)
VALUES
  ('Porto',34,28,2,4,28*3+4),
  ('Benfica',34,32,1,1,32*3+1),
  ('Sporting',34,24,2,8,24*3+2),
  ('Braga',34,25,4,5,25*3+4),
  ('Guimarães',34,24,5,5,24*3+5),
  ('Belenenses SAD',34,15,5,14,15*3+5);

CREATE TABLE IF NOT EXISTS
CLASSIFICACAO
(
    Lugar INT UNIQUE NOT NULL,
    Clube VARCHAR(128) UNIQUE NOT NULL,
    PRIMARY KEY(Lugar,Clube),
    FOREIGN KEY(Clube) REFERENCES CLUBE(Nome) ON DELETE CASCADE,
    FOREIGN KEY(Lugar) REFERENCES CLUBE(Classificacao) ON DELETE CASCADE
);

INSERT INTO 
  CLASSIFICACAO(Lugar,Clube)
VALUES
  (1,'Benfica'),
  (2,'Porto'),
  (6,'Sporting'),
  (4,'Braga'),
  (5,'Guimarães'),
  (14,'Belenenses SAD');

CREATE TABLE IF NOT EXISTS
CLAQUE
(
  Clube    VARCHAR(64) NOT NULL,
  Claque  VARCHAR(64) UNIQUE NOT NULL,
  PRIMARY KEY(Clube, Claque),
  FOREIGN KEY(Clube) REFERENCES CLUBE(Nome) ON DELETE CASCADE
);

INSERT INTO 
  CLAQUE(Clube,Claque)
VALUES
  ('Porto','SuperDragões'), 
  ('Porto','Coletivo'),
  ('Benfica','NNBoys'),
  ('Benfica','DiabosVermelhos'),
  ('Sporting','JuveLeo'),
  ('Braga','UltrasRedBoysBraga92'),
  ('Guimarães','WhiteAngels'),
  ('Belenenses SAD','FuriaAzul');