-- USE  music_store

-- Find tracks greater than 1.08.
-- SELECT
--     track_id,
--     name,
--     unit_price
-- FROM track
-- where unit_price >
-- (select avg(unit_price)
-- from track) 



-- select 
-- Track_id ,
-- name ,
-- milliseconds
-- from track
-- where milliseconds >
-- (select avg(milliseconds)
-- from track);


-- select 
-- customer_id , 
-- sum(total) as total_spent
-- from invoice	
-- group by customer_id 
-- having  sum(total) >
-- (select avg(customer_total)
-- from  
-- ( select
--  sum(total) as customer_total
--  from invoice
--  group by customer_id) x
--  );


-- select 
-- ar.name,
-- count(al.album_id) as total_album
-- from artist ar
-- inner join album al
-- ON ar.artist_id = al.artist_id
-- group by ar.artist_id , ar.name
-- having count(al.album_id) >
-- ( select 
-- avg(album_count)
-- from ( select
-- count(al.album_id) as album_count
-- from album
-- group by artist_id ) x
-- );

-- SELECT
--     ar.name,
--     COUNT(al.album_id) AS total_albums
-- FROM artist ar
-- INNER JOIN album al
-- ON ar.artist_id = al.artist_id
-- GROUP BY
--     ar.artist_id,
--     ar.name
-- HAVING COUNT(al.album_id) >
-- (
--     SELECT AVG(album_count)
--     FROM
--     (
--         SELECT
--             COUNT(album_id) AS album_count
--         FROM album
--         GROUP BY artist_id
--     ) x
-- );

