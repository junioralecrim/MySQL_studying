////////////////// LISTA DE PARÂMETROS COM DO SELECT //////////////////;

ORDER BY
order by DESC
BETWEEN
AND, OR e NOT
LIKE 
like '%'
like '_'
DISTINCT
COUNT()
MAX()
MIN()
AVG()
GROUP BY
HAVING
;

////////////////// AULA 11 - SELECT (PART 1) //////////////////;

//TRADUZINDO A LINHA ABAIXO
Selecione (select) todos os campos/colunas/atributos (*) da (from) tabela cursos;

select * from cursos;









//ORDENANDO POR COLUNA COM o By
No caso abaixo, está sendo ordenado pelo nome (do curso)
o desc (decrescente) no comando abaixo serve para ordenar na forma inversa.;

select * from cursos 
order by carga desc;










//FAZENDO A SELEÇÃO POR FILTRAGEM DE COLUNAS.
A ordem de inserção das colunas abaixo que vai definir a ordem de mostragem. Eu posso ordenar por múltiplos
parâmetros também. Abaixo, estou fazendo a ordenação dos cursos por ano e, dentro disso, a ordenação por nome.;

select ano, nome, carga from cursos
order by ano, nome;










//FAZENDO A SELEÇÃO POR FILTRAGEM DE LINHAS
abaixo estou selecionando apenas os cursos que foram realizados em 2016;

SELECT nome, descricao, carga FROM cursos
WHERE ano = '2016'
ORDER BY nome;










//TAMBÉM POSSO UTILIZAR OPERADORES RELACIONAIS NO WHERE;

SELECT ano, nome, descricao FROM cursos
WHERE ano >= 2016
ORDER BY ano, nome, descricao;










///Tambéme existem outros operadores relacionais, como por exemplo o between (entre). Que serve para 
selecionar registros entre dois registros passados (feixa de valores);

select idcurso, nome, ano from cursos
where ano between 2016 and 2020
order by ano desc, nome;










//Já o IN serve para mostrar apenas os dados relacionados. Diferentemente do '=', que só mostra a partir de um parâmetro passado, o in me deixa
mostrar dados a partir de vários parâmetros selecionados;

select idcurso, nome, descricao, ano from cursos
where idcurso in (1, 5, 8, 12)
order by ano desc;










//Também é possível utilizar operadores lógicos combinados, como o and, or e not;
SELECT nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30;

SELECT nome, carga, totaulas from cursos
where carga > 35 or totaulas < 30;


SELECT nome, carga, totaulas FROM cursos
where totaulas < 10 and totaulas > 5;







////////////////// AULA 12 - SELECT (PART 2) //////////////////

OPERADOR LIKE (like = parecido/semelhante. É Case Sensitive(não diferencia maiúsculas e minúsculas)). 
Utilizado para procurar, dentro dos atributos/colunas selecionadas, alguma correspondência apenas por uma letra
ou conjunto de letras. Como, por ex, procurar cursos que tenham a letra P

O "%" tem significado de -> Qualquer coisa ou NADA. Ou seja, vai substituir o que está adiante ou antes por nada ou alguma coisa
que tenha a mais q o caractere colocado antes;

SELECT * FROM cursos
WHERE nome LIKE 'a%';







////WILDCARDS (CARTAS CORINGA);
	Na forma como está abaixo, significa que vai aparecer qualquer coisa ('%') encerrada com a letra 'a';

SELECT * FROM cursos
where nome like '%a';


	Agora, se eu quiser, independete da posição, algo que tenha a letra "A" em qualquer lugar do nome, o comando vai ser assim:;
    
SELECT * FROM cursos
WHERE nome LIKE '%a%'
ORDER BY ano, nome;

	E se eu quiser sem a letra A na palavra?;
    
SELECT * FROM cursos
WHERE nome NOT LIKE '%a%';

	Pra pegar cursos que tenham alguma coisa específica no início e uma coisa específica no final OU NADA:;

SELECT * FROM cursos
WHERE nome LIKE 'ph%p';

	Caso eu queira que tenha QUALQUER COISA OBRIGATÓRIAMENTE NO FINAL APÓS O 'P', eu uso outra wildcard:;
    
SELECT * FROM cursos
WHERE nome LIKE 'PH%P_';

SELECT * FROM cursos
WHERE nome LIKE 'P_P%';

SELECT * FROM gafanhotos 
WHERE nome LIKE '%silva%';









//Distinguindo coisas com DISTINCT; 
	Imagine que eu tenho vários gafanhotos que moram em diversas localidades do globo. Várias localidades vão estar repetidas, então 
    pra isso eu uso o distinct. Basicamente eu vou pegar todos os países diferentes que tenho na minha coluna, e não onde cada um mora.
    
    Eu vou pegar todos os dados apenas uma vez só e ignorar as repetições;
    
SELECT nacionalidade from gafanhotos;

SELECT DISTINCT nacionalidade FROM gafanhotos
where nacionalidade like 'A%'
ORDER BY nacionalidade;








//FUNÇÕES DE AGREGAÇÃO. 
	Servem para totalizar ou agregar alguma coisa. Lembrando que essas funções servem pra mostrar/selecionar APENAS uma tupla como resultado
    e não fazem a seleção de MIN e MAX para duas coisas, por exemplo.
    
    - COUNT() serve para fazer a contagem da quantidade de elemtentos da coluna de acordo com os parâmetros especificados na busca;
//ESSE COUNT vai estar contando o que tiver selecionado a partir da condição abaixo (no caso, WHERE). 
SELECT COUNT(peso) FROM gafanhotos
where peso >= 100;


	- MAX() serve para especificar qual a maior quantidade dentro da coluna especificada;
    
SELECT MAX(totaulas) FROM cursos
WHERE ano = '2016';

	- MIN() serve para especificar qual a menor quantidade dentro da coluna especificada;

SELECT nome, MIN(totaulas) FROM cursos
WHERE ano = '2016';


	- SUM() serve para fazer a soma de registros da coluna especificada e com os parâmetros de seleção passados;
    
SELECT SUM(totaulas) FROM cursos WHERE ano = 2016;

	- AVG() serve para tirar a média;
    
SELECT AVG(totaulas) FROM cursos WHERE ano = 2016;





//	EXERCÍCIOS
1) Uma lista com o nome de todos os gafanhotos Mulheres;

SELECT nome FROM gafanhotos
where sexo = 'f';

2) Uma lista com os dados de todos aqueles que nasceram entre 1/Jan/2000 e 31/Dez/2015.;


SELECT * FROM gafanhotos
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento;


3) Uma lista com o nome de todos os homens que trabalham como programadores.;

SELECT nome FROM gafanhotos
WHERE sexo = 'M' and profissao = 'programador';


4) Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra J.;

SELECT * FROM gafanhotos
WHERE sexo = 'f' and nacionalidade = 'Brasil' and nome like 'j%'; 


5) Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100 Kg.;


SELECT nome, nacionalidade FROM gafanhotos
WHERE nome LIKE '%silva%' and nacionalidade != 'Brasil' and peso < '100.00';


6) Qual é a maior altura entre gafanhotos Homens que moram no Brasil?;

SELECT nome FROM gafanhotos
WHERE sexo = 'm' and 


7) Qual é a média de peso dos gafanhotos cadastrados?
8) Qual é o menor peso entre os gafanhotos Mulheres que nasceram fora do Brasil e entre 01/Jan/1990 e 31/Dez/2000?
9) Quantas gafanhotos Mulheres tem mais de 1.90cm de altura?;











////////////////// AULA 13 - SELECT (PART 3) //////////////////;

// AGRUPANDO dados. Isso é utilizado quando eu quero separar tuplas/registros por algum dado igual que estes tenham, como por exemplo a idade.;
// Se os registros estão agrupados, ele vai contar os registros que estão agrupados (por quantidade dentro do grupo);

SELECT * FROM cursos;
SELECT COUNT(*) FROM cursos
WHERE totaulas >= 15
GROUP BY totaulas;

SELECT carga, count(*) FROM cursos
where totaulas = 30
group by carga; 


Eu basicamente estou contando quantos registros existem dentro de cada agrupamento;
//EM BAIXO estou agrupando todos os cursos que tenham um total de aulas iguais e, logo em seguida, fazendo a conta desse total de registros
dentro de cada um dos agrupamentos feitos;

ABAIXO, O QUE ESTÁ no GROUP é oq vai ser contado pelo COUNT é que vai ser contado a partir do que foi AGRUPADO abaixo também.;

SELECT totaulas, count(*) FROM cursos
group by carga
order by totaulas;



SELECT carga, count(*) FROM cursos
where totaulas = 30
group by carga;



//COM O HAVING eu vou especificar algum parâmetro para mostrar com a contagem. Por exemplo, só vou mostrar os resultados que o count der maior
que 2;


SELECT carga, count(*) FROM cursos
where totaulas > 10
group by carga
having count(*) >= 1 * 5 ;







// O HAVING É SEMELHANTE AO WHERE PRO SELECT. Porém, a diferença do having é que eu só posso trabalhar com o grupo que eu agrupei.
EX: Digamos que eu queira saber quos carros do mesmo modelo tem em uma tabela e também queira separar apenas os grupos que tenham
mais de dois carros do mesmo modelo;

select carga, count(carga) from cursos
where totaulas > 5
group by carga
having carga > 10
order by carga;


select avg(carga) from cursos;

select carga, count(carga) from cursos
where ano > 2015
group by carga;

E se eu quiser mostrar apenas os cursos que tem acima da média total da carga? (no caso é 36.33);

select carga, count(carga) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);




//////////////// EXERCÍCIOS ///////////////;

1) - UMA LISTA COM AS PROFISSÕES DOS GAFANHOTOS E SEUS RESPECTIVOS QUANTITATIVOS;

SELECT * FROM gafanhotos;

select profissao, count(profissao) from gafanhotos
group by profissao;


2) - QUANTOS GAFANHOTOS HOMENS E QUANTAS GAFANHOTAS MULHERES NASCERAM APÓS 01/01/2005;


select sexo, count(sexo) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;


3) - UMA LISTA COM OS GAFANHOTOS QUE NASCERAM FORA DO BRASIL, MOSTRANDO O PAÍS DE ORIGEM
E O TOTAL DE PESSOAS NASCIDAS LÁ. SÓ NOS INTERESSA OS PAÍSES QUE TIVERAM MAIS DE 3 GAFANHOTOS 
COM ESSA NACIONALIDADE;


select nacionalidade, count(nacionalidade) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(nacionalidade) > 3;

4) - UMA LISTA AGRUPADA PELA ALTURA DOS GAFANHOTOS, MOSTRANDO QUANTAS PESSOAS
PESAM MAIS DE 100KG E QUE ESTÃO ACIMA DA MÉDIA DE ALTURA DE TODOS OS CADASTRADOS;

select * from gafanhotos;

select altura, count(altura) from gafanhotos
where peso > 100 
group by altura
having altura > (select avg(altura) from gafanhotos)
order by altura;


select avg(altura) from gafanhotos;




