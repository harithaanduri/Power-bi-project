select * from customers;
select * from employees;
select * from offices;
select * from products;
select * from orderdetails;
select * from orders;
select * from payments;


/* 1.most ordered product*/


select sum(quantityOrdered),od.productCode,p.productline,p.productName from orderdetails od
join products p on od.productCode=p.productCode
group by productCode
order by sum(quantityOrdered) desc;

/*Highest ordered productline is Classic Cars and the product name is 1992 ferrari360 spider red is 1808
lowest ordered product line is also classiccars and product is 1957 ford thunderbird is 767*/ 

/*2.max orders done by customer*/

select sum(orderNumber)as nooforders,c.customerNumber,c.customerName,c.country,c.creditlimit from customers c
join orders o on c.customerNumber=o.customerNumber
group by customerNumber
order by nooforders desc;

/*Max orders done by customer Euro+shopping channel from spain is 267442 orders he had done.
  min orders done by customer Bavarian collectable imports,co. from germany. is 10296 orders he had done */


/*3.max amount paid by customer*/

select sum(amount)as payment,p.customerNumber,c.customerName,c.country from payments p
join customers c on p.customerNumber=c.customerNumber
group by customerNumber
order by payment desc;


/*Max amountpayment done by customer Euro+shopping channel from spain is 715738.98 he had done.
  min amountpayment done by customer Boards & toys co. from USA. is 7918 he had done */
  
/*4.max orders done by country*/

select sum(quantityOrdered)as nooforders,c.country from customers c
join orders o on c.customerNumber=o.customerNumber
join orderdetails od on o.orderNumber=od.orderNumber
group by country
order by nooforders desc;

/*max orders from USA 35844  , min orders from Ireland 490 */


/*5.noof orders in year*/

select sum(orderNumber) as orders ,year(orderDate)as inyear from orders
group by inyear
order by orders desc;

/*Max orders are done in 2004 is 1552910
	  orders in 2003 is 1127481
  min orders are done in 2005 is 665184 */


/*6.max orders done by salesemployee*/

select salesRepEmployeeNumber,count(orderNumber) nooforders,e.firstName,e.jobTitle from orders o
join customers c on c.customerNumber=o.customerNumber
join employees e on c.salesRepEmployeeNumber=e.employeeNumber
group by salesRepEmployeeNumber
order by nooforders desc;

/*max orders got to the employee Gerard is 43 ordernumbers.
  min orders got to the employee Martin is 12 ordernumbers.*/

/*profit*/

select (priceEach-buyPrice)as profit from orderdetails od
join products p on od.productCode=p.productCode
order by profit desc;