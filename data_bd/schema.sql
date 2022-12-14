--Create table label
DROP TABLE IF EXISTS label;

CREATE TABLE label(
	id INT GENERATED BY DEFAULT AS IDENTITY,
	title VARCHAR(100) NOT NULL,
	color VARCHAR(100) NOT NULL,
	PRIMARY KEY(id)
);

--Create table book
DROP TABLE IF EXISTS book;

CREATE TABLE book(
	id INT GENERATED BY DEFAULT AS IDENTITY,
	label_id INT,
	publish_date DATE NOT NULL,
	archived BOOLEAN,
	publisher VARCHAR(100) NOT NULL,
	cover_state VARCHAR(10) NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES label(id)
);

--Create genres table
create table genres(
  id serial not null primary key,
  name varchar(100)
);

--Create music_albums table
create table music_album(
  id serial not null primary key,
  archived boolean,
  publish_date date,
  on_spotify boolean,
  genre_id int foreign key references genres(id)
);

--Create table author
create table author (
    id serial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
-- Create table game
create table game (
    id serial PRIMARY KEY,
    name VARCHAR(50),
    multiplayer BOOLEAN,
    last_played_At DATE, 
    publish_date DATE,
    Archived BOOLEAN,
    author_id INT FOREIGN KEY REFERENCES author(id)
);

--Indexes

--Book index
CREATE INDEX label_id_asc ON book(label_id ASC);
--Music album index
CREATE INDEX genre_id_asc ON music_album(genre_id ASC);
--Game index
CREATE INDEX author_id_asc ON game(author_id ASC);
