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
    author_id INT,
    label_id INT,

    PRIMARY KEY (id),
    CONSTRAINT fk_genres
        FOREIGN KEY (genres_id)
            REFERENCES genres(id),
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
            REFERENCES  author(id),
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