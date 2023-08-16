CREATE DATABASE catalogue_of_things;

CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  label_id INT REFERENCES labels(id),
  can_be_archived BOOLEAN,
  cover_state VARCHAR(250),
  publisher VARCHAR(250),
  PRIMARY KEY(id)
);