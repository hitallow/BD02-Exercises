/* 01 - Faça uma consulta que selecione o nome dos funcionários que recebem salários superiores aos salários pagos no departamento 5. */

select f.nome from funcionario f where f.salario >  (SELECT max(f2.salario) as maximo from funcionario f2 where f2.codDept=5);

/* 02 - Faça uma consulta que selecione o nome de todos os funcionários exceto o mais idoso. */

SELECT f.nome from funcionario f where f.dtNascimento >(select min(f2.dtNascimento) from funcionario f2);

/* 03 - Faça uma consulta que selecione o nome e a data de nascimento dos funcionários com idade superior a 21 anos que não são gerentes. */

select f.nome, f.dtNascimento from funcionario f WHERE f.dtNascimento < '1998-03-08' AND f.codigo not in(select codGerente from departamento);

/* 04 - Faça uma consulta que selecione o nome, o salário e o departamento dos funcionários que não são gerentes, ordenando pelo Código do Departamento. */

select f.nome, f.salario, d.descricao from funcionario f inner join departamento d on(f.codDept=d.codigo) where f.codigo not in (select d2.codGerente from departamento d2 ) order by f.codigo;
/*
5: Responda as perguntas:
    a - Explique os problemas de termos valores nulos nos dados.
        
    b - Explique o funcionamento do Right e do Left Join.
        O left join seleciona todas as ocorrências do lado esquerdo, mesmo se ele não existir do lado direito da junção,
        O right join seleciona todas as ocorrências do lado direito, mesmo se ele não existir do lado esquerdo.
    c - Explique o funcionamento do Full Outer Join e como pode ser feito no MySQL ou MariaDB que não tem mais o comando Full.
        Pode-se fazer uma união das duas seleções, fazendo um left join union right join, exemplo:
            select colunas tabela1 left join tabela2 on(id1=id2)
            union
            select colunas tabela1 right join tabela2 on(id1=id2)
        
*/

/* 6 - Faça uma consulta que selecione o nome, o salário dos funcionário, e a descrição do departamento, mesmo que eles não tenham departamentos associados. */

select f.nome, f.salario, d.descricao from funcionario f left join departamento d on(f.codigo =d.codigo)

/* 7 - Faça uma consulta que selecione o nome do departamento, o nome do gerente, e o número de funcionários de cada departamento. Deve aparecer os departamentos sem gerente e sem funcionários. Crie uma view para totalizar o número de funcionários em cada departamento e utilize-a na consulta.*/

drop view viewAux;

create view viewAux as select count(f.nome)as total, f.codDept as codigoDepartamento from funcionario f GROUP by f.codDept;

select d.descricao, f.nome, v.total from viewAux v,departamento d inner join funcionario f on(d.codGerente = f.codigo) WHERE v.codigoDepartamento = d.codigo;


/* 8 - Faça uma consulta que selecione o nome do departamento, o nome do gerente, e o número de projetos de cada departamento. Deve aparecer os departamentos sem gerente e sem projetos. Crie e use views na consulta, se necessário.*/
select d.descricao,f.nome,(select count(p.codigo) from projeto p where p.codDept = d.codigo) as total_projetos from departamento d, funcionario f where d.codigo = f.codigo;

/* 9 - Faça uma consulta que selecione o nome dos funcionários responsáveis por projetos, o número de projetos que este funcionário é responsável e seus salários, mas apenas os funcionários que ganhem mais que o gerente do seu departamento. Crie e use views na consulta. * */ 
create view FuncSumProj as select f.nome,f.codigo,f.salario ,count(f.codigo) as totalProj from projeto p inner join funcionario f on(f.codigo = p.codResponsavel) GROUP by p.codResponsavel;

create view SalGerente as select f.salario, d.codigo from funcionario f inner join departamento d
 on(f.codigo = d.codGerente);
 
select f.nome, fp.totalProj from SalGerente sg, FuncSumProj fp inner join funcionario f on(f.codigo = fp.codigo) where fp.salario > sg.salario and sg.codigo = f.codDept ;


/*
	10 - Faça uma consulta que selecione o nome do projeto, o nome do departamento do 		projeto, o nome do funcionário responsável pelo projeto, o nome do departamento 	do 	funcionário responsável.
*/

select p.descricao,d.descricao,f.nome,d2.descricao  from projeto p inner join departamento d on(p.codDept = d.codigo) inner join funcionario f on(p.codResponsavel = f.codigo) left join departamento d2 on(f.codDept = d2.codigo) ; 


/*
	11 - Faça uma consulta que selecione o nome do projeto, o nome do departamento do 	projeto, o nome do funcionário responsável pelo projeto, o nome do departamento 	do funcionário responsável, mas apenas os projetos que o responsável é de outro 	departamento.
*/

select p.descricao, d.descricao, f.nome from projeto p left join departamento d on(p.codDept = d.codigo) left join funcionario f on(f.codigo = p.codResponsavel) where f.codDept <> d.codigo ;

/*
	12 - Faça uma consulta que selecione o nome do projeto, data de início e fim do 			projeto, o nome da atividade do projeto, data de início e fim da atividade.
*/
select p.descricao,p.dataInicio, p.dataFim, atv.descricao, atvp.dataInicio, atvp.dataFim from projeto p left join atividade atv on(atv.codigo = p.codigo) left join AtividadeProjeto atvp on(atv.codigo = atvp.codAtividade);
