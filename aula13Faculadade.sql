//1 - Selecionar todos os sobrenomes de clientes em 
ordem alfabética;

select contactLastName from customers
order by contactLastName;

//2 - Selecionar todos os sobrenomes e nomes de 
clientes onde o nome está em ordem alfabética e o 
sobrenome em inverso da ordem alfabética.;

select contactFirstName, contactLastName from customers
order by contactFirstName, contactLastName desc;


//3 -  Selecione o número do pedido, número da linha do 
pedido e o preço total, ordenado pelo preço total 
do maior pro menor.;

select orderNumber, orderLineNumber, quantityOrdered * priceEach as precoTotal from orderdetails
order by precoTotal desc;



/* 4 - Selecione todos os números dos pedidos, data 
requerida e status que apresentam a data 
requerida entre 01/01/2003 to 01/31/2003.

orderNumber, requiredDate, status*/

select orderNumber, requiredDate, status from orders
where requiredDate between CAST('2003-01-01' as DATE) and CAST('2003-01-31' as DATE);

-- ESTUDAR O CAST	

/* 5 - Selecionar todos números, nomes e sobrenomes 
dos empregados que começam com a letra ‘a’.*/


select employeeNumber, firstName, lastName from employees
where firstName like 'a%';


/*
6 -  Suponha que em uma lista de clientes, somente 10 
clientes são exibidos por página.
• Mostre todos os números e nomes de clientes da 
segunda página.
*/



select * from customers
limit 10 offset 10;




