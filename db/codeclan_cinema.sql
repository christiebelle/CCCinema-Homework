DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;


CREATE TABLE films (
id SERIAL PRIMARY KEY,
title VARCHAR(255),
price INT
);

CREATE TABLE customers (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
funds INT
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE
);

CREATE TABLE screenings (
  id SERIAL PRIMARY KEY,
  movie_id INT REFERENCES films(id) ON DELETE CASCADE,
  show_time VARCHAR(255)
);

-- Advanced extensions:
-- Write a method that finds out what is the most popular time
-- (most tickets sold) for a given film
-- Limit the available tickets for screenings.
-- Add any other extensions you think would be great to have at a cinema!
