	/*=========================================================
  music store sql project
  file : 05_ctes.sql
  topics:
  - common table expressions (cte)
  - with clause
  - cross joins with aggregations
  - subquery comparisons
=========================================================*/

-- USE  music_store

/*---------------------------------------------------------
question 1
---------------------------------------------------------*/
-- with customer_sales as 
-- (
-- select 
-- customer_id ,
-- sum(total) as total_spending 
-- from invoice 
-- group by customer_id
-- )
-- select * from customer_sales

/*---------------------------------------------------------
question 2
---------------------------------------------------------*/
-- with customer_sales as
-- ( 
-- select 
-- customer_id ,
-- sum(total) as total_spent
-- from invoice
-- group by customer_id
-- )
-- select * from  customer_sales
-- where total_spent > 
-- (
-- SELECT AVG(total_spent)
-- FROM customer_sales
-- );

/*---------------------------------------------------------
question 3
---------------------------------------------------------*/
-- with customer_sales as 
-- ( select 
-- c.customer_id,
-- concat(c.first_name , ' ' , c.last_name ) as customer_name ,
-- sum(i.total) as total_spent 
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- group by c.customer_id ,
-- c.first_name , 
-- c.last_name 
-- order  by total_spent desc 
-- limit 5 )

-- select * from customer_sales

/*---------------------------------------------------------
question 4
---------------------------------------------------------*/
--  with customer_sales as 
--  (
--  select 
--  customer_id ,
--  sum(total) as total_spent
--  from invoice
--  group by customer_id 
--  having total_spent > 100 
--  )

--  select * from customer_sales

/*---------------------------------------------------------
question 5
---------------------------------------------------------*/
-- with customer_sale as 
-- (
-- select 
-- customer_id ,
-- sum(i.total) as total_spent
-- from invoice i 
-- group by customer_id
-- ),

-- avg_sales as 
-- (
-- select 
-- avg(total_spent) as avg_spent 
-- from customer_sale
-- )

-- select 
-- cs.customer_id ,
-- cs.total_spent 
-- from customer_sale cs
-- cross join avg_sales a
-- WHERE cs.total_spent > a.avg_spent;

/*---------------------------------------------------------
question 6
---------------------------------------------------------*/
-- with avg_price as 
-- (
-- SELECT AVG(unit_price) AS average_price
-- FROM track
-- )

-- select 
-- track_id , 
-- name ,
-- unit_price
-- from track 
-- cross join avg_price
-- where unit_price > average_price

/*---------------------------------------------------------
question 7
---------------------------------------------------------*/
-- with avg_track as 
-- (
-- select 
-- avg(milliseconds) as  average_length
-- FROM track )

-- select 
-- track_id, 
-- name , 
-- milliseconds
-- from  track 
-- inner join avg_track 
-- where milliseconds > average_length

/*---------------------------------------------------------
question 8
---------------------------------------------------------*/
-- WITH avg_invoice AS
-- (
--     SELECT AVG(total) AS average_total
--     FROM invoice
-- )
-- SELECT
--     invoice_id,
--     total
-- FROM invoice
-- CROSS JOIN avg_invoice
-- WHERE total > average_total;

/*---------------------------------------------------------
question 9
---------------------------------------------------------*/
-- with artist_album as 
-- (
-- select 
-- ar.artist_id ,
-- ar.name ,
-- count(al.album_id) as total_album
-- from artist ar
-- inner join album al 
-- on ar.artist_id = al.artist_id
-- group by 
-- ar.artist_id,
-- ar.name
-- ),

-- avg_album as 
-- ( select
--  avg(total_album) as avg_album 
-- from artist_album )

-- select 
-- name,
-- total_album 
-- from artist_album
-- CROSS JOIN avg_album
-- WHERE total_album > avg_album;