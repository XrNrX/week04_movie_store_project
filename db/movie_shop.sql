DROP TABLE rentals;
DROP TABLE customers;
DROP TABLE movies;

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  age INT4
);

CREATE TABLE movies (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  certificate VARCHAR(255),
  url VARCHAR(255)
);


CREATE TABLE rentals (
  id SERIAL8 PRIMARY KEY,
  movie_id INT8 REFERENCES movies(id) ON DELETE CASCADE,
  customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE
);
