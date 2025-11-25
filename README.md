🚗 Sistema de Monitoramento de Locadora de Veículos

Controle centralizado de reservas, empréstimos, devoluções, manutenções e histórico de utilização

📌 Sobre o Projeto

Este projeto apresenta um banco de dados completo e estruturado para gerenciar o ciclo de vida dos veículos de uma locadora.
Seu foco é monitorar as operações essenciais, garantindo rastreabilidade total das atividades:

Quem alugou

Quando retirou

Quando devolveu

Em que condição estava

Como foi utilizado

Quando entrou em manutenção

O sistema foi construído com uma modelagem sólida, capaz de sustentar qualquer aplicação real ou acadêmica que dependa de dados confiáveis sobre o uso de veículos.

🎯 Foco Central do Projeto

O objetivo principal é permitir o registro, consulta e rastreamento completo de todas as movimentações de um veículo dentro da locadora.

Isso inclui:

Reservar

Emprestar (retirada)

Devolver

Registrar manutenções

Gerar histórico consolidado

Esse é o núcleo absoluto do projeto — tudo foi modelado para que essas operações funcionem com precisão.

🧠 Problema que o Projeto Resolve

Locadoras precisam responder perguntas como:

Qual veículo está disponível agora?

Quem usou este veículo por último?

A quilometragem bate com a devolução anterior?

Há pendências ou danos registrados?

Qual carro está em manutenção e até quando?

Esta reserva virou um empréstimo ou expirou?

O banco de dados foi projetado para responder exatamente essas questões de forma confiável.

🛠 Tecnologias Utilizadas

MySQL para modelagem e persistência criação de tabelas, relacionamentos e inserção de dados

DER/MER para representar estruturas e regras do domínio

🧩 Funcionalidades Monitoradas (Escopo Real)
✔ Reservas

Armazena datas, status e relação cliente–veículo.

✔ Empréstimos

Registra retirada, quilometragem inicial e funcionário responsável.

✔ Devoluções

Registra quilometragem final, danos e valores adicionais.

✔ Manutenções

Controla entrada e saída de serviços, tipo e custo.

✔ Histórico de Utilização

Registra todo evento envolvendo o veículo em formato de log permanente.

🎯 Público-Alvo

Desenvolvedores que precisam de um modelo para sistemas de locadora

Projetos acadêmicos que exigem minimundo + MER + DER

Aplicações reais que precisam de rastreamento operacional

🧱 Entidades Centrais

Cliente

Veículo

Reserva

Empréstimo

Devolução

Manutenção

Funcionário

Histórico de Utilização

🚀 Conclusão

Este projeto não é apenas um banco de dados — ele é um sistema completo de rastreamento operacional para locadoras de veículos.
Tudo foi construído com foco em claridade, confiabilidade e precisão histórica, garantindo que qualquer aplicação conectada a ele tenha uma base sólida para operar.





🚀 Como utilizar este banco de dados (AutoDrive)

Para executar este projeto e criar todo o banco AutoDrive, siga os passos abaixo dentro do seu ambiente MySQL (Workbench, DBeaver, Beekeeper, Terminal ou similar):

1️⃣ Criar e selecionar o banco de dados

O primeiro passo é criar o banco e defini-lo como o banco ativo para receber as tabelas:

CREATE DATABASE autoDrive;
USE autoDrive;

2️⃣ Criar as tabelas do sistema

O projeto inclui tabelas que representam todas as operações da locadora — clientes, veículos, reservas, empréstimos, devoluções, manutenções e histórico de utilização.

Cada CREATE TABLE deve ser executado exatamente na ordem em que aparece no arquivo, porque algumas tabelas possuem chaves estrangeiras dependentes de outras.

Exemplo de criação de tabela:

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone INT NOT NULL,
    ddd INT NOT NULL,
    email VARCHAR(100),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);


Após criar todas as tabelas, você terá a estrutura completa do sistema AutoDrive.

3️⃣ Inserir dados iniciais

O script fornece dados prontos para testes, incluindo:

7 clientes

10 veículos

Reservas com diferentes status

Empréstimos

Devoluções

Manutenções

Histórico de utilização

Basta executar os blocos de INSERT fornecidos:

INSERT INTO cliente (nome, cpf, ddd, telefone, email, data_cadastro) VALUES
('Ana Silva', '12345678901', '11', '987654321', 'ana.silva@example.com', '2025-11-23'),
...


Com isso, o banco já estará populado para testes, consultas e operações.

4️⃣ Executar consultas prontas (queries)

O arquivo também inclui consultas SQL úteis, como:

Listar reservas confirmadas

Ver veículos com quilometragem alta

Consultar histórico completo de utilização

Ver devoluções com danos

Atualizar quilometragem após devolução

Atualizar status de reserva

Exemplo:

SELECT * FROM reserva
WHERE status_reserva = 'confirmada'
ORDER BY data_prevista_retirada ASC;


Essas queries demonstram como interagir com o banco e podem ser reutilizadas no sistema final.

5️⃣ Executar comandos de atualização (UPDATE)

O script já traz exemplos reais de atualização de dados:

UPDATE veiculo
SET quilometragem_atual = 45210
WHERE idVeiculo = 1;

6️⃣ Executar deletes seguros

Todos os DELETE do arquivo usam chaves primárias, garantindo compatibilidade com o Safe Update Mode:

DELETE FROM cliente
WHERE idCliente = 7;

✔ Pronto!

Após seguir esses passos, você terá o banco AutoDrive completo, funcional e populado, pronto para:

Testes

Desenvolvimento backend

Projetos acadêmicos

Relatórios

Estudos de modelagem SQL
