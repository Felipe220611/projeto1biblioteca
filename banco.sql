CREATE DATABASE biblioteca_1ano;
USE biblioteca_1ano;


#Criando usuário
CREATE USER 'biblioteca_user1'@'localhost' IDENTIFIED BY 'projeto1';


#Dar Permissão ao usuário
GRANT ALL PRIVILEGES
ON biblioteca_1ano.*
TO 'biblioteca_user1'@'localhost';


#Atualiza Permissão
FLUSH PRIVILEGES;


#Visualizar todas as bases existentes
SHOW DATABASES;


#Visualizar todos os usuários
SELECT user FROM mysql.user;

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    turma VARCHAR(20) NOT NULL,
    telefone VARCHAR(20)
);


#Criação da tabela de Livro
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    status VARCHAR(20) NOT NULL DEFAULT 'Disponível'
);


#Criação da tabela de Professor
CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL);


#Criação da tabela de Bibliotecário
CREATE TABLE bibliotecario (
    id_bibliotecario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

#Criação da tabela de Empréstimo
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_livro INT,
    id_bibliotecario INT,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Emprestado',


    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

# Criação da tabela Usuário
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    perfil VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',

    id_aluno INT,
    id_professor INT,
    id_bibliotecario INT,

    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);


INSERT INTO aluno (nome, serie, turma, telefone) 
VALUES('Felipe','1° ano', '1°B', '4433333-3333'),
('Lucas', '1° ano', '1°B', '4455555-5555'),
('Murillo', '1° ano', '1°B', '4466666-6666'),
('Matheus', '1° ano', '1°B', '4477777-7777'),
('Carimbo', '1° ano', '1°B', '4488888-8888');

SELECT * FROM aluno;

INSERT INTO livro (titulo, autor, categoria, status) VALUES
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Ficção', 'Disponível'),
('Dom Casmurro', 'Machado de Assis', 'Literatura Brasileira', 'Emprestado'),
('1984', 'George Orwell', 'Ficção Científica', 'Disponível'),
('A Hora da Estrela', 'Clarice Lispector', 'Literatura Brasileira', 'Disponível'),
('O Hobbit', 'J.R.R. Tolkien', 'Fantasia', 'Disponível');

SELECT * FROM livro;

INSERT INTO professor (nome, telefone, email) VALUES
('Carlos Silva', '4491111-1111', 'carlos.silva@escola.com'),
('Ana Maria', '4492222-2222', 'ana.maria@escola.com'),
('Roberto Gomez', '4493333-3333', 'roberto.gomez@escola.com'),
('Mariana Santos', '4494444-4444', 'mariana.santos@escola.com'),
('Fernando Costa', '4495555-5555', 'fernando.costa@escola.com');

SELECT * FROM professor;

INSERT INTO bibliotecario (nome, email) VALUES
('Sônia Regina', 'sonia.biblioteca@escola.com'),
('Marcos Paulo', 'marcos.biblioteca@escola.com'),
('Beatriz Lima', 'beatriz.biblioteca@escola.com'),
('Renato Souza', 'renato.biblioteca@escola.com'),
('Claudia Ramos', 'claudia.biblioteca@escola.com');

SELECT * FROM bibliotecario;

INSERT INTO emprestimo (id_aluno, id_livro, id_bibliotecario, data_emprestimo, data_prevista_devolucao, data_devolucao, status) VALUES
(1, 2, 1, '2026-03-01', '2026-03-15', NULL, 'Emprestado'),
(2, 1, 1, '2026-02-10', '2026-02-24', '2026-02-22', 'Devolvido'),
(3, 3, 2, '2026-03-05', '2026-03-19', NULL, 'Emprestado'),
(4, 4, 3, '2026-02-15', '2026-03-01', '2026-03-01', 'Devolvido'),
(5, 5, 2, '2026-03-10', '2026-03-24', NULL, 'Emprestado');

SELECT * FROM emprestimo;

INSERT INTO usuario 
(nome, email, senha, perfil, status, id_aluno, id_professor, id_bibliotecario) 
VALUES
('Felipe', 'felipe.aluno@escola.com', 'senha123', 'Aluno', 'Ativo', 1, NULL, NULL),
('Lucas', 'lucas.aluno@escola.com', 'senha456', 'Aluno', 'Ativo', 2, NULL, NULL),
('Carlos Silva', 'carlos.prof@escola.com', 'prof123', 'Professor', 'Ativo', NULL, 1, NULL),
('Ana Maria', 'ana.prof@escola.com', 'prof456', 'Professor', 'Ativo', NULL, 2, NULL),
('Sônia Regina', 'sonia.admin@escola.com', 'admin123', 'Bibliotecário', 'Ativo', NULL, NULL, 1);

SELECT * FROM usuario;