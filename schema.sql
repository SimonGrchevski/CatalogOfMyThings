CREATE DATABASE catalog_of_things;

CREATE TABLE authors(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE games(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  multiplayer VARCHAR(100),
  last_played_at DATE,
  PRIMARY KEY(id),
  CONSTRAINT fk_genres
  FOREIGN KEY(genre_id)
  REFERENCES genres(id),
  CONSTRAINT fk_authors
  FOREIGN KEY(author_id)
  REFERENCES authors(id)
  CONSTRAINT fk_sources
  FOREIGN KEY(source_id)
  REFERENCES sources(id)
  CONSTRAINT fk_labels
  FOREIGN KEY(label_id)
  REFERENCES labels(id)
);

CREATE INDEX idx_games_genre_id ON games (genre_id);
CREATE INDEX idx_games_auhor_id ON games (author_id);
CREATE INDEX idx_games_source_id ON games (source_id);
CREATE INDEX idx_games_label_id ON games (label_id);


CREATE TABLE music_albums (
 id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    source_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
);


CREATE TABLE genres (
    id  PRIMARY KEY INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
)

CREATE TABLE label (
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  title varchar(32),
  color varchar(32),
  PRIMARY KEY(id)
);

CREATE TABLE book(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  genre_id int,
  author_id int,
  source_id int,
  label_id int,
  publish_date date,
  archived boolean,
  PRIMARY KEY(id),
  CONSTRAINT fk_genres
  FOREIGN KEY(genre_id)
  REFERENCES genres(id),
  CONSTRAINT fk_authors
  FOREIGN KEY(author_id)
  REFERENCES authors(id),
    CONSTRAINT fk_sources
  FOREIGN KEY(source_id)
  REFERENCES sources(id),
    CONSTRAINT fk_labels
  FOREIGN KEY(label_id)
  REFERENCES labels(id)
);

CREATE INDEX idx_book_genre_id ON book (genre_id);
CREATE INDEX idx_book_auhor_id ON book (author_id);
CREATE INDEX idx_book_source_id ON book (source_id);
CREATE INDEX idx_book_label_id ON book (label_id);
