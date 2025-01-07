-- persistência dos dados

INSERT INTO Equipe (Nequip, Decricao) VALUES
('Equipe Alfa', 'Equipe responsável por veículos leves'),
('Equipe Beta', 'Especializada em caminhões'),
('Equipe Gamma', 'Equipe de manutenção pesada'),
('Equipe Delta', 'Equipe para veículos elétricos'),
('Equipe Omega', 'Equipe geral para emergências');
INSERT INTO Equipe (Nequip, Decricao) VALUES
('Equipe Phoenix', 'Especialistas em restauração de veículos antigos'),
('Equipe Turbo', 'Equipe de reparos rápidos e manutenção básica'),
('Equipe Electra', 'Foco exclusivo em veículos híbridos e elétricos'),
('Equipe Titan', 'Equipe dedicada a veículos pesados e transporte de carga'),
('Equipe Vulcano', 'Responsável por manutenção de motores e sistemas de alta performance');


INSERT INTO Responsavel (Pnome, Nmeio, Sobrenome, Celular, CPF, Logradouro_Mecanico, Complemento_Mecanico, Cidade_Mecanico, Bairro_Mecanico, UF_Mec, Funcao, idEquipe_Responsavel) VALUES
('João', 'Pedro', 'Silva', '11999990000', '12345678901', 'Rua A', 'Apt 1', 'São Paulo', 'Centro', 'SP', 'Chefe de Equipe', 1),
('Maria', 'Clara', 'Santos', '21988880000', '23456789012', 'Rua B', 'Casa', 'Rio de Janeiro', 'Zona Sul', 'RJ', 'Mecânica', 2),
('Carlos', 'Eduardo', 'Souza', '31977770000', '34567890123', 'Rua C', 'Apt 5', 'Belo Horizonte', 'Savassi', 'MG', 'Técnico', 1),
('Ana', 'Luiza', 'Pereira', '41966660000', '45678901234', 'Rua D', 'Loft', 'Curitiba', 'Centro', 'PR', 'Assistente', 3),
('José', 'Fernando', 'Lima', '51955550000', '56789012345', 'Rua E', 'Apt 10', 'Porto Alegre', 'Moinhos', 'RS', 'Mecânico', 4);
INSERT INTO Responsavel (Pnome, Nmeio, Sobrenome, Celular, CPF, Logradouro_Mecanico, Complemento_Mecanico, Cidade_Mecanico, Bairro_Mecanico, UF_Mec, Funcao, idEquipe_Responsavel) VALUES
('Bruno', 'Alves', 'Costa', '11988887777', '67890123456', 'Rua X', 'Casa', 'São Paulo', 'Moema', 'SP', 'Supervisor', 2),
('Fernanda', 'Carla', 'Rodrigues', '21977776666', '78901234567', 'Rua Y', 'Apt 4', 'Rio de Janeiro', 'Barra', 'RJ', 'Mecânica', 3),
('Thiago', 'Augusto', 'Martins', '31966665555', '89012345678', 'Av. Z', 'Apt 12', 'Belo Horizonte', 'Centro', 'MG', 'Técnico', 5),
('Camila', 'Luiza', 'Moreira', '41955554444', '90123456789', 'Rua W', 'Loft', 'Curitiba', 'Batel', 'PR', 'Assistente', 4),
('Diego', 'Fernando', 'Barbosa', '51944443333', '01234567890', 'Rua V', 'Casa', 'Porto Alegre', 'Menino Deus', 'RS', 'Chefe de Equipe', 1);


INSERT INTO Cliente (Pnome_Cliente, Nmeio_Cliente, Sobrenome_Cliente, Celular_Cliente, CPF_Cliente, Logradouro, Complemento, Bairro, Cidade, UF, CEP, email) VALUES
('Carlos', 'Henrique', 'Ferreira', '11912345678', '78945612301', 'Av. Paulista', 'Apt 101', 'Bela Vista', 'São Paulo', 'SP', '01311000', 'carlos.h@gmail.com'),
('Patrícia', 'Almeida', 'Lopes', '21987654321', '89012345678', 'Rua da Paz', 'Casa 10', 'Leblon', 'Rio de Janeiro', 'RJ', '22451000', 'patricia.l@gmail.com'),
('Fernando', 'César', 'Moraes', '31945678912', '90123456789', 'Rua das Flores', 'Apt 23', 'Lourdes', 'Belo Horizonte', 'MG', '30170000', 'fernando.m@gmail.com'),
('Juliana', 'Maria', 'Farias', '41934567891', '91234567890', 'Rua Marechal', 'Apt 45', 'Centro', 'Curitiba', 'PR', '80010000', 'juliana.f@gmail.com'),
('Rafael', 'Antônio', 'Silva', '51923456789', '12312312312', 'Av. Independência', 'Loft 5', 'Independência', 'Porto Alegre', 'RS', '90035000', 'rafael.s@gmail.com');
INSERT INTO Cliente (Pnome_Cliente, Nmeio_Cliente, Sobrenome_Cliente, Celular_Cliente, CPF_Cliente, Logradouro, Complemento, Bairro, Cidade, UF, CEP, email) VALUES
('Lucas', 'Gabriel', 'Dias', '11999887766', '23423423422', 'Rua Bela Vista', 'Casa 8', 'Vila Mariana', 'São Paulo', 'SP', '04010000', 'lucas.d@gmail.com'),
('Mariana', 'Sofia', 'Ribeiro', '21988776655', '34534534533', 'Av. Atlântica', 'Apt 20', 'Copacabana', 'Rio de Janeiro', 'RJ', '22041001', 'mariana.r@gmail.com'),
('Pedro', 'Henrique', 'Souza', '31977665544', '45645645644', 'Rua Liberdade', 'Loft 15', 'Savassi', 'Belo Horizonte', 'MG', '30140000', 'pedro.s@gmail.com'),
('Isabela', 'Cristina', 'Silveira', '41966554433', '56756756755', 'Rua João Negrão', 'Apt 30', 'Rebouças', 'Curitiba', 'PR', '80230000', 'isabela.s@gmail.com'),
('Ricardo', 'Antônio', 'Oliveira', '51955443322', '67867867866', 'Av. Protásio Alves', 'Casa 3', 'Petrópolis', 'Porto Alegre', 'RS', '90460000', 'ricardo.o@gmail.com');


INSERT INTO Veiculo (Marca, Modelo, Ano, Placa, chassi, Cor, OBS, idCliente_Veiculo, idEquipe_Veiculo) VALUES
('Toyota', 'Corolla', '2022', 'ABC1234', '1HGBH41JXMN109186', 'Prata', 'Sem observações', 1, 1),
('Honda', 'Civic', '2021', 'DEF5678', '2HGBH41JXMN209187', 'Preto', 'Troca de pneus realizada', 2, 2),
('Ford', 'Focus', '2020', 'GHI9012', '3HGBH41JXMN309188', 'Branco', 'Manutenção recente', 3, 1),
('Chevrolet', 'Onix', '2019', 'JKL3456', '4HGBH41JXMN409189', 'Vermelho', 'Leve arranhão na lateral', 4, 3),
('Fiat', 'Uno', '2018', 'MNO7890', '5HGBH41JXMN509190', 'Azul', 'Troca de óleo pendente', 5, 4);
INSERT INTO Veiculo (Marca, Modelo, Ano, Placa, chassi, Cor, OBS, idCliente_Veiculo, idEquipe_Veiculo)
VALUES
('Renault', 'Sandero', '2017', 'PQR1122', '9BWHE21JXMN206789', 'Cinza', 'Revisão atrasada', 6, 1),
('Fiat', 'Toro', '2021', 'STU3344', '3D7KA28C87G775689', 'Vermelho', 'Pneu traseiro desgastado', 7, 2),
('Hyundai', 'HB20', '2020', 'VWX5566', '2HGFG12867H568920', 'Preto', 'Sem observações', 8, 3),
('Nissan', 'Kicks', '2022', 'YZA7788', '1HGCM82633A123457', 'Branco', 'Alarme com defeito', 9, 4),
('Jeep', 'Compass', '2019', 'BCD9900', '1G1BL52P7SR154321', 'Azul', 'Troca de óleo realizada', 10, 5);


INSERT INTO Ordem_Servico (dt_abertura, dt_conclusao, status_servico, idCliente_OS, idVeiculo_OS, idEquipe_OS) VALUES
('2025-01-01', '2025-01-05', 'Concluído', 1, 1, 1),
('2025-01-02', '2025-01-06', 'Em andamento', 2, 2, 2),
('2025-01-03', '2025-01-07', 'Aguardando Peças', 3, 3, 1),
('2025-01-04', '2025-01-08', 'Cancelado', 4, 4, 3),
('2025-01-05', '2025-01-09', 'Aberto', 5, 5, 4);
INSERT INTO Ordem_Servico (dt_abertura, dt_conclusao, status_servico, idCliente_OS, idVeiculo_OS, idEquipe_OS)
VALUES
('2024-02-02', '2024-03-04', 'Aberto', 6, 6, 1),
('2024-02-05', '2024-02-10', 'Concluído', 7, 7, 2),
('2024-04-12', '2024-04-30', 'Aguardando Peças', 8, 8, 3),
('2024-03-15', '2024-05-20', 'Concluído', 9, 9, 4),
('2024-11-18', '2024-12-18', 'Em andamento', 10, 10, 5);


INSERT INTO Servico (Tipo_Servico, Descricao_servico, Valor_Servico, idOS_Servico)
VALUES
('Troca de óleo', 'Troca de óleo lubrificante do motor', 150.00, 1),
('Revisão completa', 'Revisão geral de componentes do veículo', 500.00, 2),
('Alinhamento e balanceamento', 'Serviço de alinhamento e balanceamento das rodas', 200.00, 3),
('Troca de bateria', 'Substituição da bateria do veículo', 300.00, 4),
('Pintura', 'Reparação e pintura de para-lama traseiro', 700.00, 5);
INSERT INTO Servico (Tipo_Servico, Descricao_servico, Valor_Servico, idOS_Servico)
VALUES
('Troca de amortecedores', 'Substituição de amortecedores dianteiros', 800.00, 6),
('Alinhamento', 'Correção do alinhamento da direção', 150.00, 7),
('Troca de farol', 'Substituição do farol esquerdo', 400.00, 8),
('Revisão elétrica', 'Revisão completa do sistema elétrico', 600.00, 9),
('Reparo de pintura', 'Pintura e polimento do capô', 500.00, 10);


INSERT INTO Pecas (nome_peca, descricao_peca, valor_peca)
VALUES
('Filtro de óleo', 'Filtro de óleo para motor 1.6', 50.00),
('Pneus', 'Jogo de pneus aro 17', 1200.00),
('Bateria', 'Bateria automotiva 60Ah', 400.00),
('Amortecedor', 'Amortecedores traseiros', 800.00),
('Farol', 'Farol dianteiro direito', 300.00);
INSERT INTO Pecas (nome_peca, descricao_peca, valor_peca)
VALUES
('Correia dentada', 'Correia dentada para motor 2.0', 200.00),
('Velas de ignição', 'Jogo de velas para motores 1.6', 150.00),
('Pastilhas de freio', 'Conjunto de pastilhas dianteiras', 300.00),
('Radiador', 'Radiador completo para motor 1.8', 700.00),
('Lanterna traseira', 'Lanterna traseira lado direito', 250.00);


INSERT INTO Pagamento (valor_pgto, forma_pgto, dt_pagamento, idOS_Pgto)
VALUES
(150.00, 'Pix', '2024-01-06', 1),
(500.00, 'Cartão', '2024-01-16', 2),
(200.00, 'Dinheiro', '2024-01-21', 3),
(300.00, 'Cartão', '2024-01-26', 4),
(700.00, 'Pix', '2024-02-01', 5);
INSERT INTO Pagamento (valor_pgto, forma_pgto, dt_pagamento, idOS_Pgto)
VALUES
(800.00, 'Dinheiro', '2024-02-03', 6),
(150.00, 'Pix', '2024-02-11', 7),
(400.00, 'Cartão', '2024-02-13', 8),
(600.00, 'Dinheiro', '2024-02-21', 9),
(500.00, 'Pix', '2024-02-19', 10);


INSERT INTO Nota_Fiscal (numero_nota, valor_total, dt_emissao, idOS_NF)
VALUES
('NF001', 150.00, '2024-01-06', 1),
('NF002', 500.00, '2024-01-16', 2),
('NF003', 200.00, '2024-01-21', 3),
('NF004', 300.00, '2024-01-26', 4),
('NF005', 700.00, '2024-02-01', 5);
INSERT INTO Nota_Fiscal (numero_nota, valor_total, dt_emissao, idOS_NF)
VALUES
('NF006', 800.00, '2024-02-03', 6),
('NF007', 150.00, '2024-02-11', 7),
('NF008', 400.00, '2024-02-13', 8),
('NF009', 600.00, '2024-02-21', 9),
('NF010', 500.00, '2024-02-19', 10);


INSERT INTO analise_pedido (idOS_analise, idResponsavel_analise)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO analise_pedido (idOS_analise, idResponsavel_analise)
VALUES
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);


INSERT INTO pecas_em_os (idOS_pecas, idPecas_em_OS, quantidade_pecas)
VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1);
INSERT INTO pecas_em_os (idOS_pecas, idPecas_em_OS, quantidade_pecas)
VALUES
(6, 1, 2),
(7, 2, 4),
(8, 3, 1),
(9, 4, 2),
(10, 5, 1);


INSERT INTO Orcamento (valor_orcamento, produtoservico, Decricao_orcamento, status_orcamento, idOS_Orcamento, idCliente_Orcamento)
VALUES
(500.00, 'Revisão completa', 'Orçamento para revisão geral', 'Aprovado', 1, 1),
(700.00, 'Pintura', 'Orçamento para reparação e pintura', 'Aguardando', 2, 2),
(300.00, 'Troca de bateria', 'Orçamento para troca da bateria', 'Aprovado', 3, 3),
(1200.00, 'Pneus novos', 'Substituição dos pneus aro 17', 'Cancelado', 4, 4),
(800.00, 'Amortecedores', 'Troca de amortecedores traseiros', 'Aguardando', 5, 5);
INSERT INTO Orcamento (valor_orcamento, produtoservico, Decricao_orcamento, status_orcamento, idOS_Orcamento, idCliente_Orcamento)
VALUES
(800.00, 'Troca de amortecedores', 'Orçamento para substituição de amortecedores', 'Aprovado', 6, 6),
(150.00, 'Alinhamento', 'Orçamento para alinhamento do veículo', 'Aprovado', 7, 7),
(400.00, 'Troca de farol', 'Substituição do farol esquerdo', 'Aguardando', 8, 8),
(600.00, 'Revisão elétrica', 'Revisão completa do sistema elétrico', 'Aprovado', 9, 9),
(500.00, 'Reparo de pintura', 'Polimento e pintura do capô', 'Aguardando', 10, 10);

