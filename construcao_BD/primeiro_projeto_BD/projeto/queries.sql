-- queries

-- Quantos pedidos foram feitos por cada cliente?
SELECT 
    c.idCliente, 
   concat(c.Pnome, ' ', c.Sobrenome) as nome_completo,
    COUNT(p.idPedido) AS total_pedidos
FROM 
    cliente c
LEFT JOIN 
    pedido p ON c.idCliente = p.idPedidoCliente
GROUP BY 
    c.idCliente
ORDER BY 
    total_pedidos DESC;

-- Algum vendedor também é fornecedor?
select 
	v.idVendedor, v.NomeVendedor, v.CNPJVendedor,
    f.idFornecedor, f.RazaoSocial
from vendedor as v
inner join fornecedor as f on v.CNPJVendedor = f.CNPJ
ORDER BY 
    v.idVendedor;

-- Relação de produtos fornecedores e estoques;
SELECT 
    p.NomeProduto, 
    f.RazaoSocial AS Fornecedor,
    pf.QuantidadeProdForn AS QuantidadeNoFornecedor,
    e.LocalEstoque,
	e.QuantidadeEstoque
FROM 
    produto p
JOIN 
    produto_por_fornecedor pf ON p.idProduto = pf.idProdProduto
JOIN 
    fornecedor f ON pf.idProdFornecedor = f.idFornecedor
JOIN 
    produto_em_estoque pe ON p.idProduto = pe.idLocalProduto
JOIN 
    estoque e ON pe.idLocalEstoque = e.idEstoque;


-- Relação de produtos fornecedores e estoques;
select 
	f.RazaoSocial as Nome_Fornecedor,
    p.NomeProduto,
    pf.QuantidadeProdForn as Quantidade_no_Fornecedor
    from fornecedor f
    join 
    produto_por_fornecedor pf ON pf.idProdFornecedor = f.idFornecedor
    join
    produto p ON p.idProduto = pf.idProdProduto;

-- quantidade gasta por cada cliente nos pedidos realizados
select 
	concat(c.Pnome, ' ', c.Sobrenome) as nome_completo,
    sum(pg.Valor_total) as total_gasto    
    from cliente c
    join pedido p on p.idPedidoCliente = c.idCliente
    join pagamento pg on pg.idPedido_pgto = idPedido
    where p.StatusPedido = "Entregue"
    group by c.idCliente
    order by total_gasto desc
    ;

-- quais as categorias mais vendidas? 
select 
    prod.Categoria,
    count(prod.Categoria) as quantidade_categoria
	from produto prod
    join produto_por_pedido ppe on ppe.idPeProduct = prod.idProduto
    join pedido pe on ppe.idProPedido = pe.idPedido
	where pe.StatusPedido = 'Entregue'
    group by prod.Categoria
    order by quantidade_categoria desc
	;

-- quantas entregas foram feitas por cada transportadora? 
select 
	t.Razao_Social_Transportadora,
    count(t.Razao_Social_Transportadora) as quantidade
    from transportadora t
    join entrega e on e.id_Entrega_Trans = t.idTransportadora
    where StatusEntrega = 'Entregue'
    group by Razao_Social_Transportadora;
    
-- Qual vendedor tem o maior quantidade de produtos vendidas?
SELECT 
    v.NomeVendedor,
    v.NomeFantasiaVendedor,
    count(p.StatusPedido) as Quantidade
FROM 
    vendedor v
JOIN
	pedido p on p.idVendedorPedido = v.idVendedor
where
	p.StatusPedido = 'Entregue'
GROUP BY 
    v.NomeVendedor, 
    v.NomeFantasiaVendedor
ORDER BY
	quantidade desc;

-- Quais clientes têm pedidos associados e quais ainda não realizaram pedidos?
SELECT c.idCliente, concat(c.Pnome, ' ', Sobrenome) as nome_cliente
	FROM cliente c
	LEFT JOIN pedido p ON c.idCliente = p.idPedidoCliente
WHERE p.idPedidoCliente IS NULL;

-- Quais produtos ou categorias têm maior incidência de cancelamentos?
SELECT p.DescricaoPedido, COUNT(*) AS totalCancelamentos
	FROM pedido p
WHERE p.StatusPedido = 'Cancelado'
GROUP BY p.DescricaoPedido
ORDER BY totalCancelamentos DESC;

-- Qual é o tempo médio entre o pedido ser enviado e ser entregue?
SELECT round(AVG(DATEDIFF(dt_entrega, dt_envio)),2) AS tempoMedioEntrega
FROM entrega
WHERE StatusEntrega = 'Entregue';

-- Status de Entrega com mais de 3 pedidos associados
SELECT StatusEntrega, COUNT(*) AS total_entregas
FROM entrega
GROUP BY StatusEntrega
HAVING COUNT(*) > 3;



select * from vendedor;
select * from fornecedor;
select * from cliente;
select * from produto; 
select * from estoque;
select * from produto_por_fornecedor;
select * from produto_em_estoque;
select * from pedido;
select * from pagamento;
select * from produto_por_pedido;
select * from entrega;
select * from transportadora;
select * from produto_p_vendedor;

show tables;
use ecommerce2;
