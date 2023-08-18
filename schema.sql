CREATE DATABASE catalogue_of_things;

CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  label_id INT REFERENCES labels(id),
  author_ID INT REFERENCES authors(id),
  genre_ID INT REFERENCES genre(id),
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
  genre_id INT REFERENCES genre(id),
  label_id INT REFERENCES labels(id),
  author_ID INT REFERENCES authors(id)
);

CREATE TABLE genre
(
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    items TEXT
    []
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  played_at_date DATE,
  author_id INT NOT NULL,
  genre_id INT NOT NULL,
  label_id INT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);
