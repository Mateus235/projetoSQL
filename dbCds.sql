drop database dbCds;

create database dbCds;

use dbCds;

create table tbArtistas(
codArt int not null primary key	,
nomeArt varchar(100) not null unique
);

create table tbGrava(
codGrav int not null primary key, 
nomeGrav varchar(50) not null unique
);

create table tbCatego(
codCate int not null primary key,
nomeCate varchar(50) not null unique
);

create table tbEstad (
codEsta char(2) not null primary key,
nomeEsta varchar(50) not null unique
);

create table tbCida (
codCid int not null primary key,
nomeCid varchar(50) not null,
codEsta char(2) not null,
foreign key (codEsta) references tbEstad (codEsta) 
);

create table tbCli (
 codCli int not null primary key,
 nomeCli varchar(50) not null,
 endCli varchar(100) not null,
 rendaCli decimal(9,2) not null default 0 check (rendaCli >= 0),
 sexoCli char (1) not null default 'F' check (sexoCli in('F','M')),
 codCid int not null,
 foreign key (codCid) references tbCida (codCid)
 );

 create table tbConju (
 codConj int not null primary key,
 nomeConj varchar(50) not null,
 rendaConj decimal(9,2) not null default 0 check (rendaConj >= 0),
 sexoConj char (1) not null default 'F' check (sexoConj in ('F','M')),
 codCli int not null, 
 foreign key (codCli) references tbCli(codCli)
 );

 create table tbFuncio (
 codFunc int not null primary key,
 nomeFunc varchar(50) not null,
 endFunc varchar(100) not null,
 salaFunc decimal(9,2) not null default 0 check (salafunc>=0),
 sexoFunc char(1) not null default 0 check (sexofunc in ('F','M'))
 );

 create table tbDepend (
 codDep int not null primary key,
 nomeDep varchar(100) not null,
 sexoDep char(1) not null default 0 check (sexoDep in ('F','M')),
 codFunc int not null,
 foreign key (codFunc) references tbFuncio (codFunc)
 );

create table tbTitu (
codTi int not null primary key,
codCate int not null,
codGrav int not null,
foreign key (codCate)references tbCatego(codCate),
foreign key (codGrav)references tbGrava(codGrav),
nomeCD varchar(50) not null unique,
valCD decimal (9,2) not null check(valCD>=0),
qtdEstoq int not null check (qtdEstoq>=0)
 );

create table tbPedi (
numPed int not null primary key,
codCli int not null,
codFunc int not null,
foreign key (codCli)references tbCli (codCli),
foreign key (codFunc)references tbFuncio (codFunc),
dataPed datetime not null,
valPed decimal(9,2) not null default 0 check(valPed >=0)
 );

create table tbTiPED (
numPed int not null,
codTi int not null,
foreign key (numPed)references tbPedi (numPed),
foreign key (codTi)references tbTitu (codTi),
 qtdCD int not null check (qtdCD >= 1),
 valCD decimal (9,2) not null check(valCD>=0)
 );

create table tbTituART (
codTi int not null,
codArt int not null,
foreign key (codTi)references tbTitu(codTi),
foreign key (codArt)references tbArtistas(codArt)
);


desc tbArtistas;
desc tbGrava;
desc tbCatego;
desc tbEstad;
desc tbCida;
desc tbCli;
desc tbConju;
desc tbFuncio;
desc tbDepend;
desc tbTitu;
desc tbpedi;
desc tbTiPED;
desc tbTituART



insert into tbArtistas (codArt,nomeArt)values(1,'wellington rato');
insert into tbArtistas (codArt,nomeArt)values(2,'lucas moura');
insert into tbArtistas (codArt,nomeArt)values(3,'dorival');
insert into tbArtistas (codArt,nomeArt)values(4,'calleri');
insert into tbArtistas (codArt,nomeArt)values(5,'luciano');
insert into tbArtistas (codArt,nomeArt)values(6,'james');
insert into tbArtistas  (codArt,nomeArt)values(7,'nestor');

select * from tbArtistas order by codArt,nomeArt; 

insert into tbGrava (codGrav,nomeGrav)values(1,'Polygram');
insert into tbGrava (codGrav,nomeGrav)values(2,'emi');	
insert into tbGrava (codGrav,nomeGrav)values(3,'Som Livre');
insert into tbGrava (codGrav,nomeGrav)values(4,'Som Music');
select * from tbGrava order by codGrav,nomeGrav;

insert into tbCatego (codCate,nomeCate)values(1,'MPB');
insert into tbCatego (codCate,nomeCate)values(2,'Trilha sonora');
insert into tbCatego (codCate,nomeCate)values(3,'Rock Intercional');
insert into tbCatego (codCate,nomeCate)values(4,'Rock Nacional');	
select * from tbCatego order by codCate,nomeCate;

insert into tbEstad (codEsta,nomeEsta)values('sp','Sao paulo');
insert into tbEstad (codEsta,nomeEsta)values('MG','Minas gerais');
insert into tbEstad (codEsta,nomeEsta)values('RJ','Rio de janeiro');
insert into tbEstad (codEsta,nomeEsta)values('ES','Espirito santo');
select * from tbEstad order by codEsta,nomeEsta;

insert into tbCida (codCid,codEsta,nomeCid)values(1,'sp','sao paulo');
insert into tbCida (codCid,codEsta,nomeCid)values(2,'sp','sorocaba');
insert into tbCida (codCid,codEsta,nomeCid)values(3,'sp','jundiai');
insert into tbCida (codCid,codEsta,nomeCid)values(4,'sp','Americana');
insert into tbCida (codCid,codEsta,nomeCid)values(5,'sp','Araquara');
insert into tbCida (codCid,codEsta,nomeCid)values(6,'MG','Ouro preto');
insert into tbCida (codCid,codEsta,nomeCid)values(7,'ES','Cachoeira do Itapemirim');	
select * from tbCida;

insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(1,2,'marcos','rua turosbango 123', 1500,'M');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(2,5,'miranda','rua A', 2000,'M');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(3,4,'carlos','rua B ', 1500,'M');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(4,7,'fernando','rua C ', 892,'M');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(5,4,'mateus','rua D',950,'M');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(6,6,'gustavo','rua F', 1582,'M');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(7,4,'paulo','rua G', 1152,'M');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(8,5,'maria','rua H', 3250,'F');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(9,7,'duda','rua I', 1632,'F');
insert into tbCli (codCli,codCid,nomeCli,endCli,rendaCli,sexoCli)values(10,4,'roberta','rua J', 2000,'F');
select * from tbCli;

insert into tbConju (codCli,codConj,nomeConj,rendaConj,sexoConj)values(1,1,'Carla nogueira',2500,'F');
insert into tbConju (codCli,codConj,nomeConj,rendaConj,sexoConj)values(2,2,'Emilia pereira',5500,'F');
insert into tbConju (codCli,codConj,nomeConj,rendaConj,sexoConj)values(6,3,'Altiva da Costa',3000,'F');
insert into tbConju (codCli,codConj,nomeConj,rendaConj,sexoConj)values(7,4,'Carlos de Souza',3250,'M');
select * from tbConju;

insert into tbFuncio (codFunc,nomeFunc,endFunc,salaFunc,sexoFunc)values(1,'vania gabrela','rua AA',2500,'F');
insert into tbFuncio (codFunc,nomeFunc,endFunc,salaFunc,sexoFunc)values(2,'Noberto pereira','rua BB',300,'M');
insert into tbFuncio (codFunc,nomeFunc,endFunc,salaFunc,sexoFunc)values(3,'Olavo','rua CC',580,'M');
insert into tbFuncio (codFunc,nomeFunc,endFunc,salaFunc,sexoFunc)values(4,'Paula da Silva','rua DD',3000,'F');
insert into tbFuncio (codFunc,nomeFunc,endFunc,salaFunc,sexoFunc)values(5,'Rolandi Rocha','rua EE',2000,'M');
select * from tbFuncio;

insert into tbDepend (codDep,codFunc,nomeDep,sexoDep)values(1,2,'ana pereira','F');
insert into tbDepend (codDep,codFunc,nomeDep,sexoDep)values(2,3,'Roberto pereira','M');
insert into tbDepend (codDep,codFunc,nomeDep,sexoDep)values(4,5,'celso pereira','M');
insert into tbDepend (codDep,codFunc,nomeDep,sexoDep)values(5,4,'brisa pereira','F');
insert into tbDepend (codDep,codFunc,nomeDep,sexoDep)values(7,3,'mari sol','F');
insert into tbDepend (codDep,codFunc,nomeDep,sexoDep)values(9,1,'sonia pereira','F');
select * from tbDepend;	

insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(1,1,1,'tribalistas',30,1500);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(2,1,1,'tropicalia',30,500);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(3,1,1,'aquele abraço',30,600);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(4,2,2,'refazenda',30,100);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(5,2,2,'totalmente demais',30,2000);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(6,2,2,'travessia',30,500);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(7,2,3,'courage',30,200);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(8,3,3,'legiao urbana',30,100);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(9,4,4,'the beatles',30,300);
insert into tbTitu (codTi,codCate,codGrav,nomeCD,valCD,qtdEstoq)values(10,4,4,'rita lee',30,500);
select * from tbTitu;

insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(1,1,2,'02/05/02',1500);
insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(2,3,4,'02/05/02',500);	
insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(4,1,4,'02/02/02',200);
insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(5,7,5,'02/03/03',300);
insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(6,4,4,'02/03/03',100);	
insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(7,5,5,'02/03/03',50);	
insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(8,8,2,'02/03/03',50);	
insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(9,2,2,'02/03/03',1000);	
insert into tbPedi (numPed,codCli,codFunc,dataPed,valPed)values(10,7,1,'02/03/03',2000);
select * from tbPedi;


insert into tbTituART (codTi,codArt)values(1,2);
insert into tbTituART (codTi,codArt)values(2,2);	
insert into tbTituART (codTi,codArt)values(3,2);	
insert into tbTituART (codTi,codArt)values(4,2);	
insert into tbTituART (codTi,codArt)values(5,3);
insert into tbTituART (codTi,codArt)values(6,4);
insert into tbTituART (codTi,codArt)values(7,4);
insert into tbTituART (codTi,codArt)values(8,5);
insert into tbTituART (codTi,codArt)values(9,6);
insert into tbTituART (codTi,codArt)values(10,7);	
select * from tbTituART;

insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(1,1,2,30);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(1,2,3,20);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(2,1,1,50);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(2,2,3,30);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(4,2,3,20);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(5,1,2,25);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(6,2,3,30);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(6,3,1,35);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(7,4,2,55);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(8,1,4,60);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(9,2,3,15);
insert into	tbTiPED(numPed,codTi,qtdCD,valCD)values(10,7,2,15);		
select * from tbTiPED;	


-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD. 
 select titu.nomeCD, Grav.nomeGrav from tbTitu as titu inner join tbGrava as Grav on titu.codGrav = Grav.codGrav;
-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD. 
select titu.nomeCD,Cate.nomeCate from tbTitu as titu inner join tbCatego as Cate on titu.codCate = Cate.codCate;
-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de 
-- cada CD. 
 select titu.nomeCD,Grav.nomeGrav,Cate.nomeCate from  tbTitu as titu inner join tbGrava as Grav on titu.codGrav = Grav.codGrav inner join tbCatego as Cate on titu.codCate = cate.codCate;

-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o 
-- cliente fez. 
-- 
-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este 
-- funcionário registrou, além do nome do cliente que está fazendo o pedido.
select funcio.nomeFunc,Pedi.numPed, Pedi.dataPed, Pedi.valorTotal,Cli.nomeCli from tbFuncionarios as func inner join tbPedi as ped on func.c