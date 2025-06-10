DROP TABLE IF EXISTS tb_pessoa;
CREATE TABLE IF NOT EXISTS tb_pessoa(
cod_pessoa SERIAL PRIMARY KEY,
nome VARCHAR(200) NOT NULL,
idade INT NOT NULL,
saldo NUMERIC(10, 2) NOT NULL
);
DROP TABLE IF EXISTS tb_auditoria;
CREATE TABLE IF NOT EXISTS tb_auditoria(
cod_auditoria SERIAL PRIMARY KEY,
cod_pessoa INT NOT NULL,
idade INT NOT NULL,
saldo_antigo NUMERIC (10, 2),
saldo_atual NUMERIC(10, 2)
);

-- 1.1 Adicione uma coluna à tabela tb_pessoa chamada ativo. Ela indica se a pessoa está
-- ativa no sistema ou não. Ela deve ser capaz de armazenar um valor booleano. Por padrão,
-- toda pessoa cadastrada no sistema está ativa. Se necessário, consulte o Link 1.1.1.
-- Link 1.1.1
-- https://www.postgresql.org/docs/current/sql-altertable.html

-- uma opção 
-- ALTER TABLE tb_pessoa ADD COLUMN ativo BOOLEAN DEFAULT TRUE;

--resolução com trigger
CREATE OR REPLACE FUNCTION fn_antes_de_um_insert()
RETURNS TRIGGER
LANGUAGE plpgsql AS $$
BEGIN
If New.ativo IS NULL
 THEN New.ativo := TRUE;
End If;
RETURN NEW;
END;
$$

CREATE OR REPLACE TRIGGER tg_antes_do_insert
BEFORE INSERT OR UPDATE ON tb_pessoa
FOR EACH ROW
EXECUTE PROCEDURE fn_antes_de_um_insert();

INSERT INTO tb_pessoa (nome, idade, saldo)
             VALUES ('Fernando', 24, 100);
SELECT * FROM tb_pessoa;

-- 1.2 Associe um trigger de DELETE à tabela. Quando um DELETE for executado, o trigger
-- deve atribuir FALSE à coluna ativo das linhas envolvidas. Além disso, o trigger não deve
-- permitir que nenhuma pessoa seja removida.

CREATE OR REPLACE FUNCTION fn_DELETE_de_uma_tabela()
RETURNS TRIGGER
LANGUAGE plpgsql AS $$
BEGIN
 if Old.ativo = TRUE
    THEN UPDATE tb_pessoa
    SET ativo = False
    WHERE cod_pessoa = OLD.cod_pessoa;
 End if;
 RETURN NULL;
END;
$$

CREATE OR REPLACE TRIGGER tg_antes_do_DELETE
BEFORE DELETE ON tb_pessoa
FOR EACH ROW
EXECUTE PROCEDURE fn_DELETE_de_uma_tabela();

SELECT * FROM tb_pessoa;
DELETE FROM tb_pessoa WHERE nome = 'Fernando';
