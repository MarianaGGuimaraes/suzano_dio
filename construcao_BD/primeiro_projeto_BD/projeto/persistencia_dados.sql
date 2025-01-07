-- criação de um banco de dados para cenário de E-COMMERCE

create database ecommerce2;
use ecommerce2;

-- criar tabela cliente
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Pnome VARCHAR(15) NOT NULL,
    NomeMeioInicial CHAR(3),
    Sobrenome VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    CONSTRAINT cpf_cliente UNIQUE (CPF),
    Logradouro VARCHAR(45) NOT NULL,
    Complemento VARCHAR(45) NOT NULL,
    Bairro VARCHAR(45) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    CEP CHAR(08) NOT NULL,
    Telefone CHAR(11) NOT NULL,
    Email VARCHAR(45) NOT NULL
)  AUTO_INCREMENT=1;


-- criar tabela produto
-- se quiser alterar constraint será preciso dropar a tabela ao invés de fazer alter. 
-- avaliação equivale a nota de avaliação 
create table produto(
		idProduto int auto_increment primary key,
        NomeProduto varchar(255) not null,
		Categoria enum("eletrônico", "brinquedos", "livros", "bebida", "papelaria", "vestiário", "móveis") not null,
        Classificacao_infantil bool default false,
		Descrição varchar(100) not null,
        Avaliação float default 0, 
        DimensaoProduto varchar(10),
		Valor float check (Valor >= 0)not null
) auto_increment=1;

alter table produto modify Categoria enum("eletrônico", "brinquedos", "livros", "bebida", "papelaria", "vestiário", "móveis", "eletrodoméstico", "cama e banho", "esporte e lazer") not null;

-- criar tabela pedido
-- deixando o pagamento em boleto como falso já que a maioria das vezes as pessoas pagam em cartão
create table pedido(
		idPedido int auto_increment primary key,
        idPedidoCliente int,
        idVendedorPedido int,
		StatusPedido enum("Confirmado", "Cancelado", "Enviado", "Entregue", "Em processamento") default "Em processamento",
        DescricaoPedido varchar(255),
        Frete float default 10,
        PagamentoBoleto bool default false,
        constraint fk_pedido_cliente foreign key(idPedidoCliente) references cliente(idCliente)
			on update cascade,
		constraint fk_vendedor_pedido foreign key (idVendedorPedido) references vendedor (idVendedor)
)auto_increment=1;




-- criar tabela estoque
create table estoque(
	idEstoque int auto_increment primary key,
    LocalEstoque varchar(255) not null,
    QuantidadeEstoque int default 0
)auto_increment=1;


-- criar tabela fornecedor
create table fornecedor(
	idFornecedor int auto_increment primary key,
    RazaoSocial varchar(100) not null,
    CNPJ char (15) not null,
	CONSTRAINT cnpj_fornecedor UNIQUE (CNPJ),
	Logradouro_forn VARCHAR(100) NOT NULL,
	Complemento_forn VARCHAR(45) NOT NULL,
	Bairro_forn VARCHAR(45) NOT NULL,
	Cidade_forn VARCHAR(30) NOT NULL,
	Estado_forn VARCHAR(20) NOT NULL,
	CEP_forn CHAR(8) NOT NULL,
	Telefone_forn VARCHAR(11) NOT NULL,
	Email_forn VARCHAR(45) 
)auto_increment=1;


-- criar tabela vendedor
CREATE TABLE vendedor (
    idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    NomeVendedor VARCHAR(50),
    RazaoSocialVendedor VARCHAR(255),
    NomeFantasiaVendedor VARCHAR(255),
    CNPJVendedor CHAR(15),
    CPFVendedor CHAR(11),
    LogradouroVendedor VARCHAR(45) NOT NULL,
    ComplementoVendedor VARCHAR(45) NOT NULL,
    BairroVendedor VARCHAR(45) NOT NULL,
    CidadeVendedor VARCHAR(30) NOT NULL,
    EstadoVendedor VARCHAR(20) NOT NULL,
    CEPVendedor CHAR(08) NOT NULL,
    TelefoneVendedor CHAR(11) NOT NULL,
    CONSTRAINT cnpj_unico_vendedor UNIQUE (CNPJVendedor),
    CONSTRAINT cpf_unico_vendedor UNIQUE (CPFVendedor),
     CONSTRAINT check_cnpj_or_cpf
        CHECK (
            (CNPJVendedor IS NOT NULL AND CPFVendedor IS NULL) 
            OR
            (CPFVendedor IS NOT NULL AND CNPJVendedor IS NULL)
        )
) AUTO_INCREMENT = 1;



-- criar tabela forma_pagamento
CREATE TABLE  Forma_Pagamento (
  idForma_Pagamento INT NOT NULL,
  FormaPagamento ENUM("boleto", "cartão", "dois cartões", "pix") NOT NULL,
  idPedido_forma_pgto INT NOT NULL,
  Detalhes VARCHAR(100) NOT NULL,
  primary key (idForma_Pagamento, idPedido_forma_pgto),
  constraint fk_pedido_forma_pagamento foreign key (idPedido_forma_pgto) references pedido(idPedido)
  )auto_increment = 1;
  drop table Forma_Pagamento;
  
  -- criar tabela transportadora
  create table transportadora(  
	idTransportadora INT NOT NULL ,
	Razao_Social_Transportadora VARCHAR(200) NOT NULL,
	CNPJ_Transp CHAR(14) NOT NULL,
	Logradouro_Transp VARCHAR(45) NOT NULL,
	Complemento_Transp VARCHAR(45) NOT NULL,
	Bairro_Transp VARCHAR(45) NOT NULL,
	Cidade_Transp VARCHAR(45) NOT NULL,
	Estado_Transp VARCHAR(20) NOT NULL,
	CEP_transp CHAR(8) NOT NULL,
	Email_transp VARCHAR(45) NULL,
	Telefone_transp CHAR(11) NOT NULL,
	PRIMARY KEY (idTransportadora))AUTO_INCREMENT =1;
    
alter table transportadora modify column CNPJ_Transp char(18) not null;
  
  -- criar tabela entrega
  CREATE TABLE entrega (
	idEntrega INT NOT NULL ,
	idPedido_Entrega INT NOT NULL,
	StatusEntrega ENUM("Entregue", "Em Trânsito", "Cancelado", "Pendente") NOT NULL DEFAULT "Pendente",
	código_rastreio VARCHAR(50) NOT NULL,
	dt_envio DATE NULL,
	dt_entrega DATE NOT NULL,
	id_Entrega_Trans INT NOT NULL,
	PRIMARY KEY (idEntrega, idPedido_Entrega, id_Entrega_Trans) ,
    constraint fk_entrega_pedido foreign key (idPedido_Entrega) references pedido(idPedido),
    constraint fk_entrega_transportadora foreign key (id_Entrega_Trans) references transportadora (idTransportadora)) 
    AUTO_INCREMENT =1
  ;
drop table entrega;
  
  -- criar tabela pagamento
  CREATE TABLE pagamento (
	idPagamento INT NOT NULL ,
	idPedido_pgto INT NOT NULL,
	Valor_total FLOAT NOT NULL COMMENT 'produto + frete',
	Status_pgto ENUM("Pendente", "Pago", "Cancelado") NOT NULL DEFAULT "Pendente",
	Dt_pgto DATE NOT NULL,
	PRIMARY KEY (idPagamento, idPedido_pgto),
	constraint fk_pagamento_pedido foreign key (idPedido_pgto) references pedido(idPedido)
) AUTO_INCREMENT =1;
  drop table pagamento;
  
-- tabelas de relacionamentos M:N

-- tabela produto_por_vendedor
-- não tem autoincrement pq está herdando de outras tabelas
-- tenho chave primária composta
create table produto_p_Vendedor(
	idPVendedor int,
    idPproduto int,
    ProdQuantidade int default 1,
    primary key (idPVendedor, idPproduto),
    constraint fk_produto_vendedor foreign key (idPVendedor) references vendedor(idVendedor),
    constraint fk_produto_produto foreign key (idPproduto) references produto(idProduto)
);

-- tabela relaçao produto/pedido
create table produto_por_pedido(
	idPeProduct int,
    idProPedido int,
    PPQuantidade int default 1,
    PPStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPeProduct, idProPedido),
    constraint fk_ProdutoPedido_produto foreign key (idPeProduct) references produto(idProduto),
    constraint fk_ProdutoPedido_pedido foreign key (idProPedido) references pedido(idPedido)
);
drop table produto_por_pedido;
-- tabela relação produto em estoque
create table produto_em_estoque(
	idLocalProduto int,
    idLocalEstoque int,
    Localização varchar(255) not null,
    primary key (idLocalProduto, idLocalEstoque),
    constraint fk_EstoqueLocal_produto foreign key (idLocalProduto) references produto(idProduto),
    constraint fk_EstoqueLocal_estoque foreign key (idLocalEstoque) references estoque(idEstoque)
);

-- tabela fornecedor disponibiliza produto
create table produto_por_fornecedor(
	idProdFornecedor int,
    idProdProduto int,
    QuantidadeProdForn int not null,
    primary key (idProdFornecedor, idProdProduto),
    constraint fk_produtoFornecedor_fornecedor foreign key (idProdFornecedor) references fornecedor(idFornecedor),
    constraint fk_produtoFornecedor_produto foreign key (idProdProduto) references produto(idProduto)
);


show tables;


