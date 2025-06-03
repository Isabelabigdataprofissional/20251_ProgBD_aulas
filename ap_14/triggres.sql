--03/06



-- CREATE OR REPLACE FUNCTION fn_log_pessoa_update()
-- RETURNS TRIGGER
-- LANGUAGE plpgsql 
-- AS $$
-- BEGIN
-- INSERT INTO tb_auditoria
-- (cod_pessoa, nome, idade, saldo_antigo, saldo_atual)
-- VALUES
-- (NEW.cod_pessoa, NEW.nome, NEW.idade, OLD.saldo, NEW.saldo);
-- RETURN NEW;
-- END;

CREATE TRIGGER tg_log_de_pessoa_update
AFTER UPDATE ON tb_pessoa
FOR ROW 
EXECUTE FUNCTION fn_validador_de_saldo();


-- ALTER TABLE tb_auditoria ADD COLUMN if not EXISTS nome VARCHAR(200) not null ;

-- CREATE OR REPLACE FUNCTION fn_validador_de_saldo()
-- RETURNS TRIGGER
-- LANGUAGE plpgsql AS $$
-- BEGIN
-- IF NEW.saldo >= 0 THEN
-- RETURN NEW;
-- ELSE
-- RAISE NOTICE 'Valor de saldor R$% inválido', NEW.saldo;
-- RETURN NULL;
-- END IF;
-- END;
-- $$

-- CREATE TRIGGER tg_validador_de_saldo
-- BEFORE INSERT OR UPDATE ON tb_pessoa
-- FOR ROW 
-- EXECUTE FUNCTION fn_validador_de_saldo();

-- INSERT INTO tb_pessoa (nome, idade, saldo)
-- VALUES ('João',20,100), ('Pedro', 22,-100), ('Maria',22,400);



-- --quando return null vc impede o trigger de funiconar



--criR UM TRIGGER PARA VINCULAR A FUNÇÃO A UMA TABELA 
--DEVESER ANTES DO INSER/UPDATE
--linha por libha para ver o saldo
 
 --tabelas

--  --pessoa
--  DROP TABLE IF EXISTS tb_pessoa;
-- CREATE TABLE IF NOT EXISTS tb_pessoa(
-- cod_pessoa SERIAL PRIMARY KEY,
-- nome VARCHAR(200) NOT NULL,
-- idade INT NOT NULL,
-- saldo NUMERIC(10, 2) NOT NULL
-- );
-- --auditoria
-- DROP TABLE IF EXISTS tb_auditoria;
-- CREATE TABLE IF NOT EXISTS tb_auditoria(
-- cod_auditoria SERIAL PRIMARY KEY,
-- cod_pessoa INT NOT NULL,
-- idade INT NOT NULL,
-- saldo_antigo NUMERIC (10, 2),
-- saldo_atual NUMERIC(10, 2)
-- );








--triggers 
--27/05




-- CREATE OR REPLACE TRIGGER tg_antes_do_insert


-- DROP TRIGGER IF EXISTS tg_antes_do_insert2 ON teste_tigger;

-- DROP TRIGGER IF EXISTS tg_depois_do_insert ON teste_tigger;

-- ALTER SEQUENCE teste_tigger_cod_teste_trigger_seq
-- RESTART WITH 1;
-- --nome tabela _ cod pk _ seq 
-- SELECT * FROM teste_tigger_cod_teste_trigger_seq;















-- DELETE From teste_tigger

-- INSERT INTO teste_tigger(texto)
-- VALUES ('testando trigger');
-- CREATE OR REPLACE TRIGGER tg_depois_do_insert2


-- CREATE or replace TRIGGER tg_antes_do_insert
-- BEFORE INSERT On teste_tigger
-- FOR EACH STATEMENT
-- EXECUTE FUNCTION fn_antes_de_um_insert();

-- INSERT INTO teste_tigger (texto)
-- VALUES ('testando trigger');

-- CREATE OR REPLACE TRIGGER tg_depois_do_insert
-- AFTER INSERT ON teste_tigger
-- FOR EACH STATEMENT
-- EXECUTE FUNCTION fn_depois_de_um_insert();

-- CREATE OR REPLACE FUNCTION fn_depois_de_um_insert ()
-- RETURNS TRIGGER
-- LANGUAGE plpgsql
-- AS $$ 
-- BEGIN 
--    RAISE NOTICE 'Trigger foi chamado depois do INSERT!';
--    RETURN NULL ; --mais sobre isso em breve 
-- END;
-- $$



-- INSERT INTO teste_tigger(texto)
-- VALUES ('testando trigger');

-- CREATE OR REPLACE TRIGGER tg_antes_do_insert
-- BEFORE INSERT ON teste_tigger
-- FOR EACH STATEMENT
-- EXECUTE FUNCTION fn_antes_de_um_insert();

-- --returns devolve explicação indica que devolve um trigger
-- --return ordem eu quero que returne isso 

-- CREATE OR REPLACE FUNCTION fn_antes_de_um_insert ()
-- RETURNS TRIGGER
-- LANGUAGE plpgsql
-- AS $$ 
-- BEGIN
--  RAISE NOTICE 'Trigger foi chamado antes do INSERT!';
--   RETURN NULL;
-- END;
-- $$ 

-- --tabela de teste 

-- CREATE TABLE teste_tigger (
--     cod_teste_trigger SERIAL PRIMARY KEY,
--     texto VARCHAR(200)

-- );



