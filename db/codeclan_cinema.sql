DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE films (
id SERIAL PRIMARY KEY,
title VARCHAR(255),
price INT,
show_time INT
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



-- CodeClan Cinema (CCC (again))
-- Create a system that handles bookings for our newly built cinema!
-- It's enough if you can call your methods in pry, don't worry about
-- an interface.
--
-- Your app should have:
-- 😃 Customers 😲
-- name
-- funds

-- 🎥 Films 🎬
-- title
-- price
--
-- 🎟️ Tickets 🎟️
-- customer_id
-- film_id
--
-- Your app should be able to:
-- Create customers, films and tickets
-- CRUD actions (create, read, update, delete) customers, films and tickets.
-- Show which films a customer has booked to see, and see which customers
-- are coming to see one film.
--
-- Basic extensions:
-- Buying tickets should decrease the funds of the customer by the price
-- Check how many tickets were bought by a customer
-- Check how many customers are going to watch a certain film
--
-- Advanced extensions:
-- Create a screenings table that lets us know what time films are showing
-- Write a method that finds out what is the most popular time
-- (most tickets sold) for a given film
-- Limit the available tickets for screenings.
-- Add any other extensions you think would be great to have at a cinema!
