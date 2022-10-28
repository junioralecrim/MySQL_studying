/*
ESTUDAR: group by, having, count, all, in, distinct

*/


/*
1. Escreva uma consulta para encontrar o nome (first_name, last_name) 
e o salário dos funcionários que têm um salário maior do que o empregado cujo last_name='Bull'
*/

select FIRST_NAME, LAST_NAME, SALARY from employees /*Peguei o nome, sobrenome e salário de employees*/
where SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME = "Bull"); 


/*
2. Escreva uma consulta para encontrar o nome (first_name, last_name) 
de todos os funcionários que trabalham no departamento de TI. 
*/

select FIRST_NAME, LAST_NAME from employees 
where DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM departments where DEPARTMENT_NAME = "IT");


/*
3. Escreva uma consulta para encontrar o nome (first_name, last_name) dos funcionários 
que têm um gerente e trabalharam em um departamento com sede nos EUA.

Dica: Escreva subqueries de linha única e várias linhas
*/



/*4.  Encontre todos os nomes (first_name, last_name) 
dos empregados são gerentes.*/

select FIRST_NAME, LAST_NAME from employees /*ESTOU PEGANDO OS FUNCIOŃARIOS QUE SÃO GERENTES*/
where EMPLOYEE_ID IN (select MANAGER_ID from departments);


/*
5. Escreva uma consulta para encontrar o nome 
(first_name, last_name), cargo, id do departamento 
e nome dos funcionários que trabalham em 
Londres.

Departments(location id) -- Londres - locations (city)
*/
/*JOIN*/
select emp.FIRST_NAME, emp.LAST_NAME, emp.JOB_ID, emp.DEPARTMENT_ID, loc.CITY
from employees as emp
join departments as dep on emp.DEPARTMENT_ID = dep.DEPARTMENT_ID
join locations as loc on dep.LOCATION_ID = loc.LOCATION_ID
where loc.CITY = "London";

/*SUBQUERY*/
select FIRST_NAME, LAST_NAME, JOB_ID from employees
where DEPARTMENT_ID in (
select DEPARTMENT_ID from departments
where LOCATION_ID in (
select LOCATION_ID from locations
where CITY = 'London'));


/*6 - Escreva uma consulta para obter o salário médio de 
cada trabalho (job), excluindo o programador 
(‘IT_PROG’).
*/

select JOB_ID, avg(salary) from employees
where not JOB_ID = 'IT_PROG'
group by job_id;


/*
7. Escreva uma consulta para encontrar o nome 
(first_name, last_name) e o salário dos funcionários 
que ganham mais do que o salário médio e 
trabalham em qualquer um dos departamentos de 
TI.
*/


SELECT first_name, last_name, salary 
FROM employees 
WHERE department_id IN 
(SELECT department_id FROM departments WHERE department_name LIKE 'IT%') 
AND salary > (SELECT avg(salary) FROM employees);


/*
8. Escreva uma consulta para encontrar o nome (first_name, last_name), 
e o salário dos funcionários que ganham mais do que o ganho do Sr. Bell. 
*/

select first_name, last_name, salary
from employees
where salary > (
	select salary
	from employees
	where last_name = 'Bell'
	)
order by first_name;


/*
9. Escreva uma consulta para encontrar o nome (first_name, last_name), e salário 
dos funcionários que ganham o mesmo salário que o salário mínimo para todos os departamentos.
*/

select first_name, last_name, salary from employees
where salary = (select min(salary) from employees);

/*
10. Escreva uma consulta para encontrar o nome (first_name, last_name),
 e salário dos funcionários cujo salário é maior que o salário médio de todos os departamentos.
*/

select first_name, last_name, salary 
from employees
where salary > 
		(select avg(salary) 
        from employees);
        
/* O all retorna verdadeiro e as listas somente se TODAS AS MÈDIAS DOS VALORES, agrupados por alguma coisa, derem 
verdadeiro com a condição estabelecida*/        
SELECT first_name, last_name, salary FROM employees 
WHERE salary > 
ALL(SELECT avg(salary)FROM employees GROUP BY department_id);


/*
11. Escreva uma consulta para encontrar o nome (first_name, last_name) e salário dos empregados que ganham 
um salário superior ao salário de todos os Funcionários (JOB_ID = 'SH_CLERK'). 
Classifique os resultados do salário do mais baixo ao mais alto.
*/

select first_name, last_name, salary
from employees
where salary > 
		ALL(select salary from employees
		where job_id = 'SH_CLERK')
order by salary;

/*12. Escreva uma consulta para encontrar o nome (first_name, last_name) 
dos funcionários que não são supervisores.*/

select first_name, last_name 
from employees
where employee_id != 
				all(select manager_id from employees);

/*
13. Escreva uma consulta para exibir o employee_id, 
nome, sobrenome e nomes de departamento de todos os funcionários. 
*/

select emp.employee_id, emp.first_name, emp.last_name, dep.department_name 
from employees as emp join departments as dep
on emp.department_id = dep.department_id;


/*
14. Escreva uma consulta para exibir o ID do empregado, nome, sobrenome, salário de todos 
os funcionários cujo salário é acima da média para seus departamentos.
*/


select employee_id, first_name, last_name, salary
from employees as e
where salary >  
			(select avg(salary)
			from employees 
            where e.department_id = department_id);
            
            
SELECT employee_id, first_name, last_name, salary
FROM employees AS A 
WHERE salary > 
(SELECT AVG(salary) FROM employees WHERE department_id = A.department_id);



/*
16. Escreva uma consulta para encontrar o 5º salário máximo na tabela dos funcionários. 
*/

select salary 
from employees as emp
order by salary desc
limit 1 offset 4; /* O offset omite o resultado. Nesse caso, eu quero mostrar apenas um
resultado e omitir 4. Ou seja, vou estar pegando só o 5°*/

select *
from employees as emp
order by salary desc
limit 2 offset 4; /* primeira mostra quantas linhas quero pegar e a segunda, quantas quero pular antes de 
pegar a primeira definida no limit*/



/* 17. Escreva uma consulta para encontrar o 4º salário mínimo na tabela de funcionários.*/

select salary
from employees
order by salary asc
limit 1 offset 3;


/*18. Escreva uma consulta para selecionar os últimos 10 registros de uma tabela*/


select * from employees
order by employee_id desc
limit 10;


/*
19. Escreva uma consulta para listar o department_id do departamento e o nome de todos os departamentos 
onde nenhum funcionário está trabalhando
*/

select department_id, department_name
from departments
where department_id not in(select department_id from employees);
/*
DESC TEXT: selecione o department_id, department_name dos departments 
onde o department_id não corresponde a nenhum department_id da tabela dos funcionários
*/




/*
20. Escreva uma consulta para obter 3 salários máximos.
*/

select distinct salary from employees
order by salary desc
limit 3;


/* 21 Escreva uma consulta para obter 3 salários mínimos*/


select distinct salary from employees
order by salary asc
limit 3;




/* 22. Escreva uma consulta para obter o salário máximo dos funcionários */

select salary from employees
order by salary desc
limit 1 offset 2;

/*Escreva uma consulta para exibir o ID do empregado, nome, sobrenome, 
salário de todos os funcionários cujo salário é acima da média para seus departamentos. */

select employee_id, first_name, last_name, salary
from employees as e
where salary > (select avg(salary) from employees as emp
                where emp.department_id = e.department_id);
