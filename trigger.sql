CREATE TABLE Produto
(
 cod_prod INTEGER PRIMARY KEY,
 descricao VARCHAR(50) UNIQUE,
 qtde_disponivel INT NOT NULL DEFAULT 0
);

INSERT INTO Produto(cod_prod, descricao, qtde_disponivel) VALUES (1, 'Feijão', 15);
INSERT INTO Produto(cod_prod, descricao, qtde_disponivel)  VALUES (2, 'Arroz', 10);
INSERT INTO Produto(cod_prod, descricao, qtde_disponivel)  VALUES (3, 'Farinha', 20);

CREATE TABLE ItensVenda
(
 cod_venda  INTEGER,
 id_produto INTEGER,
 qtde_vendida INTEGER,
 FOREIGN KEY (id_produto) REFERENCES Produto(cod_prod) ON DELETE CASCADE
);

select* from Produto;

SELECT * FROM ItensVenda;

insert into ItensVenda (cod_venda, id_produto, qtde_vendida) values (1, 1, 3);
INSERT into ItensVenda (cod_venda, id_produto, qtde_vendida) values (2 ,2, 5);

create trigger t_atualiza_estoque
BEFORE INSERT ON itensVenda
for each ROW
EXECUTE PROCEDURE atualiza_estoque();

CREATE or REPLACE function atualiza_estoque() returns TRIGGER
AS
$$
DECLARE 
	qtde INTEGER; --quantidade disponível do produto em estoque
BEGIN
	SELECT qtd_disponivel from Produto where cod_prod = new.id_produto into qtde;
    if qtde < new.qtde_vendida THEN
    	raise EXCEPTION 'Quantidade indisponível em estoque.';
    ELSE
    	UPDATE Produto set qtde_disponivel = qtde_disponivel - new.qtde_vendida
        	WHERE cod_prod = new.id_produto;
     end if;
     return new;
end 
$$ LANGUAGE plpgsql;