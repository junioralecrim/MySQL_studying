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







////////////////// AULA 11 - SELECT (PART 2) //////////////////

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
    
SELECT COUNT(nome) FROM gafanhotos
where nacionalidade >= 40;


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