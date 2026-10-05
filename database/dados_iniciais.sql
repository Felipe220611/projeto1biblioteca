USE biblioteca_1ano;

-- 1. Inserção de dados nas tabelas
INSERT INTO aluno (nome, serie, turma, telefone)
VALUES
('Ana Clara Lima', '1º Ano', 'B', '4499999-1111'),
('João Pedro Santos', '1º Ano', 'B', '4499999-2222'),
('Maria Eduarda Ribeiro', '1º Ano', 'B', '4499999-3333'),
('Pedro Henrique Silva', '1º Ano', 'B', '4499999-4444'),
('Letícia Oliveira', '1º Ano', 'B', '4499999-5555');

INSERT INTO livro (titulo, autor, categoria, status)
VALUES
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Literatura', 'Disponível'),
('Dom Casmurro', 'Machado de Assis', 'Romance', 'Disponível'),
('Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 'Fantasia', 'Disponível'),
('A Menina que Roubava Livros', 'Markus Zusak', 'Drama', 'Disponível'),
('O Cortiço', 'Aluísio Azevedo', 'Literatura Brasileira', 'Disponível');

INSERT INTO bibliotecario (nome, email)
VALUES
('Bibliotecária Responsável', 'biblioteca@escola.com'),
('Auxiliar da Biblioteca', 'auxiliar.biblioteca@escola.com');

-- 2. Preenchimento dos logins nos utilizadores existentes
UPDATE usuario SET login = 'admin' WHERE id_usuario = 1;
UPDATE usuario SET login = 'biblioteca' WHERE id_usuario = 2;
UPDATE usuario SET login = 'ana_clara' WHERE id_usuario = 3;

-- 3. Adição da coluna created_at
ALTER TABLE usuario
ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP AFTER id_bibliotecario;

-- 4. Alteração da coluna login para NOT NULL
ALTER TABLE usuario
MODIFY login VARCHAR(50) NOT NULL;

-- 5. Adição da restrição de login ÚNICO (UNIQUE)
ALTER TABLE usuario
ADD CONSTRAINT uk_usuario_login UNIQUE (login);