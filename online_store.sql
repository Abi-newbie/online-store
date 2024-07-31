Create table online_store(
	InvoiceNo varchar (255),
	StockCode varchar (225),
	Description	varchar(255),
	Quantity int,	
	InvoiceDate timestamp,
	UnitPrice numeric(10,2),
	CustomerID varchar(255),
	Country varchar(255)
);

select *
from online_store



-- assignment 1

select *
from online_store
where quantity >10 and country != 'United Kingdom';

select *
from online_store
where stockcode= '85123A' or stockcode= '85099B'

select *
from online_store
where invoicedate  between '2010-12-01 00:00:00' and '2010-12-07 23:59:59';

select *
from online_store
where customerid= '17850' and unitprice > 2.00

select *
from online_store
where customerid in ('17850','12583','13694');

select *
from online_store
where customerid not in ('17850,12583,13694')

select *
from online_store
where customerid IS null;

select *
from online_store
where unitprice between 2.00 and 3.00

select country
from online_store
where country in ('United Kingdom', 'France');

select distinct country
from online_store

select distinct quantity
from online_store
order by quantity desc

select unitprice
from online_store
Order by unitprice desc
Limit 5

select distinct(stockcode,description)
from online_store

Alter table online_store
Add column total_prices numeric(10,2)

Update online_store
Set total_prices = quantity * unitprice

select invoiceno,invoicedate,total_prices
from online_store
Order by total_prices desc

select invoicedate ,(extract(YEAR from invoicedate))
from online_store
	
-- extract december 2010
select count (quantity)
from online_store
where extract(YEAR from invoicedate)= '2010' and extract (month from invoicedate) = '12'

select sum (quantity)
from online_store
where extract(YEAR from invoicedate)= '2011' and extract (month from invoicedate) = '03'

select  MIN(unitprice)
from online_store

select  max (quantity)
from online_store

select avg(unitprice)
from online_store

select  sum(quantity)
from online_store

select count(*)
from online_store

select customerid ,sum(quantity)
from online_store
group by customerid
having sum(quantity)>100

select stockcode, sum(total_prices)
from online_store
group by stockcode;

select stockcode, sum(total_prices)
from online_store
group by stockcode
having sum(total_prices) >1000;

select distinct(invoiceno), sum(total_prices),
	CASE
		WHEN sum(total_prices) > 100 then 'High'  	
		WHEN sum(total_prices) <100 and sum(total_prices) = 50 then 'medium'
		WHEN sum(total_prices) <= 50 then 'low'
		ELSE 'low'
	END AS SCORE
from online_store
group by invoiceno
order by  score desc

select stockcode, sum(unitprice),
	CASE
		WHEN sum(unitprice) > 10 then 'Expensive'  	
		WHEN sum(unitprice) <10 then 'Affordable'
		ELSE 'Affordable'
	END AS price
from online_store
group by stockcode