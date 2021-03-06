/* CRIA��O DAS TABELAS -- */
 ---------------------------------------------------------------
-- TABELA ESTADO
CREATE TABLE TB_ESTADO(
    SIGLA_ESTADO CHAR(2),
    NOME_ESTADO VARCHAR(40)
); 
-- CONSTRAINT(S) DA TB_ESTADO
ALTER TABLE TB_ESTADO ADD CONSTRAINT PK_TB_ESTADO PRIMARY KEY (SIGLA_ESTADO);

-- TABELA CLASSE
CREATE  TABLE TB_CLASSE(
    ID_CLASSE SMALLINT,
    ID_ANDAR SMALLINT
); 
-- CONSTRAINT(S) DA TB_CLASSE
ALTER TABLE TB_CLASSE ADD CONSTRAINT PK_TB_CLASSE PRIMARY KEY (ID_CLASSE);

-- TABELA PROFESSOR
CREATE TABLE TB_PROFESSOR(
    ID_PROFESSOR CHAR(3),
    NOME_PROFESSOR VARCHAR(25)
);
-- CONSTRAINT(S) DA TB_PROFESSOR
ALTER TABLE TB_PROFESSOR ADD CONSTRAINT PK_TB_PROFESSOR PRIMARY KEY (ID_PROFESSOR);

-- TABELA ALUNO
CREATE TABLE TB_ALUNO(
    COD_ALUNO SMALLINT,
    NOME_ALUNO VARCHAR(45),
    END_ALUNO VARCHAR(100),
    SIGLA_ESTADO CHAR(2),
    ID_CLASSE SMALLINT
); 
-- CONSTRAINT(S) DA TB_ALUNO
ALTER TABLE TB_ALUNO ADD CONSTRAINT PK_TB_ALUNO  PRIMARY KEY (COD_ALUNO);
ALTER TABLE TB_ALUNO ADD CONSTRAINT FK_TB_ALUNO_TB_ESTADO FOREIGN KEY (SIGLA_ESTADO) REFERENCES TB_ESTADO;
ALTER TABLE TB_ALUNO ADD CONSTRAINT FK_TB_ALUNO_TB_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES TB_CLASSE;

-- TABELA DISCIPLINA
CREATE TABLE TB_DISCIPLINA(
    ID_DISCIPLINA CHAR(3),
    NOME_DISCIPLINA VARCHAR(15),
    ID_PROFESSOR_DISCIPLINA CHAR(3),
    NOTA_MINIMA_DISCIPLINA SMALLINT
);
-- CONSTRAINT(S) DA TB_DISCIPLINA
ALTER TABLE TB_DISCIPLINA ADD CONSTRAINT PK_TB_DISCIPLINA PRIMARY KEY (ID_DISCIPLINA);
ALTER TABLE TB_DISCIPLINA ADD CONSTRAINT FK_TB_DISCIPLINA_TB_PROFESSOR FOREIGN KEY (ID_PROFESSOR_DISCIPLINA) REFERENCES TB_PROFESSOR;

-- TABELA ALUNO_DISCIPLINA
CREATE TABLE TB_ALUNO_DISCIPLINA(
    COD_ALUNO SMALLINT,
    ID_DISCIPLINA CHAR(3),
    NOTA_ALUNO SMALLINT
);
-- CONSTRAINT(S) DA TB_ALUNO_DISCIPLINA
ALTER TABLE TB_ALUNO_DISCIPLINA ADD CONSTRAINT PK_ALUNO_DISCIPLINA PRIMARY KEY (COD_ALUNO,ID_DISCIPLINA);
ALTER TABLE TB_ALUNO_DISCIPLINA ADD CONSTRAINT FK_TB_ALUNOD_DISC_TB_ALUNO FOREIGN KEY (COD_ALUNO) REFERENCES TB_ALUNO;
ALTER TABLE TB_ALUNO_DISCIPLINA ADD CONSTRAINT FK_TB_ALUNO_DISC_TB_DISCIPLINA FOREIGN KEY (ID_DISCIPLINA) REFERENCES TB_DISCIPLINA;

/* INSER��O DE DADOS NAS TABELAS */
--------------------------------------------------------------------
-- INSER��ES NA NA TB_PROFESSOR
INSERT INTO TB_PROFESSOR (ID_PROFESSOR, NOME_PROFESSOR) VALUES ('JOI', 'JOILSON CARDOSO');
INSERT INTO TB_PROFESSOR (ID_PROFESSOR, NOME_PROFESSOR) VALUES ('OSE', 'OSEAS SANTANA');
INSERT INTO TB_PROFESSOR (ID_PROFESSOR, NOME_PROFESSOR) VALUES ('VIT','VITOR VASCONCELOS');
INSERT INTO TB_PROFESSOR (ID_PROFESSOR, NOME_PROFESSOR) VALUES ('FER', 'JOSE ROBERTO FERROLI');
INSERT INTO TB_PROFESSOR (ID_PROFESSOR, NOME_PROFESSOR) VALUES ('LIM', 'VALMIR LIMA');
INSERT INTO TB_PROFESSOR (ID_PROFESSOR, NOME_PROFESSOR) VALUES ('EDS', 'EDSON SILVA');
INSERT INTO TB_PROFESSOR (ID_PROFESSOR, NOME_PROFESSOR) VALUES ('WAG', 'WAGNER OKIDA');

-- INSER��ES NA TB_ESTADO
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('AC', 'ACRE');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('AL','ALAGOAS');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('AP', 'AMAP�');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('AM', 'AMAZONAS');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('BA', 'BAHIA');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('CE', 'CEAR�');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('DF', 'BRAS�LIA');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('ES', 'ESP�RITO SANTO');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('GO', 'GOI�S');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('MA', 'MARANH�O');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('MT', 'MATO GROSSO');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('MS', 'MATO GROSSO DO SUL');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('MG','MINAS GERAIS');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('PA','PAR�');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('PB', 'PARA�BA');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('PR', 'PARAN�');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('PE', 'PERNAMBUCO');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('PI', 'PIAU�');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('RJ', 'RIO DE JANEIRO');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('RN', 'RIO GRANDE DO NORTE');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('RS', 'RIO GRANDE DO SUL');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('RO','ROND�NIA');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('RR', 'RORAIMA');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('SC', 'SANTA CATARINA');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('SP', 'S�O PAULO');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('SE', 'SERGIPE');
INSERT INTO TB_ESTADO (SIGLA_ESTADO, NOME_ESTADO) VALUES ('TO', 'TOCANTINS');

-- INSER��ES NA TB_CLASSE
INSERT INTO TB_CLASSE (ID_CLASSE, ID_ANDAR) VALUES (1,1);
INSERT INTO TB_CLASSE (ID_CLASSE, ID_ANDAR) VALUES (2,2);
INSERT INTO TB_CLASSE (ID_CLASSE, ID_ANDAR) VALUES (3,3);

 -- INSER��ES NA TB_ALUNO
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (1, 'ANTONIO CARLOS PENTEADO', 'RUA X', 'SP', 1);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (2, 'AUROMIR DA SILVA VALDEVINO', 'RUA W', 'SP', 1);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (3, 'ANDRE COSTA', 'RUA T', 'SP', 1);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (4, 'ROBERTO SOARES DE MENEZES', 'RUA BW', 'SP', 2);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (5, 'DANIA', 'RUA CCC', 'SP', 2);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (6, 'CARLOS MAGALH�ES', 'AV SP', 'SP', 2);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (7, 'MARCELO RAUBA', 'AV S�O LU�S', 'SP', 3);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (8, 'FERNANDO', 'AV COUNTYR', 'SP', 3);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (9, 'WALMIR BURIN', 'RUA SSISIS', 'SP', 3);
 INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES (10, 'MATHEUS SILVA', 'RUA DAS BOAS NOITES', 'PI', 3);
-- INSER��ES NA TB_DISCIPLINA
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA) VALUES ('MAT', 'MATEM�TICA', 'JOI', 7);
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA) VALUES ('POR', 'PORTUGU�S', 'VIT', 5);
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA) VALUES ('FIS', 'FISICA', 'OSE', 3);
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA) VALUES ('HIS', 'HISTORIA', 'EDS', 2);
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA) VALUES ('GEO', 'GEOGRAFIA', 'WAG', 4);
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA) VALUES ('ING', 'INGL�S', 'LIM', 2);

-- INSER��ES NA TB_ALUNO_DISCIPLINA
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (1, 'MAT', 0);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (2, 'MAT', 0);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (3, 'MAT', 1);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (4, 'POR', 2);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (5, 'POR', 2);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (6, 'POR', 2);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (7, 'FIS', 3);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (8, 'FIS', 3);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (9, 'FIS', 3);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (1, 'POR', 2);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (2, 'POR', 2);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (7, 'POR', 2);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (1, 'FIS', 3);
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES (10, 'FIS', 3);

/* EXERC�CIOS */

-- A) EXERC�CIOS DE SELECT B�SICO 

-- 1) QUEREMOS SELECIONAR TODOS OS ALUNOS CADASTRADOS
SELECT * FROM TB_ALUNO;

-- 2) QUEREMOS SELECIONAR TODOS OS NOMES DE DISCIPLINAS CUJO A NOTA M�NIMA SEJA MAIOR QUE 5
SELECT NOME_DISCIPLINA, NOTA_MINIMA_DISCIPLINA 
FROM TB_DISCIPLINA
WHERE NOTA_MINIMA_DISCIPLINA > 5;

-- 3)Queremos selecionar todas disciplinas que tenham nota m�nima entre 3 (tr�s) e 5 (cinco).
SELECT * FROM TB_DISCIPLINA
WHERE NOTA_MINIMA_DISCIPLINA BETWEEN 3 AND 5;

-- B) Exerc�cios de SELECT (Ordenando e agrupando dados)

-- 1) Queremos selecionar todos os alunos em ordem alfab�tica de nome de aluno, e tamb�m o n�mero da classe que estuda.
SELECT NOME_ALUNO, ID_CLASSE 
FROM TB_ALUNO 
ORDER BY NOME_ALUNO;

-- 2). Selecionaremos o item anterior, por�m ordenado alfabeticamente pelo identificador do aluno de forma descendente (ascendente � �default�).
SELECT COD_ALUNO, NOME_ALUNO, ID_CLASSE
FROM TB_ALUNO
ORDER BY TO_CHAR(COD_ALUNO) DESC;

-- 3). Selecionaremos todos os alunos cursando as disciplinas de matem�tica e de portugu�s agrupados por aluno e disciplina.
 SELECT COD_ALUNO, ID_DISCIPLINA
 FROM TB_ALUNO_DISCIPLINA
 WHERE ID_DISCIPLINA = 'MAT'
 AND COD_ALUNO
 IN(SELECT COD_ALUNO
 FROM TB_ALUNO_DISCIPLINA
 WHERE ID_DISCIPLINA = 'POR')
 GROUP BY COD_ALUNO, ID_DISCIPLINA;
 
 -- C) Exerc�cios de SELECT (Jun��o de Tabelas)
 -- 1). Queremos selecionar todos os nomes de alunos que cursam Portugu�s ou Matem�tica.
 SELECT ALU.NOME_ALUNO, ADIS.ID_DISCIPLINA
 FROM TB_ALUNO ALU INNER JOIN TB_ALUNO_DISCIPLINA ADIS
 ON (ALU.COD_ALUNO = ADIS.COD_ALUNO)
 WHERE (ID_DISCIPLINA = 'POR' OR ID_DISCIPLINA = 'MAT');
 
 -- 2). Queremos selecionar todos os nomes de alunos cadastrados que cursam a disciplina F�SICA e seus respectivos endere�os .
-- RESPOSTA 1
SELECT ALU.NOME_ALUNO, DIS.NOME_DISCIPLINA, ALU.END_ALUNO
FROM TB_ALUNO ALU INNER JOIN TB_ALUNO_DISCIPLINA ADIS
ON (ALU.COD_ALUNO = ADIS.COD_ALUNO)
INNER JOIN TB_DISCIPLINA DIS
ON (ADIS.ID_DISCIPLINA = DIS.ID_DISCIPLINA)
WHERE ADIS.ID_DISCIPLINA = 'FIS';

-- RESPOSTA 2
SELECT ALU.NOME_ALUNO, ADIS.ID_DISCIPLINA, ALU.END_ALUNO
FROM TB_ALUNO ALU INNER JOIN TB_ALUNO_DISCIPLINA ADIS
ON (ALU.COD_ALUNO = ADIS.COD_ALUNO)
WHERE ADIS.ID_DISCIPLINA = 'FIS';

-- 3). Queremos selecionar todos os nomes de alunos cadastrados que cursam f�sica e o andar
-- que se encontra a classe dos mesmos. Preste aten��o ao detalhe da concatena��o de uma
-- string "andar" junto � coluna do n�mero do andar (Apenas para est�tica do resultado).
SELECT ALU.NOME_ALUNO, ADIS.ID_DISCIPLINA, 'ANDAR' || CLA.ID_ANDAR, CLA.ID_CLASSE
FROM TB_ALUNO ALU INNER JOIN TB_CLASSE CLA
ON (ALU.ID_CLASSE = CLA.ID_CLASSE)
INNER JOIN TB_ALUNO_DISCIPLINA ADIS
ON (ALU.COD_ALUNO = ADIS.COD_ALUNO)
WHERE ADIS.ID_DISCIPLINA = 'FIS';

-- D)Exerc�cios de SELECT (OUTER JOIN)

-- 1) Selecionar todos os Professores com suas respectivas disciplinas e os demais Professores que n�o lecionam disciplina alguma.
SELECT PRO.NOME_PROFESSOR, DIS.NOME_DISCIPLINA
FROM TB_PROFESSOR PRO LEFT JOIN TB_DISCIPLINA DIS
ON (PRO.ID_PROFESSOR) = DIS.ID_PROFESSOR_DISCIPLINA;

-- E) Exerc�cios de SELECT (USE Clausula IN e/ou SUBSelect).
-- OBS: N�o pode usar JOIN.
-- 1) Selecionar todos os nomes de professores que tenham ministrado disciplina para
--   alunos que sejam do Estado do Piaui, cujo a classe tenha sido no terceiro andar.
SELECT PRO.NOME_PROFESSOR, ALU.NOME_ALUNO, ALU.SIGLA_ESTADO, CLA.ID_ANDAR
FROM TB_ALUNO ALU, TB_PROFESSOR PRO, TB_CLASSE CLA
WHERE PRO.ID_PROFESSOR
IN (SELECT TB_DISCIPLINA.ID_PROFESSOR_DISCIPLINA FROM TB_DISCIPLINA WHERE ID_DISCIPLINA
IN (SELECT ID_DISCIPLINA FROM  TB_ALUNO_DISCIPLINA WHERE COD_ALUNO
IN (SELECT COD_ALUNO FROM TB_ALUNO WHERE SIGLA_ESTADO = 'PI' AND ID_CLASSE 
IN (SELECT ID_CLASSE FROM TB_CLASSE WHERE ID_CLASSE
IN (SELECT ID_CLASSE FROM TB_CLASSE WHERE ID_ANDAR = 3)))));
commit;