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
