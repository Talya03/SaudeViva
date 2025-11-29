-- =====================================================================
-- TESTE COMPLETO DO SISTEMA SAÚDEVIVA - BANCO RELACIONAL
-- Criação do BD, tabelas, inserção de dados e testes de SELECT/UPDATE/DELETE
-- =====================================================================

-- 1) Criar e usar o banco
DROP DATABASE IF EXISTS saudeviva;
CREATE DATABASE saudeviva;
USE saudeviva;

-- =====================================================================
-- 2) Criação das tabelas
-- =====================================================================

CREATE TABLE especialidade (
    id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    nome_especialidade VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(120),
    id_especialidade INT,
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(120),
    endereco VARCHAR(200),
    convenio VARCHAR(120)
);

CREATE TABLE agendamento (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    status_consulta ENUM('agendado','realizado','cancelado','ausente') DEFAULT 'agendado',
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    id_agendamento INT UNIQUE NOT NULL,
    data_consulta DATE NOT NULL,
    anotacoes TEXT,
    prescricao TEXT,
    FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento)
);

CREATE TABLE exame (
    id_exame INT PRIMARY KEY AUTO_INCREMENT,
    id_consulta INT NOT NULL,
    nome_exame VARCHAR(120) NOT NULL,
    tipo VARCHAR(80) NOT NULL,
    data_solicitacao DATE NOT NULL,
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

CREATE TABLE laudo (
    id_laudo INT PRIMARY KEY AUTO_INCREMENT,
    id_exame INT UNIQUE NOT NULL,
    arquivo LONGBLOB,
    descricao TEXT,
    data_resultado DATE,
    FOREIGN KEY (id_exame) REFERENCES exame(id_exame)
);

-- =====================================================================
-- 3) Inserts
-- =====================================================================

-- Especialidades principais + novas especialidades
INSERT INTO especialidade (nome_especialidade, descricao) VALUES
('Cardiologia', 'Doenças do coração'),
('Pediatria', 'Saúde infantil'),
('Dermatologia', 'Doenças da pele'),
('Ortopedia', 'Tratamento de ossos, músculos e articulações'),
('Neurologia', 'Doenças do sistema nervoso'),
('Ginecologia', 'Saúde do sistema reprodutor feminino'),
('Oftalmologia', 'Saúde dos olhos e visão'),
('Endocrinologia', 'Distúrbios hormonais e metabólicos');

-- Médicos (originais + 5 novos)
INSERT INTO medico (nome, crm, telefone, email, id_especialidade) VALUES
('Dr. João Silva', '12345-SP', '11993450000', 'joao@saudeviva.com', 1),
('Dra. Maria Souza', '67890-SP', '11992340000', 'maria@saudeviva.com', 2),
('Dr. Ricardo Almeida', '11223-SP', '11998887711', 'ricardo.almeida@saudeviva.com', 4),
('Dra. Helena Furtado', '33445-SP', '11997776622', 'helena.furtado@saudeviva.com', 5),
('Dr. André Vasconcelos', '55667-SP', '11996665533', 'andre.vasconcelos@saudeviva.com', 6),
('Dra. Patrícia Muniz', '77889-SP', '11995554444', 'patricia.muniz@saudeviva.com', 7),
('Dr. Leandro Rocha', '99001-SP', '11994443355', 'leandro.rocha@saudeviva.com', 8);

-- Pacientes (originais + 10 novos)
INSERT INTO paciente (nome, data_nascimento, cpf, telefone, email, endereco, convenio) VALUES
('Ana Pereira', '1990-03-11', '12345678901', '11988553322', 'ana@gmail.com', 'Rua A, 120', 'Amil'),
('Carlos Mendes', '1984-09-22', '10987654321', '11977446655', 'carlos@yahoo.com', 'Rua B, 45', 'Unimed'),
('Fernanda Costa', '1988-07-19', '32165498700', '11991234001', 'fernanda.costa@gmail.com', 'Rua das Acácias, 300', 'Bradesco Saúde'),
('Rafael Gomes', '1995-11-05', '45678912300', '11992345002', 'rafael.gomes@hotmail.com', 'Av. Paulista, 1500', 'SulAmérica'),
('Juliana Martins', '1979-04-22', '78912345600', '11993456003', 'juliana.martins@yahoo.com', 'Rua Verde, 87', 'Amil'),
('Pedro Henrique', '2002-09-10', '65498732100', '11994567004', 'pedro.henrique@gmail.com', 'Rua Azul, 12', 'Unimed'),
('Carolina Oliveira', '1993-02-17', '14725836900', '11995678005', 'carolina.oliveira@outlook.com', 'Rua Flor de Lis, 44', 'HapVida'),
('Bruno Azevedo', '1985-12-08', '25836914700', '11996789006', 'bruno.azevedo@gmail.com', 'Rua Imperial, 99', 'Porto Seguro'),
('Luiza Faria', '1999-06-26', '36914725800', '11997890007', 'luiza.faria@gmail.com', 'Rua das Hortênsias, 551', 'Bradesco Saúde'),
('Matheus Ribeiro', '1987-03-14', '96385274100', '11998901008', 'matheus.ribeiro@gmail.com', 'Rua Santos, 200', 'Unimed'),
('Beatriz Lima', '1991-10-30', '85274196300', '11999012009', 'beatriz.lima@gmail.com', 'Rua Canários, 17', 'Amil'),
('Gustavo Fernandes', '1983-01-25', '74196385200', '11990123010', 'gustavo.fernandes@gmail.com', 'Av. Liberdade, 390', 'SulAmérica');

-- Agendamentos
INSERT INTO agendamento (id_paciente, id_medico, data, horario, status_consulta) VALUES
(1, 1, '2025-02-14', '09:00', 'agendado'),
(2, 2, '2025-02-14', '10:30', 'agendado');

-- Consultas
INSERT INTO consulta (id_agendamento, data_consulta, anotacoes, prescricao) VALUES
(1, '2025-02-14', 'Paciente relata dor no peito.', 'Atestado + repouso'),
(2, '2025-02-14', 'Paciente com febre e tosse.', 'Xarope e antitérmico');

-- Exames e Laudos
INSERT INTO exame (id_consulta, nome_exame, tipo, data_solicitacao) VALUES
(1, 'Eletrocardiograma', 'Cardiológico', '2025-02-14'),
(2, 'Hemograma', 'Laboratorial', '2025-02-14');

INSERT INTO laudo (id_exame, descricao, data_resultado) VALUES
(1, 'Traçado normal', '2025-02-15'),
(2, 'Leve alteração nos níveis', '2025-02-15');

-- =====================================================================
-- 4) SELECTS de Teste
-- =====================================================================

SELECT * FROM paciente;
SELECT * FROM medico;
SELECT * FROM agendamento;

SELECT p.nome AS paciente, m.nome AS medico, a.data, a.horario
FROM agendamento a
JOIN paciente p ON p.id_paciente = a.id_paciente
JOIN medico m ON m.id_medico = a.id_medico;

SELECT e.nome_exame, c.id_consulta, l.descricao
FROM exame e
JOIN laudo l ON l.id_exame = e.id_exame
JOIN consulta c ON c.id_consulta = e.id_consulta;

-- =====================================================================
-- 5) UPDATE
-- =====================================================================

UPDATE paciente SET telefone = '11990002211' WHERE id_paciente = 1;
UPDATE medico SET email = 'novoemail@saudeviva.com' WHERE id_medico = 1;
UPDATE agendamento SET status_consulta = 'realizado' WHERE id_agendamento = 1;

-- =====================================================================
-- 6) DELETE
-- =====================================================================

DELETE FROM laudo WHERE id_laudo = 1;
DELETE FROM paciente WHERE id_paciente = 2;

-- =====================================================================
-- 7) TESTE FINAL
-- =====================================================================

SELECT 'TESTE CONCLUÍDO COM SUCESSO' AS status;
