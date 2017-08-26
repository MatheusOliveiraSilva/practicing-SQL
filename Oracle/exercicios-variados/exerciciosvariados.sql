-- CRIA��O DAS TABELAS

DROP TABLE PREREQ;
DROP TABLE PROFTURMA;
DROP TABLE PROFESSOR;
DROP TABLE TITULACAO;
DROP TABLE HORARIO;
DROP TABLE SALA;
DROP TABLE PREDIO;
DROP TABLE TURMA;
DROP TABLE DISCIPLINA;
DROP TABLE DEPTO;

CREATE TABLE DEPTO 
(
  CODDEPTO CHAR(5), /*PK*/
  NOMEDEPTO VARCHAR(40)
);
ALTER TABLE DEPTO ADD CONSTRAINT PK_DEPTO PRIMARY KEY (CODDEPTO);

CREATE TABLE DISCIPLINA 
(
  CODDEPTO       CHAR(5) NOT NULL, /*FK*/
  NUMDISC        INT NOT NULL,   /*PK*/
  NOMEDISC       VARCHAR(10),
  CREDITODISC    INT
);
ALTER TABLE DISCIPLINA ADD CONSTRAINT PK_DISCIPLINA PRIMARY KEY (CODDEPTO, NUMDISC);
ALTER TABLE DISCIPLINA ADD CONSTRAINT FK_DISCIPLI_RELATION_DEPTO FOREIGN KEY (CODDEPTO) REFERENCES DEPTO;

CREATE TABLE PREREQ
(
  CODDEPTOPREREQ CHAR(5) NOT NULL,       /*FK*//*PK*/
  NUMDISCPREREQ  INT    NOT NULL,      /*FK*//*PK*/
  CODDEPTO       CHAR(5) NOT NULL,     /*FK*//*PK*/
  NUMDISC        INT    NOT NULL     /*FK*//*PK*/
);
ALTER TABLE PREREQ ADD CONSTRAINT FK_PREREQ_TEM_PRE_DISCIPLI FOREIGN KEY (CODDEPTO, NUMDISC) REFERENCES DISCIPLINA;
ALTER TABLE PREREQ ADD CONSTRAINT FK_PREREQ_EH_PRE_DISCIPLI FOREIGN KEY (CODDEPTOPREREQ, NUMDISCPREREQ) REFERENCES DISCIPLINA;
ALTER TABLE PREREQ  ADD CONSTRAINT PK_PREREQ PRIMARY KEY (CODDEPTOPREREQ, NUMDISCPREREQ, CODDEPTO, NUMDISC);

CREATE TABLE TURMA
(
  ANOSEM      INT NOT NULL, /*PK*/
  CODDEPTO    CHAR(5) NOT NULL, /*FK*//*PK*/
  NUMDISC     INT NOT NULL,    /*FK*//*PK*/
  SIGLATUR    CHAR(2),
  CAPACTUR    INT
);
ALTER TABLE TURMA ADD CONSTRAINT PK_TURMA PRIMARY KEY (ANOSEM, CODDEPTO, NUMDISC, SIGLATUR);
ALTER TABLE TURMA ADD CONSTRAINT FK_TURMA_RELATION_DISCIPLI FOREIGN KEY (CODDEPTO, NUMDISC) REFERENCES DISCIPLINA;

CREATE TABLE PREDIO
(
  CODPRED    INT, /*PK*/
  NOMEPRED   VARCHAR(40)
);
ALTER TABLE PREDIO ADD CONSTRAINT PK_PREDIO PRIMARY KEY (CODPRED);

CREATE TABLE SALA
(
  CODPRED         INT NOT NULL,  /*FK*//*PK*/
  NUMSALA         INT,  /*PK*/
  DESCRICAOSALA   VARCHAR(40),
  CAPACSALA       INT
);
ALTER TABLE SALA ADD CONSTRAINT PK_SALA PRIMARY KEY (CODPRED, NUMSALA);
ALTER TABLE SALA ADD CONSTRAINT FK_SALA_RELATION_PREDIO FOREIGN KEY (CODPRED) REFERENCES PREDIO;

CREATE TABLE HORARIO
(
  ANOSEM      INT NOT NULL,        /*FK*//*PK*/
  CODDEPTO    CHAR(5) NOT NULL,    /*FK*//*PK*/
  NUMDISC     INT NOT NULL,     /*FK*//*PK*/
  SIGLATUR    CHAR(2) NOT NULL,  /*FK*//*PK*/
  DIASEM      INT NOT NULL,    /*PK*/
  HORAINICIO  INT NOT NULL,    /*PK*/
  NUMSALA     INT,   /*FK*/
  CODPRED     INT,  /*FK*/
  NUMHORAS    INT
); 
ALTER TABLE HORARIO ADD CONSTRAINT PK_HORARIO PRIMARY KEY (ANOSEM,CODDEPTO,NUMDISC, SIGLATUR, DIASEM, HORAINICIO);
ALTER TABLE HORARIO ADD CONSTRAINT FK_HORARIO_RELATION_TURMA FOREIGN KEY (ANOSEM, CODDEPTO, NUMDISC, SIGLATUR) REFERENCES TURMA;
ALTER TABLE HORARIO ADD CONSTRAINT FK_HORARIO_RELATION_SALA FOREIGN KEY (CODPRED, NUMSALA) REFERENCES SALA;

CREATE TABLE TITULACAO 
(
  CODTIT INT, /*PK*/
  NOMETIT VARCHAR(40)
);
ALTER TABLE TITULACAO ADD CONSTRAINT PK_TITULACAO PRIMARY KEY (CODTIT);

CREATE TABLE PROFESSOR 
(
  CODPROF INT, /*PK*/
  CODDEPTO CHAR(5), /*FK*/
  CODTIT INT, /*FK*/
  NOMEPROF VARCHAR(40)
);
ALTER TABLE PROFESSOR ADD CONSTRAINT PK_PROFESSOR PRIMARY KEY (CODPROF);
ALTER TABLE PROFESSOR ADD CONSTRAINT FK_PROFESSOR_RELATION_DEPTO FOREIGN KEY (CODDEPTO) REFERENCES DEPTO;
ALTER TABLE PROFESSOR ADD CONSTRAINT FK_PROFESSOR_RELATION_TITULACA FOREIGN KEY (CODTIT) REFERENCES TITULACAO;

CREATE TABLE PROFTURMA 
(
  ANOSEM INT, /*FK*//*PK*/
  CODDEPTO CHAR(5), /*FK*//*PK*/
  NUMDISC INT, /*FK*//*PK*/
  SIGLATUR CHAR(2), /*FK*//*PK*/
  CODPROF INT /*FK*//*PK*/ 
);
ALTER TABLE PROFTURMA ADD CONSTRAINT PK_PROFTURMA PRIMARY KEY (ANOSEM, CODDEPTO, NUMDISC, SIGLATUR, CODPROF);
ALTER TABLE PROFTURMA ADD CONSTRAINT FK_PROFTURM_PROFTURMA_PROFES FOREIGN KEY (CODPROF) REFERENCES PROFESSOR;
ALTER TABLE PROFTURMA ADD CONSTRAINT  FK_PROFTURM_PROFTURMA_TURMA FOREIGN KEY (ANOSEM,CODDEPTO,NUMDISC,SIGLATUR) REFERENCES TURMA;
-- NOTA: DE ONDE A TABELA PROFTURMA PEGA A FK CODDEPTO: DA TABELA PROFESSOR OU DA TABELA TURMA? */ 

/* 
 * Exerc�cios de SQL - parte 1
 * A. INSERIR REGISTROS PARA TODAS AS TABELAS RESPEITANDO AS INTEGRIDADES.
 */
 
 -- 1) Obter os c�digos dos diferentes departamentos que tem turmas no ano-semestre 2002/1
-- UPDATE DEPTO SET CODDEPTO = 'MT', NOMEDEPTO = 'Matem�tica e estat�stica' WHERE CODDEPTO = 'RH';
 -- INSER��ES NA TABELA DEPTO
 INSERT INTO DEPTO (CODDEPTO, NOMEDEPTO) VALUES ('CB', 'Ci�ncias biol�gicas');
 INSERT INTO DEPTO (CODDEPTO, NOMEDEPTO) VALUES ('MT', 'Matem�tica e estat�stica');
 INSERT INTO DEPTO (CODDEPTO, NOMEDEPTO) VALUES ('L', 'Linguagens');
 -- INSER��ES NA TABELA DISCIPLINA
 INSERT INTO DISCIPLINA (CODDEPTO, NUMDISC, NOMEDISC, CREDITODISC) VALUES ('MT', 1, '�lgebra', 6);
 INSERT INTO DISCIPLINA (CODDEPTO, NUMDISC, NOMEDISC, CREDITODISC) VALUES ('CB', 2, 'Anatomia', 5);
 INSERT INTO DISCIPLINA (CODDEPTO, NUMDISC, NOMEDISC, CREDITODISC) VALUES ('L', 3, 'Literatura', 7);
 --UPDATE DISCIPLINA SET NUMDISC = 1 WHERE CODDEPTO = 'MT';
 -- INSER��ES NA TABELA TURMA 
 INSERT INTO TURMA (ANOSEM, CODDEPTO, NUMDISC, SIGLATUR, CAPACTUR) VALUES (20172, 'MT',1, 'TA', 40);
 INSERT INTO TURMA (ANOSEM, CODDEPTO, NUMDISC, SIGLATUR, CAPACTUR) VALUES (20021, 'CB',2, 'CA', 40);
 INSERT INTO TURMA (ANOSEM, CODDEPTO, NUMDISC, SIGLATUR, CAPACTUR) VALUES (20021, 'L',3, 'LT', 40);
 --INNER JOIN DO EXERC�CIO
 SELECT DE.CODDEPTO 
 FROM DEPTO DE INNER JOIN DISCIPLINA DI
 ON (DE.CODDEPTO = DI.CODDEPTO)
 INNER JOIN TURMA T
 ON (DI.CODDEPTO = T.CODDEPTO)
 WHERE ANOSEM = 20021;
 -- PROCEDURES
 
EXECUTE INSERE_DEPTO ('AG', 'AGRO');
 CREATE OR REPLACE PROCEDURE INSERE_DEPTO (
                                      CODDEPTO IN CHAR,
                                      NOMEDEPTO IN VARCHAR)
AS
BEGIN
INSERT INTO DEPTO (CODDEPTO, NOMEDEPTO) VALUES (CODDEPTO, NOMEDEPTO);
END;

  EXECUTE INSERE_5MIL_DEPTO ;
CREATE OR REPLACE PROCEDURE INSERE_5MIL_DEPTO
IS
vCONTADOR SMALLINT;
vNOMEDEPTO VARCHAR(10);
--vCONTADORFINAL SMALLINT;
BEGIN
--vCONTADORFINAL := 5000;
FOR vCONTADOR IN 0..5000 --vCONTADORFINAL
LOOP
INSERT INTO DEPTO (CODDEPTO, NOMEDEPTO) VALUES (vCONTADOR, TO_CHAR(vCONTADOR));
END LOOP;
END;



