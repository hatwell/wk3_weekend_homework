DROP TABLE customers;
DROP TABLE films;
DROP TABLE tickets;

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  year_of_release INT2,
  price INT2
);

CREATE TABLE tickets (
  id SERIAL8 PRIMARY KEY,
  customer_id INT2 REFERENCES customers(id),
  film_id INT2 REFERENCES films(id)
  );
