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
