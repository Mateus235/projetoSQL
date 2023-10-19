-- drop database dbAgenda;

create database dbAgenda;

use dbAgenda;

create table tbTarefas(
nomeUsu varchar (100) not null unique primary key,
horaAcademia time,
horaTrabalhar time,
horaLazer time,
horaEstudo time,
horaDormir time
);	

create table tbCalen(
data datetime not null,

);