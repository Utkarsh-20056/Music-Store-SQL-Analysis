/*=========================================================
  music store sql project
  file : 01_basic_sql.sql
  topics:
  - select
  - where
  - order by
  - limit
  - distinct
=========================================================*/

-- USE  music_store
/*---------------------------------------------------------
question 1
---------------------------------------------------------*/
-- select customer_id , first_name  , last_name , city , country 
-- from customer
-- where country = "brazil";
/*---------------------------------------------------------
question 2
---------------------------------------------------------*/
-- select customer_id , first_name , last_name , city , country
-- from customer
-- where country in ('USA' , 'Canada')
/*---------------------------------------------------------
question 3
---------------------------------------------------------*/
-- select customer_id , first_name , last_name , city , country 
-- from customer
-- where country != 'brazil';
/*---------------------------------------------------------
question 4
---------------------------------------------------------*/
-- select customer_id, first_name , last_name , city , country 
-- from customer
-- where country in ('Brazil' , 'Germany' , 'India' )

/*---------------------------------------------------------
question 5
---------------------------------------------------------*/
-- select track_id , name , unit_price 
-- from track
-- where unit_price >1.50 ;

/*---------------------------------------------------------
question 6
---------------------------------------------------------*/
-- select invoice_id , customer_id , total 
-- from invoice
-- where total between 10 and 20 ;

/*---------------------------------------------------------
question 7
---------------------------------------------------------*/
-- select customer_id , first_name , last_name 
-- from customer
-- where first_name like 'A%';
/*---------------------------------------------------------
question 8
---------------------------------------------------------*/
-- select track_id , name , unit_price 
-- from track
-- order by unit_price desc;
/*---------------------------------------------------------
question 9
---------------------------------------------------------*/
-- select customer_id , first_name , last_name 
-- from customer
-- order by first_name asc

/*---------------------------------------------------------
question 10
---------------------------------------------------------*/
-- select invoice_id , invoice_date , total 
-- from invoice
-- order by total desc , invoice_date  desc;
/*---------------------------------------------------------
question 11
---------------------------------------------------------*/
-- select track_id , name , unit_price 
-- from track
-- order by unit_price desc
-- limit 10;
/*---------------------------------------------------------
question 12
---------------------------------------------------------*/
-- select distinct country
-- from customer ;
/*---------------------------------------------------------
question 13
---------------------------------------------------------*/
-- SELECT COUNT(DISTINCT country)
-- FROM customer;
/*---------------------------------------------------------
question 14
---------------------------------------------------------*/
-- SELECT customer_id,
-- first_name,
-- last_name
-- FROM customer
-- WHERE country='USA'
-- ORDER BY last_name;