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
    codFuncionarioGerente int not null
	);
create table projeto(
	codigo int not null primary key,
    descricao varchar(100),
    codDept int not null,
    codFuncionarioResponsavel int not null,
    dataInicio date not null,
    dataFim date not null
);
create table AtividadeProjeto(
	id int not null primary key AUTO_INCREMENT,
	codProjeto int not null,
    codAtividade int not null,
    dataInicio date not null,
    dataFim date not null
);
/** adcionando as FKs**/
alter table funcionario add constraint funcDeptFK foreign key (codDept) references departamento(codigo);
alter table departamento add constraint depGerFK foreign key (codFuncionarioGerente) references funcionario(codigo);
alter table projeto add constraint projDeptFK foreign key (codDept) references departamento(codigo);
alter table projeto add constraint projetoFuncFK foreign key (codFuncionarioResponsavel) references funcionario(codigo);
alter table AtividadeProjeto add constraint AtvProProjFK foreign key (codProjeto) references projeto(codigo);
alter table AtividadeProjeto add constraint AtvProAtvFK foreign key (codAtividade) references atividade(codigo);


