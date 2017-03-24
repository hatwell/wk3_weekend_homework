DROP TABLE screenings
DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

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
  customer_id INT2 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT2 REFERENCES films(id) ON DELETE CASCADE
  );

  CREATE TABlE screenings (
    id SERIAL8 PRIMARY KEY,
    film_id INT2 REFERENCES films(id),
    showing_time TIME
  );
