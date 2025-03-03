#1. Create a table called employees with the following structure?
# : emp_id (integer, should not be NULL and should be a primary key)Q
# : emp_name (text, should not be NULL)Q
# : age (integer, should have a check constraint to ensure the age is at least 18)Q
# : email (text, should be unique for each employee)Q
# : salary (decimal, with a default value of 30,000).

# Write the SQL query to create the above table with all constraints.

CREATE DATABASE employee_details;
USE employee_details;

CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(50) UNIQUE,
    salary DECIMAL DEFAULT 30000
);

#############################################################################
# 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
# examples of common types of constraints.

# Constraints in a database are rules applied to columns or tables to ensure the accuracy and reliability of the data.
# They help maintain data integrity by restricting the type of data that can be inserted, updated, or deleted.

# Common type of constraints are-
# Primary Key Constraint prevents duplicate rows in a table, ensuring each row is uniquely identifiable.

# Foreign Key Constraint ensures that relationships between tables are valid and prevents orphaned records.

# Unique Constraint ensures that no duplicate values exist in a specified column, maintaining the uniqueness of the data.

# Not Null Constraint ensures that critical fields always have a value, preventing incomplete data entry.

# Check Constraint ensures that data entered into the table meets specific criteria, maintaining the accuracy and validity of the data.

# Default Constraint ensures that columns have a default value if none is provided, maintaining consistency.
#############################################################################

# 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
# your answer.

# The NOT NULL constraint is used to ensure that a column cannot have a null value.
# A primary key cannot contain NULL values.
# The NOT NULL constraint is crucial for ensuring data integrity, reliability, and consistency by preventing incomplete data entry. 
# On the other hand, a primary key must be unique and non-null to uniquely identify records and maintain referential integrity.

################################################################################

# 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
# example for both adding and removing a constraint.

# Steps to Add a Constraint
# Use the ALTER TABLE statement followed by the table name.
# Use the ADD clause to specify the type of constraint and the constraint definition.

ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

# Steps to Remove a Constraint
# Use the ALTER TABLE statement followed by the table name.

# Use the DROP CONSTRAINT clause followed by the constraint name.

ALTER TABLE employees
DROP CONSTRAINT unique_email;

###################################################################

# 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
# Provide an example of an error message that might occur when violating a constraint.
# Ans:- When you attempt to insert, update, or delete data in a way that violates constraints in a database, several consequences can occur like
# Data Integrity Issues,Transaction Rollback,Error Messages,Application Errors
# ERROR: duplicate key value violates unique constraint "employees_pkey"
# DETAIL: Key (employee_id)=(101) already exists.

##################################################################

# 6. You created a products table without constraints as follows:

CREATE TABLE products (
product_id INT,
product_name VARCHAR(50),
price DECIMAL(10, 2));

# Now, you realise that?
# : The product_id should be a primary keyQ
# : The price should have a default value of 50.00

ALTER TABLE products
ADD CONSTRAINT product_id PRIMARY KEY (product_id);

ALTER TABLE products
ALTER COLUMN price SET DEFAULT(50.00);

#################################################################
# Q. 7 Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
# Ans:

SELECT student_name,class_name
FROM Students
INNER JOIN Classes
ON Students.class_id = Classes.class_id;

####################################################################
# Q.8 Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
# listed even if they are not associated with an order 
# Hint: (use INNER JOIN and LEFT JOIN)5

SELECT order_id,customer_name,product_name
FROM orders
INNER JOIN customers
ON orders.customer_id=customers.customer_id
LEFT JOIN Products
ON orders.order_id=products.order_id;

#########################################################################
# Q.9 Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
SELECT
product_name, SUM(amount) AS tot_sale
FROM sales
INNER JOIN Products
ON Sales.product_id=Product.product_id
GROUP BY product_name;

###########################################################################

# Q.10 Write a query to display the order_id, customer_name, and the quantity of products ordered by each
# customer using an INNER JOIN between all three tables.

SELECT 
order_id, customer_name,SUM(quantity) AS tot_quantity
FROM Orders
INNER JOIN Customers
ON Orders.customer_id = Customers.customer_id
INNER JOIN Other_details
ON Orders.order_id = Other_details.order_id
GROUP BY tot_quantity;


## SQL Commands

USE sakila;

# Q.1 Identify the primary keys and foreign keys in maven movies db. Discuss the differences
# The primary keys and foreign keys in maven movies db are actor_id,customer_id,film_id,rental_id 
# And film_id,customer_id,actor_id respectively.
# Differences Between Primary and Foreign Keys
# Purpose: A primary key uniquely identifies each record within its own table, while a foreign key establishes a link between records in two different tables.
# Uniqueness: Primary keys must contain unique values and cannot be null. Foreign keys can contain duplicate values and can be null.
# Table Relationship: Primary keys define the entity's identity within its own table, whereas foreign keys create 
# relationships between different tables by referencing primary keys in those tables.

# Q.2 List all details of actors

SELECT * FROM actor;

# Q.3 List all customer information from DB.
SELECT * FROM customer;

# Q.4 List different countries.
SELECT * FROM country;

# Q.5 Display all active customers.
SELECT * FROM customer
WHERE active =1;

# Q.6List of all rental IDs for customer with ID 1.
SELECT * FROM rental
WHERE customer_id =1;

# Q.7 Display all the films whose rental duration is greater than 5 .
SELECT * FROM film
WHERE rental_duration > 5;

# Q.8  List the total number of films whose replacement cost is greater than $15 and less than $20
SELECT * FROM film
WHERE replacement_cost > 15 AND replacement_cost< 20;

# Q.9 Display the count of unique first names of actors
SELECT * FROM actor
WHERE first_name IN(
SELECT first_name
FROM actor
GROUP BY first_name
HAVING COUNT(first_name)=1
);

# Q.10 Display the first 10 records from the customer table .
SELECT * FROM
customer
LIMIT 10;

# Q.11 Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT * FROM customer
WHERE first_name 
LIKE "b%"
LIMIT 3;

# Q.12 Display the names of the first 5 movies which are rated as ‘G’.
SELECT * FROM film
WHERE rating
LIKE "G%"
LIMIT 5;

# Q.13 Find all customers whose first name starts with "a".
SELECT * FROM customer
WHERE first_name
LIKE "a%";

# Q.14  Find all customers whose first name ends with "a".
SELECT * FROM customer
WHERE first_name
LIKE "%a";

# Q.15 Display the list of first 4 cities which start and end with ‘a’ 
SELECT * FROM city
WHERE city
LIKE "%A%";

# Q.16 Find all customers whose first name have "NI" in any position.
SELECT * FROM customer
WHERE first_name
LIKE "%NI%";

# Q.17  Find all customers whose first name have "r" in the second position .
SELECT * FROM customer
WHERE first_name
LIKE "_R%";

# Q.18 Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT * FROM customer
WHERE first_name
LIKE "A%" AND 
LENGTH(first_name)>=5;

# Q.19 Find all customers whose first name starts with "a" and ends with "o".

SELECT * FROM customer
WHERE first_name
LIKE "A%O";

# Q.20  Get the films with pg and pg-13 rating using IN operator.
SELECT * FROM film
WHERE rating IN ("PG","PG-13");

# Q.21 Get the films with length between 50 to 100 using between operator.
SELECT * FROM film
WHERE length>=50 and length<=100;

# Q.22 Get the top 50 actors using limit operator.
SELECT * FROM actor
LIMIT 50;

# Q.23 Get the distinct film ids from inventory table.
SELECT DISTINCT film_id FROM inventory;

## Functions
# Question 1:Retrieve the total number of rentals made in the Sakila database.
SELECT COUNT(rental_id) AS total_rental
FROM rental;

# Question 2:Find the average rental duration (in days) of movies rented from the Sakila database.
SELECT AVG(DATEDIFF(return_date,rental_date)) 
AS avg_return_date
FROM rental;

# Question 3:Display the first name and last name of customers in uppercase
SELECT UPPER(first_name), UPPER(last_name)
FROM customer;

# Question 4:Extract the month from the rental date and display it alongside the rental ID
SELECT rental_id,MONTH(rental_date) AS rental_month
 FROM rental;

# Question 5:Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
SELECT customer_id,COUNT(customer_id) 
AS No_rentals
FROM rental
GROUP BY customer_id;

# Question 6:Find the total revenue generated by each store.

SELECT staff_id,SUM(amount) AS tot_rev
FROM payment
GROUP BY staff_id;

# Question 8:Find the average rental rate of movies in each language.

SELECT  language_id,AVG(rental_rate) AS Avg_rate
FROM film
JOIN language ON film.language_id=language.language_id
GROUP BY language_id;

# Questions 9 -Display the title of the movie, customer s first name, and last name who rented it

SELECT title,first_name,last_name
FROM film
JOIN inventory ON
film.film_id=inventory.film_id
JOIN rental ON
rental.inventory_id= inventory.inventory_id
JOIN customer ON
customer.customer_id=rental.customer_id;

# Question 10:Retrieve the names of all actors who have appeared in the film "Gone with the Wind."

SELECT first_name,last_name
FROM actor
JOIN film_actor ON
actor.actor_id=film_actor.actor_id
JOIN film ON
film.film_id= film_actor.film_id
WHERE title = "Gone with the Wind";

# Question 11:Retrieve the customer names along with the total amount they've spent on rentals.

SELECT customer.customer_id,first_name,last_name,SUM(amount) AS tot_amount
FROM customer 
JOIN rental ON
customer.customer_id=rental.customer_id
JOIN payment ON
payment.rental_id=rental.rental_id
GROUP BY 
customer_id,first_name,last_name;

# Question 12:List the titles of movies rented by each customer in a particular city (e.g., 'London').

SELECT 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name, 
    film.title
FROM 
    customer
JOIN 
    address ON customer.address_id = address.address_id
JOIN 
    city ON address.city_id = city.city_id
JOIN 
    rental ON customer.customer_id = rental.customer_id
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    film ON inventory.film_id = film.film_id
WHERE 
    city.city = 'London'
GROUP BY 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name, 
    film.title;
    

# Question 13:Display the top 5 rented movies along with the number of times they've been rented.

SELECT 
    film.title, 
    COUNT(rental.rental_id) AS rental_count
FROM 
    film
JOIN 
    inventory ON film.film_id = inventory.film_id
JOIN 
    rental ON inventory.inventory_id = rental.inventory_id
GROUP BY 
    film.title
ORDER BY 
    rental_count DESC
LIMIT 5;

# Question 14:Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).

SELECT 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name
FROM 
    customer
JOIN 
    rental AS rental1 ON customer.customer_id = rental1.customer_id
JOIN 
    inventory AS inventory1 ON rental1.inventory_id = inventory1.inventory_id
JOIN 
    store AS store1 ON inventory1.store_id = store1.store_id
JOIN 
    rental AS rental2 ON customer.customer_id = rental2.customer_id
JOIN 
    inventory AS inventory2 ON rental2.inventory_id = inventory2.inventory_id
JOIN 
    store AS store2 ON inventory2.store_id = store2.store_id
WHERE 
    store1.store_id = 1
    AND store2.store_id = 2
GROUP BY 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name;


## Windows Function:

# 1. Rank the customers based on the total amount they've spent on rentals.

SELECT * FROM payment;
SELECT payment.customer_id,first_name,last_name,SUM(amount) AS tot_amt,
RANK() OVER(ORDER BY SUM(amount) DESC) AS cust_rank
FROM payment JOIN customer
ON payment.customer_id=customer.customer_id
GROUP BY customer_id
ORDER BY cust_rank;

#  Calculate the cumulative revenue generated by each film over time.

SELECT 
    film.title,
    payment.payment_date,
    payment.amount,
    SUM(payment.amount) OVER (PARTITION BY film.title ORDER BY payment.payment_date) AS cumulative_revenue
FROM 
    film
JOIN 
    inventory ON film.film_id = inventory.film_id
JOIN 
    rental ON inventory.inventory_id = rental.inventory_id
JOIN 
    payment ON rental.rental_id = payment.rental_id
ORDER BY 
    film.title, 
    payment.payment_date;
    
# 3. Determine the average rental duration for each film, considering films with similar lengths.
SELECT 
    film.length,
    film.title,
    AVG(DATEDIFF(rental.return_date, rental.rental_date)) AS avg_rental_duration
FROM 
    film
JOIN 
    inventory ON film.film_id = inventory.film_id
JOIN 
    rental ON inventory.inventory_id = rental.inventory_id
GROUP BY 
    film.length, 
    film.title
ORDER BY 
    film.length, 
    avg_rental_duration DESC;

# 4. Identify the top 3 films in each category based on their rental counts.

SELECT 
    category.name AS category_name,
    film.title,
    COUNT(rental.rental_id) AS rental_count,
    RANK() OVER (PARTITION BY category.name ORDER BY COUNT(rental.rental_id) DESC) AS film_rank
FROM 
    film
JOIN 
    inventory ON film.film_id = inventory.film_id
JOIN 
    rental ON inventory.inventory_id = rental.inventory_id
JOIN 
    film_category ON film.film_id = film_category.film_id
JOIN 
    category ON film_category.category_id = category.category_id
GROUP BY 
    category.name, 
    film.title
HAVING 
    RANK() OVER (PARTITION BY category.name ORDER BY COUNT(rental.rental_id) DESC) <= 3
ORDER BY 
    category.name, 
    film_rank;

# 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.

WITH customer_rentals AS (
    SELECT 
        customer.customer_id, 
        customer.first_name, 
        customer.last_name, 
        COUNT(rental.rental_id) AS total_rentals
    FROM 
        customer
    JOIN 
        rental ON customer.customer_id = rental.customer_id
    GROUP BY 
        customer.customer_id, 
        customer.first_name, 
        customer.last_name
),
average_rentals AS (
    SELECT 
        AVG(total_rentals) AS avg_rentals
    FROM 
        customer_rentals
)
SELECT 
    customer_rentals.customer_id, 
    customer_rentals.first_name, 
    customer_rentals.last_name, 
    customer_rentals.total_rentals,
    average_rentals.avg_rentals,
    customer_rentals.total_rentals - average_rentals.avg_rentals AS rental_difference
FROM 
    customer_rentals, 
    average_rentals;
    
# 6. Find the monthly revenue trend for the entire rental store over time.    
SELECT 
    DATE_FORMAT(payment.payment_date, '%Y-%m') AS year_month,
    SUM(payment.amount) AS total_revenue
FROM 
    payment
GROUP BY 
    year_month
ORDER BY 
    year_month;

## Normalisation & CTE

# 1. First Normal Form (1NF):
# a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.

# Ans: One potential example of a table in the Sakila database that might violate 1NF is the address table if it were to store multiple phone numbers in a single field.
# To normalize this table to achieve 1NF, you can split the phone numbers into a separate table, ensuring that each column contains atomic values.

#####################################################################

# 2. Second Normal Form (2NF):
# a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.

# Ans: Second Normal Form (2NF) requires that a table is already in First Normal Form (1NF) and that it does not have any partial dependency, 
# meaning that non-key attributes must be fully functionally dependent on the entire primary key.

# 3. Third Normal Form (3NF):
# a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies  present and outline the steps to normalize the table to 3NF.

# Ans: One potential transitive dependency in the rental table is between the inventory_id and last_update columns. If inventory_id determines another attribute, such as film_id (from the inventory table),
#  and that film_id determines last_update, then there is a transitive dependency.
# Steps to normalize to 3NF:Create separate tables for the non-key attributes that are transitively dependent.

# 4. 5. CTE Basics:
# a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
WITH actor_film_count AS (
    SELECT 
        actor.actor_id,
        actor.first_name,
        actor.last_name,
        COUNT(film_actor.film_id) AS film_count
    FROM 
        actor
    JOIN 
        film_actor ON actor.actor_id = film_actor.actor_id
    GROUP BY 
        actor.actor_id,
        actor.first_name,
        actor.last_name
)
SELECT 
    first_name,
    last_name,
    film_count
FROM 
    actor_film_count
ORDER BY 
    film_count DESC;

# 6. CTE with Joins:
# a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.

WITH film_language_info AS (
    SELECT 
        film.film_id,
        film.title,
        language.name AS language_name,
        film.rental_rate
    FROM 
        film
    JOIN 
        language ON film.language_id = language.language_id
)
SELECT 
    title,
    language_name,
    rental_rate
FROM 
    film_language_info;

# 7. CTE for Aggregation: a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.
WITH customer_payments AS (
    SELECT 
        customer.customer_id,
        customer.first_name,
        customer.last_name,
        SUM(payment.amount) AS total_revenue
    FROM 
        customer
    JOIN 
        payment ON customer.customer_id = payment.customer_id
    GROUP BY 
        customer.customer_id,
        customer.first_name,
        customer.last_name
)
SELECT 
    customer_id,
    first_name,
    last_name,
    total_revenue
FROM 
    customer_payments
ORDER BY 
    total_revenue DESC;
    
# 8. CTE with Window Functions: a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.

WITH film_rental_duration AS (
    SELECT 
        film.film_id,
        film.title,
        DATEDIFF(rental.return_date, rental.rental_date) AS rental_duration
    FROM 
        film
    JOIN 
        inventory ON film.film_id = inventory.film_id
    JOIN 
        rental ON inventory.inventory_id = rental.inventory_id
)
SELECT 
    film_id,
    title,
    rental_duration,
    RANK() OVER (ORDER BY rental_duration DESC) AS film_rank
FROM 
    film_rental_duration;





