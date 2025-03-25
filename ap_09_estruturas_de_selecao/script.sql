--dd/mm/aaaa é valida?
DO $$
DECLARE
    --testar
    --22/10/2022:valida
    --29/02/2020: VALIDA
    --29/02/2021: invalida
    --28/02/2021: valia
    --31/09/2025: invalida
    --31/06/2025: invalida
    data INT := 21122005;
    dia INT;
    mes INT;
    ano INT;
    data_valida BOOL := True;

BEGIN
    dia:= data / 1000000;
    mes := data % 1000000/10000;
    ano := data %10000;
    RAISE NOTICE '% / % / %', dia, mes, ano;
    IF ano >= 1 THEN
        CASE 
            WHEN mes > 12 OR mes < 1 Or dia < 1 OR dia > 31 THEN  data_valida := FALSE ;
            ELSE 
                IF (mes IN (4, 6, 9, 11 )) And dia > 30 THEN data_valida := FALSE; 
                ELSE
                    IF mes = 2 THEN 
                    CASE 
                        WHEN  ano % 4 = 0 AND ano % 100 <> 0 OR ano % 400 = 0 THEN 
                            IF dia > 29 THEN data_valida := FALSE;
                            END IF;
                        ELSE 
                            IF dia > 28 THEN data_valida := FALSE;
                            END IF ;
                    END CASE;
                END IF ; 
            END IF;
        END CASE;
    ELSE
        data_valida := FALSE;
    END IF;
    CASE   
        WHEN data_valida THEN RAISE NOTICE 'Data Valida';
        ELSE RAISE NOTICE 'Data Invalida';
    END CASE;
END;
$$


DO $$
DECLARE
    valor INT :=valor_aleatorio_enrre (1,12);
    mensagem VARCHAR(200);
BEGIN
    RAISE NOTICE ' o VALOR DE VEZ É %', valor;
    CASE valor
        WHEN 1, 3, 5, 7, 9, THEN
            mensagem := 'impar';
        WHEN 2,4,6,8,10
            mensagem := 'par';
        ELSE
        mensagem := 'nao está no intervalo';
    END CASE;
    RAISE NOTICE '%', mensagem 
END; 
$$




DO 
$$
DECLARE
    a INT := valor_aleatorio_entre(0,20);
    b INT := valor_aleatorio_entre(0,20);
    c INT := valor_aleatorio_entre(0,20);
    delta NUMERIC(10,2);
    raizUm NUMERIC(10,2);
    raizDois NUMERIC(10,2);
BEGIN
-- ax^2 + bx + c = 0
    RAISE NOTICE '%x% + %x + % = 0', a, U&'\00b2', b, c;
    IF a = 0 THEN 
        RAISE NOTICE 'Não é equação do segundo grau';
    ELSE 
        delta := b ^ 2 - 4 * a * c;
        RAISE NOTICE 'Delta: %', delta;
        IF delta < 0 THEN 
            RAISE NOTICE 'Não tem raiz';
        ELSE IF delta = 0 THEN
            raizUm := -1 * b / (2 * a);
            RAISE NOTICE 'Teve uma  raiz. Essa aqui: %', raizUm;
        ELSE 
            raizUm := (-b + |/delta) / (2 * a);
            raizUm := (-b - |/delta) / (2 * a);
            RAISE NOTICE 'Duas raízes. Observe: % e %', raizUm, raizDois;
        END IF; 
    END IF; 
-- U&'\00b2' = elevado ao quadrado
-- a equivale ao primeiro %, 
END;$$

DO
$$
DECLARE
    v_valor INT;
BEGIN
    v_valor := valor_aleatorio_entre(1,30);
    IF v_valor <= 20 THEN 
        RAISE NOTICE 'A metade de % é %', v_valor, v_valor/2::FLOAT;
    END IF;
END;
$$





CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;

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

