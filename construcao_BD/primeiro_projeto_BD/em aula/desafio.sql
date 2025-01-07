-- criação de um banco de dados para cenário de E-COMMERCE

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table cliente(
		idCliente int auto_increment primary key,
        Pnome varchar (15),
        NomeMeioInicial char (3),
        Sobrenome varchar(20),
        CPF char(11) not null,
        constraint cpf_cliente unique (CPF),
        Logradouro varchar(45),
        Complemento varchar(45),
        Bairro varchar(45),
        Cidade varchar(30),
        Estado varchar(20),
        CEP char(08),
        Telefone char(11),
        Email varchar(45)
);

-- é preciso setar o auto increment, pois caso contrário o sgbd entenderá que estou criando a mesma variável
alter table cliente auto_increment=1;


-- criar tabela produto
-- se quiser alterar constraint será preciso dropar a tabela ao invés de fazer alter. 
-- avaliação equivale a nota de avaliação 
create table produto(
		idProduto int auto_increment primary key,
        NomeProduto varchar(10) not null,
		Categoria enum("eletrônico", "brinquedos", "livros", "bebida", "papelaria", "vestimenta", "móveis") not null,
        Classificacao_infantil bool default false,
		Descrição varchar(45),
        Avaliação float default 0, 
        DimensaoProduto varchar(10),
		Valor float not null
);

alter table produto auto_increment=1;
ALTER TABLE produto
MODIFY COLUMN NomeProduto VARCHAR(255);



-- criar tabela pagamento
create table pagamento(
		idCliente int,
        idPagamento int,
		FormaPagamento enum("boleto", "cartão", "dois cartões", "pix"),
        LimiteDisponível float,
        primary key (idCliente, idPagamento)
);

-- criar tabela pedido
-- deixando o pagamento em boleto como falso já que a maioria das vezes as pessoas pagam em cartão
create table pedido(
		idPedido int auto_increment primary key,
        idPedidoCliente int,
		StatusPedido enum("Em andamento", "Processando", "Enviado", "Entregue") default "Processando",
        DescricaoPedido varchar(255),
        Frete float default 10,
        PagamentoBoleto bool default false,
        constraint fk_pedido_cliente foreign key(idPedidoCliente) references cliente(idCliente)
			on update cascade
);

alter table pedido auto_increment=1;
ALTER TABLE pedido
MODIFY COLUMN StatusPedido enum("Confirmado", "Cancelado", "Enviado", "Entregue", "Em processamento") default "Em processamento";

-- desc pedido;

-- criar tabela estoque
create table estoque(
	idEstoque int auto_increment primary key,
    LocalEstoque varchar(255) not null,
    QuantidadeEstoque int default 0
);

alter table estoque auto_increment=1;

-- criar tabela fornecedor
create table fornecedor(
	idFornecedor int auto_increment primary key,
    RazaoSocial varchar(45) not null,
    CNPJ char (15) not null,
    Contato char(11) not null,
    constraint fornecedor_unico unique (CNPJ)
);

alter table fornecedor auto_increment=1;

-- desc fornecedor;

-- criar tabela vendedor
create table vendedor(
	idVendedor int auto_increment primary key,
    RazaoSocialVendedor varchar(255) not null,
    NomeFantasiaVendedor varchar(255),
    CNPJVendedor char(15),
    CPFVendedor char(11),
	LogradouroVendedor varchar(45) not null,
	ComplementoVendedor varchar(45) not null,
    BairroVendedor varchar(45) not null,
	CidadeVendedor varchar(30) not null,
	EstadoVendedor varchar(20) not null,
	CEPVendedor char(08) not null,
	TelefoneVendedor char(11) not null,
    constraint cnpj_unico_vendedor unique (CNPJVendedor),
    constraint cpf_unico_vendedor unique (CPFVendedor)
);

alter table vendedor auto_increment=1;


-- tabelas de relacionamentos M:N

-- tabela produto_por_vendedor
-- não tem autoincrement pq está herdando de outras tabelas
-- tenho chave primária composta
create table produtoVendedor(
	idPVendedor int,
    idPproduto int,
    ProdQuantidade int default 1,
    primary key (idPVendedor, idPproduto),
    constraint fk_produto_vendedor foreign key (idPVendedor) references vendedor(idVendedor),
    constraint fk_produto_produto foreign key (idPproduto) references produto(idProduto)
);

-- tabela relaçao produto/pedido
create table ProdutoPedido(
	idPeProduct int,
    idProPedido int,
    PPQuantidade int default 1,
    PPStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPeProduct, idProPedido),
    constraint fk_ProdutoPedido_produto foreign key (idPeProduct) references produto(idProduto),
    constraint fk_ProdutoPedido_pedido foreign key (idProPedido) references pedido(idPedido)
);

-- tabela relação produto em estoque
create table EstoqueLocal(
	idLocalProduto int,
    idLocalEstoque int,
    Localização varchar(255) not null,
    primary key (idLocalProduto, idLocalEstoque),
    constraint fk_EstoqueLocal_produto foreign key (idLocalProduto) references produto(idProduto),
    constraint fk_EstoqueLocal_estoque foreign key (idLocalEstoque) references estoque(idEstoque)
);

-- tabela fornecedor disponibiliza produto
create table produtoFornecedor(
	idProdFornecedor int,
    idProdProduto int,
    QuantidadeProdForn int not null,
    primary key (idProdFornecedor, idProdProduto),
    constraint fk_produtoFornecedor_fornecedor foreign key (idProdFornecedor) references fornecedor(idFornecedor),
    constraint fk_produtoFornecedor_produto foreign key (idProdProduto) references produto(idProduto)
);

show tables;


