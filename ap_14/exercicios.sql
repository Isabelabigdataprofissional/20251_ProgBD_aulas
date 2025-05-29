--1.1 Adicione uma coluna à tabela tb_pessoa chamada ativo. Ela indica se a pessoa está ativa no sistema ou não. Ela deve ser capaz de armazenar um valor booleano. 
--Por padrão, toda pessoa cadastrada no sistema está ativa. 

CREATE TABLE tb_teste_pessoas (
     nome VARCHAR(200))

ALTER TABLE tb_teste_pessoas ADD COLUMN ativo BOOLEAN

DELETE TABLE tb_teste_pessoas

select * FROM tb_teste_pessoas 

CREATE OR REPLACE TRIGGER tg_antes_do_insert
BEFORE INSERT OR UPDATE ON tb_teste_pessoas
FOR EACH ROW
EXECUTE PROCEDURE fn_antes_de_um_insert();

INSERT INTO tb_teste_pessoas (nome) VALUES ('RICARDO NUNES');

CREATE OR REPLACE FUNCTION fn_antes_de_um_insert()
RETURNS TRIGGER
LANGUAGE plpgsql AS $$
BEGIN
INSERT INTO tb_teste_pessoas (ativo)
VALUES (NEW.ativo);
RETURN NEW;
END;
$$
