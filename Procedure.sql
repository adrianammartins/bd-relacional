CREATE table Produtos(
  id_produto serial PRIMARY KEY,
  nome_produto VARCHAR(255) NOT NULL,
  preco DECIMAL(10,2) Not NULL
  );
  
  CREATE table Compras (
    id_compra serial PRIMARY KEY,
    data_compra DATE NOT NULL,
    id_produto INT,
    quantidade INT not NULL,
    FOREIGN key (id_produto) REFERENCES Produtos (id_produto)
    );
    
    insert into Produtos(nome_produto, preco) VALUES('produto1',10.99), ('produto2', 15.99);
    INSERT INTO Compras (data_compra, id_produto, quantidade) VALUES
    ('2023-10-23', 1, 5),
    ('2023-10-23', 2, 3),
    ('2023-10-22', 1, 2),
    ('2023-10-22', 2, 4);
    
DELIMITER //

CREATE PROCEDURE RelatorioDiario()
BEGIN
    SELECT data_compra, p.nome_produto, SUM(c.quantidade) as total_comprado
    FROM Compras c
    JOIN Produtos p ON c.id_produto = p.id_produto
    WHERE data_compra = CURDATE()
    GROUP BY data_compra, p.nome_produto;
END//
DELIMITER ;

CALL RelatorioDiario();

