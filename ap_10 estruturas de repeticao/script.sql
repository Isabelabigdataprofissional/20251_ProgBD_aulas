





--ignorando interação com continue 
DO $$
DECLARE
    contador INT := 0 ;
BEGIN
    LOOP
        contador := contador + 1 ;
        EXIT WHEN contador > 100; --quenbra  o loop inteiro 
        
        IF contador % 7 = 0 THEN CONTINUE; -- para so a caixa atual é tipo passa pro proximo 
        END IF;

        CONTINUE WHEN contador % 11 = 0 ;

        RAISE NOTICE '%' , contador ; 
    END LOOP;
END;
$$



-- DO
-- $$
-- DECLARE
--     contador INT := 1;
-- BEGIN
--     LOOP
--         RAISE NOTICE '%', contador;
--         contador := contador + 1 ;
--         Exit WHEN contador > 10 ; 
--     END LOOP;
-- END;
-- $$



-- DO $$
-- DECLARE
--     contador INT :=1;
-- BEGIN 
--     LOOP 
--         RAISE NOTICE '%', contador;
--         contador := contador + 1; 
--         IF contador > 10 THEN EXIT;
--         END IF;
--     END LOOP;
-- END;
-- $$



-- --esse loop é infinito 
-- --nao
-- --rode
-- --atenção
-- DO $$
-- BEGIN
--     LOOP
--     --loop infinito
--         RAISE NOTICE 'Um loop simples...';
--         --nao rode
--     END LOOP;
-- END;
-- $$