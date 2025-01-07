-- criação tabelas

CREATE DATABASE IF NOT EXISTS ordem_servico;
USE ordem_servico ;

-- -----------------------------------------------------
-- Tabela Equipe
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Equipe (
  idEquipe INT NOT NULL AUTO_INCREMENT,
  Nequip VARCHAR(100) NOT NULL,
  Decricao VARCHAR(100) NOT NULL,
  PRIMARY KEY (idEquipe))
;

-- -----------------------------------------------------
-- Tabela Responsavel
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Responsavel (
	idMecanico_Responsavel INT NOT NULL AUTO_INCREMENT,
	Pnome VARCHAR(45) NOT NULL,
	Nmeio VARCHAR(45) NOT NULL,
	Sobrenome VARCHAR(45) NOT NULL,
	Celular CHAR(11) NOT NULL,
	CPF CHAR(11) unique NOT NULL,
	Logradouro_Mecanico VARCHAR(100) NOT NULL,
	Complemento_Mecanico VARCHAR(45) NOT NULL,
	Cidade_Mecanico VARCHAR(45) NOT NULL,
	Bairro_Mecanico VARCHAR(45) NOT NULL,
	UF_Mec CHAR(2) NOT NULL,
	Funcao VARCHAR(45) NOT NULL,
	idEquipe_Responsavel INT NOT NULL,
	PRIMARY KEY (idMecanico_Responsavel, idEquipe_Responsavel),
	CONSTRAINT fk_Mecanico_Responsavel_Equipe
			FOREIGN KEY (idEquipe_Responsavel) REFERENCES Equipe (idEquipe)
    ON UPDATE cascade)
; 

-- -----------------------------------------------------
-- Tabela Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente (
	idCliente INT NOT NULL AUTO_INCREMENT,
	Pnome_Cliente VARCHAR(45) NOT NULL,
	Nmeio_Cliente VARCHAR(45) NOT NULL,
	Sobrenome_Cliente VARCHAR(45) NOT NULL,
	Celular_Cliente CHAR(11) NOT NULL,
	CPF_Cliente CHAR(11) unique NOT NULL,
	Logradouro VARCHAR(45) NOT NULL,
	Complemento VARCHAR(45) NOT NULL,
	Bairro VARCHAR(45) NOT NULL,
	Cidade VARCHAR(45) NOT NULL,
	UF CHAR(2) NOT NULL,
	CEP CHAR(8) NOT NULL,
	email VARCHAR(45) ,
  PRIMARY KEY (idCliente));


-- -----------------------------------------------------
-- Tabela Veículo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Veiculo (
  idVeiculo INT NOT NULL AUTO_INCREMENT,
  Marca VARCHAR(45) NOT NULL,
  Modelo VARCHAR(45) NOT NULL,
  Ano VARCHAR(45) NOT NULL,
  Placa CHAR(7) NOT NULL,
  chassi CHAR(17) NOT NULL,
  Cor VARCHAR(45) NOT NULL,
  OBS VARCHAR(200),
  idCliente_Veiculo INT NOT NULL,
  idEquipe_Veiculo INT NOT NULL,
  PRIMARY KEY (idVeiculo, idCliente_Veiculo, idEquipe_Veiculo),
  CONSTRAINT fk_Veiculo_Cliente
		FOREIGN KEY (idCliente_Veiculo) REFERENCES Cliente (idCliente) ON UPDATE CASCADE,
  CONSTRAINT fk_VeIculo_Equipe
		FOREIGN KEY (idEquipe_Veiculo) REFERENCES Equipe (IdEquipe) ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Tabela Ordem_Serviço
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ordem_Servico (
  idOrdem_Servico INT NOT NULL AUTO_INCREMENT,
  dt_abertura DATE NOT NULL,
  dt_conclusao DATE NOT NULL,
  status_servico ENUM("Aberto", "Concluído", "Em andamento", "Cancelado", "Aguardando Peças") NOT NULL DEFAULT "Aberto",
  idCliente_OS INT NOT NULL,
  idVeiculo_OS INT NOT NULL,
  idEquipe_OS INT NOT NULL,
  PRIMARY KEY (idOrdem_Servico, idCliente_OS, idVeiculo_OS, idEquipe_OS),
  CONSTRAINT fk_Ordem_Serviço_Cliente
    FOREIGN KEY (idCliente_OS) REFERENCES Cliente (idCliente) ON UPDATE CASCADE,
  CONSTRAINT fk_Ordem_Servico_Veiculo
    FOREIGN KEY (idVeiculo_OS) REFERENCES Veiculo (idVeiculo) ON UPDATE CASCADE,
  CONSTRAINT fk_Ordem_Serviço_Equipe
    FOREIGN KEY (idEquipe_OS) REFERENCES Equipe (idEquipe) ON UPDATE CASCADE);
    

-- -----------------------------------------------------
-- Tabela Servico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Servico (
  idServico INT NOT NULL AUTO_INCREMENT,
  Tipo_Servico VARCHAR(100) NOT NULL,
  Descricao_servico VARCHAR(255) NOT NULL,
  Valor_Servico FLOAT NOT NULL,
  idOS_Servico INT NOT NULL,
  PRIMARY KEY (idServico, idOS_Servico),
  CONSTRAINT fk_Serviço_Ordem_Serviço
    FOREIGN KEY (idOS_Servico) REFERENCES Ordem_Servico (idOrdem_Servico) ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Tabela Pecas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  Pecas(
  idPecas INT NOT NULL AUTO_INCREMENT,
  nome_peca VARCHAR(255) NOT NULL,
  descricao_peca VARCHAR(255) NOT NULL,
  valor_peca FLOAT NOT NULL,
  PRIMARY KEY (idPecas));


-- -----------------------------------------------------
-- Tabela Pagamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pagamento (
  idPagamento INT NOT NULL AUTO_INCREMENT,
  valor_pgto FLOAT NOT NULL,
  forma_pgto ENUM("Cartão", "Pix", "Dinheiro") NOT NULL DEFAULT "Cartão",
  dt_pagamento DATE NOT NULL,
  idOS_Pgto INT NOT NULL,
  PRIMARY KEY (idPagamento, idOS_Pgto),
  CONSTRAINT fk_Pagamento_Ordem_Serviço
    FOREIGN KEY (idOS_Pgto) REFERENCES Ordem_Servico (idOrdem_Servico) ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela Nota_Fiscal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Nota_Fiscal (
  idNota_Fiscal INT NOT NULL AUTO_INCREMENT,
  numero_nota VARCHAR(45) NOT NULL,
  valor_total FLOAT NOT NULL,
  dt_emissao DATE NOT NULL,
  idOS_NF INT NOT NULL,
  PRIMARY KEY (idNota_Fiscal, idOS_NF),
  CONSTRAINT fk_Nota_Fiscal_Ordem_Serviço
    FOREIGN KEY (idOS_NF) REFERENCES Ordem_Servico (idOrdem_Servico) ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Tabela analise_pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS analise_pedido (
  idOS_analise INT NOT NULL,
  idResponsavel_analise INT NOT NULL,
  PRIMARY KEY (idOS_analise, idResponsavel_analise),
  CONSTRAINT fk_analisepedido_Ordem_Servico
    FOREIGN KEY (idOS_analise) REFERENCES Ordem_Servico (idOrdem_Servico) ON UPDATE CASCADE,
  CONSTRAINT fk_analisepedido_responsavel
    FOREIGN KEY (idResponsavel_analise) REFERENCES Responsavel (idMecanico_Responsavel) ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Tabela pecas_em_os
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pecas_em_os (
  idOS_pecas INT NOT NULL,
  idPecas_em_OS INT NOT NULL,
  quantidade_pecas int not null,
  PRIMARY KEY (idOS_pecas, idPecas_em_OS),
  CONSTRAINT fk_pecas_em_os_Ordem_Servico
    FOREIGN KEY (idOS_pecas) REFERENCES Ordem_Servico (idOrdem_Servico) ON UPDATE CASCADE,
  CONSTRAINT fk_pecas_em_os_pecas
    FOREIGN KEY (idPecas_em_OS) REFERENCES Pecas (idPecas) ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Tabela Orcamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Orcamento (
  idOrçamento INT NOT NULL AUTO_INCREMENT,
  valor_orcamento FLOAT NOT NULL,
  produtoservico VARCHAR(100) NOT NULL,
  Decricao_orcamento VARCHAR(255) NOT NULL COMMENT 'descrição detalhada do orçcamento',
  status_orcamento ENUM("Aprovado", "Aguardando", "Cancelado") NOT NULL DEFAULT "Aguardando",
  idOS_Orcamento INT NOT NULL,
  idCliente_Orcamento INT NOT NULL,
  PRIMARY KEY (idOrçamento, idOS_Orcamento, idCliente_Orcamento),
  CONSTRAINT fk_Orcamento_Ordem_Serviço
    FOREIGN KEY (idOS_Orcamento , idCliente_Orcamento) REFERENCES Ordem_Servico (idOrdem_Servico , idCliente_OS) ON UPDATE CASCADE);
