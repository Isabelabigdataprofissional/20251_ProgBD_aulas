--CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
--INT) RETURNS INT AS
--$$
--BEGIN
--RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
--END;
--$$ LANGUAGE plpgsql;

DO
$$
DECLARE
valor INT;
BEGIN
valor := valor_aleatorio_entre(1, 100);
RAISE NOTICE 'O valor gerado é: %', valor;
IF valor <= 20 THEN
RAISE NOTICE 'A metade do valor % é %', valor, valor / 2::FLOAT;
END IF;
END;
$$

