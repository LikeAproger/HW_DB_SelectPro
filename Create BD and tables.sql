psql CREATE USER user1 with PASSWORD 'pass1';

CREATE DATABASE musicsite WITH OWNER user1;

CREATE TABLE genres (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(40) NOT NULL);

CREATE TABLE singers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(70) NOT NULL,	                                
	);

CREATE TABLE genres_singers (
    genre_id INTEGER REFERENCES genres(id),    
    singer_id INTEGER REFERENCES singers(id),
    CONSTRAINT genre_singer_pk PRIMARY KEY(genres_id, singer_id)    
    );

CREATE TABLE albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	year_of_release INTEGER NOT NULL CHECK(year_of_release >= 1700 and year_of_release <= 2022),	                                    
	);
	
CREATE TABLE singers_albums (
    singer_id INTEGER REFERENCES singers(id),
    album_id INTEGER REFERENCES albums(id),
    CONSTRAINT singer_album PRIMARY KEY(singer_id, album_id)
    );

CREATE TABLE tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	duration TIME NOT NULL,
	album_id INTEGER REFERENCES albums(id)
	);

CREATE TABLE collections (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    year_of_release INTEGER NOT NULL CHECK(year_of_release >= 1700 and year_of_release <= 2022)
    );

CREATE TABLE tracks_collections (
    track_id INTEGER REFERENCES tracks(id),
    collection_id INTEGER REFERENCES collections(id),
    CONSTRAINT track_collection_id PRIMARY KEY(track_id, collection_id)    
    );