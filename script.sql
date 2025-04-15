-- CREATE TABLE tb_top_youtubers(cod_top_yourubers SERIAL PRIMARY KEY, 
-- 							rank INT,
-- 							youtuber VARCHAR (200),
-- 							subscribers INT,
-- 							video_views INT,
-- 							video_count INT,
-- 							category VARCHAR (200),
-- 							started INT);
							
-- ALTER TABLE tb_top_youtubers ALTER COLUMN video_views TYPE BIGINT;

-- select * from tb_top_youtubers

-- DO $$
-- DECLARE
-- --1 decclaração do cursor nao vinculado (unbold) sem especificar o select 
-- -- ocursosr nasce apontando pro nada 

-- cur_nomes_youtubers REFCURSOR;
-- v_youtubers VARCHAR (200);
-- BEGIN
-- --2 abertura do cursos para coluna da tabela
-- 	OPEN cur_nomes_youtubers FOR 
-- 		SELECT youtuber FROM  tb_top_youtubers;
-- 			LOOP
-- 				--3 recuperação de dados de interese
-- 				-- operação fetch recuperar/buscar 
-- 				FETCH cur_nomes_youtubers INTO v_youtubers;
-- 						EXIT WHEN NOT FOUND ;
-- 					raise notice '%', v_youtubers;
-- 			END LOOP;
-- --4 fechament do cursos
-- 	CLOSE cur_nomes_youtubers;
-- END$$

--CURSOR NAO VINCULADO com query dinamica  

--exibir os nomes dos youtubers que começarm a partir de um ano especifico 

-- DO $$
-- DECLARE
-- --1.declaração do cursor não vinculado
-- 	cur_nomes_a_partir_de REFCURSOR;
-- 	v_youtuber VARCHAR (200);
-- 	v_ano INT := 2008;
-- 	v_nome_tabela VARCHAR(200) := 'tb_top_youtubers'; --query dinamica 
-- BEGIN 
-- --2.abertura do cursor
-- 	OPEN cur_nomes_a_partir_de FOR EXECUTE --usa o for execute para as query dinamicas 
-- 	format(' 
-- 		   SELECT youtuber FROM 
-- 		   %s
-- 		   WHERE started >= $1
-- 		 	', v_nome_tabela 
-- 		  ) USING v_ano ;
-- 		  --using é do cursor substitui o $
-- 	LOOP 
-- 		FETCH cur_nomes_a_partir_de 
-- 		INTO v_youtuber;
-- 		EXIT WHEN NOT FOUND ;
-- 		RAISE NOTICE '%', v_youtuber;
-- 	END LOOP;
-- --4.fechar o cursor 
-- 	CLOSE cur_nomes_a_partir_de;
-- END;
-- $$

--CURSOR VINCULADO bound

--cocatenar come e numero de inscritos 

-- DO $$
-- DECLARE 
-- 	cur_nomes_e_inscritos CURSOR FOR 
-- 	SELECT youtuber, subscribers FROM tb_top_youtubers;
-- 	tupla RECORD; --linha = tulpla
-- 	resultado TEXT DEFAULT '';
-- BEGIN
-- --2.abertura 
-- 	OPEN cur_nome_e_inscritos;
-- 		FETCH cur_nomes_e_inscritos INTO tupla;
-- 			WHILE FOUND LOOP 
-- 				resultado := resultado || tupla.youtuber || ': ' || tupla.subscribers || ' , ';
-- 				FETCH cur_nomes_e_inscritos INTO  tupla; --para ir para a proxima linha 
-- 			END LOOP;
-- 	CLOSE cur_nomes_e_inscritos;
-- 	RAISE NOTICE '%', resultado;
-- END ;
-- $$


--CURSORES COM PARANETROS NOMEADOS PELA ORDEM 
--começaram  partir de 2010 e tem pelo menos 60M de inscritos 

-- DO $$
-- DECLARE
-- 	 v_ano INT := 2010;
-- 	 v_inscritos INT := 60000000;
-- 	 v_youtuber VARCHAR(200);
-- 	 -- 1. declaração
-- 	 cur_ano_inscritos CURSOR(ano INT, inscritos INT) 
-- 	 FOR SELECT youtuber 
-- 	 FROM tb_top_youtubers 
-- 	 WHERE started >= ano AND subscribers >= inscritos;
-- BEGIN
-- 	-- 2. abertura
-- 	OPEN cur_ano_inscritos(
-- 		ano := v_ano,
-- 		inscritos := v_inscritos
-- 	);
-- 	LOOP 
-- 		-- 3. recuperação de dados
-- 		FETCH cur_ano_inscritos INTO v_youtuber;
-- 		EXIT WHEN NOT FOUND;
-- 		RAISE NOTICE '%', v_youtuber;
-- 	END LOOP;
-- 	-- 4. fechamento
-- 	CLOSE cur_ano_inscritos;
-- 	END;
-- $$

-- SELECT * FROM tb_top_youtubers WHERE video_count IS NULL; 

DO $$
DECLARE 
--1.declaração 
	cur_delete REFCURSOR;
	tupla RECORD; 
BEGIN 
--abertura
	OPEN cur_delete SCROLL
	SELECT * FROM tb_top_youtubers;
-- aqui se fala que ele tem que saber ir e voltar EU DECIDO GASTAR MEMORIA  principio de menor privilegio

	LOOP 
	--recuperação
	FETCH cur_delete INTO tupla;
	EXIT WHEN NOT FOUND ; -- SOMENTE ACESSE E DELETE SE VC TIVER ALGUMA LINHA 
		IF tupla.video_count IS NULL THEN 
			DELETE FROM tb_youtubers 
			WHERE CURRENT OF cur_delete;
		END IF;
	END LOOP
	LOOP 
	--recuperação
		FETCH BACKWARD FROM cur_delete 
		INTO tupla;
		EXIT WHEN NOT FOUND ; 
		RAISE NOTICE '%', tupla;
	END LOOP ; 
--4. fechamento
	CLOSE cur_delete;
END;
$$