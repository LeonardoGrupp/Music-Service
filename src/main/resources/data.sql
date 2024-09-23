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

CREATE TABLE IF NOT EXISTS genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(255) NOT NULL,
    total_likes INT DEFAULT 0,
    total_plays INT DEFAULT 0
    )
;

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
    -- In Flames songs for Come Clarity
    (1, 'Music', 'Take This Life', 'url1', '2006-02-07', 0, 0, 0), (2, 'Music', 'Leeches', 'url2', '2006-02-07', 0, 0, 0), (3, 'Music', 'Reflect the Storm', 'url3', '2006-02-07', 0, 0, 0), (4, 'Music', 'Dead End(feat. Lisa Miskovsky', 'url4', '2006-02-07', 0, 0, 0), (5, 'Music', 'Scream', 'url5', '2006-02-07', 0, 0, 0), (6, 'Music', 'Come Clarity', 'url6', '2006-02-07', 0, 0, 0), (7, 'Music', 'Vacuum', 'url7', '2006-02-07', 0, 0, 0), (8, 'Music', 'Pacing Deaths Trail', 'url8', '2006-02-07', 0, 0, 0), (9, 'Music', 'Crawl Through Knives', 'url9', '2006-02-07', 0, 0, 0), (10, 'Music', 'Versus Terminus', 'url10', '2006-02-07', 0, 0, 0), (11, 'Music', 'Our Infinite Struggle', 'url11', '2006-02-07', 0, 0, 0), (12, 'Music', 'Vanishing Light', 'url12', '2006-02-07', 0, 0, 0), (13, 'Music', 'Your Bedtime Story Is Scaring Everyone', 'url13', '2006-02-07', 0, 0, 0),

    -- Rihanna songs for Rated R
    (14, 'Music', 'Mad House', 'url14', '2009-11-20', 0, 0, 0), (15, 'Music', 'Wait Your Turn', 'url15', '2009-11-13', 0, 0, 0), (16, 'Music', 'Hard', 'url16', '2009-11-10', 0, 0, 0), (17, 'Music', 'Stupid in Love', 'url17', '2009-11-20', 0, 0, 0), (18, 'Music', 'Rockstar 101', 'url18', '2010-05-18', 0, 0, 0), (19, 'Music', 'Russian Roulette', 'url19', '2009-12-14', 0, 0, 0), (20, 'Music', 'Fire Bomb', 'url20', '2009-11-20', 0, 0, 0), (21, 'Music', 'Rude Boy', 'url21', '2010-02-05', 0, 0, 0), (22, 'Music', 'Photographs', 'url22', '2009-11-20', 0, 0, 0), (23, 'Music', 'G4L', 'url23', '2009-11-20', 0, 0, 0), (24, 'Music', 'Te Amo', 'url24', '2009-06-08', 0, 0, 0), (25, 'Music', 'Cold Case Love', 'url25', '2009-11-20', 0, 0, 0), (26, 'Music', 'The Last Song', 'url26', '2009-11-20', 0, 0, 0),

    -- Rihanna Songs for Good Girl Gone Bad
    (27, 'Music', 'Umbrella', 'url27', '2007-03-29', 0, 0, 0), (28, 'Music', 'Push Up on Me', 'url28', '2009-01-27', 0, 0, 0), (29, 'Music', 'Dont Stop the Music', 'url29', '2007-07-26', 0, 0, 0), (30, 'Music', 'Breakin Dishes', 'url30', '2007-05-31', 0, 0, 0), (31, 'Music', 'Shut Up and Drive', 'url31', '2007-06-10', 0, 0, 0), (32, 'Music', 'Hate That I Love You', 'url32', '2007-08-24', 0, 0, 0), (33, 'Music', 'Say It', 'url33', '2007-05-31', 0, 0, 0), (34, 'Music', 'Sell Me Candy', 'url34', '2007-05-31', 0, 0, 0), (35, 'Music', 'Lemme Get That', 'url35', '2007-05-31', 0, 0, 0), (36, 'Music', 'Rehab', 'url36', '2008-11-12', 0, 0, 0), (37, 'Music', 'Question Existing', 'url37', '2009-01-27', 0, 0, 0), (38, 'Music', 'Good Girl Gone Bad', 'url38', '2007-05-31', 0, 0, 0),

    -- D'Angelo Songs for Voodoo
    (39, 'Music', 'Playa Playa', 'url78', 'release', 0, 0, 0), (40, 'Music', 'Devils Pie', 'url79', 'release', 0, 0, 0), (41, 'Music', 'Left & Right (featuring Method Man & Redman', 'url80', 'release', 0, 0, 0), (42, 'Music', 'The Line', 'url81', 'release', 0, 0, 0), (43, 'Music', 'Send It On', 'url82', 'release', 0, 0, 0), (44, 'Music', 'Chicken Grease', 'url83', 'release', 0, 0, 0), (45, 'Music', 'One Mo''gin', 'url84', 'release', 0, 0, 0), (46, 'Music', 'The Root', 'url85', 'release', 0, 0, 0), (47, 'Music', 'Spanish Joint', 'url86', 'release', 0, 0, 0), (48, 'Music', 'Feel Like Makin Love', 'url87', 'release', 0, 0, 0), (49, 'Music', 'Greatdayndamornin/Booty', 'url88', 'release', 0, 0, 0), (50, 'Music', 'Untitled (How Does It Feel)', 'url89', 'release', 0, 0, 0), (51, 'Music', 'Africa', 'url90', 'release', 0, 0, 0),

    -- Frank Ocean Songs for Channel Orange
    (52, 'Music', 'Start', 'url91', 'release', 0, 0, 0), (53, 'Music', 'Thinkin Bout You', 'url92', 'release', 0, 0, 0), (54, 'Music', 'Fertilizer', 'url93', 'release', 0, 0, 0), (55, 'Music', 'Sierra Leona', 'url94', 'release', 0, 0, 0), (56, 'Music', 'Sweet Life', 'url95', 'release', 0, 0, 0), (57, 'Music', 'Not Just Money', 'url96', 'release', 0, 0, 0), (58, 'Music', 'Super Rich Kids (featuring Earl Sweatshirt)', 'url97', 'release', 0, 0, 0), (59, 'Music', 'Pilot Jones', 'url98', 'release', 0, 0, 0), (60, 'Music', 'Crack Rock', 'url99', 'release', 0, 0, 0), (61, 'Music', 'Pyramids', 'url100', 'release', 0, 0, 0), (62, 'Music', 'Lost', 'url101', 'release', 0, 0, 0), (63, 'Music', 'White (featuring John Mayer)', 'url102', 'release', 0, 0, 0), (64, 'Music', 'Monks', 'url103', 'release', 0, 0, 0), (65, 'Music', 'Bad Religion', 'url104', 'release', 0, 0, 0), (66, 'Music', 'Pink Matter (featuring André 3000', 'url105', 'release', 0, 0, 0), (67, 'Music', 'Forrest Gump', 'url106', 'release', 0, 0, 0), (68, 'Music', 'End', 'url107', 'release', 0, 0, 0),

    -- Lauryn Hill Songs for The Miseducation of Lauryn Hill
    (69, 'Music', 'Intro','url108', 'release', 0, 0, 0), (70, 'Music', 'Lost Ones','url109', 'release', 0, 0, 0), (71, 'Music', 'Ex-Factor','url110', 'release', 0, 0, 0), (72, 'Music', 'To Zion (featuring Carlos Santana)','url111', 'release', 0, 0, 0), (73, 'Music', 'Doo Wop (That Thing)','url112', 'release', 0, 0, 0), (74, 'Music', 'Superstar','url113', 'release', 0, 0, 0), (75, 'Music', 'Final Hour','url114', 'release', 0, 0, 0), (76, 'Music', 'When It Hurts So Bad','url115', 'release', 0, 0, 0), (77, 'Music', 'I Used to Love Him (featuring Mary J. Blige)','url116', 'release', 0, 0, 0), (78, 'Music', 'Forgive Them Father','url117', 'release', 0, 0, 0), (79, 'Music', 'Every Ghetto, Every City','url118', 'release', 0, 0, 0), (80, 'Music', 'Nothing Even Matters (featuring D''Angelo','url119', 'release', 0, 0, 0), (81, 'Music', 'Everything Is Everything','url120', 'release', 0, 0, 0), (82, 'Music', 'The Miseducation of Lauryn Hill','url121', 'release', 0, 0, 0), (83, 'Music', 'Cant Take My Eyes Of You','url122', 'release', 0, 0, 0), (84, 'Music', 'Tell Him','url123', 'release', 0, 0, 0),

    -- Maxwell Songs for Maxwell's Urban Hang Suite
    (85, 'Music', 'The Urban Theme','url124', 'release', 0, 0, 0), (86, 'Music', 'Welcome','url125', 'release', 0, 0, 0), (87, 'Music', 'Sumthin'' Sumthin''','url126', 'release', 0, 0, 0), (88, 'Music', 'Ascension (Dont Ever Wonder)','url127', 'release', 0, 0, 0), (89, 'Music', 'Dancewitme','url128', 'release', 0, 0, 0), (90, 'Music', '...Til the Cops Come Knockin','url129', 'release', 0, 0, 0), (91, 'Music', 'Whenever Wherever Whatever','url130', 'release', 0, 0, 0), (92, 'Music', 'Lonely''s the Only Company (I & II)','url131', 'release', 0, 0, 0), (93, 'Music', 'Reunion','url132', 'release', 0, 0, 0), (94, 'Music', 'Suitelady (The Proposal Jam)','url133', 'release', 0, 0, 0), (95, 'Music', 'The Suite Theme','url134', 'release', 0, 0, 0),

    -- Marvin Gaye Songs for What's Going On
    (96, 'Music', 'Whats Going On','url135', 'release', 0, 0, 0), (97, 'Music', 'Whats Happening Brother','url136', 'release', 0, 0, 0), (98, 'Music', 'Flyin'' High (In the Friendly Sky)','url137', 'release', 0, 0, 0), (99, 'Music', 'Save the Children','url138', 'release', 0, 0, 0), (100, 'Music', 'God Is Love','url139', 'release', 0, 0, 0), (101, 'Music', 'Mercy Mercy Me (The Ecology)','url140', 'release', 0, 0, 0), (102, 'Music', 'Right On','url141', 'release', 0, 0, 0), (103, 'Music', 'Wholy Holy','url142', 'release', 0, 0, 0), (104, 'Music', 'Inner City Blues (Make Me Wanna Holler)','url143', 'release', 0, 0, 0), (105, 'Music', 'God Is Love','url144', 'release', 0, 0, 0), (106, 'Music', 'Sad Tomorrows','url145', 'release', 0, 0, 0),

    -- Janelle Monae songs for The Electric Lady
    (107, 'Music', 'Suite IV Electric Overture','url146', 'release', 0, 0, 0), (108, 'Music', 'Givin Em What They Love (featuring Prince)','url147', 'release', 0, 0, 0), (109, 'Music', 'Q.U.E.E.N (featuring Erykah Badu)','url148', 'release', 0, 0, 0), (110, 'Music', 'Electric Lady (featuring Solange)','url149', 'release', 0, 0, 0), (111, 'Music', 'Good Morning Midnight (Interlude)','url150', 'release', 0, 0, 0), (112, 'Music', 'PrimeTime (featuring Miguel)','url151', 'release', 0, 0, 0), (113, 'Music', 'We Were Rock & Roll','url152', 'release', 0, 0, 0), (114, 'Music', 'The Chrome Shoppe (Interlude)','url153', 'release', 0, 0, 0), (115, 'Music', 'Dance Apocalyptic','url154', 'release', 0, 0, 0), (116, 'Music', 'Look into My Eyes','url155', 'release', 0, 0, 0), (117, 'Music', 'Suite V Electric Overture','url156', 'release', 0, 0, 0), (118, 'Music', 'It''s Code','url157', 'release', 0, 0, 0), (119, 'Music', 'Ghetto Woman','url158', 'release', 0, 0, 0), (120, 'Music', 'Our Favorite Fugitive (Interlude)','url159', 'release', 0, 0, 0), (121, 'Music', 'Victory','url160', 'release', 0, 0, 0), (122, 'Music', 'Can''t Live Without Your Love','url161', 'release', 0, 0, 0), (123, 'Music', 'Sally Ride','url162', 'release', 0, 0, 0), (124, 'Music', 'Dorothy Dandridge Eyes (featuring Esperanza Spalding)','url163', 'release', 0, 0, 0), (125, 'Music', 'What an Experience','url164', 'release', 0, 0, 0),

    -- Usher songs for Confessions
    (126, 'Music', 'Intro','url165', 'release', 0, 0, 0), (127, 'Music', 'Yeah! (featuring Lil John and Ludacris)','url166', 'release', 0, 0, 0), (128, 'Music', 'Throwback','url167', 'release', 0, 0, 0), (129, 'Music', 'Confessions (Interlude)','url168', 'release', 0, 0, 0), (130, 'Music', 'Confessions Part II','url169', 'release', 0, 0, 0), (131, 'Music', 'Burn','url170', 'release', 0, 0, 0), (132, 'Music', 'Caught Up','url171', 'release', 0, 0, 0), (133, 'Music', 'Superstar (Interlude)','url172', 'release', 0, 0, 0), (134, 'Music', 'Superstar','url173', 'release', 0, 0, 0), (135, 'Music', 'Truth Hurts','url174', 'release', 0, 0, 0), (136, 'Music', 'Simple Things','url175', 'release', 0, 0, 0), (137, 'Music', 'Bad Girl','url176', 'release', 0, 0, 0), (138, 'Music', 'Thats What Its Made For','url177', 'release', 0, 0, 0), (139, 'Music', 'Can U Handle It','url178', 'release', 0, 0, 0), (140, 'Music', 'Do It to Me','url179', 'release', 0, 0, 0), (141, 'Music', 'Take Your Hand','url180', 'release', 0, 0, 0), (142, 'Music', 'Follow Me','url181', 'release', 0, 0, 0), (143, 'Music', 'Whatever I Want','url182', 'release', 0, 0, 0), (144, 'Music', 'Confessions Part I','url183', 'release', 0, 0, 0),

    -- John Legend songs for Get Lifted
    (145, 'Music', 'Prelude','url184', 'release', 0, 0, 0), (146, 'Music', 'Lets Get Lifted','url185', 'release', 0, 0, 0), (147, 'Music', 'Used to Love U','url186', 'release', 0, 0, 0), (148, 'Music', 'Alright','url187', 'release', 0, 0, 0), (149, 'Music', 'She Dont Have to Know','url188', 'release', 0, 0, 0), (150, 'Music', 'Number One (featuring Kanye West)','url189', 'release', 0, 0, 0), (151, 'Music', 'I Can Change (featuring Snoop Dogg','url190', 'release', 0, 0, 0), (152, 'Music', 'Ordinary People','url191', 'release', 0, 0, 0), (153, 'Music', 'Stay With You','url192', 'release', 0, 0, 0), (154, 'Music', 'Lets Get Lifted Again','url193', 'release', 0, 0, 0), (155, 'Music', 'So High','url194', 'release', 0, 0, 0), (156, 'Music', 'Refuge (When Its Cold Outside)','url195', 'release', 0, 0, 0), (157, 'Music', 'It Dont Have to Change (featuring The Stephens Family)','url196', 'release', 0, 0, 0), (158, 'Music', 'Live Ut Up (featuring Miri Ben-Ari)','url197', 'release', 0, 0, 0),

    -- Porter Robinson songs for Nurture
    (159, 'Music', 'Lifelike','url198', 'release', 0, 0, 0), (160, 'Music', 'Look at the Sky','url199', 'release', 0, 0, 0), (161, 'Music', 'Get Your Wish','url200', 'release', 0, 0, 0), (162, 'Music', 'Wind Tempos','url201', 'release', 0, 0, 0), (163, 'Music', 'Musician','url202', 'release', 0, 0, 0), (164, 'Music', 'Do-re-mi-fa-so-la-ti-do','url203', 'release', 0, 0, 0), (165, 'Music', 'Mother','url204', 'release', 0, 0, 0), (166, 'Music', 'Dullscythe','url205', 'release', 0, 0, 0), (167, 'Music', 'Sweet Time','url206', 'release', 0, 0, 0), (168, 'Music', 'Mirror','url207', 'release', 0, 0, 0), (169, 'Music', 'Something Comforting','url208', 'release', 0, 0, 0), (170, 'Music', 'Blossom','url209', 'release', 0, 0, 0), (171, 'Music', 'Unfold','url210', 'release', 0, 0, 0), (172, 'Music', 'Trying to Feel Alive','url211', 'release', 0, 0, 0),

    -- Zed songs for True Colors
    (173, 'Music', 'Addicted to a Memory (featuring Bahari)','url212', 'release', 0, 0, 0), (174, 'Music', 'I Want You to Know (featuring Selena Gomez)','url213', 'release', 0, 0, 0), (175, 'Music', 'Beautiful Now (featuring Jon Bellion)','url214', 'release', 0, 0, 0), (176, 'Music', 'Transmission (featuring Logic and X Ambassadors','url215', 'release', 0, 0, 0), (177, 'Music', 'Done with Love','url216', 'release', 0, 0, 0), (178, 'Music', 'True Colors','url217', 'release', 0, 0, 0), (179, 'Music', 'Straight into the Fire','url218', 'release', 0, 0, 0), (180, 'Music', 'Papercut (featuring Troye Sivan)','url219', 'release', 0, 0, 0), (181, 'Music', 'Bumble Bee','url220', 'release', 0, 0, 0), (182, 'Music', 'Daisy','url221', 'release', 0, 0, 0), (183, 'Music', 'Illusion (featuring Echosmith)','url222', 'release', 0, 0, 0), (184, 'Music', 'Stay the Night (featuring Hayley Williams)','url223', 'release', 0, 0, 0), (185, 'Music', 'Find You (featuring Matthew Koma and Miriam Bryant)','url224', 'release', 0, 0, 0), (186, 'Music', 'Clarity (featuring Foxes)','url225', 'release', 0, 0, 0), (187, 'Music', 'Rude','url226', 'release', 0, 0, 0), (188, 'Music', 'Alive','url227', 'release', 0, 0, 0),

    -- Avicii songs for True
    (189, 'Music', 'Wake Me Up','url228', 'release', 0, 0, 0), (190, 'Music', 'You Make Me','url229', 'release', 0, 0, 0), (191, 'Music', 'Hey Brother','url230', 'release', 0, 0, 0), (192, 'Music', 'Addicted to You','url231', 'release', 0, 0, 0), (193, 'Music', 'Dear Boy','url232', 'release', 0, 0, 0), (194, 'Music', 'Liar Liar','url233', 'release', 0, 0, 0), (195, 'Music', 'Shame on Me','url234', 'release', 0, 0, 0), (196, 'Music', 'Lay Me Down','url235', 'release', 0, 0, 0), (197, 'Music', 'Hope There''s Someone','url236', 'release', 0, 0, 0), (198, 'Music', 'Heart Upon My Sleeve','url237', 'release', 0, 0, 0), (199, 'Music', 'Canyons','url238', 'release', 0, 0, 0), (200, 'Music', 'All You Need Is Love','url239', 'release', 0, 0, 0),

    -- Madeon songs for Good Faith
    (201, 'Music', 'Dream Dream Dream','url240', 'release', 0, 0, 0), (202, 'Music', 'All My Friends','url241', 'release', 0, 0, 0), (203, 'Music', 'Be Fine','url242', 'release', 0, 0, 0), (204, 'Music', 'Nirvana','url243', 'release', 0, 0, 0), (205, 'Music', 'Mania','url244', 'release', 0, 0, 0), (206, 'Music', 'Miracle','url245', 'release', 0, 0, 0), (207, 'Music', 'No Fear No More','url246', 'release', 0, 0, 0), (208, 'Music', 'Hold Me Just Because','url247', 'release', 0, 0, 0), (209, 'Music', 'Heavy with Hoping','url248', 'release', 0, 0, 0), (210, 'Music', 'Borealis','url249', 'release', 0, 0, 0),

    -- Avicii songs for Stories
    (211, 'Music', 'Waiting for Love','url250', 'release', 0, 0, 0), (212, 'Music', 'Talk to Myself','url251', 'release', 0, 0, 0), (213, 'Music', 'Touch Me','url252', 'release', 0, 0, 0), (214, 'Music', 'Ten More Days','url253', 'release', 0, 0, 0), (215, 'Music', 'For a Better Day','url254', 'release', 0, 0, 0), (216, 'Music', 'Broken Arrows','url255', 'release', 0, 0, 0), (217, 'Music', 'True Believer','url256', 'release', 0, 0, 0), (218, 'Music', 'City Lights','url257', 'release', 0, 0, 0), (219, 'Music', 'Pure Grinding','url258', 'release', 0, 0, 0), (220, 'Music', 'Sunset Jesus','url259', 'release', 0, 0, 0), (221, 'Music', 'Cant Catch Me','url260', 'release', 0, 0, 0), (222, 'Music', 'Somewhere in Stockholm','url261', 'release', 0, 0, 0), (223, 'Music', 'Trouble','url262', 'release', 0, 0, 0), (224, 'Music', 'Gonna Love Ya','url263', 'release', 0, 0, 0),

    -- Porter Robinson songs for Worlds
    (225, 'Music', 'Divinity (featuring Amy Millan)','url263', 'release', 0, 0, 0), (226, 'Music', 'Sad Machine','url264', 'release', 0, 0, 0), (227, 'Music', 'Years of War (featuring Breanne Düren and Sean Caskey)','url265', 'release', 0, 0, 0), (228, 'Music', 'Flicker','url266', 'release', 0, 0, 0), (229, 'Music', 'Fresh Static Snow','url267', 'release', 0, 0, 0), (230, 'Music', 'Polygon Dust (featuring Lemaitre)','url268', 'release', 0, 0, 0), (231, 'Music', 'Hear the Bells (featuring Imaginary Cities)','url269', 'release', 0, 0, 0), (232, 'Music', 'Natural Light','url270', 'release', 0, 0, 0), (233, 'Music', 'Lionhearted (featuring Urban Cone)','url271', 'release', 0, 0, 0), (234, 'Music', 'Sea of Voices','url272', 'release', 0, 0, 0), (235, 'Music', 'Fellow Feeling','url273', 'release', 0, 0, 0), (236, 'Music', 'Goodbye to a World','url274', 'release', 0, 0, 0),

    -- Kygo
    (237, 'Music', 'Never Let You Go','url275', 'release', 0, 0, 0),
    (238, 'Music', 'Sunrise','url276', 'release', 0, 0, 0),
    (239, 'Music', 'Riding Shotgun','url277', 'release', 0, 0, 0),
    (240, 'Music', 'Stranger Things','url278', 'release', 0, 0, 0),
    (241, 'Music', 'With You','url279', 'release', 0, 0, 0),
    (242, 'Music', 'Kids in Love','url280', 'release', 0, 0, 0),
    (243, 'Music', 'Permanent','url281', 'release', 0, 0, 0),
    (244, 'Music', 'I See You','url282', 'release', 0, 0, 0),
    (245, 'Music', 'Stargazing','url283', 'release', 0, 0, 0),
    (246, 'Music', 'It Aint Me','url284', 'release', 0, 0, 0),
    (247, 'Music', 'First Time','url285', 'release', 0, 0, 0),
    (248, 'Music', 'This Town','url286', 'release', 0, 0, 0)
;

INSERT INTO songs_genres (songs_id, genre_id)
VALUES
    -- MUSIC
    -- in flames to metal
    (1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4), (7, 4), (8, 4), (9, 4), (10, 4), (11, 4), (12, 4), (13, 4),

    -- rihanna to pop
    (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2), (25, 2), (26, 2),

    -- rihanna to pop
    (27, 2), (28, 2), (29, 2), (30, 2), (31, 2), (32, 2), (33, 2), (34, 2), (35, 2), (36, 2), (37, 2), (38, 2),

    -- D'Angelo to RNB
    (39, 6), (40, 6), (41, 6), (42, 6), (43, 6), (44, 6), (45, 6), (46, 6), (47, 6), (48, 6), (49, 6), (50, 6), (51, 6),

    -- Frank Ocean to RNB
    (52, 6), (53, 6), (54, 6), (55, 6), (56, 6), (57, 6), (58, 6), (59, 6), (60, 6), (61, 6), (62, 6), (63, 6), (64, 6), (65, 6), (66, 6), (67, 6), (68, 6),

    -- Lauryn Hill to RNB
    (69, 6), (70, 6), (71, 6), (72, 6), (73, 6), (74, 6), (75, 6), (76, 6), (77, 6), (78, 6), (79, 6), (80, 6), (81, 6), (82, 6), (83, 6), (84, 6),

    -- Maxwell to RNB
    (85, 6), (86, 6), (87, 6), (88, 6), (89, 6), (90, 6), (91, 6), (92, 6), (93, 6), (94, 6), (95, 6),

    -- Marvin Gaye to RNB
    (96, 6), (97, 6), (98, 6), (99, 6), (100, 6), (101, 6), (102, 6), (103, 6), (104, 6), (105, 6), (106, 6),

    -- Janelle Monae to RNB
    (107, 6), (108, 6), (109, 6), (110, 6), (111, 6), (112, 6), (113, 6), (114, 6), (115, 6), (116, 6), (117, 6), (118, 6), (119, 6), (120, 6), (121, 6), (122, 6), (123, 6), (124, 6), (125, 6),

    -- Usher to RNB
    (126, 6), (127, 6), (128, 6), (129, 6), (130, 6), (131, 6), (132, 6), (133, 6), (134, 6), (135, 6), (136, 6), (137, 6), (138, 6), (139, 6), (140, 6), (141, 6), (142, 6), (143, 6), (144, 6),

    -- John Legend to RNB
    (145, 6), (146, 6), (147, 6), (148, 6), (149, 6), (150, 6), (151, 6), (152, 6), (153, 6), (154, 6), (155, 6), (156, 6), (157, 6), (158, 6),

    -- Porter Robinson to EDM
    (159, 7), (160, 7), (161, 7), (162, 7), (163, 7), (164, 7), (165, 7), (166, 7), (167, 7), (168, 7), (169, 7), (170, 7), (171, 7), (172, 7),

    -- Zedd to EDM
    (173, 7), (174, 7), (175, 7), (176, 7), (177, 7), (178, 7), (179, 7), (180, 7), (181, 7), (182, 7), (183, 7), (184, 7), (185, 7), (186, 7), (187, 7), (188, 7),

    -- Avicii to EDM
    (189, 7), (190, 7), (191, 7), (192, 7), (193, 7), (194, 7), (195, 7), (196, 7), (197, 7), (198, 7), (199, 7), (200, 7),

    -- Madeon to EDM
    (201, 7), (202, 7), (203, 7), (204, 7), (205, 7), (206, 7), (207, 7), (208, 7), (209, 7), (210, 7),

    -- Avicii to EDM
    (211, 7), (212, 7), (213, 7), (214, 7), (215, 7), (216, 7), (217, 7), (218, 7), (219, 7), (220, 7), (221, 7), (222, 7), (223, 7), (224, 7),

    -- Porter Robinson to EDM
    (225, 7), (226, 7), (227, 7), (228, 7), (229, 7), (230, 7), (231, 7), (232, 7), (233, 7), (234, 7), (235, 7), (236, 7),

    -- Kygo to EDM
    (237, 7),
    (238, 7),
    (239, 7),
    (240, 7),
    (241, 7),
    (242, 7),
    (243, 7),
    (244, 7),
    (245, 7),
    (246, 7),
    (247, 7),
    (248, 7)
;

-- INSERT Artists
INSERT INTO songs_artists (songs_id, artist_id)
VALUES
    -- MUSIC
    --Come Clarity
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), -- In Flames
    -- Features
    (4, 2),  -- Lisa Miskovsky

    --Rated R
    (14, 3), (15, 3), (16, 3), (17, 3), (18, 3), (19, 3), (20, 3), (21, 3), (22, 3), (23, 3), (24, 3), (25, 3), (26, 3), (27, 3), -- Rihanna
    -- Features
    (16, 5), -- Jeezy
    (18, 6), -- Slash
    (22, 7), -- Will.I.Am

    --Good Girl Gone Bad
    (28, 3), (29, 3), (30, 3), (31, 3), (32, 3), (33, 3), (34, 3), (35, 3), (36, 3), (37, 3), (38, 3), -- Rihanna
    -- Features
    (27, 4), -- Jay-Z
    (32, 8), -- Ne-Yo

    -- Voodoo
    (39, 25), (40, 25), (41, 25), (42, 25), (43, 25), (44, 25), (45, 25), (46, 25), (47, 25), (48, 25), (49, 25), (50, 25), (51, 25), -- D'Angelo
    -- Features
    (41, 26), -- Method Man
    (41, 27), -- Redman

    -- Channel Orange
    (52, 28), (54, 28), (54, 28), (55, 28), (56, 28), (57, 28), (58, 28), (59, 28), (60, 28), (61, 28), (62, 28), (63, 28), (64, 28), (65, 28), (66, 28), (67, 28), (68, 28), -- Frank Ocean
    -- Features
    (58, 29), -- Earl Sweatshirt
    (63, 30), -- John Mayer
    (66, 31), -- André 3000

    -- The Miseducation of Lauryn Hill
    (69, 32), (70, 32), (71, 32), (72, 32), (73, 32), (74, 32), (75, 32), (76, 32), (77, 32), (78, 32), (79, 32), (80, 32), (81, 32), (82, 32), (83, 32), (84, 32), -- Lauryn Hill
    -- Features
    (72, 33), -- Carlos Santana
    (77, 34), -- Mary J. Blige
    (80, 25), -- D'Angelo

    -- Maxwell's Urban Hang Suite
    (85, 35), (86, 35), (87, 35), (88, 35), (89, 35), (90, 35), (91, 35), (92, 35), (93, 35), (94, 35), (95, 35), -- Maxwell

    -- What's Going On
    (96, 36), (97, 36), (98, 36), (99, 36), (100, 36), (101, 36), (102, 36), (103, 36), (104, 36), (105, 36), (106, 36), -- Marvin Gaye

    -- The Electric Lady
    (107, 37), (108, 37), (109, 37), (110, 37), (111, 37), (112, 37), (113, 37), (114, 37), (115, 37), (116, 37), (117, 37), (118, 37), (119, 37), (120, 37), (121, 37), (122, 37), (123, 37), (124, 37), (125, 37), -- Janelle Monae
    -- Features
    (108, 38), -- Prince
    (109, 39), -- Erykah Badu
    (110, 40), -- Solange
    (112, 41), -- Miguel
    (124, 42), -- Esperanza Spalding

    -- Confessions
    (126, 43), (127, 43), (128, 43), (129, 43), (130, 43), (131, 43), (132, 43), (133, 43), (134, 43), (135, 43), (136, 43), (137, 43), (138, 43), (139, 43), (140, 43), (141, 43), (142, 43), (143, 43), (144, 43), -- Usher
    -- Features
    (127, 44), -- Lil Jon
    (127, 45), -- Ludacris

    -- Get Lifted
    (145, 46), (146, 46), (147, 46), (148, 46), (149, 46), (150, 46), (151, 46), (152, 46), (153, 46), (154, 46), (155, 46), (156, 46), (157, 46), (158, 46), -- John Legend
    -- Features
    (150, 18), -- Kanye West
    (151, 47), -- Snoop Dogg
    (157, 48), -- The Stephens Family
    (158, 49), -- Miri Ben-Ari

    -- Nurture
    (159, 50), (160, 50), (161, 50), (162, 50), (163, 50), (164, 50), (165, 50), (166, 50), (167, 50), (168, 50), (169, 50), (170, 50), (171, 50), (172, 50), -- Porter Robinson

    -- True Colors
    (173, 51), (174, 51), (175, 51), (176, 51), (177, 51), (178, 51), (179, 51), (180, 51), (181, 51), (182, 51), (183, 51), (184, 51), (185, 51), (186, 51), (187, 51), (188, 51), -- Zedd
    -- Features
    (173, 52), -- Bahari
    (174, 53), -- Selena Gomez
    (175, 54), -- Jon Bellion
    (176, 55), -- Logic
    (176, 56), -- X Ambassadors
    (180, 57), -- Troye Sivan
    (183, 58), -- Echosmith
    (184, 59), -- Hayley Williams
    (185, 60), -- Matthew Koma
    (185, 61), -- Miriam Bryant
    (186, 62), -- Foxes

    -- True
    (189, 63), (190, 63), (191, 63), (192, 63), (193, 63), (194, 63), (195, 63), (196, 63), (197, 63), (198, 63), (199, 63), (200, 63), -- Avicii

    -- Good Faith
    (201, 64), (202, 64), (203, 64), (204, 64), (205, 64), (206, 64), (207, 64), (208, 64), (209, 64), (210, 64), -- Madeon

    -- Stories
    (211, 63), (212, 63), (213, 63), (214, 63), (215, 63), (216, 63), (217, 63), (218, 63), (219, 63), (220, 63), (221, 63), (222, 63), (223, 63), (224, 63), -- Avicii

    -- Worlds
    (225, 50), (226, 50), (227, 50), (228, 50), (229, 50), (230, 50), (231, 50), (232, 50), (233, 50), (234, 50), (235, 50), (236, 50), -- Porter Robinson
    -- Features
    (225, 65), -- Amy Millan
    (227, 66), -- Breanne Düren
    (227, 67), -- Sean Caskey
    (230, 68), -- Lemaitre
    (231, 69), -- Imaginary Cities
    (233, 70), -- Urban Cone

    -- Kids in Love
    (237, 71), -- Kygo
    (238, 71), -- Kygo
    (239, 71), -- Kygo
    (240, 71), -- Kygo
    (241, 71), -- Kygo
    (242, 71), -- Kygo
    (243, 71), -- Kygo
    (244, 71), -- Kygo
    (245, 71), -- Kygo
    (246, 71), -- Kygo
    (247, 71), -- Kygo
    (248, 71) -- Kygo
;

-- INSERT Albums
INSERT INTO songs_albums (songs_id, album_id)
VALUES
    -- MUSIC
    -- In Flames
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), -- Come Clarity

    -- Rihanna
    (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2), (25, 2), (26, 2), -- Rated R

    -- Rihanna
    (27, 3), (28, 3), (29, 3), (30, 3), (31, 3), (32, 3), (33, 3), (34, 3), (35, 3), (36, 3), (37, 3), (38, 3), -- Good Girl Gone Bad

    -- D'Angelo
    (39, 9), (40, 9), (41, 9), (42, 9), (43, 9), (44, 9), (45, 9), (46, 9), (47, 9), (48, 9), (49, 9), (50, 9), (51, 9), -- Voodoo

    -- Frank Ocean
    (52, 10), (53, 10), (54, 10), (55, 10), (56, 10), (57, 10), (58, 10), (59, 10), (60, 10), (61, 10), (62, 10), (63, 10), (64, 10), (65, 10), (66, 10), (67, 10), (68, 10), -- Channel Orange

    -- Lauryn Hill
    (69, 11), (70, 11), (71, 11), (72, 11), (73, 11), (74, 11), (75, 11), (76, 11), (77, 11), (78, 11), (79, 11), (80, 11), (81, 11), (82, 11), (83, 11), (84, 11), -- The Miseducation of Lauryn Hill

    -- Maxwell
    (85, 12), (86, 12), (87, 12), (88, 12), (89, 12), (90, 12), (91, 12), (92, 12), (93, 12), (94, 12), (95, 12), -- Maxwell's Urban Hang Suite

    -- Marvin Gaye
    (96, 13), (97, 13), (98, 13), (99, 13), (100, 13), (101, 13), (102, 13), (103, 13), (104, 13), (105, 13), (106, 13), -- What's Going On

    -- Janelle Monae
    (107, 14), (107, 14), (107, 14), (110, 14), (111, 14), (112, 14), (113, 14), (114, 14), (115, 14), (116, 14), (117, 14), (118, 14), (119, 14), (120, 14), (121, 14), (122, 14), (123, 14), (124, 14), (125, 14), -- The Electric Lady

    -- Usher
    (126, 15), (127, 15), (128, 15), (129, 15), (130, 15), (131, 15), (132, 15), (133, 15), (134, 15), (135, 15), (136, 15), (137, 15), (138, 15), (139, 15), (140, 15), (141, 15), (142, 15), (143, 15), (144, 15), -- Confessions

    -- John Legend
    (145, 16), (146, 16), (147, 16), (148, 16), (149, 16), (150, 16), (151, 16), (152, 16), (153, 16), (154, 16), (155, 16), (156, 16), (157, 16), (158, 16), -- Get Lifted

    -- Porter Robinson
    (159, 17), (160, 17), (161, 17), (162, 17), (163, 17), (164, 17), (165, 17), (166, 17), (167, 17), (168, 17), (169, 17), (170, 17), (171, 17), (172, 17), -- Nurture

    -- Zedd
    (173, 18), (174, 18), (175, 18), (176, 18), (177, 18), (178, 18), (179, 18), (180, 18), (181, 18), (182, 18), (183, 18), (184, 18), (185, 18), (186, 18), (187, 18), (188, 18), -- True Colors

    -- Avicii
    (189, 19), (190, 19), (191, 19), (192, 19), (193, 19), (194, 19), (195, 19), (196, 19), (197, 19), (198, 19), (199, 19), (200, 19), -- True

    -- Madeon
    (201, 20), (202, 20), (203, 20), (204, 20), (205, 20), (206, 20), (207, 20), (208, 20), (209, 20), (210, 20), -- Good Faith

    -- Avicii
    (211, 21), (212, 21), (213, 21), (214, 21), (215, 21), (216, 21), (217, 21), (218, 21), (219, 21), (220, 21), (221, 21), (222, 21), (223, 21), (224, 21), -- Stories

    -- Porter Robinson
    (225, 22), (226, 22), (227, 22), (228, 22), (229, 22), (230, 22), (231, 22), (232, 22), (233, 22), (234, 22), (235, 22), (236, 22), -- Worlds

    -- Kygo
    (237, 23), -- Kids in Love
    (238, 23), -- Kids in Love
    (239, 23), -- Kids in Love
    (240, 23), -- Kids in Love
    (241, 23), -- Kids in Love
    (242, 23), -- Kids in Love
    (243, 23), -- Kids in Love
    (244, 23), -- Kids in Love
    (245, 23), -- Kids in Love
    (246, 23), -- Kids in Love
    (247, 23), -- Kids in Love
    (248, 23) -- Kids in Love
;