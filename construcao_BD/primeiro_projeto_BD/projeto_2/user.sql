show databases;
use azure_company;
show tables;

desc dependent;

-- CRIANDO USUÁRIO PARA USAR NO POWERBI AO UTILIZAR O BANCO DE DADOS LÁ. NÃO SE USA ROOT NESSES CASOS. 
create user 'powerbiuser'@'localhost' identified by '123456';
grant all privileges on azure_company.* to  'powerbiuser'@'localhost';
flush privileges;
