## DESAFIO
- O desafio consiste em criar um dashboard corporativo com integração com MySQL e AZURE. 
- Aqui é possível encontrar as etapas, diretrizes, bem como as repostas (e comentários) para o que foi solicitado. 
- Fora deste readme encontra-se os arquivos .sql script_azure que contém o script utilizado no desafio, o insert_data com os dados utilizados e queries com as queries realizadas.

#### ETAPAS:

1. Configurar setup de banco de dados na Azure 
 - Na Azure buscar por mysql e clicar em criar. 
2. Popular o servidor por meio de script fornecido ('azure_company')
3. Integrar o MySQL com Power BI
4. Realizar as transformações


#### ODiretrizes para transformação dos dados

1. Verifique os cabeçalhos e tipos de dados 

- os dados subiram com os cabeçalhos como haviam sido inseridos no mysql. Foram alterados alguns tipos de dados para inteiro (como ssn e semelhantes) e salário para decimal fixo.

2. Modifique os valores monetários para o tipo double preciso

- foi necessário modificar o valor de salário para decimal fixo. 

3. Verifique a existência dos nulos e analise a remoção

- foi removido o valor 'null' em gerente_cpf na tabela 'employee'

4. Os employees com nulos em Super_ssn podem ser os gerentes. Verifique se há algum colaborador sem gerente

- James não possui gerente
`select Fname` 
    `from employee` 
    `where super_ssn is null;`

5. Verifique se há algum departamento sem gerente

- não há departamentos sem gerentes 
 `select Dnumber, Mgr_ssn from department d` 
    `left join employee e on d.mgr_ssn = e.ssn`
    `where d.mgr_ssn is null;`

6. Se houver departamento sem gerente, suponha que você possui os dados e preencha as lacunas

- não há departamento sem gerente

7. Verifique o número de horas dos projetos

`select  pname, pno, sum(hours) from works_on w`
`join project p on  p.pnumber = w.pno`
`where hours >= 0`
`group by pname;`

8. Separar colunas complexas

- a coluna de endereço em employee foi separada por número, cidade, rua, estado

9. Mesclar consultas employee e departament para criar uma tabela employee com o nome dos departamentos associados aos colaboradores. A mescla terá como base a tabela employee. Fique atento, essa informação influencia no tipo de junção

- foram mescladas de acordo com o número de departamento. 

10. Neste processo elimine as colunas desnecessárias.

- foram apagadas as colunas numero departamento 

11. Realize a junção dos colaboradores e respectivos nomes dos gerentes . Isso pode ser feito com consulta SQL ou pela mescla de tabelas com Power BI. Caso utilize SQL, especifique no README a query utilizada no processo.

`select concat(Fname, ' ' , Minit, ' ', Lname) as colaborador, ssn, super_ssn as gerente,`
	`case` 
		`when super_ssn = '333445555' then 'Franklin T Wong'`
        `when super_ssn = '888665555' then 'James E Borg'`
        `when super_ssn = '987654321' then 'Jennifer S Wallace'`
        `else super_ssn`
	`end as nome_gerente`
`from employee;`

12. Mescle as colunas de Nome e Sobrenome para ter apenas uma coluna definindo os nomes dos colaboradores

`select concat(Fname, ' ', Minit, ' ', Lname) as Colaborador`
	`from employee;`

13. Mescle os nomes de departamentos e localização. Isso fará que cada combinação departamento-local seja único. Isso irá auxiliar na criação do modelo estrela em um módulo futuro.

`select d.dnumber as num_dpto, d.Dname as nome_dpto, l.dlocation as local_dpto
	from department d`
    `join dept_locations l on l.dnumber = d.dnumber`
    `where l.dnumber = d.dnumber;`

14. Explique por que, neste caso supracitado, podemos apenas utilizar o mesclar e não o atribuir.

- Uso mesclar quando preciso combinar dados de diferentes fontes ou colunas para criar uma visão consolidada. Neste caso utilizei duas tabelas 'department' e 'dept_locations' mesclando elas pelo numero do dpto.

15. Agrupe os dados a fim de saber quantos colaboradores existem por gerente

`select  count(super_ssn)`
	`from employee`
	`group by super_ssn;`

16. Elimine as colunas desnecessárias, que não serão usadas no relatório, de cada tabela