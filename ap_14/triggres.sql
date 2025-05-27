--triggers 
--27/05

CREATE OR REPLACE TRIGGER tg_depois_do_insert
BEFORE INSERT ON teste_tigger
FOR EACH STATEMENT
EXECUTE FUNCTION fn_depois_de_um_insert();

CREATE OR REPLACE FUNCTION fn_depois_de_um_insert ()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$ 
BEGIN 
   RAISE NOTICE 'Trigger foi chamado depois do INSERT!';
   RETURN NULL ; --mais sobre isso em breve 
END;
$$



INSERT INTO teste_tigger(texto)
VALUES ('testando trigger');

CREATE OR REPLACE TRIGGER tg_antes_do_insert
BEFORE INSERT ON teste_tigger
FOR EACH STATEMENT
EXECUTE FUNCTION fn_antes_de_um_insert();

--returns devolve explicação indica que devolve um trigger
--return ordem eu quero que returne isso 

CREATE OR REPLACE FUNCTION fn_antes_de_um_insert ()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$ 
BEGIN
 RAISE NOTICE 'Trigger foi chamado antes do INSERT!';
  RETURN NULL;
END;
$$ 

--tabela de teste 

CREATE TABLE teste_tigger (
    cod_teste_trigger SERIAL PRIMARY KEY,
    texto VARCHAR(200)

);



