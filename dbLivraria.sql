drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbGenero(
codGeneLivr int not null primary key,
descriGe varchar(100)
);

create table tbLivros(
codLivro int not null primary key,
tituLivro varchar(100) not null unique,
precoLi decimal (9,2) not null default 0 check (precoLi >= 0),
estoLivr int not null check(estoLivr >= 0),
codGeneLivr int not null,
foreign key (codGeneLivr)references tbGenero(codGeneLivr) 
);

create table tbAutor(
codAu int not null primary key,
nomeAu varchar(100) not null,
emailAu varchar(100) not null
);


create table tbClie(
codCli int not null primary key,
nomeCli varchar(100) not null,
telCli varchar (45) not null
);

create table tbItensDaVenda(
codVenda int not null primary key,
quantida int not null check (quantida>= 0),
subtotal varchar(45) ,
codLivro int not null,
foreign key (codLivro)references tbLivros(codLivro)
);


create table tbVendas(
data datetime not null,
total decimal (9,2) not null default 0 check (total >= 0),
codVenda int not null,
foreign key (codVenda)references tbItensDaVenda (codVenda),
codCli int not null,
foreign key (codCli)references tbClie (codCli)
);

create table tbEscritor(
codLivro int not null,
foreign key (codLivro)references tbLivros(codLivro),
codAu int not null,
foreign key (codAu)references tbAutor(codAu)
);


desc tbLivros;
desc tbGenero;
desc tbAutor;
desc tbItensDaVenda;
desc tbVendas
desc tbClie;



insert into tbGenero(codGeneLivr,descriGe)values(1,'romance');
insert into tbGenero(codGeneLivr,descriGe)values(2,'ficcao');
insert into tbGenero(codGeneLivr,descriGe)values(3,'romance');
insert into tbGenero(codGeneLivr,descriGe)values(4,'aventura');
insert into tbGenero(codGeneLivr,descriGe)values(5,'documentario');
insert into tbGenero(codGeneLivr,descriGe)values(6,'estudo');
insert into tbGenero(codGeneLivr,descriGe)values(7,'suspense');
insert into tbGenero(codGeneLivr,descriGe)values(8,'terror');
insert into tbGenero(codGeneLivr,descriGe)values(9,'terror');
insert into tbGenero(codGeneLivr,descriGe)values(10,'romance');


update tbGenero set descriGe = 'aventura'
where  codGeneLivr = 2;

update tbGenero set descriGe = 'ficcao1'
where  codGeneLivr = 1;

update tbGenero set descriGe = 'romance'
where  codGeneLivr = 4;

update tbGenero set descriGe = 'terror'
where  codGeneLivr = 5;

update tbGenero set descriGe = 'documentario'
where  codGeneLivr = 6;



delete from tbGenero where codGeneLivr = 5;

delete from tbGenero where codGeneLivr = 6;

delete from tbGenero where codGeneLivr = 7;

delete from tbGenero where codGeneLivr = 8;

delete from tbGenero where codGeneLivr = 9;

select * from tbGenero order by codGeneLivr,descriGe;


insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(1,'Jogador numero 1',100,5,2);
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(2,'harry potter',200,4,4);
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(3,'crepusculo',90,6,10);
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(4,'cemiterio maldito',400,2,10);
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(5,'cabeca fria e coraçao quente',10,100,2);
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(6,'racionais',500,1,2);	
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(7,'o poder do habito',150,3,4);	
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(8,'a biblia para minecraft',250,4,10);	
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(9,'o paciente',300,2,10);	
insert into tbLivros(codLivro,tituLivro,precoLi,estoLivr,codGeneLivr)values(10,'guerra civil',50,11,4);

update tbLivros set precoLi = precoLi * 1.15
where tituLivro =  'Jogador numero 1';

update tbLivros set precoLi = precoLi * 1.50
where tituLivro =  'cabeca fria e coraçao quente';

update tbLivros set precoLi = precoLi * 1.80
where tituLivro =  'o poder do habito';

update tbLivros set precoLi = precoLi * 0.50
where tituLivro =  'o paciente';

update tbLivros set precoLi = precoLi * 1.10
where tituLivro =  'guerra civil';

delete from tbLivros where tituLivro = 'racionais'; 

delete from tbLivros where tituLivro = 'crepusculo';

delete from tbLivros where tituLivro = 'harry potter';

delete from tbLivros where tituLivro = 'cemiterio maldito';

delete from tbLivros where tituLivro = 'o paciente';    

select * from tbLivros order by codLivro,tituLivro,precoLi,estoLivr,codGeneLivr; 



insert into tbAutor(codAu,nomeAu,emailAu)values(1,'Ernest Cline','ernestcline5@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(2,'J.K.Rowling','jkrowling@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(3,'Stephenie Meyer','stemeyer10@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(4,'Stephen King','king129@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(5,'abel ferreira','ferreiraabel@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(6,'mano brow','browmano@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(7,'Charles Duhigg','charles44@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(8,'Garrett Rominies ','garret555@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(9,'Jasper DeWitt','jasper190@gmail.com');
insert into tbAutor(codAu,nomeAu,emailAu)values(10,'Moore Stuart','stuartmoore@gmail.com');	

update tbAutor set codAu = 1
where nomeAu = 'Ernest Cline silva';

update tbAutor set codAu = 5
where nomeAu = 'ferreira abel';

update tbAutor set codAu = 10
where nomeAu = 'stuart moore';

update tbAutor set codAu = 9
where nomeAu = 'witt jasper';

update tbAutor set codAu = 6
where nomeAu = 'nego drama';



delete from tbAutor where nomeAu = 'J.K.Rowling';

delete from tbAutor where nomeAu = 'Stephen King';

delete from tbAutor where nomeAu = 'Charles Duhigg';

delete from tbAutor where nomeAu = 'Garrett Rominies';

delete from tbAutor where nomeAu = 'Stephenie Meyer';	

select * from tbAutor order by codAu,nomeAu,emailAu;



insert into tbClie(codCli,nomeCli,telCli)values(1,'Erik henrique','9431-3293');
insert into tbClie(codCli,nomeCli,telCli)values(2,'mateus','9567-8913');	
insert into tbClie(codCli,nomeCli,telCli)values(3,'luffy','9623-7893');
insert into tbClie(codCli,nomeCli,telCli)values(4,'son goku','9124-3293');
insert into tbClie(codCli,nomeCli,telCli)values(5,'naruto uzumaki','9986-5321');
insert into tbClie(codCli,nomeCli,telCli)values(6,'vegeta ','9431-8632');
insert into tbClie(codCli,nomeCli,telCli)values(7,' kakaroto','9346-6579');	
insert into tbClie(codCli,nomeCli,telCli)values(8,'jaime','9531-0897');
insert into tbClie(codCli,nomeCli,telCli)values(9,'edcarlos','9431-1275');
insert into tbClie(codCli,nomeCli,telCli)values(10,'gaara','9654-0894');


	
