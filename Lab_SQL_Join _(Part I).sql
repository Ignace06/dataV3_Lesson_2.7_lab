use sakila

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select c.name as category, count(f.film_id) as Nb_film from film_category as f
join category as c
on c.category_id = f.category_id
group by f.category_id
order by Nb_film desc;

-- Display the total amount rung up by each staff member in August of 2005.
select staff_id, count(amount) as "payment 08/2005" from payment
where date_format(convert(payment_date, date), '%Y-%M') = "2005-August"
group by staff_id;

-- Which actor has appeared in the most films?
select a.actor_id, a.first_name, a.last_name, count(fa.actor_id) as nb_show from film_actor as fa
join actor as a
on a.actor_id = fa.actor_id
group by a.actor_id
order by nb_show desc
limit 1;

-- Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, email, a.address as address  from staff as s
join address as a
on a.address_id = s.address_id
group by first_name


-- List each film and the number of actors who are listed for that film.
select * from actor;
select * from film_actor;
select film_id, count(distinct actor_id) as nb_of_actors from film_actor
group by film_id;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select * from customer;
select * from payment;
select c.first_name, c.last_name, count(p.amount) as payment from payment as p
join customer as c
on c.customer_id = p.customer_id
group by p.customer_id
order by c.last_name;


-- List number of films per category. 
select category_id as category, count(film_id) as nb_of_films from film_category
group by category
order by category

