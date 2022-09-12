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







