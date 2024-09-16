-- Total de livros na biblioteca: 
SELECT COUNT(ID_LIVRO) AS total_livros
FROM LIVROS;

-- Número de livros emprestados:
SELECT COUNT(ID_LIVRO) AS total_livros_emprestados
FROM LOCACAO;

-- Número de multas aplicadas:
SELECT COUNT(ID_MULTAS) AS total_multas
FROM MULTAS;

-- Calcula o valor total de todas as multas aplicadas:
SELECT SUM(VALOR_MULTAS) AS total_valor_multas
FROM MULTAS;

-- Calcula a média de valor das multas aplicadas:
SELECT AVG(VALOR_MULTAS) AS media_valor_multas
FROM MULTAS;

-- Encontra o valor da maior multa aplicada:
SELECT MAX(VALOR_MULTAS) AS maior_multa
FROM MULTAS;

-- Encontra o valor da menor multa aplicada:
SELECT MIN(VALOR_MULTAS) AS menor_multa
FROM MULTAS;

-- Conta o número de livros por autor específico (por exemplo, Autor 1):
SELECT COUNT(LA.ID_LIVRO) AS total_livros_autor1
FROM LIVROS_AUTOR LA
JOIN AUTOR A ON LA.ID_AUTOR = A.ID_AUTOR
WHERE A.NOME_AUTOR = 'Autor 1';

-- Conta o número de livros que foram devolvidos com atraso:
SELECT COUNT(ID_DEVOLUCAO) AS total_devolucoes_atraso
FROM DEVOLUCOES
WHERE DATA_DEVOLUCAO > DATA_DEVOLUCAO_ESPERADA;

-- Calcula a média de dias de atraso para devoluções:
SELECT AVG(DATEDIFF(DATA_DEVOLUCAO, DATA_DEVOLUCAO_ESPERADA)) AS media_dias_atraso
FROM DEVOLUCOES
WHERE DATA_DEVOLUCAO > DATA_DEVOLUCAO_ESPERADA;