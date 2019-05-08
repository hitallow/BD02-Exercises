/*
	1 - Faça um função para calcular a idade do funcionário.
*/
	create or replace function getDataComCodigo(codigo integer) returns integer 
	return (select timestampdiff(YEAR,f.dataNasc,CURDATE()) from funcionario f where f.codigo = codigo)
	

	select getDataComCodigo(<CODIGO DO FUNCIONARIO EM QUESTAO>)

/*
	2 - Faça uma consulta para calcular a média de idade por departamento.
*/
	
	select AVG(getDataComCodigo(f.codigo)) as MEDIA from funcionario f group by f.depto;


/*
	Faça um procedimento para exibir os funcionários com idade acima da média do seu departamento.
*/



	drop procedure if exists showFunAcimaMedia ; 
	delimiter //
	create procedure showFunAcimaMedia()
	begin
		select f.nome from funcionario f where getDataComCodigo(f.codigo) > 
			(select AVG(getDataComCodigo(f2.codigo)) as MEDIA from funcionario f2 where f.depto = f2.depto);
	end; //
	delimiter ; 

	call showFunAcimaMedia();

/*
	Faça uma função para calcular quantos dias de atraso tem uma atividade. A função retornará negativo se tiver atrasada e positivo se tiver em dia.
*/
delimiter //
create or replace function atividadeAtrasada(codigo int) returns boolean 
	BEGIN
		declare retorno boolean; 
		declare atraso int  ;
        set atraso = select timestampdiff(day,a.dataFim,CURDATE()) from atividade a where a.codigo = codigo; 
        if atraso > 0 then
			set retorno = true;
		else 
			set retorno = false;
		end if;
        return retorno;
    END //
delimiter ;

delimiter //
create or replace function atividadeAtrasada(codigo int) returns boolean 
	BEGIN

		declare atraso int  ;
         
        if (select TIMESTAMPDIFF(day,a.dataFim,CURDATE()) from atividade a where a.codigo = codigo) > 0 then
			return true;
		else 
			return false;
		end if;
    END //
delimiter ;
    
    




