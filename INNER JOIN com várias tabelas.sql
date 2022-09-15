//RELACIONAMENTO MUITOS PRA MUITOS
PRECISO CRIAR UMA TABELA PRA NOVA PRA FAZER TODO O RELACIONAMENTO;

CURSOS =1=====N |ASSISTE| N=====1= GAFANHOTOS;

create table gafanhoto_assiste_curso(
	id int not null auto_increment,
    data date,
    idgafanhoto int,
    idcurso int,
    primary key (id),
    foreign key (idgafanhoto) references gafanhotos(id),
    foreign key (idcurso) references cursos(idcurso)
) default charset = utf8mb4;

DESC gafanhoto_assiste_curso;






//ADICIONANDO DADOS NA RELAÇÃO/TABELA INTERMEDIÁRIA;

insert into gafanhoto_assiste_curso values
(default, '2014-03-01', 1, 2);

select * from gafanhoto_assiste_curso;











//MAS... COMO EU CORRELACIONO AS 3 TABELAS?
POR MEIO DO JOIN. NO CASO, VAI SER MAIS DE UM JOIN;


select * from gafanhotos;
select * from gafanhoto_assiste_curso;


select g.id, g.nome, ga.idgafanhoto, idcurso from gafanhotos g
join gafanhoto_assiste_curso ga
on g.id = ga.idgafanhoto;





select g.nome, idcurso from gafanhotos g
join gafanhoto_assiste_curso ga
on g.id = ga.idgafanhoto
order by g.nome;


//E COMO EU PEGO O DADO DA TERCEIRA TABELA?
FAZ MAIS UM JOIN!!!;


select * from gafanhoto_assiste_curso;

select g.nome, c.nome from gafanhotos g
join gafanhoto_assiste_curso ga
on g.id = ga.idgafanhoto
join cursos c
on c.idcurso = ga.idcurso
order by g.nome;

