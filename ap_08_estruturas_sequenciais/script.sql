DO $$
DECLARE
    n1 NUMERIC (5, 2);
    n2 INTEGER;
    limite_inferior INTEGER := 5;
    limite_superior INTEGER := 17;
BEGIN
-- 0 <= n1 < 1 (real) entre 0 e 1 execto o 1 o zero incluso o 1 nao 
    n1 := random();
    RAISE NOTICE 'n1 := radom apenas entre 0 e 1 execto o 1 o zero incluso o 1 nao : %', n1;
-- 1 <= n1 < 10 (real) nao inclui o 10 inclui no minimo o 1
    n1 := 1 + random() * 9 ;
    RAISE NOTICE 'n1: 1+radom*9 nao inclui o 10 tem como minimo 1 :  %', n1;
-- 1 <= n2 <10 (:: faz type cast é uma função que converte um valor de um tipo de dado para outro ) (floor arredonda para baixo) cortar a parte decimal
    n2 := floor(random() * 10 + 1)::int;
    RAISE NOTICE 'n2 cortar a parte decimal : %', n2;
-- limite_inferior <= n2 <= limite_superior  superior menos o inferior mais um vai dar ate 12.999 mas com tem o chao fica 12 nao chega ate o 13 no caso 13 numros acima do 5 que é o 16.9999 ou 16 com o chao 
    n2 := floor(random() * (17 - 5 + 1) + 5)::int;
    RAISE NOTICE '%', n2;
-- limite_inferior <= n2 <= limite_superior
    n2 := floor(random() * (limite_superior - limite_inferior + 1) + limite_inferior)::int;
    RAISE NOTICE '%', n2;

END $$;




--DO 
--$$
--DECLARE
--v_codigo INTEGER := 1;
--v_nome_completo VARCHAR(200) := 'João';
-- 11 digitos no total, dois para valores decimais
--v_salario numeric (11, 2) := 20.5 ;
--BEGIN
--RAISE NOTICE 'Meu código é %, me chamo % e meu salário é R$%',
--v_codigo, v_nome_completo, v_salario;
--END $$;
--% guardiao de lugar 

--DO
--$$
--BEGIN
--RAISE NOTICE '% + % = %', 2, 2, 2 + 2;
--END;
--$$

--DO
--$$
--BEGIN
--para exibir valores no console
--RAISE NOTICE 'Meu primeiro Bloco anônimo!!';
--END;
--$$

-- CREAT DATABASE "20251_fatec_ipi_pbdi_isabelalugo"