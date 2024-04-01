use music_store_data;



-- Q1 who is the senior most employee based on job title?

select * from employee
order by levels desc
limit 1;

-- Q2 Which countries have the most invoices?

select count(*) as c, billing_country from invoice
group by billing_country
order by c desc;

-- Q3 What are top three values from invoice table?

select * from invoice
order by total desc
limit 3;

-- Q4 Which city has the best customers? we would like to throw a promotional music 
-- festival in the city we made the most money. Write a query that returns one city
-- that has highest sum of invoice totals. Return both the city name and sum of
-- all the invoice totals.

select sum(total) as tot, billing_city from invoice
group by billing_city 
order by tot desc
limit 1;


-- Q5 Who is the best customer? The customer who has spent the most money will be
-- declared as the best customer. Write a qeury that returns the person who has 
-- spent the most money.

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as tot
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by tot desc 
limit 1;



-- Q6 aWrite a query to return the email, first name, last name, and the genre of 
-- all rock music listeners. Return your list ordered aplhanetically by email 
-- starting with A.

select distinct email, first_name, last_name from customer
join invoice on customer.customer_id = invoice.invoice_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
     select track_id from track
     join genre on track.genre_id = genre.genre_id
     where genre.name like 'rock'
)
order by email;

-- OR

select distinct email, first_name, last_name from customer
join invoice on customer.customer_id = invoice.invoice_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join genre on track.genre_id = genre.genre_id
where genre.name like 'rock'
order by email;


-- Q7 Let's invite the artists who have written the most rock musicin our dataset.
-- Write a query that returns the artist name and the total track count of top 10 
-- rock bands.

select artist.artist_id, artist.name, count(artist.artist_id) as tota from track
join album2 on album2.album_id = track.album_id 
join artist on artist.artist_id = album2.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'rock'
group by artist.artist_id
order by tota desc
limit 10;

-- Q8 Return all the track names that have a song length longer than  the average 
--  song length. Return the name and milliseconds for each track. Order by song 
-- length with the longest songs listed first.

select name, milliseconds from track
where milliseconds > ( select avg(milliseconds) as avg_milli from track)
order by milliseconds desc;

-- Q9 Find how much amount spent by each customer on artist? Write a query to 
-- return customer name, artist name, total spent.





select * from album2;
select * from employee
order by levels desc
limit 1;
select count(*) as c, billing_country from invoice
group by billing_country
order by c desc;
select * from invoice;
select total from invoice order by total desc limit 3;



select sum(total) as s, billing_city from invoice
group by billing_city
order by s desc; 

select * from invoice;

select * from customer;












