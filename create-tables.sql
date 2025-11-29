
DROP DATABASE IF EXISTS saudeviva;
CREATE DATABASE saudeviva;
USE saudeviva;

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

