CREATE TABLE Book (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    author_id INTEGER,
    label_id INTEGER,
    publish_date DATE,
    archive BOOLEAN,
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE Label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    color VARCHAR(50)
)
