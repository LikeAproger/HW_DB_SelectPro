INSERT INTO genres (id, name)
    VALUES
        (1, 'jazz'), 
        (2, 'pop-rock'),
        (3, 'r&b'), 
        (4, 'blues'), 
        (5, 'hip-hop');

INSERT INTO singers (id, name)
    VALUES
        (1, 'Joe Cocker'),
        (2, 'Sting'),
        (3, 'Adele'),
        (4, 'Bon Jovi'),
        (5, 'Louis Armstrong'),
        (6, 'Chris Rea'),
        (7, 'Paul McCartney'),
        (8, 'Eminem');

INSERT INTO genres_singers (genre_id, singer_id)
    VALUES
        (1, 1),
        (1, 5),        
        (2, 2),
        (2, 4),
        (2, 6),
        (2, 7),
        (3, 3),
        (4, 1),        
        (4, 6),
        (5, 8);

INSERT INTO albums (id, name, year_of_release)
    VALUES
        (1, 'What a wonderful world', 1968),
        (2, 'Brand new day', 1999),
        (3, '25', 2015),
        (4, 'Crush', 2000),
        (5, 'Cocker', 1986),
        (6, 'The road to hell: part 2', 1999),
        (7, 'Kamikaze', 2018),
        (8, 'Egypt station', 2018);

INSERT INTO singers_albums (singer_id, album_id)
    VALUES
        (1, 5),
        (2, 2),
        (3, 3),
        (4, 4),
        (5, 1),
        (6, 6),
        (7, 8),
        (8, 7);

INSERT INTO tracks (id, name, duration, album_id)
    VALUES
        (1, 'What a wonderful world', '00:02:19', 1),
        (2, 'The sunshine of love', '00:02:53', 1),
        (3, 'Desert rose', '00:04:45', 2),
        (4, 'A thousand years', '00:05:57', 2),
        (5, 'Hello', '00:04:55', 3),
        (6, 'When we were young', '00:04:51', 3),
        (7, 'Its my life', '00:03:44', 4),
        (8, 'One wild night', '00:04:18', 4),
        (9, 'You can leave your hat on', '00:04:14', 5),
        (10, 'I am in my car', '00:04:42', 6),
        (11, 'Good morning', '00:05:23', 6),
        (12, 'The ringer', '00:05:37', 7),
        (13, 'Lucky you', '00:04:04', 7),       
        (14, 'Come on to me', '00:04:11', 8),
        (15, 'Happy with you', '00:03:34', 8);

INSERT INTO collections (id, name, year_of_release)
    VALUES
        (1, 'Jazz collection', 1970),
        (2, 'Rock collection', 2018),
        (3, 'Gold voices xx century', 2000),
        (4, 'RnB collection', 2018),
        (5, 'New classic rock', 2019),
        (6, 'Dancing club', 2000),
        (7, 'For two', 2019),
        (8, 'Road songs', 2021);

INSERT INTO tracks_collections (track_id, collection_id)
    VALUES
        (1, 1),
        (2, 1),
        (9, 1),
        (7, 2),
        (8, 2),
        (9, 2),
        (1, 3),
        (2, 3),
        (3, 3),
        (4, 3),
        (10, 3),
        (11, 3),
        (12, 4),
        (13, 4),
        (14, 5),
        (15, 5),
        (5, 5),
        (1, 6),
        (2, 6), 
        (7, 6),        
        (9, 6),
        (2, 7),        
        (3, 7),
        (5, 7),
        (14, 7),
        (15, 7),
        (10, 8),
        (14, 8);