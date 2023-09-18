-- drop database dbMercadoSA;

create database dbMercadoSA;

use dbMercadoSA;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codFunc));

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(10),
primary key(codCli)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc));

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
dataEntrada date,
horaEntrada time,
quantidade decimal(9,2),
valorUnit decimal(9,2),
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn));

create table tbVendas(
codVenda int not null auto_increment,
codUsu int not null,
codCli int not null,
codProd int not null,
dataVenda date,
quantidade decimal(9,2),
valorTotal decimal(9,2),
primary key(codVenda),
foreign key(codUsu) references tbUsuarios(codUsu),
foreign key(codCli) references tbClientes(codCli),
foreign key(codProd) references tbProdutos(codProd));

desc tbFuncionarios;
desc tbClientes;
desc tbFornecedores;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserir registros nas tabelas

insert into tbFuncionarios(nome,email,cpf,salario,sexo)
	values('Pedro Antunes da Cunha','pedro.acunha@hotmail.com',
		'124.852.369-88',1500.00,'M');

insert into tbClientes(nome,email,telCel)
	values('Luciano Mendes','luciano.mendes@gmail.com',
		'99554-7895');
insert into tbClientes(nome,email,telCel)
	values('Augusto de Jesus','augusto.jesus@gmail.com',
		'98963-9587');

insert into tbFornecedores(nome,email,cnpj)
	values('Alimentos SA','sac@alimentos.com.br',
		'22.222.111.0001/15');
insert into tbFornecedores(nome,email,cnpj)
	values('Verduras LTDA','sac@colheitafeliz.com.br',
		'23.258.145.0001/25');

insert into tbUsuarios(nome,senha,codFunc)
	values('pedro.cunha','123456',1);

insert into tbProdutos(descricao,dataEntrada,horaEntrada,
	quantidade,valorUnit,codForn)
	values('Banana','2023/08/10','16:53:53',10,5.50,2);
insert into tbProdutos(descricao,dataEntrada,horaEntrada,
	quantidade,valorUnit,codForn)
	values('Morango','2023/08/09','09:03:55',100,5.35,2);
insert into tbProdutos(descricao,dataEntrada,horaEntrada,
	quantidade,valorUnit,codForn)
	values('Bicicleta','2023/08/07','15:00:53',80,855.50,1);

insert into tbVendas(codUsu,codCli,codProd,dataVenda,quantidade,valorTotal)
	values(1,1,2,'2023/08/10',10,50.00);
insert into tbVendas(codUsu,codCli,codProd,dataVenda,quantidade,valorTotal)
	values(1,2,1,'2023/08/10',20,30.00);
insert into tbVendas(codUsu,codCli,codProd,dataVenda,quantidade,valorTotal)
	values(1,2,1,'2023/08/10',10,30.00);
insert into tbVendas(codUsu,codCli,codProd,dataVenda,quantidade,valorTotal)
	values(1,2,1,'2023/08/15',10,30.00);

-- Pesquisando tabelas

select * from tbFuncionarios;
select * from tbClientes;
select * from tbFornecedores;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;

-- inner join


select usu.nome as 'Nome do usuário',
 func.nome as 'Nome do funcionário',
 func.email as 'E-mail do funcionário' 
 from tbUsuarios as usu 
inner join tbFuncionarios as func
on usu.codFunc = func.codFunc;


select forn.nome, forn.cnpj, prod.descricao 
from tbProdutos as prod 
inner join tbFornecedores as forn 
on prod.codForn = forn.codForn;

select cli.nome, cli.email, cli.telCel, 
vend.dataVenda, vend.valorTotal 
from tbVendas vend 
inner join tbClientes as cli on vend.codCli = cli.codCli;

select cli.nome,cli.email, 
prod.descricao, vend.dataVenda 
from tbVendas as vend
inner join tbClientes as cli 
on vend.codCli = cli.codCli
inner join tbProdutos as prod 
on vend.codProd = prod.codProd
where vend.codVenda = 1;

select cli.nome,cli.email, 
prod.descricao, vend.dataVenda 
from tbVendas as vend
inner join tbClientes as cli 
on vend.codCli = cli.codCli
inner join tbProdutos as prod 
on vend.codProd = prod.codProd
where prod.descricao like '%b%';

-- Perguntando para tabela de usuários
-- nome do usuário
-- nome do funcionário
-- data da venda
-- quantidade vendida
-- valor total da venda

-- Perguntando para tabela de clientes
-- nome do cliente
-- data da venda
-- nome do produto
-- nome do fornecedor

-- Perguntando para tabela de funcionarios
-- nome do funcionário
-- nome do usuário
-- data da venda
-- valor total
-- nome do produto
-- data da entrada
-- nome do fornecedor
-- cnpj do fornecedor



-- select forn.nome,Usu.nome,Venda.Venda,Venda.total,prod.descricao,prod.entrada,forn.nome,forn.cnpj
-- from tbFornecedores as forn 
-- inner join tbProdutos as prod
-- on forn.codForn = forn.codProd
-- inner join  tbVendas as data
-- on venda.codVenda = Venda.codProd
-- inner join tbUsuarios as Usu
-- on Usu.codUsu = Usu.codProd; 

select prod.descricao,prod.quantidade from tbFuncionarios as func left join tbProdutos as prod on func.codFunc = prod.codProd;

select prod.descricao,prod.quantidade from tbFuncionarios as func right join tbProdutos as prod on func.codFunc = prod.codProd;


select prod.descricao,prod.quantidade from tbFuncionarios as func inner join tbProdutos as prod on func.codFunc = prod.codProd;



