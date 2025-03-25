--1.7 Escreva um programa que gere um inteiro que representa o ano de nascimento de uma pessoa no intervalo [1980, 2000] e gere um inteiro que representa o ano atual no intervalo[2010, 2020]. O programa deve exibir a idade da pessoa em anos. Desconsidere detalhes envolvendo dias, meses, anos bissextos etc.
DO $$
DECLARE
  nasci INTEGER;
  atual INTEGER;
  idade INTEGER;
  limite_inferior_N INTEGER := 1980;
  limite_superior_N INTEGER := 2000;
  limite_inferior_A INTEGER := 2010;
  limite_superior_A INTEGER := 2020;
BEGIN
  nasci := floor(random() * (limite_superior_N - limite_inferior_N + 1) + limite_inferior_N)::INTEGER;

  atual := floor(random() * (limite_superior_A - limite_inferior_A + 1) + limite_inferior_A)::INTEGER;

  idade := atual - nasci;

  RAISE NOTICE 'Ano de nascimento: %, Ano atual: %, Idade: %', nasci, atual, idade;
END $$;


--1.6 Faça um programa que gere medidas reais de um terreno retangular. Gere também um valor real no intervalo [60, 70] que representa o preço por metro quadrado. O programa deve exibir o valor total do terreno.
DO $$
DECLARE
  nAltura NUMERIC(5, 2);
  nBase NUMERIC(5, 2);
  preco_m2 NUMERIC(5, 2);
  area NUMERIC(7, 2);
  valor_terreno NUMERIC(10, 2);
  limite_inferior NUMERIC := 1;
  limite_superior NUMERIC := 10;
  limite_inferior_m2 NUMERIC := 60;
  limite_superior_m2 NUMERIC := 70;
BEGIN
  nAltura := (random() * (limite_superior - limite_inferior)) + limite_inferior;
  nBase := (random() * (limite_superior - limite_inferior)) + limite_inferior;

  preco_m2 := (random() * (limite_superior_m2 - limite_inferior_m2)) + limite_inferior_m2;

  area := nAltura * nBase;

  valor_terreno := area * preco_m2;

  RAISE NOTICE 'Altura: %, Base: %, Preço por m²: %, Área: %, Valor total: %', 
    nAltura, nBase, preco_m2, area, valor_terreno;
END $$;


--1.5 Faça um programa que gere um número inteiro e mostre a raiz cúbica de seu antecessor e a raiz quadrada de seu sucessor.
DO $$
DECLARE
  n2 INTEGER;
  limite_inferior INTEGER := 1;
  limite_superior INTEGER := 100;
  antecessor INTEGER;
  sucessor INTEGER;
  raiz_quadrada DOUBLE PRECISION;
  raiz_cubica DOUBLE PRECISION;
BEGIN
  n2 := floor(random() * (limite_superior - limite_inferior + 1) + limite_inferior)::INTEGER;

  antecessor := n2 - 1;
  sucessor := n2 + 1;

  raiz_cubica := power(antecessor, 1.0 / 3.0);
  raiz_quadrada := sqrt(sucessor);

  RAISE NOTICE 'n2: %, antecessor: %, sucessor: %, raiz quadrada: %, raiz cúbica: %', 
  n2, antecessor, sucessor, raiz_quadrada, raiz_cubica;
END $$;


--1.4 Faça um programa que gere três valores reais a, b, e c e mostre o valor de delta: aquele que calculamos para chegar às potenciais raízes de uma equação do segundo grau.
DO $$
DECLARE
  nA NUMERIC(5, 2);
  nB NUMERIC(5, 2);
  nC NUMERIC(5, 2);
  delta NUMERIC(10, 2); 
  limite_inferior INTEGER := 1;
  limite_superior INTEGER := 10;
BEGIN

  nA := random() * (limite_superior - limite_inferior) + limite_inferior;
  nB := random() * (limite_superior - limite_inferior) + limite_inferior;
  nC := random() * (limite_superior - limite_inferior) + limite_inferior;

  delta := (nB ^2) - (4 * nA * nC);

  RAISE NOTICE 'nA: %, nB: %, nC: %, delta: %', nA, nB, nC, delta;
END $$;


--1.3 Faça um programa que gere um valor real no intervalo [20, 30] que representa uma temperatura em graus Celsius. Faça a conversão para Fahrenheit e exiba.
DO $$
DECLARE
  n1 NUMERIC(5, 2);
  limite_inferior INTEGER := 20;
  limite_superior INTEGER := 30;
  fahrenheit NUMERIC(5, 2);
BEGIN
  n1 := random() * (limite_superior - limite_inferior) + limite_inferior;

  fahrenheit := (n1 * 1.8) + 32;

  RAISE NOTICE 'Celsius: %, Fahrenheit: %', n1, fahrenheit;
END $$;


--1.2 Faça um programa que gere um valor real e o exiba.
DO $$
DECLARE
  n1 NUMERIC(5, 2);
  limite_inferior NUMERIC := 1;
  limite_superior NUMERIC := 10;
BEGIN
  n1 := random() * (limite_superior - limite_inferior) + limite_inferior;
  RAISE NOTICE 'Valor gerado: %', n1;
END $$;


--1.1 Faça um programa que gere um valor inteiro e o exiba.
 DO $$
DECLARE
  n2 INTEGER;
  limite_inferior INTEGER := 1;
  limite_superior INTEGER := 100;
BEGIN
  n2 := floor(random() * (limite_superior - limite_inferior + 1) + limite_inferior)::INTEGER;
  RAISE NOTICE 'Valor de n2: %', n2;
END $$;






--DO $$
--DECLARE
   -- n1 NUMERIC (5, 2);
  --  n2 INTEGER;
 --   limite_inferior INTEGER := 5;
 --   limite_superior INTEGER := 17;
--BEGIN
-- 0 <= n1 < 1 (real) entre 0 e 1 execto o 1 o zero incluso o 1 nao 
--    n1 := random();
   -- RAISE NOTICE 'n1 := radom apenas entre 0 e 1 execto o 1 o zero incluso o 1 nao : %', n1;
-- 1 <= n1 < 10 (real) nao inclui o 10 inclui no minimo o 1
  --  n1 := 1 + random() * 9 ;
   -- RAISE NOTICE 'n1: 1+radom*9 nao inclui o 10 tem como minimo 1 :  %', n1;
-- 1 <= n2 <10 (:: faz type cast é uma função que converte um valor de um tipo de dado para outro ) (floor arredonda para baixo) cortar a parte decimal
   -- n2 := floor(random() * 10 + 1)::int;
  --  RAISE NOTICE 'n2 cortar a parte decimal : %', n2;
-- limite_inferior <= n2 <= limite_superior  superior menos o inferior mais um vai dar ate 12.999 mas com tem o chao fica 12 nao chega ate o 13 no caso 13 numros acima do 5 que é o 16.9999 ou 16 com o chao 
  --  n2 := floor(random() * (17 - 5 + 1) + 5)::int;
  --  RAISE NOTICE '%', n2;
-- limite_inferior <= n2 <= limite_superior
  --  n2 := floor(random() * (limite_superior - limite_inferior + 1) + limite_inferior)::int;
  --  RAISE NOTICE '%', n2;
--END $$;


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