CREATE DATABASE catalogue_of_things;

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