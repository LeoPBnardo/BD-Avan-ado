-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS HALLOWEN;
USE HALLOWEN;

-- Criação da tabela de usuários
CREATE TABLE USUARIOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(150) NOT NULL,
    EMAIL VARCHAR(150) NOT NULL,
    IDADE INT NOT NULL
);

DELIMITER $$

-- Criação da procedure para inserir 10.000 registros
CREATE PROCEDURE GerarUsuariosAleatorios()
BEGIN
    DECLARE contador INT DEFAULT 1;

    -- Loop para inserir os registros
    WHILE contador <= 10000 DO
        -- Gerar valores aleatórios para os campos
        SET @nome_usuario := CONCAT('user_', contador);
        SET @email_usuario := CONCAT('user', contador, '@dominio.com');
        SET @idade_usuario := 18 + FLOOR(RAND() * 80); -- Idades entre 18 e 97
       
        -- Inserir os dados gerados na tabela
        INSERT INTO USUARIOS (NOME, EMAIL, IDADE)
        VALUES (@nome_usuario, @email_usuario, @idade_usuario);
       
        -- Incrementar o contador
        SET contador = contador + 1;
    END WHILE;
END$$

DELIMITER ;

-- Executar a procedure para gerar os registros
CALL GerarUsuariosAleatorios();

-- Visualizar os registros inseridos
SELECT * FROM USUARIOS LIMIT 10;