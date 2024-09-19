-- DROP TABLE IF EXISTS songs_artists;
-- DROP TABLE IF EXISTS songs_albums;
-- DROP TABLE IF EXISTS songs_genres;
-- DROP TABLE IF EXISTS songs;
--
-- DROP TABLE IF EXISTS music_genres;


CREATE TABLE IF NOT EXISTS songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    title VARCHAR(250) NOT NULL,
    url VARCHAR(250) NOT NULL,
    release_date DATE NOT NULL,
    play_counter INT DEFAULT 0,
    likes INT DEFAULT 0,
    dis_likes INT DEFAULT 0
    )
;

-- CREATE TABLE IF NOT EXISTS music_genres (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     genre VARCHAR(255) NOT NULL,
--     total_likes INT DEFAULT 0,
--     total_plays INT DEFAULT 0
--     )
-- ;

CREATE TABLE IF NOT EXISTS genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(255) NOT NULL,
    total_likes INT DEFAULT 0,
    total_plays INT DEFAULT 0
    )
;

-- CREATE TABLE IF NOT EXISTS songs_genres (
--     songs_id INT,
--     genre_id INT,
--     FOREIGN KEY(songs_id) REFERENCES songs(id),
--     FOREIGN KEY(genre_id) REFERENCES music_genres(id)
--     )
-- ;

CREATE TABLE IF NOT EXISTS songs_genres (
    songs_id INT,
    genre_id INT,
    FOREIGN KEY(songs_id) REFERENCES songs(id),
    FOREIGN KEY(genre_id) REFERENCES genres(id)
    )
;

CREATE TABLE IF NOT EXISTS songs_artists (
    songs_id INT,
    artist_id INT,
    FOREIGN KEY(songs_id) REFERENCES songs(id),
    FOREIGN KEY(artist_id) REFERENCES artist(id)
    )
;

CREATE TABLE IF NOT EXISTS songs_albums (
    songs_id INT,
    album_id INT,
    FOREIGN KEY(songs_id) REFERENCES songs(id),
    FOREIGN KEY(album_id) REFERENCES album(id)
    )
;

-- INSERT INTO music_genres (id, genre, total_likes, total_plays)
-- VALUES
--        (1, 'Rock', 0, 0),
--        (2, 'Pop', 0, 0),
--        (3, 'Jazz', 0, 0),
--        (4, 'Metal', 0, 0),
--        (5, 'Hip-Hop', 0, 0),
--        (6, 'RNB', 0, 0),
--        (7, 'EDM', 0, 0),
--        (8, 'Heavy Metal', 0, 0)
-- ;

INSERT INTO genres (id, genre, total_likes, total_plays)
VALUES
    (1, 'Rock', 0, 0),
    (2, 'Pop', 0, 0),
    (3, 'Jazz', 0, 0),
    (4, 'Metal', 0, 0),
    (5, 'Hip-Hop', 0, 0),
    (6, 'RNB', 0, 0),
    (7, 'EDM', 0, 0),
    (8, 'Heavy Metal', 0, 0)
;

INSERT INTO songs (id, type, title, url, release_date, play_counter, likes, dis_likes)
VALUES
    -- MUSIC
    (1, 'Music', 'Take This Life', 'url1', '2006-02-07', 0, 0, 0),
    (2, 'Music', 'Leeches', 'url2', '2006-02-07', 0, 0, 0),
    (3, 'Music', 'Reflect the Storm', 'url3', '2006-02-07', 0, 0, 0),
    (4, 'Music', 'Dead End(feat. Lisa Miskovsky', 'url4', '2006-02-07', 0, 0, 0),
    (5, 'Music', 'Scream', 'url5', '2006-02-07', 0, 0, 0),
    (6, 'Music', 'Come Clarity', 'url6', '2006-02-07', 0, 0, 0),
    (7, 'Music', 'Vacuum', 'url7', '2006-02-07', 0, 0, 0),
    (8, 'Music', 'Pacing Deaths Trail', 'url8', '2006-02-07', 0, 0, 0),
    (9, 'Music', 'Crawl Through Knives', 'url9', '2006-02-07', 0, 0, 0),
    (10, 'Music', 'Versus Terminus', 'url10', '2006-02-07', 0, 0, 0),
    (11, 'Music', 'Our Infinite Struggle', 'url11', '2006-02-07', 0, 0, 0),
    (12, 'Music', 'Vanishing Light', 'url12', '2006-02-07', 0, 0, 0),
    (13, 'Music', 'Your Bedtime Story Is Scaring Everyone', 'url13', '2006-02-07', 0, 0, 0),

    (14, 'Music', 'Mad House', 'url14', '2009-11-20', 0, 0, 0),
    (15, 'Music', 'Wait Your Turn', 'url15', '2009-11-13', 0, 0, 0),
    (16, 'Music', 'Hard', 'url16', '2009-11-10', 0, 0, 0),
    (17, 'Music', 'Stupid in Love', 'url17', '2009-11-20', 0, 0, 0),
    (18, 'Music', 'Rockstar 101', 'url18', '2010-05-18', 0, 0, 0),
    (19, 'Music', 'Russian Roulette', 'url19', '2009-12-14', 0, 0, 0),
    (20, 'Music', 'Fire Bomb', 'url20', '2009-11-20', 0, 0, 0),
    (21, 'Music', 'Rude Boy', 'url21', '2010-02-05', 0, 0, 0),
    (22, 'Music', 'Photographs', 'url22', '2009-11-20', 0, 0, 0),
    (23, 'Music', 'G4L', 'url23', '2009-11-20', 0, 0, 0),
    (24, 'Music', 'Te Amo', 'url24', '2009-06-08', 0, 0, 0),
    (25, 'Music', 'Cold Case Love', 'url25', '2009-11-20', 0, 0, 0),
    (26, 'Music', 'The Last Song', 'url26', '2009-11-20', 0, 0, 0),

    (27, 'Music', 'Umbrella', 'url27', '2007-03-29', 0, 0, 0),
    (28, 'Music', 'Push Up on Me', 'url28', '2009-01-27', 0, 0, 0),
    (29, 'Music', 'Dont Stop the Music', 'url29', '2007-07-26', 0, 0, 0),
    (30, 'Music', 'Breakin Dishes', 'url30', '2007-05-31', 0, 0, 0),
    (31, 'Music', 'Shut Up and Drive', 'url31', '2007-06-10', 0, 0, 0),
    (32, 'Music', 'Hate That I Love You', 'url32', '2007-08-24', 0, 0, 0),
    (33, 'Music', 'Say It', 'url33', '2007-05-31', 0, 0, 0),
    (34, 'Music', 'Sell Me Candy', 'url34', '2007-05-31', 0, 0, 0),
    (35, 'Music', 'Lemme Get That', 'url35', '2007-05-31', 0, 0, 0),
    (36, 'Music', 'Rehab', 'url36', '2008-11-12', 0, 0, 0),
    (37, 'Music', 'Question Existing', 'url37', '2009-01-27', 0, 0, 0),
    (38, 'Music', 'Good Girl Gone Bad', 'url38', '2007-05-31', 0, 0, 0)
;

INSERT INTO songs_genres (songs_id, genre_id)
VALUES
    -- MUSIC
    -- in flames to metal
    (1, 4),
    (2, 4),
    (3, 4),
    (4, 4),
    (5, 4),
    (6, 4),
    (7, 4),
    (8, 4),
    (9, 4),
    (10, 4),
    (11, 4),
    (12, 4),
    (13, 4),

    -- rihanna to pop
    (14, 2),
    (15, 2),
    (16, 2),
    (17, 2),
    (18, 2),
    (19, 2),
    (20, 2),
    (21, 2),
    (22, 2),
    (23, 2),
    (24, 2),
    (25, 2),
    (26, 2),

    -- rihanna to pop
    (27, 2),
    (28, 2),
    (29, 2),
    (30, 2),
    (31, 2),
    (32, 2),
    (33, 2),
    (34, 2),
    (35, 2),
    (36, 2),
    (37, 2),
    (38, 2)
;

-- INSERT Artists
INSERT INTO songs_artists (songs_id, artist_id)
VALUES
    -- MUSIC
    --Come Clarity
    (1, 1),  -- In Flames
    (2, 1),  -- In Flames
    (3, 1),  -- In Flames
    (4, 1),  -- In Flames
    (5, 1),  -- In Flames
    (6, 1),  -- In Flames
    (7, 1),  -- In Flames
    (8, 1),  -- In Flames
    (9, 1),  -- In Flames
    (10, 1), -- In Flames
    (11, 1), -- In Flames
    (12, 1), -- In Flames
    (13, 1), -- In Flames
    -- Features
    (4, 2),  -- Lisa Miskovsky

    --Rated R
    (14, 3), -- Rihanna
    (15, 3), -- Rihanna
    (16, 3), -- Rihanna
    (17, 3), -- Rihanna
    (18, 3), -- Rihanna
    (19, 3), -- Rihanna
    (20, 3), -- Rihanna
    (21, 3), -- Rihanna
    (22, 3), -- Rihanna
    (23, 3), -- Rihanna
    (24, 3), -- Rihanna
    (25, 3), -- Rihanna
    (26, 3), -- Rihanna
    (27, 3), -- Rihanna
    -- Features
    (16, 5), -- Jeezy
    (18, 6), -- Slash
    (22, 7), -- Will.I.Am

    --Good Girl Gone Bad
    (28, 3), -- Rihanna
    (29, 3), -- Rihanna
    (30, 3), -- Rihanna
    (31, 3), -- Rihanna
    (32, 3), -- Rihanna
    (33, 3), -- Rihanna
    (34, 3), -- Rihanna
    (35, 3), -- Rihanna
    (36, 3), -- Rihanna
    (37, 3), -- Rihanna
    (38, 3), -- Rihanna
    -- Features
    (27, 4), -- Jay-Z
    (32, 8) -- Ne-Yo
;

-- INSERT Albums
INSERT INTO songs_albums (songs_id, album_id)
VALUES
    -- MUSIC
    -- In Flames
    (1, 1),  -- Come Clarity
    (2, 1),  -- Come Clarity
    (3, 1),  -- Come Clarity
    (4, 1),  -- Come Clarity
    (5, 1),  -- Come Clarity
    (6, 1),  -- Come Clarity
    (7, 1),  -- Come Clarity
    (8, 1),  -- Come Clarity
    (9, 1),  -- Come Clarity
    (10, 1), -- Come Clarity
    (11, 1), -- Come Clarity
    (12, 1), -- Come Clarity
    (13, 1), -- Come Clarity

    -- Rihanna
    (13, 2), -- Rated R
    (14, 2), -- Rated R
    (15, 2), -- Rated R
    (16, 2), -- Rated R
    (17, 2), -- Rated R
    (18, 2), -- Rated R
    (19, 2), -- Rated R
    (20, 2), -- Rated R
    (21, 2), -- Rated R
    (22, 2), -- Rated R
    (23, 2), -- Rated R
    (24, 2), -- Rated R
    (25, 2), -- Rated R
    (26, 2), -- Rated R

    -- Rihanna
    (27, 3), -- Good Girl Gone Bad
    (28, 3), -- Good Girl Gone Bad
    (29, 3), -- Good Girl Gone Bad
    (30, 3), -- Good Girl Gone Bad
    (31, 3), -- Good Girl Gone Bad
    (32, 3), -- Good Girl Gone Bad
    (33, 3), -- Good Girl Gone Bad
    (34, 3), -- Good Girl Gone Bad
    (35, 3), -- Good Girl Gone Bad
    (36, 3), -- Good Girl Gone Bad
    (37, 3), -- Good Girl Gone Bad
    (38, 3) -- Good Girl Gone Bad
;