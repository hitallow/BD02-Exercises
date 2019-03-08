/* Tabelas com novos atributos */
create table atividade(
	codigo int not null primary key,
    	descricao varchar(100)
    );
create table funcionario(
	codigo int not null primary key,
	nome varchar(30),
	sexo varchar(1) ,
	dtNascimento date not null,
	salario float not null,
	codDept int not null
    );
create table departamento(
	codigo int not null primary key,
    	descricao varchar(100) not null,
    	codGerente int not null
	);
create table projeto(
	codigo int not null primary key,
	descricao varchar(100),
	codDept int not null,
	codResponsavel int not null,
	dataInicio date not null,
	dataFim date not null
	);
create table AtividadeProjeto(
	codigo int not null primary key AUTO_INCREMENT,
	codProjeto int not null,
    	codigoResponsavel int not null,
    	codAtividade int not null,
    	dataInicio date not null,
    	dataFim date not null
	);


/* novas foreing keys*/

alter table funcionario add constraint funcDeptFK foreign key (codDept) references departamento(codigo);
alter table departamento add constraint depGerFK foreign key (codGerente) references funcionario(codigo);
alter table projeto add constraint projDeptFK foreign key (codDept) references departamento(codigo);
alter table projeto add constraint projetoFuncFK foreign key (codResponsavel) references funcionario(codigo);
alter table AtividadeProjeto add constraint AtvProProjFK foreign key (codProjeto) references projeto(codigo);
alter table AtividadeProjeto add constraint AtvProAtvFK foreign key (codAtividade) references atividade(codigo);
alter table AtividadeProjeto Add constraint fkAtvResp foreign key(codigoResponsavel) references funcionario(codigo);



/* desativei a chave estrangeura de funcionario */

ALTER TABLE funcionario DROP FOREIGN KEY funcDeptFK;
/*removi a restriçao de ser not null*/

alter table funcionario MODIFY codDept int;

/*Adcionando funcionario */
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(1,'1964-12-12', 'José da Silva',999,'M',NULL);

/* inseriondo um departamento */
insert into departamento(codGerente, codigo,descricao) values(1, 1, 'Descricao do departamento 1');

/* ativei a FK novamente*/

alter table funcionario add constraint funcDeptFK foreign key (codDept) references departamento(codigo);
/* uni as duas linhas */
UPDATE funcionario f set codDept = 1 where f.codigo = 1;

/*inserindo departamentos*/
insert into departamento (codGerente, codigo, descricao) values (1,2,'Departamento de Marketing');/*gerente : Maria do Rosario*/
insert into departamento (codGerente, codigo, descricao) values (1,3,'Departamento de RH'); /*gerente : Adalberto*/ 
insert into departamento (codGerente, codigo, descricao) values (1,4,'Departamento da Cozinha'); /*gerente : Luciana Ribeiro */
insert into departamento (codGerente, codigo, descricao) values (1,5,'Departamento de Logística'); /* gerente : Lindomaldo*/ 
insert into departamento (codGerente, codigo, descricao) values(1,6,'Departamento de TI');

/*inseriondo funcionarios*/

INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(14,'1995-07-15', 'Luciola',850,'F',1);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(15,'1985-06-12', 'Caio Ribeiro',1500,'M',1);

INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(2,'1999-11-15', 'Walter Monteiro',850,'M',2);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(3,'2001-01-12', 'Maria do Rosario',1500,'F',2);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(4,'1980-04-11', 'Wendel Ferreira',1200,'M',2);

INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(5,'1999-05-11', 'Marilia Fonseca',1200,'F',3);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(6,'1987-01-19', 'Adalberto silva',3000,'M',3);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(7,'2000-05-26', 'Jefersson Baptista',600,'M',3);

INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(8,'1999-05-11', 'Ingrid Amaral',1500,'F',4);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(9,'1987-01-19', 'Luciana Ribeiro',3000,'F',4);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(10,'2000-05-26', 'Talia da Silva',999,'F',4);

INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(11,'1997-02-19', 'Cristiano de Melo',1300,'M',5);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(12,'1987-01-19', 'Lindomaldo da Silva',3000,'M',5);
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(13,'2000-05-26', 'Ribamar de Araujo',3000,'M',5);



/*alterando os gerentes*/

update departamento d set d.codGerente =  3 where d.codigo = 2;/* colocando maria do rosario como gerente do departamento 2*/ 
UPDATE departamento d set d.codGerente = 6 where d.codigo = 3 ; /*colocando adalberto como gerente do departamento 3*/ 
update departamento d set d.codGerente = 9 where d.codigo = 4; /*colocando Luciana como gerente do departamento 4*/
update departamento d set d.codGerente = 12 where d.codigo = 5; /*colocando Lindomaldo como gerente do departamento 5*/

/* inserindo projetos*/

INSERT into projeto(codigo,codDept,codResponsavel,dataInicio,dataFim,descricao) 
values(
	1, 1,14,'2017-01-01','2018-01-01','Criação de curso online'
);
INSERT into projeto(codigo,codDept,codResponsavel,dataInicio,dataFim,descricao) 
values(
	2, 2,4,'2018-01-01','2018-12-01','Criação de software de testes'
);
INSERT into projeto(codigo,codDept,codResponsavel,dataInicio,dataFim,descricao) 
values(
	3, 3,6 ,'2016-03-01','2018-12-01','Manutenção de projetos'
);

INSERT into projeto(codigo,codDept,codResponsavel,dataInicio,dataFim,descricao) 
values(
	4, 4,10 ,'2019-03-01','2020-01-01','Criação de aplicação online'
);
INSERT into projeto(codigo,codDept,codResponsavel,dataInicio,dataFim,descricao) 
values(
	5, 5,13 ,'2017-03-01','2019-01-01','Criação de banco de dados'
);

/*Inserts na tabela atividade */

INSERT into atividade(codigo, descricao) VALUES(1, 'descricao da atividade 1');
INSERT into atividade(codigo, descricao) VALUES(2, 'descricao da atividade 2');
INSERT into atividade(codigo, descricao) VALUES(3, 'descricao da atividade 3');
INSERT into atividade(codigo, descricao) VALUES(4, 'descricao da atividade 4');
INSERT into atividade(codigo, descricao) VALUES(5, 'descricao da atividade 5');

/* inserindo atividades de projeto*/

/* inserindo atividades de projeto*/
insert into AtividadeProjeto (codAtividade,codigoResponsavel, codProjeto,dataFim,dataInicio) values(1, 4, 2,'2018-01-01','2019-01-01');
insert into AtividadeProjeto (codAtividade,codigoResponsavel, codProjeto,dataFim,dataInicio) values(2, 5, 3,'2017-12-02','2019-01-01');
insert into AtividadeProjeto (codAtividade, codigoResponsavel,codProjeto,dataFim,dataInicio) values(3, 2, 4,'2014-06-01','2019-01-01');
insert into AtividadeProjeto (codAtividade, codigoResponsavel,codProjeto,dataFim,dataInicio) values(4,7, 5,'2018-01-01','2019-01-01');
insert into AtividadeProjeto (codAtividade, codigoResponsavel, codProjeto,dataFim,dataInicio) values(5, 9, 1,'2017-01-01','2018-03-29');


