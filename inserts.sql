
INSERT INTO especialidade (nome_especialidade, descricao) VALUES
('Cardiologia', 'Doenças do coração'),
('Pediatria', 'Saúde infantil'),
('Dermatologia', 'Doenças da pele');
('Ortopedia', 'Tratamento de ossos, músculos e articulações'),
('Neurologia', 'Doenças do sistema nervoso'),
('Ginecologia', 'Saúde do sistema reprodutor feminino'),
('Oftalmologia', 'Saúde dos olhos e visão'),
('Endocrinologia', 'Distúrbios hormonais e metabólicos');


INSERT INTO medico (nome, crm, telefone, email, id_especialidade) VALUES
('Dr. João Silva', '12345-SP', '11993450000', 'joao@saudeviva.com', 1),
('Dra. Maria Souza', '67890-SP', '11992340000', 'maria@saudeviva.com', 2);
('Dr. Ricardo Almeida', '11223-SP', '11998887711', 'ricardo.almeida@saudeviva.com', 4),
('Dra. Helena Furtado', '33445-SP', '11997776622', 'helena.furtado@saudeviva.com', 5),
('Dr. André Vasconcelos', '55667-SP', '11996665533', 'andre.vasconcelos@saudeviva.com', 6),
('Dra. Patrícia Muniz', '77889-SP', '11995554444', 'patricia.muniz@saudeviva.com', 7),
('Dr. Leandro Rocha', '99001-SP', '11994443355', 'leandro.rocha@saudeviva.com', 8);


INSERT INTO paciente (nome, data_nascimento, cpf, telefone, email, endereco, convenio) VALUES
('Ana Pereira', '1990-03-11', '12345678901', '11988553322', 'ana@gmail.com', 'Rua A, 120', 'Amil'),
('Carlos Mendes', '1984-09-22', '10987654321', '11977446655', 'carlos@yahoo.com', 'Rua B, 45', 'Unimed');
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

INSERT INTO agendamento (id_paciente, id_medico, data, horario, status_consulta) VALUES
(1, 1, '2025-02-14', '09:00', 'agendado'),
(2, 2, '2025-02-14', '10:30', 'agendado');
(3, 4, '2025-03-10', '08:30', 'agendado'),   
(4, 5, '2025-03-10', '09:00', 'agendado'),   
(5, 6, '2025-03-10', '09:30', 'agendado');   


INSERT INTO consulta (id_agendamento, data_consulta, anotacoes, prescricao) VALUES
(1, '2025-02-14', 'Paciente relata dor no peito.', 'Atestado + repouso'),
(2, '2025-02-14', 'Paciente com febre e tosse.', 'Xarope e antitérmico');
(3, '2025-03-10', 'Paciente apresentou dor no joelho após queda.', 'Analgésico e fisioterapia leve.'),
(4, '2025-03-10', 'Paciente com fortes dores de cabeça e náuseas.', 'Solicitado exame de imagem.');


INSERT INTO exame (id_consulta, nome_exame, tipo, data_solicitacao) VALUES
(1, 'Eletrocardiograma', 'Cardiológico', '2025-02-14'),
(2, 'Hemograma', 'Laboratorial', '2025-02-14');
(3, 'Raio-X do Joelho', 'Ortopédico', '2025-03-10'),
(4, 'Tomografia Computadorizada', 'Neurológico', '2025-03-10');


INSERT INTO laudo (id_exame, descricao, data_resultado) VALUES
(1, 'Traçado normal', '2025-02-15'),
(2, 'Leve alteração nos níveis', '2025-02-15');
(4, 'Tomografia revela sinais leves de inflamação; recomendada avaliação neurológica.', '2025-03-11');




