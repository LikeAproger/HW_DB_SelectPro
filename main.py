from sqlalchemy import create_engine
from pprint import pprint


engine = create_engine(
    'postgresql://user1:pass1@localhost:5432/musicsite')
connection = engine.connect()


#1 Количество исполнителей в каждом жанре
select_1 = connection.execute("""
    SELECT genres.name,COUNT(singers.name) FROM singers
    JOIN Genres_Singers ON singers.id = Genres_Singers.singer_id
    JOIN genres ON Genres_Singers.genre_id = genres.id
    GROUP BY genres.name;
    """).fetchall()
pprint(select_1)


#2 количество треков, вошедших в альбомы 2018-2020 годов
select_2 = connection.execute("""
    SELECT COUNT(id) FROM tracks
    WHERE album_id IN (SELECT id FROM albums
                        WHERE year_of_release BETWEEN 2018 AND 2020)
    """).fetchall()
pprint(select_2)


#3  средняя продолжительность треков по каждому альбому;
select_3 = connection.execute("""
    SELECT albums.name,AVG(tracks.duration) FROM albums
    JOIN tracks ON albums.id = tracks.album_id
    GROUP BY albums.name;
    """).fetchall()
pprint(select_3)


#4 все исполнители, которые не выпустили альбомы в 2020 году;
select_4 = connection.execute("""
    SELECT singers.name,albums.year_of_release FROM albums
    JOIN singers_albums ON albums.id = singers_albums.album_id
    JOIN singers ON singers_albums.singer_id = singers.id
    WHERE albums.year_of_release != 2020;
    """).fetchall()
pprint(select_4)


#5 названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select_5 = connection.execute("""
        SELECT collections.name FROM collections
        JOIN tracs_collections ON collections.id = tracs_collections.collection_id
        JOIN tracks ON tracs_collections.track_id = tracks.id
        JOIN albums ON tracks.id = albums.id
        JOIN singers_albums ON albums.id = singers_albums.album_id
        JOIN singers ON singers_albums.singer_id = singers.id
        WHERE singers.name LIKE 'Eminem';
        """).fetchall()
pprint(select_5)


#6 название альбомов, в которых присутствуют исполнители более 1 жанра;
select_6 = connection.execute("""
        SELECT albums.name FROM albums
        JOIN singers_albums ON albums.id = singers_albums.album_id
        JOIN singers ON singers_albums.singer_id = singers.id
        JOIN genres_singers ON singers.id = genres_singers.singer_id
        GROUP BY singers.name, albums.name
        HAVING count(genres_singers.genre_id) > 1;
        """).fetchall()
pprint(select_6)


#7 наименование треков, которые не входят в сборники;
select_7 = connection.execute("""
        SELECT tracks.name FROM tracks
        LEFT JOIN tracs_collections ON tracks.id = tracs_collections.track_id
        WHERE tracs_collections.track_id IS NULL;
        """).fetchall()
pprint(select_7)


#8 исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select_8 = connection.execute("""
        SELECT singers.name, tracks.duration FROM singers
        JOIN singers_albums ON singers.id = singers_albums.singer_id
        JOIN albums ON singers_albums.album_id = albums.id
        JOIN tracks ON albums.id = tracks.album_id
        WHERE tracks.duration IN (SELECT MIN(duration) FROM tracks)
        """).fetchall()
pprint(select_8)


#9 название альбомов, содержащих наименьшее количество треков.
select_9 = connection.execute('''
    SELECT albums.name, COUNT(tracks.id) FROM albums
    JOIN tracks ON albums.id = tracks.album_id
    GROUP BY albums.name 
    HAVING count(tracks.id) in (
        SELECT COUNT (tracks.id)
        FROM albums
        JOIN tracks ON albums.id = tracks.album_id
        GROUP BY albums.name
        ORDER BY count(tracks.id)
        LIMIT 1)
    ''').fetchall()
pprint(select_9)
