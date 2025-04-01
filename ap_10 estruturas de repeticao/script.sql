

-- DO
-- $$--FOREACH com fatias (slice)
-- DO $$
-- DECLARE
--     vetor INT[] := ARRAY[1, 2, 3];
--     matriz INT[] := ARRAY[
--         [1, 2, 3],
--         [4, 5, 6],
--         [7, 8, 9]
--     ];
--     var_aux INT;
--     vet_aux INT[];
-- BEGIN
--     RAISE NOTICE 'SLICE %, vetor', 0;
--     FOREACH var_aux IN ARRAY vetor LOOP
--         RAISE NOTICE '%', var_aux;    
--     END LOOP;

--     RAISE NOTICE 'SLICE %, vetor', 1;
--     FOREACH vet_aux SLICE 1 IN ARRAY vetor LOOP
--         RAISE NOTICE '%', vet_aux;
--     END LOOP;

--     RAISE NOTICE 'SLICE %, matriz', 0;
--     FOREACH var_aux IN ARRAY matriz LOOP
--         RAISE NOTICE '%', var_aux;    
--     END LOOP;

--     RAISE NOTICE 'SLICE %, matriz', 1;
--     FOREACH vet_aux SLICE 1 IN ARRAY matriz LOOP
--         RAISE NOTICE '%', vet_aux;
--     END LOOP;

--     RAISE NOTICE 'SLICE %, matriz', 2;
--     FOREACH vet_aux SLICE 2 IN ARRAY matriz LOOP
--         RAISE NOTICE '%', vet_aux;
--     END LOOP;
-- DECLARE
-- i INT;
-- j INT;
-- BEGIN
-- i := 0;
-- <<externo>>
-- LOOP
-- i := i + 1;
-- EXIT WHEN i > 10;
-- j := 1;
-- <<interno>>
-- LOOP
-- RAISE NOTICE '% %', i, j;
-- j := j + 1;
-- -- j vai contar até 5, o loop externo vai ser interrompido e oprograma acaba
-- EXIT externo WHEN j > 5;
-- END LOOP;
-- END LOOP;
-- END;
-- $$




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