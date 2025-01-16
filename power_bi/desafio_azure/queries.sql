select * from employee;

-- 4. Os employees com nulos em Super_ssn podem ser os gerentes. Verifique se há algum colaborador sem gerente
select Fname from employee where super_ssn is null;

-- 5. Verifique se há algum departamento sem gerente
select * from department;
select * from employee;

select Dnumber, Mgr_ssn from department d 
left join employee e on d.mgr_ssn = e.ssn
where d.mgr_ssn is null;

-- 7. Verifique o número de horas dos projetos
select * from project;
select * from works_on;

select  pname, pno, sum(hours) from works_on w
join project p on  p.pnumber = w.pno
where hours >= 0
group by pname;

-- 11. Realize a junção dos colaboradores e respectivos nomes dos gerentes.
select concat(Fname, ' ' , Minit, ' ', Lname) as colaborador, ssn, super_ssn as gerente,
	case 
		when super_ssn = '333445555' then 'Franklin T Wong'
        when super_ssn = '888665555' then 'James E Borg'
        when super_ssn = '987654321' then 'Jennifer S Wallace'
        else super_ssn
	end as nome_gerente
from employee;

-- 12. Mescle as colunas de Nome e Sobrenome para ter apenas uma coluna definindo os nomes dos colaboradores
select concat(Fname, ' ', Minit, ' ', Lname) as Colaborador
	from employee;
    
-- 13. Mescle os nomes de departamentos e localização. Isso fará que cada combinação departamento-local seja único. Isso irá auxiliar na criação do modelo estrela em um módulo futuro.

select d.dnumber as num_dpto, d.Dname as nome_dpto, l.dlocation as local_dpto
	from department d
    join dept_locations l on l.dnumber = d.dnumber
    where l.dnumber = d.dnumber;
    
--    15. Agrupe os dados a fim de saber quantos colaboradores existem por gerente
select * from employee;
select  count(super_ssn)
	from employee
	group by super_ssn;