
/*=========================================================
  music store sql project
  file : 02_aggregate_functions.sql
  topics:
  - count
  - sum
  - avg
  - group by
  - having
=========================================================*/

-- USE  music_store

-- select count(*)  as total_customers
-- from customer ;

-- select sum(total) as total_revenew
-- from invoice;
/*---------------------------------------------------------
question 1
How many customers does each country have?
---------------------------------------------------------*/
-- select
-- country ,
-- count(*) as total_customer
-- from customer
-- group by country
-- order by total_customer desc;
/*---------------------------------------------------------
question 2
Which countries generated the highest revenue?
---------------------------------------------------------*/
-- select
-- billing_country,
-- sum(total) as total_revenew
-- from invoice
-- group by billing_country
-- order by  total_revenew desc
/*---------------------------------------------------------
question 3
How many tracks are there in each genre?
---------------------------------------------------------*/
-- select
-- g.name as genre,
-- count(t.track_id) as total_tracks
-- from   genre g
-- inner join   track t
-- on t.genre_id =  g.genre_id
-- group by g.name
-- order by total_tracks  desc ;
/*---------------------------------------------------------
question 4
How many albums has each artist released?
---------------------------------------------------------*/
-- select
-- ar.name ,
-- count(album_id) as total_album
-- from album as al
-- inner join artist as ar
-- on al.artist_id = ar.artist_id
-- group by ar.name
-- order by total_album desc
/*---------------------------------------------------------
question 5
How many invoices has each customer generated?
---------------------------------------------------------*/
-- select
-- concat(c.first_name, ' ' , c.last_name ) as full_name,
-- count(i.invoice_id) as total_invoices
-- from invoice as i
-- inner join customer as c
-- on c.customer_id = i.customer_id
-- group by c.customer_id , c.first_name , c.last_name
-- order by total_invoices  desc;
/*---------------------------------------------------------
question 6
Find the Top 10 customers who spent the most money.
---------------------------------------------------------*/
--  select
--  concat(c.first_name , ' ' , c.last_name ) as customer_name,
--  sum(i.total) as total_spent
--  from customer c
--  inner join invoice i
--  on c.customer_id = i.customer_id
--  group by c.customer_id , c.first_name , c.last_name
--  order by total_spent desc
--  limit 10;
/*---------------------------------------------------------
question 7
 Find the Top 10 best-selling artists based on total revenue.
 ---------------------------------------------------------*/
--  select
--  ar.name as artist_name ,
--  sum(il.unit_price * il.quantity) as total_revenue
--  from artist ar
--  inner join album al
--  on ar.artist_id = al.artist_id
--  inner join track t
--  on al.album_id = t.album_id
--  inner join invoice_line il
--  on t.track_id = il.track_id
--  group by
--  ar.artist_id,
--  ar.name
--  order by total_revenue desc
--  limit 10;
/*---------------------------------------------------------
question 8
Find the number of customers in each city.
---------------------------------------------------------*/
-- SELECT
--     city,
--     COUNT(*) AS total_customers
-- FROM customer
-- GROUP BY city
-- ORDER BY total_customers DESC;
/*---------------------------------------------------------
question 9
Find the average track length for each genre.
---------------------------------------------------------*/
-- select
-- g.name as genre_name ,
-- avg(t.milliseconds) as avg_track_lenght
-- from genre g
-- inner join track t
-- on g.genre_id = t.genre_id
-- group by
-- g.genre_id,
-- g.name
-- order by avg_track_lenght desc;
/*---------------------------------------------------------
question 10
Find the total number of tracks in each playlist.
---------------------------------------------------------*/
-- SELECT
--     p.name AS playlist_name,
--     COUNT(pt.track_id) AS total_tracks
-- FROM playlist p
-- INNER JOIN playlist_track pt
-- ON p.playlist_id = pt.playlist_id
-- GROUP BY
--     p.playlist_id,
--     p.name
-- ORDER BY total_tracks DESC;
