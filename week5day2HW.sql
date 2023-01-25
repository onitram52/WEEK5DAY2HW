-- 1
SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2
SELECT customer.first_name, customer.last_name
FROM payment
FULL JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--3
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

--4
SELECT first_name, last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--5
SELECT first_name, last_name, COUNT(payment_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(payment_id) DESC;

--6
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

--7
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(payment_id) = 1
);

--8
SELECT rental_id
FROM payment
WHERE amount = 0;