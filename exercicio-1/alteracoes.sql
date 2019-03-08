
/* Mudando nome da coluna id  */

ALTER TABLE AtividadeProjeto 
    CHANGE id codigo int auto_increment not NULL;

/* adcionando coluna CodigoResponsavel em AtividadeProjeto */
    
ALTER TABLE AtividadeProjeto ADD codigoResponsavel int not null;

alter table AtividadeProjeto Add constraint fkAtvResp foreign key(codigoResponsavel) references funcionario(codigo);




