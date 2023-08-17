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

CREATE TABLE labels (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 color VARCHAR(255),
 title VARCHAR(255),
 items TEXT
 []
);

CREATE TABLE music_album
(
  id INT PRIMARY KEY NOT NULL,
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
  genre_id INT REFERENCES genre(id)
);

CREATE TABLE genre
(
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    items TEXT
    []
);
