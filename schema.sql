--Create a schema.sql file with tables that will be analogical to the structure of the classes that we created

-- Create the 'authors' table
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
-- Create the 'games' table
CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  played_at_date DATE,
  author_id INT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

