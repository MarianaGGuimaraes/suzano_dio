-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into cliente (Pnome, NomeMeioInicial, Sobrenome, CPF, Logradouro, Complemento , Bairro , Cidade, Estado , CEP, Telefone, Email) 
	   values('Maria','M','Silva', 12345678901, 'rua silva de prata', 29, 'Carangola','Cidade das flores',  'São Paulo', '01010101', '11987654321', 'maria.silva@example.com'),
		     ('Matheus','O','Pimentel', '98765432100', 'Avenida Brasil', 'Bloco C', 'Jardim Paulista', 'Rio de Janeiro', 'Rio de Janeiro', '20202020', '21987654321', 'matheus.pimentel@example.com'),
			 ('Ricardo','F','Silva', '11223344556', 'Rua dos Lírios', 'Casa 12', 'Vila Mariana', 'Belo Horizonte', 'Minas Gerais', '30303030', '31987654321', 'ricardo.santos@example.com'),
			 ('Julia','S','França', '55667788990', 'Rua da Paz', 'S/N', 'Tijuca', 'São Paulo', 'São Paulo', '04040404', '11965432100', 'julia.franca@example.com'),
			 ('Roberta','G','Assis', '66778899011', 'Avenida do Estado', 'Sala 5', 'Centro', 'Curitiba', 'Paraná', '50005000', '41987654321', 'roberta.assis@example.com'),
			 ('Isabela','M','Cruz', '88997766554', 'Rua do Sol', 'Casa 10', 'Boa Vista', 'Porto Alegre', 'Rio Grande do Sul', '70007000', '51987654321', 'isa.cruz@example.com');
             

-- idProduct, Pname, classification_kids boolean, category("eletrônico", "brinquedos", "livros", "bebida", "papelaria", "vestimenta", "móveis"), avaliação, size
insert into produto (NomeProduto, Categoria, Classificacao_infantil, Descrição, Avaliação, DimensaoProduto, Valor) values
							  ('Fone de ouvido','eletrônico', false, 'Fone de ouvido sem fio Bluetooth', '4',null,1200.00),
                              ('Barbie Elsa','brinquedos',true, 'Boneca barbie Elsa - Frozen', '3',null, 40.00),
                              ('Body Carters','vestimenta',true, 'Conjunto body Carters - 6m a 12m', '5',null, 120.00),
                              ('Microfone Vedo - Youtuber','eletrônico',False,'Microfone de última geração', '4',null, 800.00),
                              ('Sofá retrátil','móveis',False,'Sofá retrátil de 3 lugares em couro', '3','3x57x80', 1200.00),
                              ('Enciclopédia','livros', False,'Enciclopédia de ciência e história', '2','25x20x5', 180.00),
                              ('Fire Stick Amazon','eletrônico',False,'Fire Stick Amazon','3',null, 150.00);
                              

select * from cliente;
select * from produto;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

-- delete from orders where idOrderClient in  (1,2,3,4);

insert into pedido (idPedidoCliente, StatusPedido, DescricaoPedido, Frete, PagamentoBoleto) values 
							 (1, default,'compra via aplicativo',null,1),
                             (2,default,'compra via aplicativo',50,0),
                             (3,'Confirmado',null,null,1),
                             (4,default,'compra via web site',150,0);

-- adicionando mais um pedido                             
insert into pedido (idPedidoCliente, StatusPedido, DescricaoPedido, Frete, PagamentoBoleto) values 
							 (2, default,'compra via aplicativo',null,1);

select * from ProdutoPedido;

insert into ProdutoPedido (idPeProduct, idProPedido, PPQuantidade, PPStatus) values
						 (1,3,2,default),
                         (2,2,1,null),
                         (3,1,1,null);

-- storageLocation,quantity

insert into estoque (LocalEstoque,QuantidadeEstoque) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
insert into EstoqueLocal (idLocalProduto, idLocalEstoque, Localização) values
						 (1,2,'RJ'),
                         (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into fornecedor (RazaoSocial, CNPJ, Contato) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
                            
-- select * from fornecedor;

-- idPsSupplier, idPsProduct, quantity
insert into produtoFornecedor (idProdFornecedor, idProdProduto, QuantidadeProdForn) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);


-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into vendedor (RazaoSocialVendedor, NomeFantasiaVendedor, CNPJVendedor, CPFVendedor, LogradouroVendedor, ComplementoVendedor, BairroVendedor, CidadeVendedor, EstadoVendedor, CEPVendedor, TelefoneVendedor) values 
						('Tech eletronics', null, 123456789456321, null, 'Rua das Flores', 'Apt 101', 'Centro', 'São Paulo', 'SP', '01023010', '11987654321'),
					    ('Botique Durgas',null,null,123456783,'Avenida Brasil', 'Bloco B', 'Jardim Paulista', 'Rio de Janeiro', 'RJ', '22031030', '21976543210'),
						('Kids World',null,456789123654485,null,'Rua do Sol', 'Casa 5', 'Vila Mariana', 'Belo Horizonte', 'MG', '30123040', '31323456789');

-- select * from vendedor;

-- idPseller, idPproduct, prodQuantity
insert into produtoVendedor (idPVendedor, idPproduto, ProdQuantidade) values 
						 (1,6,80),
                         (2,7,10);


-- select * from productSeller;

-- queries para os dados


select count(*) from cliente;
select * from cliente c, pedido p where c.idCliente = idPedidoCliente;

-- com especificação dos atributos recuperados
select Pnome, Sobrenome, idPedido, StatusPedido from cliente c, pedido p where c.idCliente = idPedidoCliente;

select concat(Pnome,' ', Sobrenome) as Cliente, idPedido as N°_Pedido, StatusPedido as Status from cliente c, pedido p where c.idCliente = idPedidoCliente;


-- contar quantas vezes os clientes aparecem sem repetir.                              
select count(*) from cliente c, pedido p
			where c.idCliente = idPedidoCliente;

-- select * from pedido;

-- recuperação de pedido com produto associado
select * from cliente c 
				inner join pedido p ON c.idCliente = p.idPedidoCliente
                inner join ProdutoPedido ppe on ppe.idProPedido = p.idPedido;
 
 -- Recuperar quantos pedidos foram realizados pelos clientes
select c.idCliente, concat(Pnome, ' ', Sobrenome) as Nome_Completo, count(*) as número_pedidos from cliente c 
				inner join pedido p ON c.idCliente = p.idPedidoCliente
                group by idCliente;


-- select * from ProdutoPedido;
