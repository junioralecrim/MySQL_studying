/////////////////// LISTA DE COMANDOS ('aprendidos até o momento')///////////////////
DDL - "Date Definition Language"
CREATE DATABASE
CREATE TABLE
ALTER TABLE
DROP TABLE

DML - "Date Definition Language"
INSERT INTO
UPDATE
DELETE
TRUNCATE

DQL - "Data Query Language" (algo como "linguagem de selção/pergunta") 
SELECT

//COMANDOS de definição ('DDL - Date Definition Language');

CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

//usar o bd cadastro;
use cadastro;


//criando a tabela/entidade pessoas;
create table pessoas(
	id int not null auto_increment, 
    nome varchar(30) not null,
    nascimento date,
    sexo enum ('M', 'F'),
    peso decimal(5,2),
    altura decimal(3,2),
    nacionalidade varchar(20) default 'Brasil',
    primary key (id)
) default charset = utf8;

////////////////////////////////////////////////////////////////////;
//COMANDOS de manipulação ('DML - Date Manipulation Language');
//Não preciso dizer quais são os campos caso eles estejam na mesma ordem de inserção que foram criados;
insert into pessoas values
(default, 'Ana', '2006-1-10', 'F', '80.0', '2.00', default),
(default, 'Clara', '2006-2-16', 'F', '72.0', '1.74', 'EUA'),
(default, 'Anastácia', '2006-9-4', 'F', '66.0', '1.52', default);


//selecione todos os dados para "pessoas"; 
select * from pessoas;

//mostrando tabela;
desc pessoas;

alter table pessoas
add column profissao varchar(10) after nome;

alter table pessoas
drop column profissao;

alter table pessoas
add column profissao int first;

//Altera o tipo primitivo do campo e redefinir constrainsts;

alter table pessoas
modify column nome varchar(35) not null;

//////////////////////////////////////////////////////////////////;
COMANDOS PARA MANIPULAR COLUNAS
Alterando a estrutura da Tabela - 06;

desc gafanhotos;

alter table gafanhotos
add column profissao varchar(10) after nome;

alter table gafanhotos
add column codigo int first;

alter table gafanhotos
drop column profissao;

//nao funciona mais dessa forma para modificar um valor null pré existente para um not null. Mas se eu quiser
modificar as constrains, utilizar o modify é melhor dq o change;
alter table gafanhotos
modify column profissao varchar(20) not null;

alter table gafanhotos
modify column profissao varchar(20) default null;

select * from gafanhotos;

alter table gafanhotos
modify profissao varchar(20);

alter table gafanhotos
modify column id int first;

select * from gafanhotos;

//se eu quiser modificar o nome de uma coluna, uso "change";

alter table pessoas
change column profissao prof varchar(20);

//renomeando a tabela;

alter table pessoas
rename to gafanhotos;


//criando mais uma tabela;
//if not exists é um parâmetro do create table que: vou criar uma tabela somente se ela não existir ainda.
Eu tenho os parâmetros if not exists e if exists (que serve para, por exemplo, apagar uma tabela somente se ela
existir);

//A unique serve para não deixar colocar dois dados da mesma coluna com o mesmo nome. Por exemplo, não deixar
colocar dois cursos com o mesmo nome (EX: Curso Java para iniciantes e Curso Java avançado - Pode. 
Curso Java e Curso Java - Não pode);

//unsigned siginifica que o valor não pode ser negativo (ou seja, não vai ter sinal);


create table if not exists cursos(
	nome varchar(30) NOT NULL UNIQUE,
    descricao text,
    carga int unsigned,
    totalaulas int unsigned,
    ano year default '2016'
)default charset utf8mb4;

//colocando id e definindo como PK;
alter table cursos
add column idcurso int first;

alter table cursos
add primary key (idcurso);

desc cursos; 

//apagando uma tabela/entidade inteira;

drop table cursos;

create table if not exists teste(
	nome varchar(20) not null,
    curso varchar(10) not null,
    matricula int not null,
    cidade varchar(30)
)default charset utf8mb4;

alter table teste
modify matricula varchar(20) not null;


insert into teste value
(default, 'Junior Alecrim', 'ADS', '212000320', 'Sousa'),
(default, 'Daniel da Silva', 'ADS', '212000370', 'Fortaleza'),
(default, 'Germana Rebouças', 'ADS', '212000398', 'Pacatuba');

alter table teste
modify column matricula varchar(20) after idteste;

alter table teste
add primary key (idteste);

desc teste;
select * from teste;

///////////////////////////////////////////////////////////////
COMANDOS PARA MANIPULAR LINHAS/TUPLAS/REGISTROS
//Aula 07, Manipulando linhas (UPDATE, DELETE, TRUNCATE)
/registro, linha e tupla são a mesma coisa;

insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'), 
('5', 'Jarva', 'Introdução à Linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Bancos de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer Kibe', '40', '30', '2018'),
('10', 'YouTuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

//Update (update - atualize) é o comando para modificar a linha/tupla. Set você vai dizer qual a coluna e para oq vc quer modificar.
Em Where, você vai usar uma chave primária para dizer a linha que será modificada. Com a coluna identificada 
(set - configure), o valor passado e a linha identificada pela primary key (where - onde), é possível fazer essa modificação;

update cursos
set nome = 'HTML5'
where idcurso = '1';

update cursos
set nome = 'PHP', ano = '2015'
where idcurso = '4';

//o limit serve para limitar a quantidade de linhas afetadas. Serve para não correr o risco de alterar uma 
quantidade acima da desejada. Com o limit = 1, vou alterar somente uma linha
//NOTA: O update não serve para excluir linhas. Dá pra apagar os dados delas, mas as linhas vão continuar lá.
Pra apagar as linhas em si, vai ser utilizado outro comando.
;

update cursos
set nome = 'Java', carga = '40', ano = '2015'
where idcurso = '5'
limit 1;

update cursos
set descricao = 'Dicas de Photoshop (PS) CC'
where idcurso ='3'
limit 1;

select * from cursos;


// Delete - APAGAR TUPLAS/REGISTROS/LINHAS. AQUI EXISTE UMA DICA IMPORTANTE:
tomar muito cuidado quando for usar o delete, pois é um comando sem possibilidade de retorno do registro apagado. Assim, é sempre muito importante
manter um back-up do seu BD;

//delete de apenas uma linha;
delete from cursos
where idcurso = '9';

/usar o limit é uma boa prática para evitar deletar mais registros do que eu quero
//delete de várias linhas;

delete from cursos
where ano = '2018'
limit 2;

//apagando TODAS AS LINHAS de uma TABELA
"truncar" uma tabela significa apagar TODOS os registros;
truncate table cursos;

use cadastro;
select * from cursos;























///////////////////;

use exemplo;