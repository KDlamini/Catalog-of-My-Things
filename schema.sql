-- Create book table
CREATE TABLE Book (
 id SERIAL,
 publish_date DATE NOT NULL DEFAULT CURRENT_DATE,
 publisher VARCHAR(30),
 cover_state CHAR(30),
 archived BOOLEAN,
 genre_id INT,
 label_id INT,
 author_id INT,
 CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
 CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES labels(label_id)
 CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
 PRIMARY KEY(id)
);

-- Create label table

-- Create music album table 

-- Create genre table 

-- Create game table 

-- Create author table