

SELECT * FROM paciente;
SELECT * FROM medico;
SELECT * FROM agendamento;
SELECT * FROM consulta;
SELECT * FROM exame;
SELECT * FROM laudo;


SELECT p.nome AS paciente, m.nome AS medico, a.data, a.horario
FROM agendamento a
JOIN paciente p ON p.id_paciente = a.id_paciente
JOIN medico m ON m.id_medico = a.id_medico;


SELECT e.nome_exame, c.id_consulta, l.descricao
FROM exame e
JOIN laudo l ON l.id_exame = e.id_exame
JOIN consulta c ON c.id_consulta = e.id_consulta;