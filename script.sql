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

DO $$
DECLARE
--1 decclaração do cursor nao vinculado (unbold) sem especificar o select 
-- ocursosr nasce apontando pro nada 

cur_nomes_youtubers REFCURSOR;
v_youtubers VARCHAR (200);
BEGIN
--2 abertura do cursos para coluna da tabela
	OPEN cur_nomes_youtubers FOR 
		SELECT youtuber FROM  tb_top_youtubers;
			LOOP
				--3 recuperação de dados de interese
				-- operação fetch recuperar/buscar 
				FETCH cur_nomes_youtubers INTO v_youtubers;
						EXIT WHEN NOT FOUND ;
					raise notice '%', v_youtubers;
			END LOOP;
--4 fechament do cursos
	CLOSE cur_nomes_youtubers;
END$$


