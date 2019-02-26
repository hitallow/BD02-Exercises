
/* desativei a chave estrangeura de funcionario */

ALTER TABLE funcionario DROP FOREIGN KEY funcDeptFK
/*removi a restriçao de ser not null*/

alter table funcionario MODIFY codDept int

/*Adcionando funcionario */
INSERT INTO funcionario(codigo,dtNascimento,nome,salario,sexo,codDept) VALUES(1,'1964-12-12', 'José da Silva',999,'M',NULL);

/* inseriondo um departamento */
insert into departamento(codFuncionarioGerente, codigo,descricao) values(1, 1, 'Descricao do departamento 1');

/* ativei a FK novamente*/

alter table funcionario add constraint funcDeptFK foreign key (codDept) references departamento(codigo);
/* uni as duas linhas */
UPDATE funcionario f set codDept = 1 where f.codigo = 1;

/*inserindo departamentos*/
insert into departamento (codFuncionarioGerente, codigo, descricao) values (1,2,'Departamento de Marketing');/*gerente : Maria do Rosario*/
insert into departamento (codFuncionarioGerente, codigo, descricao) values (1,3,'Departamento de RH'); /*gerente : Adalberto*/ 
insert into departamento (codFuncionarioGerente, codigo, descricao) values (1,4,'Departamento da Cozinha'); /*gerente : Luciana Ribeiro */
insert into departamento (codFuncionarioGerente, codigo, descricao) values (1,5,'Departamento de Logística'); /* gerente : Lindomaldo*/ 
insert into departamento (codFuncionarioGerente, codigo, descricao) values(1,6,'Departamento de TI');

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

update departamento d set d.codFuncionarioGerente =  3 where d.codigo = 2;/* colocando maria do rosario como gerente do departamento 2*/ 
UPDATE departamento d set d.codFuncionarioGerente = 6 where d.codigo = 3 ; /*colocando adalberto como gerente do departamento 3*/ 
update departamento d set d.codFuncionarioGerente = 9 where d.codigo = 4; /*colocando Luciana como gerente do departamento 4*/
update departamento d set d.codFuncionarioGerente = 12 where d.codigo = 5; /*colocando Lindomaldo como gerente do departamento 5*/

/* inserindo projetos*/

INSERT into projeto(codigo,codDept,codFuncionarioResponsavel,dataInicio,dataFim,descricao) 
values(
	1, 1,14,'2017-01-01','2018-01-01','Criação de curso online'
);
INSERT into projeto(codigo,codDept,codFuncionarioResponsavel,dataInicio,dataFim,descricao) 
values(
	2, 2,4,'2018-01-01','2018-12-01','Criação de software de testes'
);
INSERT into projeto(codigo,codDept,codFuncionarioResponsavel,dataInicio,dataFim,descricao) 
values(
	3, 3,6 ,'2016-03-01','2018-12-01','Manutenção de projetos'
);

INSERT into projeto(codigo,codDept,codFuncionarioResponsavel,dataInicio,dataFim,descricao) 
values(
	4, 4,10 ,'2019-03-01','2020-01-01','Criação de aplicação online'
);
INSERT into projeto(codigo,codDept,codFuncionarioResponsavel,dataInicio,dataFim,descricao) 
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
insert into AtividadeProjeto (codAtividade, codProjeto,dataFim,dataInicio) values(1,2,'2018-01-01','2019-01-01');
insert into AtividadeProjeto (codAtividade, codProjeto,dataFim,dataInicio) values(2,3,'2017-12-02','2019-01-01');
insert into AtividadeProjeto (codAtividade, codProjeto,dataFim,dataInicio) values(3,4,'2014-06-01','2019-01-01');
insert into AtividadeProjeto (codAtividade, codProjeto,dataFim,dataInicio) values(4,5,'2018-01-01','2019-01-01');
insert into AtividadeProjeto (codAtividade, codProjeto,dataFim,dataInicio) values(5,1,'2017-01-01','2018-03-29');
