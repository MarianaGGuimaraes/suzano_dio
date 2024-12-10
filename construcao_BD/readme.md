### Construção e Refinamento de um Projeto Conceitual de Banco de Dados - E-COMMERCE

#### O projeto tem como tema 'venda de produtos'. De acordo com as instruções da aula foram criadas algumas entidades e outras foram criadas para o desafio e refinamento:
1. Cliente: levou como atributo cpf/cnpj como unique para não ser repetido e nem colocar 2 informações para o mesmo campo. Cliente tem relação 1:N com pedido já que um único cliente pode fazer vários pedidos distintos.
3. Fornecedor
4. Estoque
5. Terceiro/Vendedor
6. Pedido
7. Forma de pagamento: Criada nova entidade. Posso ter várias formas de pagamento para um único pedido.Relação de n:1 com pedido.
8. Produto: Tem relação N:M com fornecedor, pois vários produtos são disponibilizados para vários fornecedores diferentes. Também tem relação de N:M com pedido, onde foi criada subclasse relação produto/pedido e aqui inserido status compra, uma vez que a entidade herdou id_produto e id_pedido.