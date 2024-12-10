### Construção e Refinamento de um Projeto Banco de Dados - ORDEM DE SERVIÇO (OFICINA)

#### De acordo com as instruções da aula foram criadas algumas entidades e outras foram criadas para o desafio e refinamento:
1. Cliente: Possui um ou mais veículo e por isso a cardinalidade 1:N com a entidade veículo. Também tem relação com autorização, pois precisa autorizar um ou mais serviços (1:N)
3. Autorização: Relacionado a cliente, serviço (cardinalidade 1:1) e forma de pagamento (1:1), pois autorizado o serviço e concluído deve haver pagamento.
4. Forma de pagamento: Tipo de pagamento, dados. RElação com autorização.
5. Veículo: 1 ou mais veículo é designado para uma equipe (1:N)
6. Equipe: Preenche uma ou mais ordem de serviço (1:N), avalia/executa um ou mais serviços (1:N)
7. Serviço: Relacionamento com autorização (1:1), Equipe e também tem relacionamento N;M com ordem de serviço onde traz o valor total após ordem de serviço executada.
8. Ordem de Serviço: Tem relação N:M com fornecedor, pois vários produtos são disponibilizados para vários fornecedores diferentes. Também tem relação de N:M com pedido, onde foi criada subclasse relação produto/pedido e aqui inserido status compra, uma vez que a entidade herdou id_produto e id_pedido.
9. Peça: Traz valor unitário e tem relação de N:M com ordem de serviço trazendo o valor total com quantidade de peças. 
10. Mecânico: Relação 1:N com equipe. Uma equipe pode ter vários mecânicos.