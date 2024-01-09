-- Q1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences.

/*	# Primary Keys & Foreign Keys in the maven movies db shown below: -
    
	    Table				 Primary Key				Foreign Key
    
	01. actor				 actor_id
	02. actor_award			 actor_award_id			    actor_id
	03. address				 address_id				    city_id
    04. advisor				 advisor_id
    05. category			 category_id
    06. city				 city_id					country_id
    07. country				 country_id
    08. customer			 customer_id				store_id, address_id
    09. film				 film_id
    10. film_actor									    actor_id, film_id
    12. film_category								    film_id, category_id
    13. film_text									    film_id
    14. inventory			 inventory_id			    film_id, store_id
    15. investor			 investor_id
    16. language			 language_id
    17. payment				 payment_id				    customer_id, staff_id, rental_id
    18. rental				 rental_id				    inventory_id, customer_id, staff_id
    19. staff				 staff_id				    address_id, store_id
    20. store				 store_id				    manager_staff_id, address_id
    
    # Differences between Primary Keys & Foreign Keys
    
    Primary Key:

    1. Uniqueness: A primary key is a column or set of columns that uniquely identifies each record in a table. Each value in the primary key must be unique.

    2. Not Null: The primary key cannot contain NULL values. Each record must have a valid value in the primary key column(s).

    3. One Per Table: A table typically has only one primary key, although a composite primary key (using multiple columns) is possible.

    4. Used for Identification: The primary key is used to uniquely identify a record in the table. It ensures that each row can be uniquely identified.

    5. Automatically Indexed: In many database systems, the primary key is automatically indexed to improve search performance.

	Foreign Key:

    1. References Primary Key: A foreign key is a column or set of columns in a table that refers to the primary key of another table. It establishes a link between the data in two tables.

    2. Not Necessarily Unique: While foreign keys often reference unique keys (usually primary keys) in another table, they are not required to be unique in the referencing table.

    3. Can Contain NULL Values: Foreign key columns can contain NULL values, indicating that a particular record has no corresponding entry in the referenced table.

    4. Used for Relationship: Foreign keys are used to create relationships between tables. They represent dependencies between the data in different tables.

    5. Enforces Referential Integrity: Foreign keys enforce referential integrity by ensuring that values in the foreign key column(s) match the values in the referenced primary key column(s).

*/

-- Q2. List all details of actors.

USE mavenmovies;
SELECT	* 
FROM actor;

-- Q3. List all customer information from DB.

USE mavenmovies;
SELECT	* 
FROM customer;

-- Q4. 	List different countries.

USE mavenmovies;
SELECT	* from country;

-- Q5 . Display all active customers.

USE mavenmovies;
SELECT	* 
FROM customer 
WHERE active = 1 ;

-- Q6. List of all rental IDs for customer with ID 1.

USE mavenmovies;
SELECT	rental_id , customer_id
FROM rental 
WHERE customer_id = 1 ;

-- Q7. Display all the films whose rental duration is greater than 5.

USE mavenmovies;
SELECT	title , rental_duration
FROM film 
WHERE rental_duration > 5 ;

-- Q8. List the total number of films whose replacement cost is greater than $15 and less than $20.

USE mavenmovies;
SELECT	COUNT(*)
FROM film 
WHERE replacement_cost > 15 AND replacement_cost <20 ;

-- Q9. Find the number of films whose rental rate is less than $1.

USE mavenmovies;
SELECT	COUNT(*)
FROM film 
WHERE rental_rate <1 ;

-- Q10. Display the count of unique first names of actors.

USE mavenmovies;
SELECT COUNT(DISTINCT first_name) AS unique_first_names_count
FROM actor;

-- Q11. Display the first 10 records from the customer table .

USE mavenmovies;
SELECT * 
FROM customer
LIMIT 10;

-- Q12. Display the first 3 records from the customer table whose first name starts with ‘b’.

USE mavenmovies;
SELECT * 
FROM customer
WHERE first_name LIKE "b%"
LIMIT 3;

-- Q13. Display the names of the first 5 movies which are rated as ‘G’.

USE mavenmovies;
SELECT title
FROM film
WHERE rating = "G"
LIMIT 5;

-- Q14. Find all customers whose first name starts with "a".

USE mavenmovies;
SELECT * 
FROM customer
WHERE first_name LIKE "a%";

-- Q15. Find all customers whose first name ends with "a".

USE mavenmovies;
SELECT * 
FROM customer
WHERE first_name LIKE "%a";

-- Q16. Display the list of first 4 cities which start and end with ‘a’ .

USE mavenmovies;
SELECT city 
FROM city
WHERE city LIKE "a%a"
LIMIT 4;

-- Q17. Find all customers whose first name have "NI" in any position.

USE mavenmovies;
SELECT * 
FROM customer
WHERE first_name LIKE "%NI%";

-- Q18. Find all customers whose first name have "r" in the second position .

USE mavenmovies;
SELECT *
FROM customer
WHERE SUBSTRING(first_name, 2, 1) = 'r';

-- Q19. Find all customers whose first name starts with "a" and are at least 5 characters in length.

USE mavenmovies;
SELECT *
FROM customer
WHERE first_name LIKE "a%" AND length(first_name)>= 5;

-- Q20. Find all customers whose first name starts with "a" and ends with "o".

USE mavenmovies;
SELECT *
FROM customer
WHERE first_name LIKE "a%o";

-- Q21. Get the films with pg and pg-13 rating using IN operator.

USE mavenmovies;
SELECT *
FROM film
WHERE rating IN ("PG","PG-13") ;

-- Q22. Get the films with length between 50 to 100 using between operator.

USE mavenmovies;
SELECT *
FROM film
WHERE length BETWEEN 50 AND 100 ;

-- Q23. Get the top 50 actors using limit operator.

USE mavenmovies;
SELECT *
FROM actor
LIMIT 50 ;

-- Q24. Get the distinct film ids from inventory table.

USE mavenmovies;
SELECT distinct(film_id)
FROM inventory;