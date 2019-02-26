/*Vendo os nomes dos gerentes*/

select f.nome from funcionario f where f.codigo in(select d.codigo from departamento d);

/* vendo maiores salarios*/
select f.nome , f.salario, f.codDept from funcionario f ORDER by f.salario DESC; 


/* q1: Obtenha o nome de todos os funcionários que ganham mais que o gerente do departamento 1*/
Select f.nome
From funcionario f
Where 
	f.salario > (Select f2.salario
     From funcionario f2
     Where f2.codigo = (Select dep.codFuncionarioGerente
     			    From departamento dep
                                  Where dep.codigo=1
				   )
                     );

/* Q2. Selecione o nome de todos os funcionários subordinados ao gerente 'José da Silva' */
Select f.nome
From funcionario f
Where f.nome <> 'José da Silva' And
	f.codDept = (Select d.codigo
		From departamento d, funcionario f
		    Where f.nome = 'José da Silva' And
		        d.codFuncionarioGerente = f.codigo);


/*Q3. Selecione a descrição dos departamentos que não possuem funcionários alocados.*/

Select d.descricao
	From departamento d
	Where
		d.codigo <> ALL (Select Distinct (f.codDept)
		From funcionario f);

/* Q4. Selecione o nome e o salário dos gerentes*/
select f.nome, f.salario from funcionario f where f.codigo in (select d.codFuncionarioGerente from departamento d);
/* Q5 - exclua os funcionarios gerentes */
delete f.nome, f.salario from funcionario f where f.codigo in (select d.codFuncionarioGerente from departamento d);

/*Q6 -  Selecione o nome e o salário dos funcionários que ganham acima da média salarial dos funcionários do departamento 5*/

select f.nome,f.salario  from funcionario f where f.salario > (
    select avg(f2.salario) from funcionario f2 where f2.codDept = 1)

Select f.Nome, f.salario From (Select Avg (salario) SalarioMedio From funcionario Where codDept = 1) Media, funcionario f Where f.salario > Media.SalarioMedio

