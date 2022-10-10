show table status;
show columns from customers;

/*1 -  Selecionar todos os sobrenomes de clientes em 
ordem alfabética*/

select contactLastName from customers
order by contactLastName asc;



/*2 - Selecionar todos os sobrenomes e nomes de 
clientes onde o nome está em ordem alfabética e o 
sobrenome em inverso da ordem alfabética.*/

select contactFirstName, contactLastName from customers
order by contactFirstName asc, contactLastName desc;



/*3 - Selecione o número do pedido, número da linha do 
pedido e o preço total, ordenado pelo preço total 
do maior pro menor.*/

select orderNumber, orderLineNumber, (quantityOrdered * priceEach) as precoTotal from orderdetails
order by precoTotal desc;



/*4 -  Selecione todos os números dos pedidos (orders), data 
requerida (orders) e status (orders) que apresentam a data 
requerida entre 01/01/2003 to 01/31/2003.*/

select orderNumber, requiredDate, status from orders
where requiredDate between cast('2003-01-01' as date) and cast('2003-01-31' as date); 
/*É ACONSELHÁVEL OLHAR NA TABELA PRA VER EM QUAL FORMATO ESTÁ A DATA ANTES DE FAZER O CAST
PARA ESCREVER CERTO.*/



/* 5 - Selecionar todos números (employees), nomes (employees) e sobrenomes (employees)
dos empregados que começam com a letra ‘a’.*/

select employeeNumber, firstName, lastName 
from employees
where firstName like 'a%';



/* 6 - Suponha que em uma lista de clientes, somente 10 
clientes são exibidos por página. Mostre todos os números 
e nomes de clientes da segunda página.*/

select customerNumber, customerName
from customers
limit 10 offset 20;

/*7 -  Mostre o nome (customers) e o limite de crédito (customers) do cliente com 
o segundo maior limite de crédito.*/

select * from customers;

select customerNumber, creditLimit 
from customers
order by creditLimit desc
limit 1 offset 1;

/*8 - Exiba o código e o nome do produto, além da 
descrição textual.*/

select productName, productCode, textDescription 
from products as ts1, productlines ts2
where ts1.productline = ts2.productline;
/*aqui temos uma junção natural apenas igualando as duas keys, sem necessariamente fazer o join entre duas tabelas*/

select productName, productCode, textDescription
from products as tb1 join productlines as tb2
on tb1.productline = tb2.productline;



/* 9 - Retorne o número do pedido, status do pedido (orders) e o 
preço total do pedido.
*/

show tables;
select * from orderdetails;

select od.orderNumber, status, (quantityOrdered*priceEach) as totalPedido
from orders as o join orderdetails as od on o.orderNumber = od.orderNumber;