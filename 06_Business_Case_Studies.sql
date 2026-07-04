/*=========================================================
  music store sql project
  file : business_case_studies.sql
  topics:
  - advanced aggregate functions & groupings
  - multi-table joins (customer, invoice, track, genre, artist)
  - analytics & subqueries
  - window functions (row_number, rank, dense_rank, lag, lead)
=========================================================*/

-- USE  music_store

/*---------------------------------------------------------
question 1
---------------------------------------------------------*/
-- select 
-- concat(c.first_name , ' ' , c.last_name ) as customer_name,
-- sum(i.total) as total_spent
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- group by c.customer_id, 
-- c.first_name , 
-- c.last_name 
-- order by total_spent desc
-- limit 1;

/*---------------------------------------------------------
question 2
---------------------------------------------------------*/
-- select 
-- billing_country,
-- sum(total) as total_revenue
-- from invoice
-- group by billing_country
-- order by total_revenue desc
-- limit 1 ;

/*---------------------------------------------------------
question 3
---------------------------------------------------------*/
-- select 
-- g.name as genre_name,
-- sum(il.quantity * il.unit_price) as total_amount
-- from genre g
-- inner join track t
-- on g.genre_id = t.genre_id
-- inner join invoice_line il
-- on il.track_id = t.track_id
-- group by 
-- g.genre_id,
-- g.name
-- order by total_amount desc
-- limit 1;

/*---------------------------------------------------------
question 4
---------------------------------------------------------*/
-- select 
-- ar.name as artist_name,
-- sum(il.quantity * il.unit_price) as total_revenue
-- from artist ar
-- inner join album al
-- on al.artist_id = ar.artist_id
-- inner join track t
-- on al.album_id = t.album_id
-- inner join invoice_line il
-- on il.track_id = t.track_id
-- group by 
-- ar.artist_id,
-- ar.name 
-- order by total_revenue desc
-- limit 1;

/*---------------------------------------------------------
question 5
---------------------------------------------------------*/
-- select 
-- concat(c.first_name , ' ' , c.last_name) as customer_name,
-- sum(i.total) as total_spent
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- group by 
-- c.customer_id,
-- c.first_name,
-- c.last_name
-- order by customer_name desc
-- limit 5; 

/*---------------------------------------------------------
question 6
---------------------------------------------------------*/
-- select 
-- concat(c.first_name , ' ' , c.last_name) as customer_name,
-- sum(il.quantity) as total_tracks
-- from customer c
-- inner join invoice i
-- on i.customer_id = c.customer_id
-- inner join invoice_line il
-- on il.invoice_id = i.invoice_id
-- group by customer_name 
-- order by total_tracks desc
-- limit 5

/*---------------------------------------------------------
question 7
---------------------------------------------------------*/
-- select 
-- billing_city as city,
-- sum(total) as city_revenue
-- from invoice
-- group by billing_city
-- order by city_revenue desc
-- limit 1

/*---------------------------------------------------------
question 8
---------------------------------------------------------*/
-- select 
-- al.title as album_title,
-- sum(il.quantity) as total_track_sold
-- from album al
-- inner join track t
-- on al.album_id = t.album_id
-- inner join invoice_line il
-- on il.track_id = t.track_id
-- group by album_title 
-- order by total_track_sold desc
-- limit 5

/*---------------------------------------------------------
question 9
---------------------------------------------------------*/
-- SELECT
--     CONCAT(e.first_name,' ',e.last_name) AS employee_name,
--     COUNT(c.customer_id) AS total_customers
-- FROM employee e
-- INNER JOIN customer c
-- ON e.employee_id = c.support_rep_id
-- GROUP BY
--     e.employee_id,
--     e.first_name,
--     e.last_name
-- ORDER BY total_customers DESC
-- LIMIT 1;

/*---------------------------------------------------------
question 10
---------------------------------------------------------*/
-- SELECT
--     CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
--     SUM(i.total) AS total_spent,
--     COUNT(DISTINCT i.invoice_id) AS total_invoices,
--     SUM(il.quantity) AS total_tracks_purchased
-- FROM customer c
-- INNER JOIN invoice i
-- ON c.customer_id = i.customer_id
-- INNER JOIN invoice_line il
-- ON i.invoice_id = il.invoice_id
-- GROUP BY
--     c.customer_id,
--     c.first_name,
--     c.last_name
-- ORDER BY total_spent DESC;

/*---------------------------------------------------------
question 11
---------------------------------------------------------*/
-- select 
-- CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
-- sum(il.quantity) as rock_tracks
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- inner join invoice_line il
-- on i.invoice_id = il.invoice_id
-- INNER JOIN track t
-- ON il.track_id = t.track_id
-- INNER JOIN genre g
-- ON t.genre_id = g.genre_id
-- where g.name= "rock"
-- group by 
-- c.customer_id,
-- c.first_name,
-- c.last_name
-- order by  rock_tracks desc ;

/*---------------------------------------------------------
question 12
---------------------------------------------------------*/
-- select 
-- billing_city as city,
-- sum(total) as city_revenue
-- from invoice
-- group by billing_city
-- order by city_revenue desc
-- limit 5

/*---------------------------------------------------------
question 13
---------------------------------------------------------*/
-- select  
-- ar.name as artist_name,
-- sum(il.quantity) as track_sold
-- from artist ar
-- inner join album al
-- on al.artist_id = ar.artist_id
-- inner join track t
-- on t.album_id = al.album_id
-- inner join invoice_line il
-- on il.track_id = t.track_id
-- group by artist_name
-- order by track_sold desc
-- limit 10

/*---------------------------------------------------------
question 14
---------------------------------------------------------*/
-- SELECT
--     customer_name,
--     total_spent
-- FROM
-- (
--     SELECT
--         CONCAT(c.first_name,' ',c.last_name) AS customer_name,
--         SUM(i.total) AS total_spent
--     FROM customer c
--     INNER JOIN invoice i
--     ON c.customer_id = i.customer_id
--     GROUP BY
--         c.customer_id,
--         c.first_name,
--         c.last_name
-- ) t
-- WHERE total_spent >
-- (
--     SELECT AVG(customer_total)
--     FROM
--     (
--         SELECT
--             SUM(total) AS customer_total
--         FROM invoice
--         GROUP BY customer_id
--     ) c
-- );

/*---------------------------------------------------------
question 15
---------------------------------------------------------*/
-- select 
-- billing_country,
-- COUNT(DISTINCT customer_id) AS total_customers,
-- SUM(total) AS revenue,
-- COUNT(invoice_id) AS total_invoices
-- from invoice
-- group by billing_country

/*---------------------------------------------------------
question 16
---------------------------------------------------------*/
-- SELECT
--     t.name AS track_name,
--     al.title AS album_title,
--     ar.name AS artist_name,
--     ROUND(t.milliseconds/60000,2) AS duration_minutes
-- FROM track t
-- INNER JOIN album al
-- ON t.album_id = al.album_id
-- INNER JOIN artist ar
-- ON al.artist_id = ar.artist_id
-- ORDER BY t.milliseconds DESC
-- LIMIT 5;

/*---------------------------------------------------------
question 17
---------------------------------------------------------*/
-- SELECT
--     concat(e.first_name,' ',e.last_name) as employee_name,
--     sum(i.total) as revenue
-- from employee e
-- inner join customer c
-- on e.employee_id = c.support_rep_id
-- INNER JOIN invoice i
-- ON c.customer_id = i.customer_id
-- GROUP BY
--     e.employee_id,
--     e.first_name,
--     e.last_name
-- ORDER BY revenue DESC
-- LIMIT 1;

/*---------------------------------------------------------
question 18
---------------------------------------------------------*/
-- select 
-- i.billing_country as country,
-- g.name as genre_name ,
-- sum(il.quantity) as purchases
-- from invoice i
-- inner join invoice_line il
-- on i.invoice_id = il.invoice_id
-- inner join track t
-- on il.track_id = t.track_id
-- inner join genre g
-- on t.genre_id = t.genre_id
-- group by 
-- i.billing_country,
-- g.name
-- order by i.billing_country , purchases desc 

/*---------------------------------------------------------
question 19
---------------------------------------------------------*/
-- SELECT
--     al.title,
--     COUNT(t.track_id) AS total_tracks
-- FROM album al
-- INNER JOIN track t
-- ON al.album_id = t.album_id
-- GROUP BY
--     al.album_id,
--     al.title
-- HAVING COUNT(t.track_id) > 15
-- ORDER BY total_tracks DESC;

/*---------------------------------------------------------
question 20
---------------------------------------------------------*/
-- select 
-- concat(c.first_name , ' ' , c.last_name ) as customer_name,
-- c.country as country , 
-- sum(i.total) as total_revenue , 
-- count(distinct i.invoice_id) as total_invoices ,
-- sum(il.quantity) as tracks_purchased,
-- round(avg(i.total),2) as avg_invoice
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- inner join invoice_line il
-- on il.invoice_id = i.invoice_id
-- GROUP BY
--     c.customer_id,
--     c.first_name,
--     c.last_name,
--     c.country
-- ORDER BY total_revenue DESC;

/*---------------------------------------------------------
question 21
---------------------------------------------------------*/
-- select 
-- concat(c.first_name , ' ' , last_name ) as customer_name ,
-- sum(total) as total_revenue
-- from customer c
-- inner join invoice i 
-- on c.customer_id = i.customer_id
-- group  by c.customer_id,
--     c.first_name,
--     c.last_name
-- order BY total_revenue DESC
-- LIMIT 3

/*---------------------------------------------------------
question 22
---------------------------------------------------------*/
-- select 
-- concat(c.first_name , ' ' , last_name ) as customer_name ,
-- count(il.quantity) as tracks_purchsed
-- from customer c
-- inner join invoice i
-- on  c.customer_id = i.customer_id
-- inner join invoice_line il
-- on i.invoice_id = il.invoice_id
-- group by c.customer_id,
-- c.first_name,
-- c.last_name
-- having tracks_purchsed > 20;

/*---------------------------------------------------------
question 23
---------------------------------------------------------*/
-- select 
-- g.name as genre_name ,
-- sum(il.quantity) as tracks_sold 
-- from genre g
-- inner join track t
-- on t.genre_id = g.genre_id
-- inner join invoice_line il
-- on il.track_id = t.track_id
-- group by g.genre_id , g.name 
-- order by tracks_sold desc
-- limit 5;

/*---------------------------------------------------------
question 24
---------------------------------------------------------*/
-- SELECT
--     ar.name,
--     SUM(il.quantity*il.unit_price) AS revenue
-- FROM artist ar
-- INNER JOIN album al
-- ON ar.artist_id=al.artist_id
-- INNER JOIN track t
-- ON al.album_id=t.album_id
-- INNER JOIN invoice_line il
-- ON t.track_id=il.track_id
-- GROUP BY
--     ar.artist_id,
--     ar.name
-- ORDER BY revenue DESC;

/*---------------------------------------------------------
question 25
---------------------------------------------------------*/
-- select 
-- billing_country,
-- round(avg(total) , 2) as avg_invoice
-- from invoice
-- group by billing_country
-- order by avg_invoice desc

/*---------------------------------------------------------
question 26
---------------------------------------------------------*/
-- select 
-- CONCAT(c.first_name,' ',c.last_name) AS customer_name,
-- count(distinct il.track_id )  as unique_tracks
-- from customer c
--  INNER JOIN invoice i
-- ON c.customer_id=i.customer_id
-- INNER JOIN invoice_line il
-- ON i.invoice_id=il.invoice_id
-- GROUP BY
--  c.customer_id,
--     c.first_name,
--     c.last_name
-- ORDER BY unique_tracks DESC
-- LIMIT 1;

/*---------------------------------------------------------
question 27
---------------------------------------------------------*/
-- select 
-- al.title as albumm_name ,
-- sum(il.quantity*il.unit_price) as revenue
-- from album al
-- inner join track t 
-- on t.album_id = al.album_id
-- inner join invoice_line il
-- ON t.track_id=il.track_id
-- GROUP BY
--     al.album_id,
--     al.title
-- HAVING revenue>20
-- ORDER BY revenue DESC;

/*---------------------------------------------------------
question 28
---------------------------------------------------------*/
-- select 
-- ar.name,
-- count(distinct al.album_id) as albums
-- from artist ar
-- inner join album al
-- on ar.artist_id = al.artist_id
-- group by ar.artist_id,
-- ar.name
-- order by albums desc
-- limit 5

/*---------------------------------------------------------
question 29
---------------------------------------------------------*/
-- select
--     month(invoice_date) as month,
--     sum(total) as revenue
-- FROM invoice
-- GROUP BY MONTH(invoice_date)
-- ORDER BY month;

/*---------------------------------------------------------
question 30
---------------------------------------------------------*/
-- select 
-- CONCAT(c.first_name,' ',c.last_name) AS customer_name,
-- i.billing_country as Country,
-- sum(i.total) as Revenue ,
-- sum(il.quantity) as Tracks_Purchased, 
-- round(avg(total),2)as Average_Invoice,
-- count(distinct i.invoice_id) as Total_Invoices
-- FROM customer c
-- INNER JOIN invoice i
-- ON c.customer_id=i.customer_id
-- INNER JOIN invoice_line il
-- ON i.invoice_id=il.invoice_id
-- GROUP BY
--     c.customer_id,
--     c.first_name,
--     c.last_name,
--     i.billing_country
-- ORDER BY revenue DESC;

/*---------------------------------------------------------
question 31
---------------------------------------------------------*/
-- SELECT
-- CONCAT(c.first_name,' ',c.last_name) customer_name,
-- SUM(i.total) revenue
-- FROM customer c
-- INNER JOIN invoice i
-- ON c.customer_id=i.customer_id
-- GROUP BY
-- c.customer_id,
-- c.first_name,
-- c.last_name
-- ORDER BY revenue DESC
-- LIMIT 3;

/*---------------------------------------------------------
question 32
---------------------------------------------------------*/
-- with invoice_rank as 
-- (
-- select
-- invoice_id ,
-- billing_country,
-- total,
-- row_number() over(partition by billing_country  order by total desc  ) as rn
-- from invoice 
-- )
-- select * from invoice_rank 
-- where rn=1 ;

/*---------------------------------------------------------
question 33
---------------------------------------------------------*/
-- with emp_sales as 
-- (
-- select 
-- e.employee_id ,
-- CONCAT(e.first_name,' ',e.last_name) employee_name,
-- sum(i.total) as revenue
-- from employee as e
-- inner join customer c
-- on e.employee_id=c.support_rep_id
-- inner join invoice i
-- on c.customer_id=i.customer_id
-- group by 
-- e.employee_id,
-- e.first_name,
-- e.last_name
-- )
-- select 
-- employee_name ,
-- revenue,
-- rank() over(order by revenue desc) as employee_rank
-- FROM emp_sales;

/*---------------------------------------------------------
question 34
---------------------------------------------------------*/
-- WITH customer_sales AS
-- (
-- select
-- c.country,
-- concat(c.first_name,' ',c.last_name) as customer_name,
-- sum(i.total) as revenue
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- group by
-- c.customer_id,
-- c.first_name,
-- c.last_name,
-- c.country
-- ),
-- ranking as
-- (
-- select *,
-- row_number() over
-- (
-- partition by country
-- order by revenue desc
-- ) as rn
-- from customer_sales
-- )
-- select *
-- from ranking
-- where rn <= 2;

/*---------------------------------------------------------
question 35
---------------------------------------------------------*/
-- with invoice_rank as
-- (
-- select
-- billing_country,
-- invoice_id,
-- total,
-- row_number() over(
-- partition by billing_country 
-- order by total desc 
-- ) as rn 
-- from invoice )
-- select * from invoice_rank 
-- where rn = 1; 

/*---------------------------------------------------------
question 36
---------------------------------------------------------*/
-- with customer_rank as 
-- (
-- select 
-- c.customer_id,
-- concat(c.first_name , ' ' , c.last_name ) as customer_name ,
-- sum(i.total) as total_revenue
-- from customer c
-- inner join invoice i 
-- on c.customer_id = i.customer_id 
-- group by 
-- c.customer_id ,
-- c.first_name,
-- c.last_name
-- )
-- select 
-- customer_name,
-- total_revenue,
-- rank() over(order by total_revenue desc) as cs
-- from 
-- customer_rank

/*---------------------------------------------------------
question 37
---------------------------------------------------------*/
-- with customer_rank as 
-- (
-- select 
-- c.customer_id,
-- concat(c.first_name , ' ' , c.last_name ) as customer_name ,
-- sum(i.total) as total_revenue
-- from customer c
-- inner join invoice i 
-- on c.customer_id = i.customer_id 
-- group by 
-- c.customer_id ,
-- c.first_name,
-- c.last_name
-- )
-- select 
-- customer_name,
-- total_revenue,
-- dense_rank() over(order by total_revenue desc) as cs
-- from 
-- customer_rank

/*---------------------------------------------------------
question 38
---------------------------------------------------------*/
-- WITH customer_sales AS
-- (
-- select
-- c.country,
-- concat(c.first_name,' ',c.last_name) as customer_name,
-- sum(i.total) as revenue
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- group by
-- c.customer_id,
-- c.first_name,
-- c.last_name,
-- c.country
-- ),
-- ranking as
-- (
-- select *,
-- row_number() over
-- (
-- partition by country
-- order by revenue desc
-- ) as rn
-- from customer_sales
-- )
-- select *
-- from ranking
-- where rn <= 2;

/*---------------------------------------------------------
question 39
---------------------------------------------------------*/
-- with  monthly_sales as
-- (
-- select 
-- month(invoice_date) as month,
-- sum(total) as monthly_revenue
-- from invoice
-- group by month(invoice_date)
-- )
-- select 
-- month,
-- monthly_revenue ,
-- sum( monthly_revenue) over(order by month) as running_total
-- from monthly_sales ;

/*---------------------------------------------------------
question 40
---------------------------------------------------------*/
-- with month_revenue as 
-- ( 
-- select 
-- month(invoice_date) as monthly_revenue,
-- sum(total) as total_revenue 
-- from invoice 
-- group by month(invoice_date)
-- )
-- select 
-- monthly_revenue ,
-- total_revenue,
-- lag(total_revenue) over(order by monthly_revenue) as lag_revenue
-- from month_revenue ;

/*---------------------------------------------------------
question 41
---------------------------------------------------------*/
-- with month_revenue as 
-- ( 
-- select 
-- month(invoice_date) as monthly_revenue,
-- sum(total) as total_revenue 
-- from invoice 
-- group by month(invoice_date)
-- )
-- select 
-- monthly_revenue ,
-- total_revenue,
-- lead(total_revenue) over(order by monthly_revenue) as lag_revenue
-- from month_revenue ;

/*---------------------------------------------------------
question 42
---------------------------------------------------------*/
-- with monthly_sale as
-- ( select
-- month(invoice_date) as month_no,
-- sum(total) as revenue
-- from invoice
-- group by month(invoice_date) 
-- ) , 
-- sales_compare as
-- ( select 
-- month_no,
-- revenue,	
-- lag(revenue) over(order by month_no ) as previous_revenue
-- from monthly_sale
-- )
--  select * from  sales_compare 
--  where revenue < previous_revenue ;

/*---------------------------------------------------------
question 43
---------------------------------------------------------*/
-- with track_sales as 
-- (
-- select 
-- g.name as genre_name ,
-- t.track_id,
-- t.name as track_name,
-- sum(il.quantity) as total_sold
-- from genre g
-- inner join track t
-- on g.genre_id = t.genre_id
-- inner join invoice_line il
-- on t.track_id = il.track_id
-- group by
-- g.genre_id,
-- g.name,
-- t.track_id,
-- t.name
-- ),
-- ranking as 
-- ( select *,
-- row_number() over
-- (
-- partition by genre_name
-- order by total_sold desc
-- ) as rn
-- from track_sales
-- )
-- select *
-- from ranking
-- where rn = 1;

/*---------------------------------------------------------
question 44
---------------------------------------------------------*/
-- select 
-- ar.name ,
-- sum(il.unit_price * il.quantity ) as revenue 
-- from artist ar 
-- inner join album al 
-- on ar.artist_id = al.artist_id 
-- inner join track t 
-- on al.album_id = t.album_id 
-- inner join invoice_line il
-- on il.track_id = t.track_id
-- group by 
-- ar.artist_id ,
-- ar.name 
-- order by revenue desc 
-- limit 3 

/*---------------------------------------------------------
question 45
---------------------------------------------------------*/
-- WITH customer_sales AS
-- (
-- select
-- concat(c.first_name,' ',c.last_name) as customer_name,
-- sum(i.total) as revenue
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- group by
-- c.customer_id,
-- c.first_name,
-- c.last_name
-- )
-- select 
-- customer_name ,
-- revenue,
-- dense_rank() over( order by revenue desc  ) as ranking 
-- from customer_sales ;

/*---------------------------------------------------------
question 46
---------------------------------------------------------*/
-- WITH customer_sales AS
-- (
-- select
-- c.country,
-- c.customer_id,
-- concat(c.first_name,' ',c.last_name) as customer_name,
-- sum(i.total) as revenue
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- group by
-- c.country,
-- c.customer_id,
-- c.first_name,
-- c.last_name
-- ),
-- country_avg as 
-- ( select 
-- customer_id,
-- country,
-- avg(revenue) over(partition by country) as country_avg
-- from customer_sales )
-- SELECT
--     cs.customer_name,
--     cs.country,
--     cs.revenue,
--     ca.country_avg
-- FROM customer_sales cs
-- INNER JOIN country_avg ca
--     ON cs.customer_id = ca.customer_id
-- WHERE cs.revenue > ca.country_avg;

-- OR ALTERNATE APPROACH:
-- WITH customer_sales AS
-- (
-- select
-- c.country,
-- c.customer_id,
-- concat(c.first_name,' ',c.last_name) as customer_name,
-- sum(i.total) as revenue
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- group by
-- c.country,
-- c.customer_id,
-- c.first_name,
-- c.last_name
-- )
-- select
-- customer_name,
-- country,
-- revenue
-- from
-- (
-- select *,
-- avg(revenue) over(partition by country) as country_avg
-- from customer_sales
-- )x
-- where revenue > country_avg;

/*---------------------------------------------------------
question 47
---------------------------------------------------------*/
-- select
-- concat(c.first_name,' ',c.last_name) as customer_name,
-- count(distinct il.track_id) as unique_tracks
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- inner join invoice_line il
-- on i.invoice_id = il.invoice_id
-- group by
-- c.customer_id,
-- c.first_name,
-- c.last_name
-- order by unique_tracks desc
-- limit 1;

/*---------------------------------------------------------
question 48
---------------------------------------------------------*/
-- WITH monthly_sales AS
-- (
-- select
-- month(invoice_date) as month_no,
-- sum(total) as revenue
-- from invoice
-- group by month(invoice_date)
-- )
-- select
-- month_no,
-- revenue,
-- lag(revenue) over(order by month_no) as previous_month,
-- revenue - lag(revenue) over(order by month_no) as revenue_difference
-- from monthly_sales;

/*---------------------------------------------------------
question 49
---------------------------------------------------------*/
-- WITH invoice_rank AS
-- (
-- select
-- customer_id,
-- invoice_id,
-- total,
-- row_number() over
-- (
-- partition by customer_id
-- order by total desc
-- ) as rn
-- from invoice
-- )
-- select *
-- from invoice_rank
-- where rn = 1;

/*---------------------------------------------------------
question 50
---------------------------------------------------------*/
-- WITH customer_summary AS
-- (
-- select
-- c.customer_id,
-- concat(c.first_name,' ',c.last_name) as customer_name,
-- c.country,
-- sum(i.total) as revenue,
-- sum(il.quantity) as tracks_purchased,
-- count(distinct i.invoice_id) as total_invoices
-- from customer c
-- inner join invoice i
-- on c.customer_id = i.customer_id
-- inner join invoice_line il
-- on i.invoice_id = il.invoice_id
-- group by
-- c.customer_id,
-- c.first_name,
-- c.last_name,
-- c.country
-- )
-- select
-- customer_name,
-- country,
-- revenue,
-- tracks_purchased,
-- total_invoices,
-- dense_rank() over(order by revenue desc) as customer_rank
-- from customer_summary
-- order by revenue desc;
