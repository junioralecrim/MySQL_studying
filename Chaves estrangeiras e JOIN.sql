desc gafanhotos;

//Adicionando a linha que vai ser minha FK;
alter table gafanhotos
add column id_curso int after id;


//MULL - Chave multipla (FK)
Aqui em baixo eu estou adicionando a chave da outra tabela como FK da tabela gafanhotos;
alter table gafanhotos
add foreign key (id_curso)
references cursos(idcurso);

select * from gafanhotos;
select * from cursos;

//aqui eu estou fazendo todo o relacionamento entre a tabela cursos e a tabela gafanhotos, setando o id do curso
no do aluno
CURSOS =1=====<PREFERE>=====n= GAFANHOTOS;

update gafanhotos 
set id_curso = '10'
where id = '1';

//como fazer esse UPDATE NA TABELA pra várias tuplas de uma vez?
SOMENTE POR MEIO DO WORKBENCH, SENAO VAI TER QUE SER FEITO POR CÓDIGO MANUALMENTE;








//INTEGRIDADE REFERENCIAL;

delete from cursos
where idcurso = 10; 

ACIMA vai dar um erro de FK. Se eu tentar alterar qualquer tupla em alguma tabela
que esteja tendo uma referência de FK em outra, vai dar erro. Se for algum curso que não tem relação
com ninguém, vai dar certo, como feito logo abaixo;

select * from gafanhotos;
select * from cursos;

delete from cursos
where idcurso = 1;










//COMO FAZER APARECER ALGUM DADO DA FK AO INVÉS DO SEU NÚMERO NA TABELA?
///ENTENDENDO AS JUNÇÕES NO SQL
ABAIXO EU VOU QUERER MOSTRAR O nome DO ALUNO, nome DO CURSO E ano;


//juntar ambas as tabelas. Porém, ele só vai juntar tudo e fazer a cardinalidade
ou seja: cada aluno vai ser junto com todos os cursos;

select nome, id_curso from gafanhotos;
select nome, ano from cursos;

select gafanhotos.nome, gafanhotos.id_curso, cursos.nome, cursos.ano
from gafanhotos join cursos;







//Para tudo ali em cima fazer sentido e o JOIN dar um resultado adequado, eu preciso
adicionar a cláusula ON, que vai ter o papel de construir o ligamento entre chave
primária e estrangeira (dizendo que ambas são iguais);
ESSE ABAIXO É CHAMADO DE INNER JOIN;


select gafanhotos.nome, cursos.nome, cursos.ano
from gafanhotos inner join cursos
on gafanhotos.id_curso = cursos.idcurso
order by gafanhotos.nome;

 

O INNER JOIN vai mostrar apenas o que possui relacionamento nas duas tabelas. Então, os 
alunos que não tem curso preferido por exemplo (que possuem a chave estrangeira(id_curso) como NULL);










// TAMBÉM POSSO FAZER O USO DE APELIDOS PARA AS TABELAS, SIMPLIFICANDO O TAMANHO DOS COMANDOS;


select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on g.id_curso = c.idcurso
order by g.nome;












//QUANDO EU QUISER MOSTRAR TUDO DE ALGUMA DAS DUAS COLUNAS, CONSIDERANDO AS RELAÇÕES
E AS COLUNAS QUE NÃO TEM RELAÇÕES (FK LIGADAS), EU USO O LEFT E O RIGHT JOIN.

LEFT - Considerar tabela à esquerda do JOIN como sendo a que vou mostrar os dados, inclusive os sem relacionamento;

select g.nome, c.nome, c.ano
from gafanhotos as g left join cursos as c
on g.id_curso = c.idcurso;




RIGHT -  Considerar tabela à direita do JOIN como sendo a que vou mostrar os dados, inclusive os sem relacionamento;

select g.nome, c.nome, c.ano
from gafanhotos as g right join cursos as c
on g.id_curso = c.idcurso;





