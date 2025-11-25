Create database autoDrive;
use autoDrive;

Create table cliente(
idCliente int primary key auto_increment,
nome varchar(45) not null,
cpf char(11) not null,
telefone int not null,
ddd int not null,
email varchar(100),
data_cadastro datetime default current_timestamp
);

insert into cliente (nome, cpf, ddd, telefone, email, data_cadastro) values
('Ana Silva', '12345678901', '11', '987654321', 'ana.silva@example.com', '2025-11-23'),
('Bruno Oliveira', '23456789012', '21', '994563210', 'bruno.oliveira@example.com', '2025-11-23'),
('Carla Mendes', '34567890123', '31', '997812345', 'carla.mendes@example.com', '2025-11-23'),
('Diego Santos', '45678901234', '41', '996543210', 'diego.santos@example.com', '2025-11-23'),
('Eduarda Rocha', '56789012345', '51', '991234567', 'eduarda.rocha@example.com', '2025-11-23'),
('Felipe Souza', '67890123456', '71', '998765432', 'felipe.souza@example.com', '2025-11-23'),
('Gabriela Lima', '78901234567', '85', '995432198', 'gabriela.lima@example.com', '2025-11-23');


create table veiculo(
idVeiculo int primary key auto_increment,
placa varchar(7) not null,
modelo varchar(20) not null,
marca varchar(20) not null,
ano int not null,
quilometragem_atual int not null
);

insert into veiculo (placa, modelo, marca, ano, quilometragem_atual) values
('ABC1A23', 'Civic', 'Honda', 2018, 45200),
('DEF2B34', 'Corolla', 'Toyota', 2020, 31000),
('GHI3C45', 'Onix', 'Chevrolet', 2019, 58500),
('JKL4D56', 'Fiesta', 'Ford', 2017, 72300),
('MNO5E67', 'HB20', 'Hyundai', 2021, 19800),
('PQR6F78', 'Gol', 'Volkswagen', 2016, 88000),
('STU7G89', 'Compass', 'Jeep', 2022, 15000),
('VWX8H90', 'Renegade', 'Jeep', 2019, 40200),
('YZA9J01', 'Argo', 'Fiat', 2020, 33500),
('BCD0K12', 'Sandero', 'Renault', 2018, 61000);

Create table historico_utilizacao (
idHistorico int primary key auto_increment,
data_fim datetime default current_timestamp not null,
data_inicio datetime default current_timestamp not null,
fkVeiculo int not null,
constraint fkHistoricoVeiculo foreign key(fkVeiculo) references veiculo(idVeiculo),
fkCliente int not null,
constraint fkHistoricoCliente foreign key(fkCliente) references cliente(idCliente),
tipo_registro varchar(12),
constraint chkRegistro 
	check(tipo_registro in ('reserva', 'devolucao', 'emprestimo', 'manutencao'))  -- Nessa parte representa que os unicos valores que são aceitos 'reserva', 'devolucao', 'emprestimo', 'manutencao'
);

insert into historico_utilizacao (data_inicio, data_fim, fkVeiculo, fkCliente, tipo_registro) values
('2025-01-10 09:00:00', '2025-01-10 12:00:00', 1, 3, 'reserva'),
('2025-01-15 08:30:00', '2025-01-15 18:00:00', 2, 5, 'emprestimo'),
('2025-01-20 14:00:00', '2025-01-20 17:45:00', 3, 1, 'devolucao'),
('2025-02-01 10:00:00', '2025-02-05 16:00:00', 4, 2, 'manutencao'),
('2025-02-12 11:30:00', '2025-02-12 15:00:00', 5, 4, 'reserva'),
('2025-02-18 07:00:00', '2025-02-19 20:45:00', 1, 6, 'emprestimo'),
('2025-02-25 09:15:00', '2025-02-25 12:30:00', 3, 2, 'devolucao');

Create table reserva (
idReserva int primary key auto_increment,
data_reserva date not null,
data_prevista_retirada date not null,
data_prevista_devolucao date not null,
fkVeiculo int not null,
constraint fkReservaVeiculo foreign key(fkVeiculo) references veiculo(idVeiculo),
fkCliente int not null,
constraint fkReservaCliente foreign key(fkCliente) references cliente(idCliente),
status_reserva varchar(12),
constraint chkStatus 
	check(status_reserva in('pendente', 'confirmada', 'cancelada', 'expirada'))
);

insert into reserva (data_reserva, data_prevista_retirada, data_prevista_devolucao, fkVeiculo, fkCliente, status_reserva) values
('2025-02-01 10:30:00', '2025-02-05 09:00:00', '2025-02-10 18:00:00', 1, 3, 'confirmada'),
('2025-02-03 14:10:00', '2025-02-06 08:00:00', '2025-02-08 17:00:00', 7, 5, 'pendente'),
('2025-02-05 09:45:00', '2025-02-07 09:00:00', '2025-02-12 19:00:00', 8, 2, 'cancelada'),
('2025-02-07 16:20:00', '2025-02-10 10:00:00', '2025-02-15 18:00:00', 9, 4, 'expirada'),
('2025-02-09 11:00:00', '2025-02-12 09:00:00', '2025-02-14 16:00:00', 10, 1, 'confirmada');


Create table emprestimo (
idEmprestimo int primary key auto_increment,
fkReserva int,
constraint fkEmprestimoReserva foreign key(fkReserva) references reserva(idReserva),
data_retirada datetime default current_timestamp,
quilometragem_atual int,
funcionario_responsavel varchar(100)
);

insert into emprestimo (fkReserva, data_retirada, quilometragem_atual, funcionario_responsavel) values
(1, '2025-11-23 09:15:00', 45200, 'Marcos Almeida'),
(2, '2025-11-23 10:00:00', 31000, 'Fernanda Ribeiro'),
(3, '2025-11-23 10:45:00', 58500, 'João Martins'),
(4, '2025-11-23 11:30:00', 72300, 'Patrícia Gomes'),
(5, '2025-11-23 12:00:00', 19800, 'Ricardo Silva');


Create table devolucao (
idDevolucao int primary key auto_increment,
data_devolucao datetime default current_timestamp,
quilometragem_final int not null,
observacao varchar(200) not null,
valor_adicional decimal not null, 
danos_identificados char(3) not null,
fkEmprestimo int,
constraint fkDevolucaoEmprestimo foreign key(fkEmprestimo) references emprestimo(idEmprestimo),
constraint chkDanos 
	check(danos_identificados in ('Sim', 'Não'))
);

insert into devolucao (data_devolucao, quilometragem_final, observacao, valor_adicional, danos_identificados, fkEmprestimo) values
('2025-02-10 17:45:00', 45210, 'Veículo devolvido no horário previsto.', 0.00, 'não', 1),
('2025-02-14 15:20:00', 38950, 'Pequeno atraso de 20 minutos, sem impacto no valor.', 0.00, 'não', 2),
('2025-02-18 11:10:00', 51230, 'Arranhão leve no para-choque traseiro.', 350.00, 'sim', 3);

create table manutencao (
idManutencao int primary key auto_increment,
data_inicio date not null,
data_fim date,
tipo_servico varchar(200),
custo decimal,
fkVeiculo int,
constraint fkManutencaoVeiculo foreign key(fkVeiculo) references veiculo(idVeiculo)
);

INSERT INTO manutencao (data_inicio, data_fim, tipo_servico, custo, fkVeiculo) VALUES
('2025-11-23', '2025-11-24', 'Reparo de arranhão no para-choque', 450.00, 8);


select * from manutencao;
select * from veiculo;
select * from cliente;
select * from reserva;
select * from emprestimo;
select * from devolucao;
select * from historico_utilizacao;

-- Lista todas as reservas confirmadas, ordenadas pela data prevista de retirada
select * from reserva
where status_reserva = 'confirmada'
order by data_prevista_retirada asc;

-- Lista os veículos com quilometragem acima de 50.000 km
select idVeiculo, modelo, marca, quilometragem_atual
from veiculo
where quilometragem_atual > 50000
order by quilometragem_atual desc;

-- Mostra o histórico de utilização junto com o nome do cliente e modelo do veículo 
select c.nome as cliente,
       v.modelo as veiculo,
       h.tipo_registro,
       h.data_inicio,
       h.data_fim
from historico_utilizacao h
join cliente c on h.fkCliente = c.idCliente
join veiculo v on h.fkVeiculo = v.idVeiculo
order by h.data_inicio desc;

-- lista as devoluções onde houve danos
select d.idDevolucao, d.data_devolucao, d.observacao, d.valor_adicional, e.fkReserva
from devolucao d
join emprestimo e on d.fkEmprestimo = e.idEmprestimo
where danos_identificados = 'Sim';

-- Mostra somente 3 veículos mais novos
select * from veiculo
order by ano desc
limit 3;

-- Lista empréstimos com informações do cliente e do veículo
select c.nome as cliente,
       v.modelo as veiculo,
       e.data_retirada,
       e.quilometragem_atual
from emprestimo e
join reserva r on e.fkReserva = r.idReserva
join cliente c on r.fkCliente = c.idCliente
join veiculo v on r.fkVeiculo = v.idVeiculo;

-- Mostra todas as manutenções feitas no veículo Renegade
select m.*, 
       v.modelo, 
       v.marca
from manutencao m
join veiculo v on m.fkVeiculo = v.idVeiculo
where v.modelo = 'Renegade';

-- Atualiza o status de uma reserva pendente para confirmada
update reserva
set status_reserva = 'confirmada'
where idReserva = 2;

-- Atualiza quilometragem do veículo após devolução
update veiculo
set quilometragem_atual = 45210
where idVeiculo = 1;

-- Atualiza o valor adicional de uma devolução por erro de registro
update devolucao
set valor_adicional = 150.00
where idDevolucao = 2;

-- Excluir o veiculo que está na mantenção com idManuntecao 1
delete from manutencao
where idManutencao = 1;

-- Excluir o cliente que corresponde idCliente 7
delete from cliente
where idCliente = 7;

-- Excluir registros de histórico de teste referentes a um cliente
delete from historico_utilizacao
where fkCliente = 6
and tipo_registro = 'emprestimo';