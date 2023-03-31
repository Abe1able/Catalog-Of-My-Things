CREATE TABLE movie (
    id SERIAL PRIMARY KEY,
    genre_id INTEGER REFERENCES genre(id),
    author_id INTEGER REFERENCES author(id),
    source_id INTEGER REFERENCES source(id),
    label_id INTEGER REFERENCES label(id),
    publish_date DATE,
    archived BOOLEAN
);

CREATE TABLE source (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(30),
  second_name VARCHAR(30),
  PRIMARY KEY(id),
  );

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  label_id INT, 
  genre_id INT, 
  source_id INT,
  author_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
);

CREATE TABLE genres (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE music_albums (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    on_spotify BOOLEAN,
    archived BOOLEAN,
    genre_id INT,
    genre_name VARCHAR(150),
    author_id INT,
    author_first_name VARCHAR(150),
    author_last_name VARCHAR(150),
    source_id INT,
    source_name VARCHAR(150),
    label_id INT,
    label_name VARCHAR(150),
    label_color VARCHAR(150),

    PRIMARY KEY (id),
    CONSTRAINT fk_genres
        FOREIGN KEY (genres_id)
            REFERENCES genres(id),
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
            REFERENCES  author(id),
    CONSTRAINT fk_source
        FOREIGN KEY (source_id)
            REFERENCES  source(id),
    CONSTRAINT fk_label
        FOREIGN KEY (label_id)
            REFERENCES  label(id)
);

CREATE TABLE labels (
  id SERIAL NOT NULL,
  title VARCHAR(250) NOT NULL, 
  color VARCHAR(250) NOT NULL, 
  PRIMARY KEY (id)
)

CREATE TABLE books (
  id SERIAL NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id),
)