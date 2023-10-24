
CREATE TABLE clientes (
    cliente_id serial PRIMARY KEY,
    nome VARCHAR(255),
    data_cadastro DATE
);
cREATE TABLE vendas (
    venda_id serial PRIMARY KEY,
    data_venda DATE, 
    cliente_id INT,
    valor_total NUMERIC
);


INSERT INTO clientes (nome, data_cadastro) VALUES
    ('Cliente A', '2023-10-23'),
    ('Cliente B', '2023-10-23'),
    ('Cliente C', '2023-10-22');

-- Inserir dados de exemplo na tabela de vendas
INSERT INTO vendas (data_venda, cliente_id, valor_total) VALUES
    ('2023-10-23', 1, 100.00),
    ('2023-10-23', 2, 75.00),
    ('2023-10-22', 3, 50.00);
    
 CREATE OR REPLACE FUNCTION somar_clientes_cadastrados(data_pesquisa DATE)
RETURNS INTEGER AS $$
DECLARE
    total_clientes INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE data_cadastro = data_pesquisa;

    RETURN total_clientes;
END;
$$ LANGUAGE plpgsql;

SELECT somar_clientes_cadastrados('2023-10-22');


