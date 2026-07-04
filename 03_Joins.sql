/*=========================================================
  music store sql project
  file : 03_advanced_sql.sql
  topics:
  - windows functions (row_number, rank, dense_rank)
  - subqueries / common table expressions (cte)
  - case statements / advanced aggregations
=========================================================*/

-- USE  music_store

/*---------------------------------------------------------
question 1
---------------------------------------------------------*/
-- select 
-- t.track_id,
-- t.name as track_name ,
-- g.name as genre_name 
-- from track t
-- inner join genre g
-- on t.genre_id = g.genre_id
-- where g.name = 'rock'
-- limit 5 ;

/*---------------------------------------------------------
question 2
---------------------------------------------------------*/
-- select
-- i.invoice_id,
-- c.first_name ,
-- c.last_name,
-- i.total
-- from invoice i
-- inner join customer c
-- on i.customer_id = c.customer_id

/*---------------------------------------------------------
question 3
---------------------------------------------------------*/
-- select 
-- ar.name as artist_name  ,
-- al.title
-- from  album al
-- inner join artist ar
-- on al.artist_id = ar.artist_id;

/*---------------------------------------------------------
question 4
---------------------------------------------------------*/
-- select
--  t.name as track_name ,
-- a.title as album_title
-- from track t
-- inner join album a
-- on t.album_id = a.album_id;

/*---------------------------------------------------------
question 5
---------------------------------------------------------*/
-- select 
-- t.name as track_name,
-- al.title as album_title,
-- ar.name as artist_name
-- from track t
-- inner join album al 
-- on t.album_id = al.album_id
-- inner join artist ar 
-- on al.artist_id =  ar.artist_id

/*---------------------------------------------------------
question 6
---------------------------------------------------------*/
-- select 
-- c.first_name, 
-- c.last_name,
-- i.invoice_id,
-- i.billing_country
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id ;

/*---------------------------------------------------------
question 7
---------------------------------------------------------*/
-- select 
-- c.customer_id ,
-- CONCAT(c.first_name,' ',c.last_name) AS customer_name,
-- t.name ,
-- g.name 
-- from customer as c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- inner join invoice_line il
-- on i.invoice_id = il.invoice_id
-- inner join track t
-- on il.track_id=t.track_id
-- inner join genre g
-- ON t.genre_id = g.genre_id
-- WHERE g.name = 'Rock';

/*---------------------------------------------------------
question 8
---------------------------------------------------------*/
-- select 
-- country ,
-- count(*) as total_customer
-- from customer
-- group by country 
-- having total_customer >5 ;

/*---------------------------------------------------------
question 9
---------------------------------------------------------*/
-- select 
-- g.name as genre_name,
-- count(*) as total_tracks
-- from genre g
-- inner join track t
-- on g.genre_id = t.genre_id
-- group by g.genre_id, g.name
-- having total_tracks >100; 

/*---------------------------------------------------------
question 10
---------------------------------------------------------*/
-- SELECT
--     CONCAT(c.first_name,' ',c.last_name) AS customer_name,
--     COUNT(i.invoice_id) AS total_invoices
-- FROM customer c
-- INNER JOIN invoice i
-- ON c.customer_id = i.customer_id
-- GROUP BY
--     c.customer_id,
--     c.first_name,
--     c.last_name
-- HAVING COUNT(i.invoice_id) > 10;

/*---------------------------------------------------------
question 11
---------------------------------------------------------*/
-- select 
-- ar.name as artist_name , 
-- count(al.album_id) as total_album
-- from artist ar
-- inner join album al
-- on ar.artist_id = al.artist_id
-- group by ar.artist_id , ar.name 
-- having total_album >5;

/*---------------------------------------------------------
question 12
---------------------------------------------------------*/
-- select 
-- billing_country,
-- sum(total) as total_revenue
-- from invoice
-- group by billing_country
-- having total_revenue >100;

/*---------------------------------------------------------
question 13
---------------------------------------------------------*/
-- select 
-- concat(c.first_name , ' ' , last_name ) as customer_name,
-- count(i.invoice_id) as total_invoices
-- from customer c
-- left join invoice i
-- on c.customer_id = i.customer_id
-- group by   c.customer_id,
--     c.first_name,
--     c.last_name;

/*---------------------------------------------------------
question 14
---------------------------------------------------------*/
-- SELECT
--     ar.name,
--     al.title
-- FROM artist ar
-- LEFT JOIN album al
-- ON ar.artist_id = al.artist_id;

/*---------------------------------------------------------
question 15
---------------------------------------------------------*/
-- SELECT
--     CONCAT(e.first_name,' ',e.last_name) AS employee_name,
--     CONCAT(m.first_name,' ',m.last_name) AS manager_name
-- FROM employee e
-- LEFT JOIN employee m
-- ON e.reports_to = m.employee_id;

