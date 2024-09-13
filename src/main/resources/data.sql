INSERT INTO music_artists (id, name)
VALUES
    -- MUSIC
    (1, 'In Flames'),
    (2, 'Lisa Miskovsky'),
    (3, 'Rihanna'),
    (4, 'Jay-Z'),
    (5, 'Jeezy'),
    (6, 'Slash'),
    (7, 'Will.I.Am'),
    (8, 'Ne-Yo')
;

INSERT INTO music_albums (id, album_name, release_date)
VALUES
    -- Music
    (1, 'Come Clarity', '2006-02-07'),
    (2, 'Rated R', '2009-11-20'),
    (3, 'Good Girl Gone Bad', '2007-05-31')
;

-- INSERT Genres
INSERT INTO music_genres (id, genre, total_likes, total_plays)
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
    (1, 'music', 'Take This Life', 'url1', '2006-02-07', 0, 0, 0),
    (2, 'music','Leeches', 'url2', '2006-02-07', 0, 0, 0),
    (3, 'music', 'Reflect the Storm', 'url3', '2006-02-07', 0, 0, 0),
    (4, 'music', 'Dead End(feat. Lisa Miskovsky', 'url4', '2006-02-07', 0, 0, 0),
    (5, 'music', 'Scream', 'url5', '2006-02-07', 0, 0, 0),
    (6, 'music', 'Come Clarity', 'url6', '2006-02-07', 0, 0, 0),
    (7, 'music', 'Vacuum', 'url7', '2006-02-07', 0, 0, 0),
    (8, 'music', 'Pacing Deaths Trail', 'url8', '2006-02-07', 0, 0, 0),
    (9, 'music', 'Crawl Through Knives', 'url9', '2006-02-07', 0, 0, 0),
    (10, 'music', 'Versus Terminus', 'url10', '2006-02-07', 0, 0, 0),
    (11, 'music', 'Our Infinite Struggle', 'url11', '2006-02-07', 0, 0, 0),
    (12, 'music', 'Vanishing Light', 'url12', '2006-02-07', 0, 0, 0),
    (13, 'music', 'Your Bedtime Story Is Scaring Everyone', 'url13', '2006-02-07', 0, 0, 0),

    (14, 'music', 'Mad House', 'url14', '2009-11-20', 0, 0, 0),
    (15, 'music', 'Wait Your Turn', 'url15', '2009-11-13', 0, 0, 0),
    (16, 'music', 'Hard', 'url16', '2009-11-10', 0, 0, 0),
    (17, 'music', 'Stupid in Love', 'url17', '2009-11-20', 0, 0, 0),
    (18, 'music', 'Rockstar 101', 'url18', '2010-05-18', 0, 0, 0),
    (19, 'music', 'Russian Roulette', 'url19', '2009-12-14', 0, 0, 0),
    (20, 'music', 'Fire Bomb', 'url20', '2009-11-20', 0, 0, 0),
    (21, 'music', 'Rude Boy', 'url21', '2010-02-05', 0, 0, 0),
    (22, 'music', 'Photographs', 'url22', '2009-11-20', 0, 0, 0),
    (23, 'music', 'G4L', 'url23', '2009-11-20', 0, 0, 0),
    (24, 'music', 'Te Amo', 'url24', '2009-06-08', 0, 0, 0),
    (25, 'music', 'Cold Case Love', 'url25', '2009-11-20', 0, 0, 0),
    (26, 'music', 'The Last Song', 'url26', '2009-11-20', 0, 0, 0),

    (27, 'music', 'Umbrella', 'url27', '2007-03-29', 0, 0, 0),
    (28, 'music', 'Push Up on Me', 'url28', '2009-01-27', 0, 0, 0),
    (29, 'music', 'Dont Stop the Music', 'url29', '2007-07-26', 0, 0, 0),
    (30, 'music', 'Breakin Dishes', 'url30', '2007-05-31', 0, 0, 0),
    (31, 'music', 'Shut Up and Drive', 'url31', '2007-06-10', 0, 0, 0),
    (32, 'music', 'Hate That I Love You', 'url32', '2007-08-24', 0, 0, 0),
    (33, 'music', 'Say It', 'url33', '2007-05-31', 0, 0, 0),
    (34, 'music', 'Sell Me Candy', 'url34', '2007-05-31', 0, 0, 0),
    (35, 'music', 'Lemme Get That', 'url35', '2007-05-31', 0, 0, 0),
    (36, 'music', 'Rehab', 'url36', '2008-11-12', 0, 0, 0),
    (37, 'music', 'Question Existing', 'url37', '2009-01-27', 0, 0, 0),
    (38, 'music', 'Good Girl Gone Bad', 'url38', '2007-05-31', 0, 0, 0)
;

INSERT INTO songs_genres (songs_id, genre_id)
VALUES
    -- MUSIC
    -- in flames to metal
    (1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4), (7, 4), (8, 4), (9, 4), (10, 4), (11, 4), (12, 4), (13, 4),

    -- rihanna to pop
    (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2), (25, 2), (26, 2),

    -- rihanna to pop
    (27, 2), (28, 2), (29, 2), (30, 2), (31, 2), (32, 2), (33, 2), (34, 2), (35, 2), (36, 2), (37, 2), (38, 2)
;

-- INSERT Artists
INSERT INTO songs_artists (songs_id, artist_id)
VALUES
    -- MUSIC
    --Come Clarity
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), -- In Flames
    (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), -- In Flames
    (13, 1),
    -- Features
    (4, 2), -- Lisa Miskovsky

    --Rated R
    (14, 3), (15, 3), (16, 3), (17, 3), (18, 3), (19, 3), -- Rihanna
    (20, 3), (21, 3), (22, 3), (23, 3), (24, 3), (25, 3), -- Rihanna
    (26, 3), (27, 3), -- Rihanna
    -- Features
    (16, 5), -- Jeezy
    (18, 6), -- Slash
    (22, 7), -- Will.I.Am

    --Good Girl Gone Bad
    (28, 3), (29, 3), (30, 3), (31, 3), (32, 3), (33, 3), -- Rihanna
    (34, 3), (35, 3), (36, 3), (37, 3), (38, 3), -- Rihanna
    -- Features
    (27, 4), -- Jay-Z
    (32, 8) -- Ne-Yo
;

-- INSERT Albums
INSERT INTO songs_albums (songs_id, album_id)
VALUES
    -- MUSIC
    -- In Flames
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), -- Come Clarity
    (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), -- Come Clarity
    (13, 1), -- Come Clarity

    -- Rihanna
    (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), -- Rated R
    (19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2), -- Rated R
    (25, 2), (26, 2), -- Rated R

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