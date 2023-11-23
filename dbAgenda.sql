drop database dbAgenda;

create database dbAgenda;

use dbAgenda;


create table tbUsuario(
nome varchar(100) not null,
senha varchar (10)not null
);
create table tbTarefas(
horaAcademia  time,
horaTrabalhar  time,
horaLazer  time,
horaEstudo  time,
horaDormir   time

);	



create table tbCalen(
data datetime not null
);

-- insert into tbUsuario (nome,senha)values('mateus','mateus');
-- insert into tbTarefas (horaAcademia,horaTrabalhar,horaLazer,horaEstudo,horaDormir)values(1'8:00',2'10:00',3'17:00',4'19:00',5'21:00');
-- insert into tbCalen (data)values('2023/10/20')
	

-- select * from tbTarefas2 where codhoraAcademia = 1; 


