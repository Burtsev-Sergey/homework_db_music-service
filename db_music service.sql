-- Создаем таблицу Жанры

CREATE TABLE IF NOT EXISTS Genre (
        id SERIAL PRIMARY KEY,
        genre VARCHAR(20) NOT NULL
);

-- Создаем таблицу Исполнители

CREATE TABLE IF NOT EXISTS Singer (
       id SERIAL PRIMARY KEY,
       name VARCHAR(20) NOT NULL
);

-- Создаем таблицу связывающую тавлицы Жанры и Исполнители

CREATE TABLE IF NOT EXISTS GenreSinger (
	   genre_id INTEGER REFERENCES Genre(id),
	   singer_id INTEGER REFERENCES Singer(id),
	   CONSTRAINT pk PRIMARY KEY (genre_id, singer_id)
);

-- Создаем таблицу Альбомы

CREATE TABLE IF NOT EXISTS Album (
        id SERIAL PRIMARY KEY,
        album VARCHAR(80) NOT NULL,
        yearrelease INTEGER NOT NULL  
);

-- Создаем таблицу связывающую тавлицы Альбомы и Исполнители

CREATE TABLE IF NOT EXISTS AlbumSinger (
	   album_id INTEGER REFERENCES Album(id),
	   singer_id INTEGER REFERENCES Singer(id),
	   CONSTRAINT pk1 PRIMARY KEY (album_id, singer_id)
);

-- Создаем таблицу Треки

CREATE TABLE IF NOT EXISTS Track (
        id INTEGER PRIMARY key REFERENCES Album(id),
        id SERIAL PRIMARY KEY,
        track VARCHAR(80) NOT NULL,
        time NUMERIC(3,2) NOT NULL   
);

-- Создаем таблицу Сборники

CREATE TABLE IF NOT EXISTS Collection (
       id SERIAL PRIMARY KEY,
       name VARCHAR(20) NOT null,
       yearrelease INTEGER NOT NULL
);

-- Создаем таблицу связывающую тавлицы Сборники и Треки

CREATE TABLE IF NOT EXISTS CollectionTrack (
	   collection_id INTEGER REFERENCES Collection(id),
	   track_id INTEGER REFERENCES Track(id),
	   CONSTRAINT pk2 PRIMARY KEY (collection_id, track_id)
);