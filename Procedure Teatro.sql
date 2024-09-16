CREATE DATABASE TEATRO;
USE TEATRO;

CREATE TABLE PECAS_TEATRO(
    ID_PECA INT AUTO_INCREMENT PRIMARY KEY,
    NOME_PECA VARCHAR(100) NOT NULL,
    DESCRICAO TEXT,
    DURACAO INT NOT NULL, -- duração em minutos
    CATEGORIA VARCHAR(50), -- exemplo: drama, comédia
    HORARIO TIME NOT NULL -- horário da apresentação
);

-- Função para Calcular a Média de Duração
DELIMITER $$

CREATE PROCEDURE CALCULAR_MEDIA_DURACAO_PECA(IN PECA_ID INT)
BEGIN
    SELECT AVG(DURACAO) AS MEDIA_DURACAO
    FROM PECAS_TEATRO
    WHERE ID_PECA = PECA_ID;
END $$

DELIMITER ;

-- Função para Verificar Disponibilidade
DELIMITER $$

CREATE PROCEDURE VERIFICAR_DISPONIBILIDADE_PECA(IN DATA_HORA TIME)
BEGIN
    IF EXISTS (SELECT 1 FROM PECAS_TEATRO WHERE HORARIO = DATA_HORA) THEN
        SELECT 'Horário não disponível' AS DISPONIBILIDADE;
    ELSE
        SELECT 'Horário disponível' AS DISPONIBILIDADE;
    END IF;
END $$

DELIMITER ;

-- Procedure para Agendar uma Peça
DELIMITER $$

CREATE PROCEDURE AGENDAR_PECA_TEATRO(
    IN NOME VARCHAR(100),
    IN DESC_PECA TEXT,
    IN TEMPO_DURACAO INT,
    IN CATEGORIA_PECA VARCHAR(50),
    IN DATA_HORA TIME
)
BEGIN
    -- Verificar se o horário já está ocupado
    CALL VERIFICAR_DISPONIBILIDADE_PECA(DATA_HORA);

    -- Inserir a nova peça
    INSERT INTO PECAS_TEATRO (NOME_PECA, DESCRICAO, DURACAO, CATEGORIA, HORARIO)
    VALUES (NOME, DESC_PECA, TEMPO_DURACAO, CATEGORIA_PECA, DATA_HORA);

    -- Calcular a média de duração das peças
    SELECT AVG(DURACAO) AS MEDIA_DURACAO_GERAL FROM PECAS_TEATRO;
   
    -- Mostrar detalhes da peça recém agendada
    SELECT * FROM PECAS_TEATRO WHERE NOME_PECA = NOME;
END $$

DELIMITER ;

-- Inserir Registros Fictícios (Exemplo)
INSERT INTO PECAS_TEATRO (NOME_PECA, DESCRICAO, DURACAO, CATEGORIA, HORARIO)
VALUES ('O Rei Leão', 'Musical famoso baseado no filme da Disney', 180, 'Musical', '13:00:00');

INSERT INTO PECAS_TEATRO (NOME_PECA, DESCRICAO, DURACAO, CATEGORIA, HORARIO)
VALUES ('Macbeth', 'Uma tragédia de Shakespeare sobre ambição e poder', 160, 'Tragédia', '17:00:00');

INSERT INTO PECAS_TEATRO (NOME_PECA, DESCRICAO, DURACAO, CATEGORIA, HORARIO)
VALUES ('Star Wars', 'Musical com orquestra sinfônica com músicas tema da franquia', 200, 'Musical', '20:00:00');


-- Exemplo de Agendamento de Peça
CALL AGENDAR_PECA_TEATRO('Star Wars', 'Musical com orquestra sinfônica com músicas tema da franquia', 200, 'Musical', '20:00:00');

select * from PECAS_TEATRO;

