-- --1. List all customers who live in Texas (use JOINs)

-- SELECT first_name,last_name,district
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id
-- WHERE district = 'Texas'

-- -- 2. Get all payments above $6.99 with the Customer's Full Name
-- select first_name, last_name from customer where customer_id in (select customer_id  from payment where amount >6.99);

-- -- 3. Show all customers names who have made payments over $175 (use subqueries)

-- -- My answer:
--SELECT first_name,last_name FROM customer WHERE customer_id IN (SELECT customer_id FROM payment GROUP BY customer_id HAVING SUM(amount) > 175);

-- -- The correct answer:
-- SELECT first_name,last_name, amount_sum 
-- FROM customer 
-- JOIN (
-- 	SELECT customer_id, SUM(amount) as amount_sum 
-- 	FROM payment 
-- 	GROUP BY customer_id 
-- 	HAVING SUM(amount) > 175
-- ) AS customer_sum
-- on customer.customer_id = customer_sum.customer_id;

-- -- 4. List all customers that live in Nepal (use the city table)# Kevin Shuler

-- SELECT customer.first_name,customer.last_name,customer.email, country 
-- FROM customer
-- FULL JOIN address ON customer.address_id = address.address_id
-- FULL JOIN city ON address.city_id = city.city_id
-- FULL JOIN country ON city.country_id = country.country_id
-- WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions? -- John Stephens


-- SELECT staff_id, SUM(amount), COUNT(amount)
-- FROM payment
-- GROUP BY staff_id
-- ORDER BY COUNT(amount) DESC;

-- --6. How many movies of each rating are there?

-- SELECT rating,  COUNT(rating)
-- FROM film
-- GROUP BY rating 

-- --7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

-- select first_name, last_name,customer_id 
-- from customer
-- where customer_id in (select customer_id from payment where amount > 6.99)
-- order by first_name, last_name

-- -- 8 How many free rentals did our stores give away?   # Answer: 24 free rentals

-- --first option:

-- SELECT amount
-- FROM payment 
-- WHERE amount = 0

-- --second option:

-- SELECT COUNT (amount)
-- FROM payment 
-- WHERE amount = 0
-- GROUP BY amount

