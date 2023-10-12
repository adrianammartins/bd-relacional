CREATE TABLE autores(
  id serial PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  nacionalidade VARCHAR(50)
  );
  
  insert into autores(nome, nacionalidade) VALUES('J.K. Rowling', 'Reino Unido'),
    ('George Orwell', 'Reino Unido'),
    ('Gabriel García Márquez', 'Colômbia'),
    ('Machado de Assis', 'Brasil'); 
    
    CREATE table livros(
      id_livro serial PRIMARY KEY,
      titulo VARCHAR(100) NOT NULL,
      ano_publicacao INT,
      id int,
      FOREIGN key (id) REFERENCES autores(id) );
      
      INSERT into livros(titulo, ano_publicacao, id) VALUES('Harry Pottter', 1997, 1), ('1984', 1949, 2), ('Cem Anos de Solidão', 1967,3), ('Machado de Asssis', 1981, 4);
      
      SELECT livros.titulo, autores.nome
      from livros
      INNER JOIN autores
      on livros.id = autores.id;
      
      SELECT livros.titulo, autores.nome
      from livros
     LEFT JOIN autores
      on livros.id = autores.id;
      
      SELECT livros.titulo, autores.nome
      from livros
     RIGHT JOIN autores
      on livros.id = autores.id;
      
      select autores.nome, livros.ano_publicacao
      from autores
      INNER join livros
      ON autores.id = livros.id;
      
      
      
      
      
  
  

