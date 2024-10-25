-- Criação do banco de dados
CREATE DATABASE gestao_projetos;

-- Uso do banco de dados
USE gestao_projetos;

-- Criação da tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255) DEFAULT NULL
);

-- Criação da tabela de projetos
CREATE TABLE projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Criação da tabela de tarefas
CREATE TABLE tarefas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projetos(id) ON DELETE CASCADE
);

-- Inserção de dados iniciais na tabela de usuários
INSERT INTO usuarios (username, password, profile_picture) VALUES
('admin', 'admin123', NULL),
('gerente1', 'senha123', NULL);

-- Inserção de dados iniciais na tabela de projetos
INSERT INTO projetos (user_id, nome) VALUES
(1, 'Projeto A'),
(1, 'Projeto B'),
(2, 'Projeto C');

-- Inserção de dados iniciais na tabela de tarefas
INSERT INTO tarefas (project_id, nome) VALUES
(1, 'Tarefa 1 do Projeto A'),
(1, 'Tarefa 2 do Projeto A'),
(2, 'Tarefa 1 do Projeto B'),
(3, 'Tarefa 1 do Projeto C');
