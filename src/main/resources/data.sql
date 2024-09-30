/*CREATE TABLE IF NOT EXISTS songs (
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
;*/

INSERT INTO genres (id, genre, type, total_likes, total_plays)
VALUES
    (1, 'Rock', 'music', 0, 0),
    (2, 'Pop', 'music', 0, 0),
    (3, 'Jazz', 'music', 0, 0),
    (4, 'Metal', 'music', 0, 0),
    (5, 'Hip-Hop', 'music', 0, 0),
    (6, 'RNB', 'music', 0, 0),
    (7, 'EDM', 'music', 0, 0),
    (8, 'Heavy Metal', 'music', 0, 0)
;

INSERT INTO songs (id, type, title, url, release_date, play_counter, likes, dis_likes)
VALUES
    -- MUSIC
    -- In Flames songs for Come Clarity
    (1, 'music', 'Take This Life', 'url1', '2006-02-07', 0, 0, 0), (2, 'music', 'Leeches', 'url2', '2006-02-07', 0, 0, 0), (3, 'music', 'Reflect the Storm', 'url3', '2006-02-07', 0, 0, 0), (4, 'music', 'Dead End(feat. Lisa Miskovsky', 'url4', '2006-02-07', 0, 0, 0), (5, 'music', 'Scream', 'url5', '2006-02-07', 0, 0, 0), (6, 'music', 'Come Clarity', 'url6', '2006-02-07', 0, 0, 0), (7, 'music', 'Vacuum', 'url7', '2006-02-07', 0, 0, 0), (8, 'music', 'Pacing Deaths Trail', 'url8', '2006-02-07', 0, 0, 0), (9, 'music', 'Crawl Through Knives', 'url9', '2006-02-07', 0, 0, 0), (10, 'music', 'Versus Terminus', 'url10', '2006-02-07', 0, 0, 0), (11, 'music', 'Our Infinite Struggle', 'url11', '2006-02-07', 0, 0, 0), (12, 'music', 'Vanishing Light', 'url12', '2006-02-07', 0, 0, 0), (13, 'music', 'Your Bedtime Story Is Scaring Everyone', 'url13', '2006-02-07', 0, 0, 0),

    -- Rihanna songs for Rated R
    (14, 'music', 'Mad House', 'url14', '2009-11-20', 0, 0, 0), (15, 'music', 'Wait Your Turn', 'url15', '2009-11-13', 0, 0, 0), (16, 'music', 'Hard', 'url16', '2009-11-10', 0, 0, 0), (17, 'music', 'Stupid in Love', 'url17', '2009-11-20', 0, 0, 0), (18, 'music', 'Rockstar 101', 'url18', '2010-05-18', 0, 0, 0), (19, 'music', 'Russian Roulette', 'url19', '2009-12-14', 0, 0, 0), (20, 'music', 'Fire Bomb', 'url20', '2009-11-20', 0, 0, 0), (21, 'music', 'Rude Boy', 'url21', '2010-02-05', 0, 0, 0), (22, 'music', 'Photographs', 'url22', '2009-11-20', 0, 0, 0), (23, 'music', 'G4L', 'url23', '2009-11-20', 0, 0, 0), (24, 'music', 'Te Amo', 'url24', '2009-06-08', 0, 0, 0), (25, 'music', 'Cold Case Love', 'url25', '2009-11-20', 0, 0, 0), (26, 'music', 'The Last Song', 'url26', '2009-11-20', 0, 0, 0),

    -- Rihanna Songs for Good Girl Gone Bad
    (27, 'music', 'Umbrella', 'url27', '2007-03-29', 0, 0, 0), (28, 'music', 'Push Up on Me', 'url28', '2009-01-27', 0, 0, 0), (29, 'music', 'Dont Stop the Music', 'url29', '2007-07-26', 0, 0, 0), (30, 'music', 'Breakin Dishes', 'url30', '2007-05-31', 0, 0, 0), (31, 'music', 'Shut Up and Drive', 'url31', '2007-06-10', 0, 0, 0), (32, 'music', 'Hate That I Love You', 'url32', '2007-08-24', 0, 0, 0), (33, 'music', 'Say It', 'url33', '2007-05-31', 0, 0, 0), (34, 'music', 'Sell Me Candy', 'url34', '2007-05-31', 0, 0, 0), (35, 'music', 'Lemme Get That', 'url35', '2007-05-31', 0, 0, 0), (36, 'music', 'Rehab', 'url36', '2008-11-12', 0, 0, 0), (37, 'music', 'Question Existing', 'url37', '2009-01-27', 0, 0, 0), (38, 'music', 'Good Girl Gone Bad', 'url38', '2007-05-31', 0, 0, 0),

    -- D'Angelo Songs for Voodoo
    (39, 'music', 'Playa Playa', 'url78', 'release', 0, 0, 0), (40, 'music', 'Devils Pie', 'url79', 'release', 0, 0, 0), (41, 'music', 'Left & Right (featuring Method Man & Redman', 'url80', 'release', 0, 0, 0), (42, 'music', 'The Line', 'url81', 'release', 0, 0, 0), (43, 'music', 'Send It On', 'url82', 'release', 0, 0, 0), (44, 'music', 'Chicken Grease', 'url83', 'release', 0, 0, 0), (45, 'music', 'One Mo''gin', 'url84', 'release', 0, 0, 0), (46, 'music', 'The Root', 'url85', 'release', 0, 0, 0), (47, 'music', 'Spanish Joint', 'url86', 'release', 0, 0, 0), (48, 'music', 'Feel Like Makin Love', 'url87', 'release', 0, 0, 0), (49, 'music', 'Greatdayndamornin/Booty', 'url88', 'release', 0, 0, 0), (50, 'music', 'Untitled (How Does It Feel)', 'url89', 'release', 0, 0, 0), (51, 'music', 'Africa', 'url90', 'release', 0, 0, 0),

    -- Frank Ocean Songs for Channel Orange
    (52, 'music', 'Start', 'url91', 'release', 0, 0, 0), (53, 'music', 'Thinkin Bout You', 'url92', 'release', 0, 0, 0), (54, 'music', 'Fertilizer', 'url93', 'release', 0, 0, 0), (55, 'music', 'Sierra Leona', 'url94', 'release', 0, 0, 0), (56, 'music', 'Sweet Life', 'url95', 'release', 0, 0, 0), (57, 'music', 'Not Just Money', 'url96', 'release', 0, 0, 0), (58, 'music', 'Super Rich Kids (featuring Earl Sweatshirt)', 'url97', 'release', 0, 0, 0), (59, 'music', 'Pilot Jones', 'url98', 'release', 0, 0, 0), (60, 'music', 'Crack Rock', 'url99', 'release', 0, 0, 0), (61, 'music', 'Pyramids', 'url100', 'release', 0, 0, 0), (62, 'music', 'Lost', 'url101', 'release', 0, 0, 0), (63, 'music', 'White (featuring John Mayer)', 'url102', 'release', 0, 0, 0), (64, 'music', 'Monks', 'url103', 'release', 0, 0, 0), (65, 'music', 'Bad Religion', 'url104', 'release', 0, 0, 0), (66, 'music', 'Pink Matter (featuring André 3000', 'url105', 'release', 0, 0, 0), (67, 'music', 'Forrest Gump', 'url106', 'release', 0, 0, 0), (68, 'music', 'End', 'url107', 'release', 0, 0, 0),

    -- Lauryn Hill Songs for The Miseducation of Lauryn Hill
    (69, 'music', 'Intro','url108', 'release', 0, 0, 0), (70, 'music', 'Lost Ones','url109', 'release', 0, 0, 0), (71, 'music', 'Ex-Factor','url110', 'release', 0, 0, 0), (72, 'music', 'To Zion (featuring Carlos Santana)','url111', 'release', 0, 0, 0), (73, 'music', 'Doo Wop (That Thing)','url112', 'release', 0, 0, 0), (74, 'music', 'Superstar','url113', 'release', 0, 0, 0), (75, 'music', 'Final Hour','url114', 'release', 0, 0, 0), (76, 'music', 'When It Hurts So Bad','url115', 'release', 0, 0, 0), (77, 'music', 'I Used to Love Him (featuring Mary J. Blige)','url116', 'release', 0, 0, 0), (78, 'music', 'Forgive Them Father','url117', 'release', 0, 0, 0), (79, 'music', 'Every Ghetto, Every City','url118', 'release', 0, 0, 0), (80, 'music', 'Nothing Even Matters (featuring D''Angelo','url119', 'release', 0, 0, 0), (81, 'music', 'Everything Is Everything','url120', 'release', 0, 0, 0), (82, 'music', 'The Miseducation of Lauryn Hill','url121', 'release', 0, 0, 0), (83, 'music', 'Cant Take My Eyes Of You','url122', 'release', 0, 0, 0), (84, 'music', 'Tell Him','url123', 'release', 0, 0, 0),

    -- Maxwell Songs for Maxwell's Urban Hang Suite
    (85, 'music', 'The Urban Theme','url124', 'release', 0, 0, 0), (86, 'music', 'Welcome','url125', 'release', 0, 0, 0), (87, 'music', 'Sumthin'' Sumthin''','url126', 'release', 0, 0, 0), (88, 'music', 'Ascension (Dont Ever Wonder)','url127', 'release', 0, 0, 0), (89, 'music', 'Dancewitme','url128', 'release', 0, 0, 0), (90, 'music', '...Til the Cops Come Knockin','url129', 'release', 0, 0, 0), (91, 'music', 'Whenever Wherever Whatever','url130', 'release', 0, 0, 0), (92, 'music', 'Lonely''s the Only Company (I & II)','url131', 'release', 0, 0, 0), (93, 'music', 'Reunion','url132', 'release', 0, 0, 0), (94, 'music', 'Suitelady (The Proposal Jam)','url133', 'release', 0, 0, 0), (95, 'music', 'The Suite Theme','url134', 'release', 0, 0, 0),

    -- Marvin Gaye Songs for What's Going On
    (96, 'music', 'Whats Going On','url135', 'release', 0, 0, 0), (97, 'music', 'Whats Happening Brother','url136', 'release', 0, 0, 0), (98, 'music', 'Flyin'' High (In the Friendly Sky)','url137', 'release', 0, 0, 0), (99, 'music', 'Save the Children','url138', 'release', 0, 0, 0), (100, 'music', 'God Is Love','url139', 'release', 0, 0, 0), (101, 'music', 'Mercy Mercy Me (The Ecology)','url140', 'release', 0, 0, 0), (102, 'music', 'Right On','url141', 'release', 0, 0, 0), (103, 'music', 'Wholy Holy','url142', 'release', 0, 0, 0), (104, 'music', 'Inner City Blues (Make Me Wanna Holler)','url143', 'release', 0, 0, 0), (105, 'music', 'God Is Love','url144', 'release', 0, 0, 0), (106, 'music', 'Sad Tomorrows','url145', 'release', 0, 0, 0),

    -- Janelle Monae songs for The Electric Lady
    (107, 'music', 'Suite IV Electric Overture','url146', 'release', 0, 0, 0), (108, 'music', 'Givin Em What They Love (featuring Prince)','url147', 'release', 0, 0, 0), (109, 'music', 'Q.U.E.E.N (featuring Erykah Badu)','url148', 'release', 0, 0, 0), (110, 'music', 'Electric Lady (featuring Solange)','url149', 'release', 0, 0, 0), (111, 'music', 'Good Morning Midnight (Interlude)','url150', 'release', 0, 0, 0), (112, 'music', 'PrimeTime (featuring Miguel)','url151', 'release', 0, 0, 0), (113, 'music', 'We Were Rock & Roll','url152', 'release', 0, 0, 0), (114, 'music', 'The Chrome Shoppe (Interlude)','url153', 'release', 0, 0, 0), (115, 'music', 'Dance Apocalyptic','url154', 'release', 0, 0, 0), (116, 'music', 'Look into My Eyes','url155', 'release', 0, 0, 0), (117, 'music', 'Suite V Electric Overture','url156', 'release', 0, 0, 0), (118, 'music', 'It''s Code','url157', 'release', 0, 0, 0), (119, 'music', 'Ghetto Woman','url158', 'release', 0, 0, 0), (120, 'music', 'Our Favorite Fugitive (Interlude)','url159', 'release', 0, 0, 0), (121, 'music', 'Victory','url160', 'release', 0, 0, 0), (122, 'music', 'Can''t Live Without Your Love','url161', 'release', 0, 0, 0), (123, 'music', 'Sally Ride','url162', 'release', 0, 0, 0), (124, 'music', 'Dorothy Dandridge Eyes (featuring Esperanza Spalding)','url163', 'release', 0, 0, 0), (125, 'music', 'What an Experience','url164', 'release', 0, 0, 0),

    -- Usher songs for Confessions
    (126, 'music', 'Intro','url165', 'release', 0, 0, 0), (127, 'music', 'Yeah! (featuring Lil John and Ludacris)','url166', 'release', 0, 0, 0), (128, 'music', 'Throwback','url167', 'release', 0, 0, 0), (129, 'music', 'Confessions (Interlude)','url168', 'release', 0, 0, 0), (130, 'music', 'Confessions Part II','url169', 'release', 0, 0, 0), (131, 'music', 'Burn','url170', 'release', 0, 0, 0), (132, 'music', 'Caught Up','url171', 'release', 0, 0, 0), (133, 'music', 'Superstar (Interlude)','url172', 'release', 0, 0, 0), (134, 'music', 'Superstar','url173', 'release', 0, 0, 0), (135, 'music', 'Truth Hurts','url174', 'release', 0, 0, 0), (136, 'music', 'Simple Things','url175', 'release', 0, 0, 0), (137, 'music', 'Bad Girl','url176', 'release', 0, 0, 0), (138, 'music', 'Thats What Its Made For','url177', 'release', 0, 0, 0), (139, 'music', 'Can U Handle It','url178', 'release', 0, 0, 0), (140, 'music', 'Do It to Me','url179', 'release', 0, 0, 0), (141, 'music', 'Take Your Hand','url180', 'release', 0, 0, 0), (142, 'music', 'Follow Me','url181', 'release', 0, 0, 0), (143, 'music', 'Whatever I Want','url182', 'release', 0, 0, 0), (144, 'music', 'Confessions Part I','url183', 'release', 0, 0, 0),

    -- John Legend songs for Get Lifted
    (145, 'music', 'Prelude','url184', 'release', 0, 0, 0), (146, 'music', 'Lets Get Lifted','url185', 'release', 0, 0, 0), (147, 'music', 'Used to Love U','url186', 'release', 0, 0, 0), (148, 'music', 'Alright','url187', 'release', 0, 0, 0), (149, 'music', 'She Dont Have to Know','url188', 'release', 0, 0, 0), (150, 'music', 'Number One (featuring Kanye West)','url189', 'release', 0, 0, 0), (151, 'music', 'I Can Change (featuring Snoop Dogg','url190', 'release', 0, 0, 0), (152, 'music', 'Ordinary People','url191', 'release', 0, 0, 0), (153, 'music', 'Stay With You','url192', 'release', 0, 0, 0), (154, 'music', 'Lets Get Lifted Again','url193', 'release', 0, 0, 0), (155, 'music', 'So High','url194', 'release', 0, 0, 0), (156, 'music', 'Refuge (When Its Cold Outside)','url195', 'release', 0, 0, 0), (157, 'music', 'It Dont Have to Change (featuring The Stephens Family)','url196', 'release', 0, 0, 0), (158, 'music', 'Live Ut Up (featuring Miri Ben-Ari)','url197', 'release', 0, 0, 0),

    -- Porter Robinson songs for Nurture
    (159, 'music', 'Lifelike','url198', 'release', 0, 0, 0), (160, 'music', 'Look at the Sky','url199', 'release', 0, 0, 0), (161, 'music', 'Get Your Wish','url200', 'release', 0, 0, 0), (162, 'music', 'Wind Tempos','url201', 'release', 0, 0, 0), (163, 'music', 'Musician','url202', 'release', 0, 0, 0), (164, 'music', 'Do-re-mi-fa-so-la-ti-do','url203', 'release', 0, 0, 0), (165, 'music', 'Mother','url204', 'release', 0, 0, 0), (166, 'music', 'Dullscythe','url205', 'release', 0, 0, 0), (167, 'music', 'Sweet Time','url206', 'release', 0, 0, 0), (168, 'music', 'Mirror','url207', 'release', 0, 0, 0), (169, 'music', 'Something Comforting','url208', 'release', 0, 0, 0), (170, 'music', 'Blossom','url209', 'release', 0, 0, 0), (171, 'music', 'Unfold','url210', 'release', 0, 0, 0), (172, 'music', 'Trying to Feel Alive','url211', 'release', 0, 0, 0),

    -- Zed songs for True Colors
    (173, 'music', 'Addicted to a Memory (featuring Bahari)','url212', 'release', 0, 0, 0), (174, 'music', 'I Want You to Know (featuring Selena Gomez)','url213', 'release', 0, 0, 0), (175, 'music', 'Beautiful Now (featuring Jon Bellion)','url214', 'release', 0, 0, 0), (176, 'music', 'Transmission (featuring Logic and X Ambassadors','url215', 'release', 0, 0, 0), (177, 'music', 'Done with Love','url216', 'release', 0, 0, 0), (178, 'music', 'True Colors','url217', 'release', 0, 0, 0), (179, 'music', 'Straight into the Fire','url218', 'release', 0, 0, 0), (180, 'music', 'Papercut (featuring Troye Sivan)','url219', 'release', 0, 0, 0), (181, 'music', 'Bumble Bee','url220', 'release', 0, 0, 0), (182, 'music', 'Daisy','url221', 'release', 0, 0, 0), (183, 'music', 'Illusion (featuring Echosmith)','url222', 'release', 0, 0, 0), (184, 'music', 'Stay the Night (featuring Hayley Williams)','url223', 'release', 0, 0, 0), (185, 'music', 'Find You (featuring Matthew Koma and Miriam Bryant)','url224', 'release', 0, 0, 0), (186, 'music', 'Clarity (featuring Foxes)','url225', 'release', 0, 0, 0), (187, 'music', 'Rude','url226', 'release', 0, 0, 0), (188, 'music', 'Alive','url227', 'release', 0, 0, 0),

    -- Avicii songs for True
    (189, 'music', 'Wake Me Up','url228', 'release', 0, 0, 0), (190, 'music', 'You Make Me','url229', 'release', 0, 0, 0), (191, 'music', 'Hey Brother','url230', 'release', 0, 0, 0), (192, 'music', 'Addicted to You','url231', 'release', 0, 0, 0), (193, 'music', 'Dear Boy','url232', 'release', 0, 0, 0), (194, 'music', 'Liar Liar','url233', 'release', 0, 0, 0), (195, 'music', 'Shame on Me','url234', 'release', 0, 0, 0), (196, 'music', 'Lay Me Down','url235', 'release', 0, 0, 0), (197, 'music', 'Hope There''s Someone','url236', 'release', 0, 0, 0), (198, 'music', 'Heart Upon My Sleeve','url237', 'release', 0, 0, 0), (199, 'music', 'Canyons','url238', 'release', 0, 0, 0), (200, 'music', 'All You Need Is Love','url239', 'release', 0, 0, 0),

    -- Madeon songs for Good Faith
    (201, 'music', 'Dream Dream Dream','url240', 'release', 0, 0, 0), (202, 'music', 'All My Friends','url241', 'release', 0, 0, 0), (203, 'music', 'Be Fine','url242', 'release', 0, 0, 0), (204, 'music', 'Nirvana','url243', 'release', 0, 0, 0), (205, 'music', 'Mania','url244', 'release', 0, 0, 0), (206, 'music', 'Miracle','url245', 'release', 0, 0, 0), (207, 'music', 'No Fear No More','url246', 'release', 0, 0, 0), (208, 'music', 'Hold Me Just Because','url247', 'release', 0, 0, 0), (209, 'music', 'Heavy with Hoping','url248', 'release', 0, 0, 0), (210, 'music', 'Borealis','url249', 'release', 0, 0, 0),

    -- Avicii songs for Stories
    (211, 'music', 'Waiting for Love','url250', 'release', 0, 0, 0), (212, 'music', 'Talk to Myself','url251', 'release', 0, 0, 0), (213, 'music', 'Touch Me','url252', 'release', 0, 0, 0), (214, 'music', 'Ten More Days','url253', 'release', 0, 0, 0), (215, 'music', 'For a Better Day','url254', 'release', 0, 0, 0), (216, 'music', 'Broken Arrows','url255', 'release', 0, 0, 0), (217, 'music', 'True Believer','url256', 'release', 0, 0, 0), (218, 'music', 'City Lights','url257', 'release', 0, 0, 0), (219, 'music', 'Pure Grinding','url258', 'release', 0, 0, 0), (220, 'music', 'Sunset Jesus','url259', 'release', 0, 0, 0), (221, 'music', 'Cant Catch Me','url260', 'release', 0, 0, 0), (222, 'music', 'Somewhere in Stockholm','url261', 'release', 0, 0, 0), (223, 'music', 'Trouble','url262', 'release', 0, 0, 0), (224, 'music', 'Gonna Love Ya','url263', 'release', 0, 0, 0),

    -- Porter Robinson songs for Worlds
    (225, 'music', 'Divinity (featuring Amy Millan)','url263', 'release', 0, 0, 0), (226, 'music', 'Sad Machine','url264', 'release', 0, 0, 0), (227, 'music', 'Years of War (featuring Breanne Düren and Sean Caskey)','url265', 'release', 0, 0, 0), (228, 'music', 'Flicker','url266', 'release', 0, 0, 0), (229, 'music', 'Fresh Static Snow','url267', 'release', 0, 0, 0), (230, 'music', 'Polygon Dust (featuring Lemaitre)','url268', 'release', 0, 0, 0), (231, 'music', 'Hear the Bells (featuring Imaginary Cities)','url269', 'release', 0, 0, 0), (232, 'music', 'Natural Light','url270', 'release', 0, 0, 0), (233, 'music', 'Lionhearted (featuring Urban Cone)','url271', 'release', 0, 0, 0), (234, 'music', 'Sea of Voices','url272', 'release', 0, 0, 0), (235, 'music', 'Fellow Feeling','url273', 'release', 0, 0, 0), (236, 'music', 'Goodbye to a World','url274', 'release', 0, 0, 0),

    -- Kygo
    (237, 'music', 'Never Let You Go','url275', 'release', 0, 0, 0), (238, 'music', 'Sunrise','url276', 'release', 0, 0, 0), (239, 'music', 'Riding Shotgun','url277', 'release', 0, 0, 0), (240, 'music', 'Stranger Things','url278', 'release', 0, 0, 0), (241, 'music', 'With You','url279', 'release', 0, 0, 0), (242, 'music', 'Kids in Love','url280', 'release', 0, 0, 0), (243, 'music', 'Permanent','url281', 'release', 0, 0, 0), (244, 'music', 'I See You','url282', 'release', 0, 0, 0), (245, 'music', 'Stargazing','url283', 'release', 0, 0, 0), (246, 'music', 'It Aint Me','url284', 'release', 0, 0, 0), (247, 'music', 'First Time','url285', 'release', 0, 0, 0), (248, 'music', 'This Town','url286', 'release', 0, 0, 0),

    -- Black Sabbath
    (249, 'music', 'War Pigs', 'url287', 'release', 0, 0, 0), (250, 'music', 'Paranoid', 'url288', 'release', 0, 0, 0), (251, 'music', 'Planet Caravan', 'url289', 'release', 0, 0, 0), (252, 'music', 'Iron Man', 'url290', 'release', 0, 0, 0), (253, 'music', 'Electric Funeral', 'url291', 'release', 0, 0, 0), (254, 'music', 'Hand of Doom', 'url292', 'release', 0, 0, 0), (255, 'music', 'Rat Salad (instrumental)', 'url293', 'release', 0, 0, 0), (256, 'music', 'Fairies Wear Boots', 'url294', 'release', 0, 0, 0),

    -- Metallica
    (257, 'music', 'Battery', 'url295', 'release', 0, 0, 0), (258, 'music', 'Master of Puppets', 'url296', 'release', 0, 0, 0), (259, 'music', 'The Thing That Should Not Be', 'url297', 'release', 0, 0, 0), (260, 'music', 'Welcome Home (Sanitarium)', 'url298', 'release', 0, 0, 0), (261, 'music', 'Disposable Heroes', 'url299', 'release', 0, 0, 0), (262, 'music', 'Leper Messiah', 'url300', 'release', 0, 0, 0), (263, 'music', 'Orion (instrumental)', 'url301', 'release', 0, 0, 0), (264, 'music', 'Damage, Inc', 'url302', 'release', 0, 0, 0),

    -- Slayer
    (265, 'music', 'Angel of Death', 'url303', 'release', 0, 0, 0), (266, 'music', 'Piece by Piece', 'url304', 'release', 0, 0, 0), (267, 'music', 'Necrophobic', 'url305', 'release', 0, 0, 0), (268, 'music', 'Altar of Sacrifice', 'url306', 'release', 0, 0, 0), (269, 'music', 'Jesus Saves', 'url307', 'release', 0, 0, 0), (270, 'music', 'Criminally Insane', 'url308', 'release', 0, 0, 0), (271, 'music', 'Reborn', 'url309', 'release', 0, 0, 0), (272, 'music', 'Epidemic', 'url310', 'release', 0, 0, 0), (273, 'music', 'Postmortem', 'url311', 'release', 0, 0, 0), (274, 'music', 'Raining Blood', 'url312', 'release', 0, 0, 0),

    -- Pantera
    (275, 'music', 'Mouth for War', 'url313', 'release', 0, 0, 0), (276, 'music', 'A New Level', 'url314', 'release', 0, 0, 0), (277, 'music', 'Walk', 'url315', 'release', 0, 0, 0), (278, 'music', 'Fucking Hostile', 'url316', 'release', 0, 0, 0), (279, 'music', 'This Love', 'url317', 'release', 0, 0, 0), (280, 'music', 'Rise', 'url318', 'release', 0, 0, 0), (281, 'music', 'No Good (Attack the Radical)', 'url319', 'release', 0, 0, 0), (282, 'music', 'Live in a Hole', 'url320', 'release', 0, 0, 0), (283, 'music', 'Regular People (Conceit)', 'url321', 'release', 0, 0, 0), (284, 'music', 'By Demons Be Driven', 'url322', 'release', 0, 0, 0), (285, 'music', 'Hollow', 'url323', 'release', 0, 0, 0), (286, 'music', 'Piss', 'url324', 'release', 0, 0, 0),

    -- Ozzy Osbourne
    (287, 'music', 'I Dont Know', 'url325', 'release', 0, 0, 0), (288, 'music', 'Crazy Train', 'url326', 'release', 0, 0, 0), (289, 'music', 'Goodbye to Romance', 'url327', 'release', 0, 0, 0), (290, 'music', 'Dee', 'url328', 'release', 0, 0, 0), (291, 'music', 'Suicide Solution', 'url329', 'release', 0, 0, 0), (292, 'music', 'Mr. Crowley', 'url330', 'release', 0, 0, 0), (293, 'music', 'No Bone Movies', 'url331', 'release', 0, 0, 0), (294, 'music', 'Revelation (Mother Earth)', 'url332', 'release', 0, 0, 0), (295, 'music', 'Steal Away (The Night)', 'url333', 'release', 0, 0, 0), (296, 'music', 'You Lookin'' at Me Lookin'' at You', 'url334', 'release', 0, 0, 0),

    -- Judas Priest
    (297, 'music', 'The Hellion', 'url335', 'release', 0, 0, 0), (298, 'music', 'Electric Eye', 'url336', 'release', 0, 0, 0), (299, 'music', 'Riding on the Wind', 'url337', 'release', 0, 0, 0), (300, 'music', 'Bloodstone', 'url338', 'release', 0, 0, 0), (301, 'music', '(Take These) Chains', 'url339', 'release', 0, 0, 0), (302, 'music', 'Pain and Pleasure', 'url340', 'release', 0, 0, 0), (303, 'music', 'Screaming for Vengeance', 'url341', 'release', 0, 0, 0), (304, 'music', 'You''ve Got Another Thing Comin''', 'url342', 'release', 0, 0, 0), (305, 'music', 'Fever', 'url343', 'release', 0, 0, 0), (306, 'music', 'Devil''s Child', 'url344', 'release', 0, 0, 0),

    -- Britney Spears
    (307, 'music', 'I''m a Slave 4 U', 'url658', 'release', 0, 0, 0), (308, 'music', 'Overprotected', 'url345', 'release', 0, 0, 0), (309, 'music', 'Lonely', 'url346', 'release', 0, 0, 0), (310, 'music', 'I''m Not a Girl, Not Yet a Woman', 'url347', 'release', 0, 0, 0), (311, 'music', 'Boys', 'url348', 'release', 0, 0, 0), (312, 'music', 'Anticipating', 'url349', 'release', 0, 0, 0), (313, 'music', 'I Love Rock n Roll', 'url350', 'release', 0, 0, 0), (314, 'music', 'Cinderella', 'url351', 'release', 0, 0, 0), (315, 'music', 'Let Me Be', 'url352', 'release', 0, 0, 0), (316, 'music', 'Bombastic Love', 'url353', 'release', 0, 0, 0), (317, 'music', 'That''s Where You Take Me', 'url354', 'release', 0, 0, 0), (318, 'music', 'What It''s Like to Be Me', 'url355', 'release', 0, 0, 0),

    -- Justin Timberlake
    (319, 'music', 'Senorita', 'url356', 'release', 0, 0, 0), (320, 'music', 'Like I Love You', 'url357', 'release', 0, 0, 0), (321, 'music', 'What You Got', 'url358', 'release', 0, 0, 0), (322, 'music', 'Take It from Here', 'url359', 'release', 0, 0, 0), (323, 'music', 'Cry Me a River', 'url360', 'release', 0, 0, 0), (324, 'music', 'Rock Your Body', 'url361', 'release', 0, 0, 0), (325, 'music', 'Nothin'' Else', 'url362', 'release', 0, 0, 0), (326, 'music', 'Last Night', 'url363', 'release', 0, 0, 0), (327, 'music', 'Still on My Brain', 'url364', 'release', 0, 0, 0), (328, 'music', 'Take Me Now', 'url365', 'release', 0, 0, 0), (329, 'music', 'Right for Me', 'url366', 'release', 0, 0, 0), (330, 'music', 'Let''s Take a Ride', 'url367', 'release', 0, 0, 0), (331, 'music', 'Never Again', 'url368', 'release', 0, 0, 0),

    -- Lady Gaga
    (332, 'music', 'Just Dance', 'url369', 'release', 0, 0, 0), (333, 'music', 'LoveGame', 'url370', 'release', 0, 0, 0), (334, 'music', 'Paparazzi', 'url371', 'release', 0, 0, 0), (335, 'music', 'Beautiful, Dirty, Rich', 'url372', 'release', 0, 0, 0), (336, 'music', 'Eh, Eh (Nothing Else I Can Say)', 'url373', 'release', 0, 0, 0), (337, 'music', 'Poker Face', 'url374', 'release', 0, 0, 0), (338, 'music', 'The Fame', 'url375', 'release', 0, 0, 0), (339, 'music', 'Money Honey', 'url376', 'release', 0, 0, 0), (340, 'music', 'Again Again', 'url377', 'release', 0, 0, 0), (341, 'music', 'Boys Boys Boys', 'url378', 'release', 0, 0, 0), (342, 'music', 'Brown Eyes', 'url379', 'release', 0, 0, 0), (343, 'music', 'Summerboy', 'url380', 'release', 0, 0, 0), (344, 'music', 'I Like It Rough', 'url381', 'release', 0, 0, 0),

    -- Katy Perry
    (345, 'music', 'One of the Boys', 'url382', 'release', 0, 0, 0), (346, 'music', 'I Kissed a Girl', 'url383', 'release', 0, 0, 0), (347, 'music', 'Waking Up in Vegas', 'url384', 'release', 0, 0, 0), (348, 'music', 'Thinking of You', 'url385', 'release', 0, 0, 0), (349, 'music', 'Mannequin', 'url386', 'release', 0, 0, 0), (350, 'music', 'Ur So Gay', 'url387', 'release', 0, 0, 0), (351, 'music', 'Hot n Cold', 'url388', 'release', 0, 0, 0), (352, 'music', 'If You Can Afford Me', 'url389', 'release', 0, 0, 0), (353, 'music', 'Lost', 'url390', 'release', 0, 0, 0), (354, 'music', 'Self Inflicted', 'url391', 'release', 0, 0, 0), (355, 'music', 'I''m Still Breathing', 'url392', 'release', 0, 0, 0), (356, 'music', 'Fingerprints', 'url393', 'release', 0, 0, 0), (357, 'music', 'A Cup of Coffee', 'url394', 'release', 0, 0, 0),

    -- Beyoncé
    (358, 'music', 'Pray You Catch Me', 'url395', 'release', 0, 0, 0), (359, 'music', 'Hold Up', 'url396', 'release', 0, 0, 0), (360, 'music', 'Don''t Hurt Yourself', 'url397', 'release', 0, 0, 0), (361, 'music', 'Sorry', 'url398', 'release', 0, 0, 0), (362, 'music', '6 Inch', 'url399', 'release', 0, 0, 0), (363, 'music', 'Daddy Lessons', 'url400', 'release', 0, 0, 0), (364, 'music', 'Love Drought', 'url401', 'release', 0, 0, 0), (365, 'music', 'Sandcastles', 'url402', 'release', 0, 0, 0), (366, 'music', 'Forward', 'url403', 'release', 0, 0, 0), (367, 'music', 'Freedom', 'url404', 'release', 0, 0, 0), (368, 'music', 'All Night', 'url405', 'release', 0, 0, 0), (369, 'music', 'Formation', 'url406', 'release', 0, 0, 0),

    -- Taylor Swift
    (370, 'music', 'Welcome to New York', 'url407', 'release', 0, 0, 0), (371, 'music', 'Blank Space', 'url408', 'release', 0, 0, 0), (372, 'music', 'Style', 'url409', 'release', 0, 0, 0), (373, 'music', 'Out of the Woods', 'url410', 'release', 0, 0, 0), (374, 'music', 'All You Had to Do Was Stay', 'url411', 'release', 0, 0, 0), (375, 'music', 'Shake It Off', 'url412', 'release', 0, 0, 0), (376, 'music', 'I Wish You Would', 'url413', 'release', 0, 0, 0), (377, 'music', 'Bad Blood', 'url414', 'release', 0, 0, 0), (378, 'music', 'Wildest Dreams', 'url415', 'release', 0, 0, 0), (379, 'music', 'How You Get the Girl', 'url416', 'release', 0, 0, 0), (380, 'music', 'This Love', 'url417', 'release', 0, 0, 0), (381, 'music', 'I Know Places', 'url418', 'release', 0, 0, 0), (382, 'music', 'Clean', 'url419', 'release', 0, 0, 0),

    -- One Direction
    (383, 'music', 'Steal My Girl', 'url420', 'release', 0, 0, 0), (384, 'music', 'Ready to Run', 'url421', 'release', 0, 0, 0), (385, 'music', 'Where Do Broken Hearts Go', 'url422', 'release', 0, 0, 0), (386, 'music', '18', 'url423', 'release', 0, 0, 0), (387, 'music', 'Girl Almighty', 'url424', 'release', 0, 0, 0), (388, 'music', 'Fool''s Gold', 'url425', 'release', 0, 0, 0), (389, 'music', 'Night Changes', 'url426', 'release', 0, 0, 0), (390, 'music', 'No Control', 'url427', 'release', 0, 0, 0), (391, 'music', 'Fireproof', 'url428', 'release', 0, 0, 0), (392, 'music', 'Spaces', 'url429', 'release', 0, 0, 0), (393, 'music', 'Stockholm Syndrome', 'url430', 'release', 0, 0, 0), (394, 'music', 'Clouds', 'url431', 'release', 0, 0, 0),

    -- Nas
    (395, 'music', 'The Genesis', 'url432', 'release', 0, 0, 0), (396, 'music', 'N.Y. State of Mind', 'url433', 'release', 0, 0, 0), (397, 'music', 'Life''s a Bitch', 'url434', 'release', 0, 0, 0), (398, 'music', 'The World Is Yours', 'url435', 'release', 0, 0, 0), (399, 'music', 'Halftime', 'url436', 'release', 0, 0, 0), (400, 'music', 'Memory Lane (Sittin'' in da Park)', 'url437', 'release', 0, 0, 0), (401, 'music', 'One Love', 'url438', 'release', 0, 0, 0), (402, 'music', 'One Time 4 Your Mind', 'url439', 'release', 0, 0, 0), (403, 'music', 'Represent', 'url440', 'release', 0, 0, 0), (404, 'music', 'It Ain''t Hard to Tell', 'url441', 'release', 0, 0, 0),

    -- Outkast
    (405, 'music', 'Hold On, Be Strong', 'url442', 'release', 0, 0, 0), (406, 'music', 'Return of the G', 'url443', 'release', 0, 0, 0), (407, 'music', 'Rosa Parks', 'url444', 'release', 0, 0, 0), (408, 'music', 'Skew It on the Bar-B', 'url445', 'release', 0, 0, 0), (409, 'music', 'Aquemini', 'url446', 'release', 0, 0, 0), (410, 'music', 'Synthesizer', 'url447', 'release', 0, 0, 0), (411, 'music', 'Slump', 'url448', 'release', 0, 0, 0), (412, 'music', 'West Savannah', 'url449', 'release', 0, 0, 0), (413, 'music', 'Da Art of Storytellin'' (Pt. 1)', 'url450', 'release', 0, 0, 0), (414, 'music', 'Da Art of Storytellin'' (Pt. 2)', 'url451', 'release', 0, 0, 0), (415, 'music', 'SpottieOttieDopaliscious', 'url452', 'release', 0, 0, 0), (416, 'music', 'Y''All Scared', 'url453', 'release', 0, 0, 0), (417, 'music', 'Nathaniel ', 'url454', 'release', 0, 0, 0), (418, 'music', 'Liberation', 'url455', 'release', 0, 0, 0), (419, 'music', 'Chonkyfire', 'url456', 'release', 0, 0, 0),

    -- Tupac
    (420, 'music', 'Ambitionz az a Ridah', 'url457', 'release', 0, 0, 0), (421, 'music', 'All About U', 'url458', 'release', 0, 0, 0), (422, 'music', 'Skandalouz', 'url459', 'release', 0, 0, 0), (423, 'music', 'Got My Mind Made Up', 'url460', 'release', 0, 0, 0), (424, 'music', 'How Do U Want It', 'url461', 'release', 0, 0, 0), (425, 'music', '2 of Amerikaz Most Wanted', 'url462', 'release', 0, 0, 0), (426, 'music', 'No More Pain', 'url463', 'release', 0, 0, 0), (427, 'music', 'Heartz of Men', 'url464', 'release', 0, 0, 0), (428, 'music', 'Life Goes On', 'url465', 'release', 0, 0, 0), (429, 'music', 'Only God Can Judge Me', 'url466', 'release', 0, 0, 0), (430, 'music', 'Tradin'' War Stories', 'url467', 'release', 0, 0, 0), (431, 'music', 'California Love', 'url468', 'release', 0, 0, 0), (432, 'music', 'I Ain''t Mad at Cha', 'url469', 'release', 0, 0, 0), (433, 'music', 'What''z Ya Phone #', 'url470', 'release', 0, 0, 0),

    -- 50 Cent
    (434, 'music', 'Intro', 'url471', 'release', 0, 0, 0), (435, 'music', 'What Up Gangsta', 'url472', 'release', 0, 0, 0), (436, 'music', 'Patiently Waiting', 'url473', 'release', 0, 0, 0), (437, 'music', 'Many Men', 'url474', 'release', 0, 0, 0), (438, 'music', 'In da Club', 'url475', 'release', 0, 0, 0), (439, 'music', 'High All the Time', 'url476', 'release', 0, 0, 0), (440, 'music', 'Heat', 'url477', 'release', 0, 0, 0), (441, 'music', 'If I Can''t', 'url478', 'release', 0, 0, 0), (442, 'music', 'Blood Hound', 'url479', 'release', 0, 0, 0), (443, 'music', 'Back Down', 'url480', 'release', 0, 0, 0), (444, 'music', 'P.I.M.P', 'url481', 'release', 0, 0, 0), (445, 'music', 'Like My Style', 'url482', 'release', 0, 0, 0), (446, 'music', 'Poor Lil Rich', 'url483', 'release', 0, 0, 0), (447, 'music', '21 Questions', 'url484', 'release', 0, 0, 0), (448, 'music', 'Don''t Push Me', 'url485', 'release', 0, 0, 0), (449, 'music', 'Gotta Make It To Heaven', 'url486', 'release', 0, 0, 0),

    -- A Tribe Called Quest
    (450, 'music', 'Excursions', 'url487', 'release', 0, 0, 0), (451, 'music', 'Buggin'' Out', 'url488', 'release', 0, 0, 0), (452, 'music', 'Rap Promoter', 'url489', 'release', 0, 0, 0), (453, 'music', 'Butter', 'url490', 'release', 0, 0, 0), (454, 'music', 'Verses from the Abstract', 'url491', 'release', 0, 0, 0), (455, 'music', 'Show Business', 'url492', 'release', 0, 0, 0), (456, 'music', 'Vibes and Stuff', 'url493', 'release', 0, 0, 0), (457, 'music', 'The Infamous Date Rape', 'url494', 'release', 0, 0, 0), (458, 'music', 'Check the Rhime', 'url495', 'release', 0, 0, 0), (459, 'music', 'Everything Is Fair', 'url496', 'release', 0, 0, 0), (460, 'music', 'Jazz', 'url497', 'release', 0, 0, 0), (461, 'music', 'Skypager', 'url498', 'release', 0, 0, 0), (462, 'music', 'What?', 'url499', 'release', 0, 0, 0), (463, 'music', 'Scenario', 'url500', 'release', 0, 0, 0),

    -- Dave Brubeck Quartet
    (464, 'music', 'Blue Rondo à la Turk', 'url501', 'release', 0, 0, 0), (465, 'music', 'Strange Meadow Lark', 'url502', 'release', 0, 0, 0), (466, 'music', 'Take Five', 'url503', 'release', 0, 0, 0), (467, 'music', 'Three to Get Ready', 'url504', 'release', 0, 0, 0), (468, 'music', 'Kathy''s Waltz', 'url505', 'release', 0, 0, 0), (469, 'music', 'Everybody''s Jumpin''', 'url506', 'release', 0, 0, 0), (470, 'music', 'Pick Up Sticks', 'url507', 'release', 0, 0, 0), (471, 'music', 'St. Louis Blues', 'url508', 'release', 0, 0, 0), (472, 'music', 'Waltz Limp', 'url509', 'release', 0, 0, 0), (473, 'music', 'Since Love Had Its Way', 'url510', 'release', 0, 0, 0), (474, 'music', 'Koto Song', 'url511', 'release', 0, 0, 0), (475, 'music', 'Pennies from Heaven', 'url512', 'release', 0, 0, 0), (476, 'music', 'You Go to My Head', 'url513', 'release', 0, 0, 0), (477, 'music', 'Blue Rondo à La Turk', 'url514', 'release', 0, 0, 0), (478, 'music', 'Take Five', 'url515', 'release', 0, 0, 0),

    -- John Coltrane
    (479, 'music', 'Blue Train', 'url516', 'release', 0, 0, 0), (480, 'music', 'Moment''s Notice', 'url517', 'release', 0, 0, 0), (481, 'music', 'Locomotion', 'url518', 'release', 0, 0, 0), (482, 'music', 'I''m Old Fashioned', 'url519', 'release', 0, 0, 0), (483, 'music', 'Lazy Bird', 'url520', 'release', 0, 0, 0),

    -- Lee Morgan
    (484, 'music', 'The Sidewinder', 'url521', 'release', 0, 0, 0), (485, 'music', 'Totem Pole', 'url522', 'release', 0, 0, 0), (486, 'music', 'Gary''s Notebook', 'url523', 'release', 0, 0, 0), (487, 'music', 'Boy, What a Night', 'url524', 'release', 0, 0, 0), (488, 'music', 'Hocus Pocus', 'url525', 'release', 0, 0, 0),

    -- Hank Mobley
    (489, 'music', 'The Turnaround', 'url526', 'release', 0, 0, 0), (490, 'music', 'East of the Village', 'url527', 'release', 0, 0, 0), (491, 'music', 'The Good Life', 'url528', 'release', 0, 0, 0), (492, 'music', 'Staight Ahead', 'url529', 'release', 0, 0, 0), (493, 'music', 'My Sin', 'url530', 'release', 0, 0, 0), (494, 'music', 'Pat n Chat', 'url531', 'release', 0, 0, 0),

    -- Art Blakey songs for Moanin'
    (495, 'music', 'Moanin''', 'url532', 'release', 0, 0, 0), (496, 'music', 'Are You Real', 'url533', 'release', 0, 0, 0), (497, 'music', 'Along Came Betty', 'url534', 'release', 0, 0, 0), (498, 'music', 'The Drum Thunder (Miniature) Suite', 'url535', 'release', 0, 0, 0), (499, 'music', 'Blues March', 'url536', 'release', 0, 0, 0), (500, 'music', 'Come Rain or Come Shine', 'url537', 'release', 0, 0, 0),

    -- Bill Evans songs for Everybody Digs Bill Evans
    (501, 'music', 'Minority', 'url538', 'release', 0, 0, 0), (502, 'music', 'Young And Foolish', 'url539', 'release', 0, 0, 0), (503, 'music', 'Lucky to Be Me', 'url540', 'release', 0, 0, 0), (504, 'music', 'Night and Day', 'url541', 'release', 0, 0, 0), (505, 'music', 'Tenderly', 'url542', 'release', 0, 0, 0), (506, 'music', 'Peace Piece', 'url543', 'release', 0, 0, 0), (507, 'music', 'What Is There To Say?', 'url544', 'release', 0, 0, 0), (508, 'music', 'Oleo', 'url545', 'release', 0, 0, 0), (509, 'music', 'Epilogue', 'url546', 'release', 0, 0, 0),

    -- The Beatles
    (510, 'music', 'Taxman', 'url547', 'release', 0, 0, 0), (511, 'music', 'Eleanor Rigby', 'url548', 'release', 0, 0, 0), (512, 'music', 'I''m Only Sleeping', 'url549', 'release', 0, 0, 0), (513, 'music', 'Love You To', 'url550', 'release', 0, 0, 0), (514, 'music', 'Here, There and Everywhere', 'url551', 'release', 0, 0, 0), (515, 'music', 'Yellow Submarine', 'url552', 'release', 0, 0, 0), (516, 'music', 'She Said She Said', 'url553', 'release', 0, 0, 0), (517, 'music', 'Good Day Sunshine', 'url554', 'release', 0, 0, 0), (518, 'music', 'And Your Bird Can Sing', 'url555', 'release', 0, 0, 0), (519, 'music', 'For No One', 'url556', 'release', 0, 0, 0), (520, 'music', 'Doctor Robert', 'url557', 'release', 0, 0, 0), (521, 'music', 'I Want to Tell You', 'url558', 'release', 0, 0, 0), (522, 'music', 'Got to Get You into My Life', 'url559', 'release', 0, 0, 0), (523, 'music', 'Tomorrow Never Known', 'url560', 'release', 0, 0, 0),

    -- Pink Floyd
    (524, 'music', 'Speak to Me', 'url561', 'release', 0, 0, 0), (525, 'music', 'Breathe (In the Air)', 'url562', 'release', 0, 0, 0), (526, 'music', 'On the Run', 'url563', 'release', 0, 0, 0), (527, 'music', 'Time', 'url564', 'release', 0, 0, 0), (528, 'music', 'The Great Gig in the Sky', 'url565', 'release', 0, 0, 0), (529, 'music', 'Money', 'url566', 'release', 0, 0, 0), (530, 'music', 'Us and Them', 'url567', 'release', 0, 0, 0), (531, 'music', 'Any Colour You Like', 'url568', 'release', 0, 0, 0), (532, 'music', 'Brain Damage', 'url569', 'release', 0, 0, 0), (533, 'music', 'Eclipse', 'url570', 'release', 0, 0, 0),

    -- Radiohead
    (534, 'music', 'Everything in Its Right Place', 'url571', 'release', 0, 0, 0), (535, 'music', 'Kid A', 'url572', 'release', 0, 0, 0), (536, 'music', 'The National Anthem', 'url573', 'release', 0, 0, 0), (537, 'music', 'How to Disappear Completely', 'url574', 'release', 0, 0, 0), (538, 'music', 'Treefingers', 'url575', 'release', 0, 0, 0), (539, 'music', 'Optimistic', 'url576', 'release', 0, 0, 0), (540, 'music', 'In Limbo', 'url577', 'release', 0, 0, 0), (541, 'music', 'Idioteque', 'url578', 'release', 0, 0, 0), (542, 'music', 'Morning Bell', 'url579', 'release', 0, 0, 0),

    -- Led Zeppelin
    (543, 'music', 'Black Dog', 'url580', 'release', 0, 0, 0), (544, 'music', 'Rock and Roll', 'url581', 'release', 0, 0, 0), (545, 'music', 'The Battle of Evermore', 'url582', 'release', 0, 0, 0), (546, 'music', 'Stairway to Heaven', 'url583', 'release', 0, 0, 0), (547, 'music', 'Misty Mountain Hop', 'url584', 'release', 0, 0, 0), (548, 'music', 'Four Sticks', 'url585', 'release', 0, 0, 0), (549, 'music', 'Going to California', 'url586', 'release', 0, 0, 0), (550, 'music', 'When the Levee Breaks', 'url587', 'release', 0, 0, 0),

    -- David Bowie
    (551, 'music', 'Five Years', 'url588', 'release', 0, 0, 0), (552, 'music', 'Soul Love', 'url589', 'release', 0, 0, 0), (553, 'music', 'Moonage Daydream', 'url590', 'release', 0, 0, 0), (554, 'music', 'Starman', 'url591', 'release', 0, 0, 0), (555, 'music', 'It Ain''t Easy', 'url592', 'release', 0, 0, 0), (556, 'music', 'Lady Stardust', 'url593', 'release', 0, 0, 0), (557, 'music', 'Star', 'url594', 'release', 0, 0, 0), (558, 'music', 'Hang Onto Yourself', 'url595', 'release', 0, 0, 0), (559, 'music', 'Ziggy Stardust', 'url596', 'release', 0, 0, 0), (560, 'music', 'Suffragette City', 'url597', 'release', 0, 0, 0), (561, 'music', 'Rock n Roll Suicide', 'url598', 'release', 0, 0, 0),

    -- Fleetwood Mac
    (562, 'music', 'Second Hand News', 'url599', 'release', 0, 0, 0), (563, 'music', 'Dreams', 'url600', 'release', 0, 0, 0), (564, 'music', 'Never Going Back Again', 'url601', 'release', 0, 0, 0), (565, 'music', 'Don''t Stop', 'url602', 'release', 0, 0, 0), (566, 'music', 'Go Your Own Way', 'url603', 'release', 0, 0, 0), (567, 'music', 'Songbird', 'url604', 'release', 0, 0, 0), (568, 'music', 'The Chain', 'url605', 'release', 0, 0, 0), (569, 'music', 'You Make Loving Fun', 'url606', 'release', 0, 0, 0), (570, 'music', 'I Don''t Want to Know', 'url607', 'release', 0, 0, 0), (571, 'music', 'Oh Daddy', 'url608', 'release', 0, 0, 0), (572, 'music', 'Gold Dust Woman', 'url609', 'release', 0, 0, 0),

    -- Scorpions
    (573, 'music', 'Loving You Sunday Morning', 'url610', 'release', 0, 0, 0), (574, 'music', 'Another Piece of Meat', 'url611', 'release', 0, 0, 0), (575, 'music', 'Always Somewhere', 'url612', 'release', 0, 0, 0), (576, 'music', 'Coast to Coast', 'url613', 'release', 0, 0, 0), (577, 'music', 'Can''t Get Enough', 'url614', 'release', 0, 0, 0), (578, 'music', 'Is Tehre Anybody There?', 'url615', 'release', 0, 0, 0), (579, 'music', 'Lovedrive', 'url616', 'release', 0, 0, 0), (580, 'music', 'Holiday', 'url617', 'release', 0, 0, 0),

    -- Motorhead
    (581, 'music', 'Overkill', 'url618', 'release', 0, 0, 0), (582, 'music', 'Stay Clean', 'url619', 'release', 0, 0, 0), (583, 'music', '(I Won''t) Pay Your Price', 'url620', 'release', 0, 0, 0), (584, 'music', 'I''ll Be Your Sister', 'url621', 'release', 0, 0, 0), (585, 'music', 'Capricorn', 'url622', 'release', 0, 0, 0), (586, 'music', 'No Class', 'url623', 'release', 0, 0, 0), (587, 'music', 'Damage Case', 'url624', 'release', 0, 0, 0), (588, 'music', 'Tear Ya Down', 'url625', 'release', 0, 0, 0), (589, 'music', 'Metropolis', 'url626', 'release', 0, 0, 0), (590, 'music', 'Limb from Limb', 'url627', 'release', 0, 0, 0),

    -- Rainbow
    (591, 'music', 'Lady of the Lake', 'url628', 'release', 0, 0, 0), (592, 'music', 'Sensitive to Light', 'url629', 'release', 0, 0, 0), (593, 'music', 'L.A. Connection', 'url630', 'release', 0, 0, 0), (594, 'music', 'Kill the King', 'url631', 'release', 0, 0, 0), (595, 'music', 'The Shed (Subtle)', 'url632', 'release', 0, 0, 0), (596, 'music', 'Long Live Rock n Roll', 'url633', 'release', 0, 0, 0), (597, 'music', 'Rainbow Eyes', 'url634', 'release', 0, 0, 0),

    -- Deep Purple
    (598, 'music', 'Burn', 'url635', 'release', 0, 0, 0), (599, 'music', 'Might Just Take Your Life', 'url636', 'release', 0, 0, 0), (600, 'music', 'Lay Down, Stay Down', 'url637', 'release', 0, 0, 0), (601, 'music', 'Sail Away', 'url638', 'release', 0, 0, 0), (602, 'music', 'You Fool No One', 'url639', 'release', 0, 0, 0), (603, 'music', 'What''s Goin'' On Here', 'url640', 'release', 0, 0, 0), (604, 'music', 'Mistreated', 'url641', 'release', 0, 0, 0), (605, 'music', '''A'' 200', 'url642', 'release', 0, 0, 0),

    -- Blue Oyster Cult
    (606, 'music', 'Career of Evil', 'url643', 'release', 0, 0, 0), (607, 'music', 'Subhuman', 'url644', 'release', 0, 0, 0), (608, 'music', 'Dominance and Submission', 'url645', 'release', 0, 0, 0), (609, 'music', 'ME 262', 'url646', 'release', 0, 0, 0), (610, 'music', 'Cagey Cretings', 'url647', 'release', 0, 0, 0), (611, 'music', 'Harvester of Eyes', 'url648', 'release', 0, 0, 0), (612, 'music', 'Flaming Telepaths', 'url649', 'release', 0, 0, 0), (613, 'music', 'Astronomy', 'url650', 'release', 0, 0, 0),

    -- Budgie
    (614, 'music', 'Breadfan', 'url651', 'release', 0, 0, 0), (615, 'music', 'Baby, Please Don''t Go', 'url652', 'release', 0, 0, 0), (616, 'music', 'You Know I''ll Always Love You', 'url653', 'release', 0, 0, 0), (617, 'music', 'You''re the Biggest Thing Since Powdered Milk', 'url654', 'release', 0, 0, 0), (618, 'music', 'In the Grip of a Tyrefitter''s Hand', 'url655', 'release', 0, 0, 0), (619, 'music', 'Riding My Nightmare', 'url656', 'release', 0, 0, 0), (620, 'music', 'Parents', 'url657', 'release', 0, 0, 0)
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
    (237, 7), (238, 7), (239, 7), (240, 7), (241, 7), (242, 7), (243, 7), (244, 7), (245, 7), (246, 7), (247, 7), (248, 7),

    -- Black Sabbath to Metal
    (249, 4), (250, 4), (251, 4), (252, 4), (253, 4), (254, 4), (255, 4), (256, 4),

    -- Metallica to Metal
    (257, 4), (258, 4), (259, 4), (260, 4), (261, 4), (262, 4), (263, 4), (264, 4),

    -- Slayer to Metal
    (265, 4), (266, 4), (267, 4), (268, 4), (269, 4), (270, 4), (271, 4), (272, 4), (273, 4), (274, 4),

    -- Pantera to Metal
    (275, 4), (276, 4), (277, 4), (278, 4), (279, 4), (280, 4), (281, 4), (282, 4), (283, 4), (284, 4), (285, 4), (286, 4),

    -- Ozzy Osbourne to Metal
    (287, 4), (288, 4), (289, 4), (290, 4), (291, 4), (292, 4), (293, 4), (294, 4), (295, 4), (296, 4),

    -- Judas Priest to Metal
    (297, 4), (298, 4), (299, 4), (300, 4), (301, 4), (302, 4), (303, 4), (304, 4), (305, 4), (306, 4),

    -- Britney Spears to Pop
    (307, 2), (308, 2), (309, 2), (310, 2), (311, 2), (312, 2), (313, 2), (314, 2), (315, 2), (316, 2), (317, 2), (318, 2),

    -- Justin Timberlake to Pop
    (319, 2), (320, 2), (321, 2), (322, 2), (323, 2), (324, 2), (325, 2), (326, 2), (327, 2), (328, 2), (329, 2), (330, 2), (331, 2),

    -- Lady Gaga to Pop
    (332, 2), (333, 2), (334, 2), (335, 2), (336, 2), (337, 2), (338, 2), (339, 2), (340, 2), (341, 2), (342, 2), (343, 2), (344, 2),

    -- Katy Perry to Pop
    (345, 2), (346, 2), (347, 2), (348, 2), (349, 2), (350, 2), (351, 2), (352, 2), (353, 2), (354, 2), (355, 2), (356, 2), (357, 2),

    -- Beyonce to Pop
    (358, 2), (359, 2), (360, 2), (361, 2), (362, 2), (363, 2), (364, 2), (365, 2), (366, 2), (367, 2), (368, 2), (369, 2),

    -- Taylor Swift to Pop
    (370, 2), (371, 2), (372, 2), (373, 2), (374, 2), (375, 2), (376, 2), (377, 2), (378, 2), (379, 2), (380, 2), (381, 2), (382, 2),

    -- One Direction to Pop
    (383, 2), (384, 2), (385, 2), (386, 2), (387, 2), (388, 2), (389, 2), (390, 2), (391, 2), (392, 2), (393, 2), (394, 2),

    -- Nas to Hip-Hop
    (395, 5), (396, 5), (397, 5), (398, 5), (399, 5), (400, 5), (401, 5), (402, 5), (403, 5), (404, 5),

    -- Outkast to Hip-Hop
    (405, 5), (406, 5), (407, 5), (408, 5), (409, 5), (410, 5), (411, 5), (412, 5), (413, 5), (414, 5), (415, 5), (416, 5), (417, 5), (418, 5), (419, 5),

    -- Tupac to Hip-Hop
    (420, 5), (421, 5), (422, 5), (423, 5), (424, 5), (425, 5), (426, 5), (427, 5), (428, 5), (429, 5), (430, 5), (431, 5), (432, 5), (433, 5),

    -- 50 Cent to Hip-Hop
    (434, 5), (435, 5), (436, 5), (437, 5), (438, 5), (439, 5), (440, 5), (441, 5), (442, 5), (443, 5), (444, 5), (445, 5), (446, 5), (447, 5), (448, 5), (449, 5),

    -- A Tribe Called Quest to Hip-Hop
    (450, 5), (451, 5), (452, 5), (453, 5), (454, 5), (455, 5), (456, 5), (457, 5), (458, 5), (459, 5), (460, 5), (461, 5), (462, 5), (463, 5),

    -- Dave Brubeck Quartet to Jazz
    (464, 3), (465, 3), (466, 3), (467, 3), (468, 3), (469, 3), (470, 3), (471, 3), (472, 3), (473, 3), (474, 3), (475, 3), (476, 3), (477, 3), (478, 3),

    -- John Coltrane to Jazz
    (479, 3), (480, 3), (481, 3), (482, 3), (483, 3),

    -- Lee Morgan to Jazz
    (484, 3), (485, 3), (486, 3), (487, 3), (488, 3),

    -- Hank Mobley to Jazz
    (489, 3), (490, 3), (491, 3), (492, 3), (493, 3), (494, 3),

    -- Art Blakey to Jazz
    (495, 3), (496, 3), (497, 3), (498, 3), (499, 3), (500, 3),

    -- Bill Evans to Jazz
    (501, 3), (502, 3), (503, 3), (504, 3), (505, 3), (506, 3), (507, 3), (508, 3), (509, 3),

    -- The Beatles to Rock
    (510, 1), (511, 1), (512, 1), (513, 1), (514, 1), (515, 1), (516, 1), (517, 1), (518, 1), (519, 1), (520, 1), (521, 1), (522, 1), (523, 1),

    -- Pink Floyd to Rock
    (524, 1), (525, 1), (526, 1), (527, 1), (528, 1), (529, 1), (530, 1), (531, 1), (532, 1), (533, 1),

    -- Radiohead to Rock
    (534, 1), (535, 1), (536, 1), (537, 1), (538, 1), (539, 1), (540, 1), (541, 1), (542, 1),

    -- Led Zeppelin to Rock
    (543, 1), (544, 1), (545, 1), (546, 1), (547, 1), (548, 1), (549, 1), (550, 1),

    -- David Bowie to Rock
    (551, 1), (552, 1), (553, 1), (554, 1), (555, 1), (556, 1), (557, 1), (558, 1), (559, 1), (560, 1), (561, 1),

    -- Fleetwood Mac to Rock
    (562, 1), (563, 1), (564, 1), (565, 1), (566, 1), (567, 1), (568, 1), (569, 1), (570, 1), (571, 1), (572, 1),

    -- Scorpions to Heavy Metal
    (573, 8), (574, 8), (575, 8), (576, 8), (577, 8), (578, 8), (579, 8), (580, 8),

    -- Motörhead to Heavy Metal
    (581, 8), (582, 8), (583, 8), (584, 8), (585, 8), (586, 8), (587, 8), (588, 8), (589, 8), (590, 8),

    -- Rainbow to Heavy Metal
    (591, 8), (592, 8), (593, 8), (594, 8), (595, 8), (596, 8), (597, 8),

    -- Deep Purple to Heavy Metal
    (598, 8), (599, 8), (600, 8), (601, 8), (602, 8), (603, 8), (604, 8), (605, 8),

    -- Blue Oyster Cult to Heavy Metal
    (606, 8), (607, 8), (608, 8), (609, 8), (610, 8), (611, 8), (612, 8), (613, 8),

    -- Budgie to Heavy Metal
    (614, 8), (615, 8), (616, 8), (617, 8), (618, 8), (619, 8), (620, 8)
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
    (237, 71), (238, 71), (239, 71), (240, 71), (241, 71), (242, 71), (243, 71), (244, 71), (245, 71), (246, 71), (247, 71), (248, 71), -- Kygo

    -- Paranoid
    (249, 72), (250, 72), (251, 72), (252, 72), (253, 72), (254, 72), (255, 72), (256, 72),

    -- Master of Puppets
    (257, 73), (258, 73), (259, 73), (260, 73), (261, 73), (262, 73), (263, 73), (264, 73),

    -- Reign in Blood
    (265, 74), (266, 74), (267, 74), (268, 74), (269, 74), (270, 74), (271, 74), (272, 74), (273, 74), (274, 74),

    -- Vulgar Display of Power
    (275, 75), (276, 75), (277, 75), (278, 75), (279, 75), (280, 75), (281, 75), (282, 75), (283, 75), (284, 75), (285, 75), (286, 75),

    -- Blizzard of Oz
    (287, 76), (288, 76), (289, 76), (290, 76), (291, 76), (292, 76), (293, 76), (294, 76), (295, 76), (296, 76),

    -- Screaming for Vengeance
    (297, 77), (298, 77), (299, 77), (300, 77), (301, 77), (302, 77), (303, 77), (304, 77), (305, 77), (306, 77),

    -- Britney
    (307, 78), (308, 78), (309, 78), (310, 78), (311, 78), (312, 78), (313, 78), (314, 78), (315, 78), (316, 78), (317, 78), (318, 78),

    -- Justified
    (319, 79), (320, 79), (321, 79), (322, 79), (323, 79), (324, 79), (325, 79), (326, 79), (327, 79), (328, 79), (329, 79), (330, 79), (331, 79),

    -- The Fame
    (332, 80), (333, 80), (334, 80), (335, 80), (336, 80), (337, 80), (338, 80), (339, 80), (340, 80), (341, 80), (342, 80), (343, 80), (344, 80),

    -- One of the Boys
    (345, 81), (346, 81), (347, 81), (348, 81), (349, 81), (350, 81), (351, 81), (352, 81), (353, 81), (354, 81), (355, 81), (356, 81), (357, 81),

    -- Lemonade
    (358, 82), (359, 82), (360, 82), (361, 82), (362, 82), (363, 82), (364, 82), (365, 82), (366, 82), (367, 82), (368, 82), (369, 82),

    -- 1989
    (370, 83), (371, 83), (372, 83), (373, 83), (374, 83), (375, 83), (376, 83), (377, 83), (378, 83), (379, 83), (380, 83), (381, 83), (382, 83),

    -- Four
    (383, 84), (384, 84), (385, 84), (386, 84), (387, 84), (388, 84), (389, 84), (390, 84), (391, 84), (392, 84), (393, 84), (394, 84),

    -- Illmatic
    (395, 85), (396, 85), (397, 85), (398, 85), (399, 85), (400, 85), (401, 85), (402, 85), (403, 85), (404, 85),

    -- Aquemini
    (405, 86), (406, 86), (407, 86), (408, 86), (409, 86), (410, 86), (411, 86), (412, 86), (413, 86), (414, 86), (415, 86), (416, 86), (417, 86), (418, 86), (419, 86),

    -- All Eyez on Me
    (420, 87), (421, 87), (422, 87), (423, 87), (424, 87), (425, 87), (426, 87), (427, 87), (428, 87), (429, 87), (430, 87), (431, 87), (432, 87), (433, 87),

    -- Get Rich or Die Tryin
    (434, 88), (435, 88), (436, 88), (437, 88), (438, 88), (439, 88), (440, 88), (441, 88), (442, 88), (443, 88), (444, 88), (445, 88), (446, 88), (447, 88), (448, 88), (449, 88),

    -- The Low End Theory
    (450, 89), (451, 89), (452, 89), (453, 89), (454, 89), (455, 89), (456, 89), (457, 89), (458, 89), (459, 89), (460, 89), (461, 89), (462, 89), (463, 89),

    -- Time Out
    (464, 90), (465, 90), (466, 90), (467, 90), (468, 90), (469, 90), (470, 90), (471, 90), (472, 90), (473, 90), (474, 90), (475, 90), (476, 90), (477, 90), (478, 90),

    -- Blue Train
    (479, 91), (480, 91), (481, 91), (482, 91), (483, 91),

    -- The Sidewinder
    (484, 92), (485, 92), (486, 92), (487, 92), (488, 92),

    -- The Turnaround!
    (489, 93), (490, 93), (491, 93), (492, 93), (493, 93), (494, 93),

    -- Moaning
    (495, 94), (496, 94), (497, 94), (498, 94), (499, 94), (500, 94),

    -- Everybody Digs Bill Evans
    (501, 95), (502, 95), (503, 95), (504, 95), (505, 95), (506, 95), (507, 95), (508, 95), (509, 95),

    -- Revolver
    (510, 96), (511, 96), (512, 96), (513, 96), (514, 96), (515, 96), (516, 96), (517, 96), (518, 96), (519, 96), (520, 96), (521, 96), (522, 96), (523, 96),

    -- The Dark Side of the Moon
    (524, 97), (525, 97), (526, 97), (527, 97), (528, 97), (529, 97), (530, 97), (531, 97), (532, 97), (533, 97),

    -- Kid A
    (534, 98), (535, 98), (536, 98), (537, 98), (538, 98), (539, 98), (540, 98), (541, 98), (542, 98),

    -- IV
    (543, 99), (544, 99), (545, 99), (546, 99), (547, 99), (548, 99), (549, 99), (550, 99),

    -- The Rise and Fall of Ziggy Stardust and the Spiders from Mars
    (551, 100), (552, 100), (553, 100), (554, 100), (555, 100), (556, 100), (557, 100), (558, 100), (559, 100), (560, 100), (561, 100),

    -- Rumours
    (562, 101), (563, 101), (564, 101), (565, 101), (566, 101), (567, 101), (568, 101), (569, 101), (570, 101), (571, 101), (572, 101),

    -- Lovedrive
    (573, 102), (574, 102), (575, 102), (576, 102), (577, 102), (578, 102), (579, 102), (580, 102),

    -- Overkill
    (581, 103), (582, 103), (583, 103), (584, 103), (585, 103), (586, 103), (587, 103), (588, 103), (589, 103), (590, 103),

    -- Long Live Rock n Roll
    (591, 104), (592, 104), (593, 104), (594, 104), (595, 104), (596, 104), (597, 104),

    -- Burn
    (598, 105), (599, 105), (600, 105), (601, 105), (602, 105), (603, 105), (604, 105), (605, 105),

    -- Secret Treaties
    (606, 106), (607, 106), (608, 106), (609, 106), (610, 106), (611, 106), (612, 106), (613, 106),

    -- Never Turn Your Back on a Friend
    (614, 107), (615, 107), (616, 107), (617, 107), (618, 107), (619, 107), (620, 107)
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
    (237, 23), (238, 23), (239, 23), (240, 23), (241, 23), (242, 23), (243, 23), (244, 23), (245, 23), (246, 23), (247, 23), (248, 23), -- Kids in Love

    -- Black Sabbath
    (249, 24), (250, 24), (251, 24), (252, 24), (253, 24), (254, 24), (255, 24), (256, 24), -- Paranoid

    -- Metallica
    (257, 25), (258, 25), (259, 25), (260, 25), (261, 25), (262, 25), (263, 25), (264, 25), -- Master of Puppets

    -- Slayer
    (265, 26), (266, 26), (267, 26), (268, 26), (269, 26), (270, 26), (271, 26), (272, 26), (273, 26), (274, 26), -- Reign in Blood

    -- Pantera
    (275, 27), (276, 27), (277, 27), (278, 27), (279, 27), (280, 27), (281, 27), (282, 27), (283, 27), (284, 27), (285, 27), (286, 27), -- Vulgar Display of Power

    -- Oz
    (287, 28), (288, 28), (289, 28), (290, 28), (291, 28), (292, 28), (293, 28), (294, 28), (295, 28), (296, 28), -- Blizzard of Oz

    -- Judas Priest
    (297, 29), (298, 29), (299, 29), (300, 29), (301, 29), (302, 29), (303, 29), (304, 29), (305, 29), (306, 29), -- Screaming for Vengeance

    -- Britney Spears
    (307, 30), (308, 30), (309, 30), (310, 30), (311, 30), (312, 30), (313, 30), (314, 30), (315, 30), (316, 30), (317, 30), (318, 30), -- Britney

    -- Justin Timberlake
    (319, 31), (320, 31), (321, 31), (322, 31), (323, 31), (324, 31), (325, 31), (326, 31), (327, 31), (328, 31), (329, 31), (330, 31), (331, 31), -- Justified

    -- Lady Gaga
    (332, 32), (333, 32), (334, 32), (335, 32), (336, 32), (337, 32), (338, 32), (339, 32), (340, 32), (341, 32), (342, 32), (343, 32), (344, 32), -- The Fame

    -- Katy Perry
    (345, 33), (346, 33), (347, 33), (348, 33), (349, 33), (350, 33), (351, 33), (352, 33), (353, 33), (354, 33), (355, 33), (356, 33), (357, 33), -- One of the Boys

    -- Beyonce
    (358, 34), (359, 34), (360, 34), (361, 34), (362, 34), (363, 34), (364, 34), (365, 34), (366, 34), (367, 34), (368, 34), (369, 34), -- Lemonade

    -- Taylor Swift
    (370, 35), (371, 35), (372, 35), (373, 35), (374, 35), (375, 35), (376, 35), (377, 35), (378, 35), (379, 35), (380, 35), (381, 35), (382, 35), -- 1989

    -- One Direction
    (383, 36), (384, 36), (385, 36), (386, 36), (387, 36), (388, 36), (389, 36), (390, 36), (391, 36), (392, 36), (393, 36), (394, 36), -- Four

    -- Nas
    (395, 37), (396, 37), (397, 37), (398, 37), (399, 37), (400, 37), (401, 37), (402, 37), (403, 37), (404, 37), -- Illmatic

    -- Outkast
    (405, 38), (406, 38), (407, 38), (408, 38), (409, 38), (410, 38), (411, 38), (412, 38), (413, 38), (414, 38), (415, 38), (416, 38), (417, 38), (418, 38), (419, 38), -- Aquemini

    -- Tupac
    (420, 39), (421, 39), (422, 39), (423, 39), (424, 39), (425, 39), (426, 39), (427, 39), (428, 39), (429, 39), (430, 39), (431, 39), (432, 39), (433, 39), -- All Eyez on Me

    -- 50 Cent
    (434, 40), (435, 40), (436, 40), (437, 40), (438, 40), (439, 40), (440, 40), (441, 40), (442, 40), (443, 40), (444, 40), (445, 40), (446, 40), (447, 40), (448, 40), (449, 40), -- Get Rich or Die Tryin

    -- A Tribe Called Quest
    (450, 41), (451, 41), (452, 41), (453, 41), (454, 41), (455, 41), (456, 41), (457, 41), (458, 41), (459, 41), (460, 41), (461, 41), (462, 41), (463, 41), -- The Low End Theory

    -- Dave Brubeck Quartet
    (464, 42), (465, 42), (466, 42), (467, 42), (468, 42), (469, 42), (470, 42), (471, 42), (472, 42), (473, 42), (474, 42), (475, 42), (476, 42), (477, 42), (478, 42), -- Time Out

    -- John Coltrane
    (479, 43), (480, 43), (481, 43), (482, 43), (483, 43), -- Blue Train

    -- Lee Morgan
    (484, 44), (485, 44), (486, 44), (487, 44), (488, 44), -- The Sidewinder

    -- Hank Mobley
    (489, 45), (490, 45), (491, 45), (492, 45), (493, 45), (494, 45), -- The Turnaround!

    -- Art Blakey
    (495, 46), (496, 46), (497, 46), (498, 46), (499, 46), (500, 46), -- Moanin'

    -- Bill Evans
    (501, 47), (502, 47), (503, 47), (504, 47), (505, 47), (506, 47), (507, 47), (508, 47), (509, 47), -- Everybody Digs Bill Evans

    -- The Beatles
    (510, 48), (511, 48), (512, 48), (513, 48), (514, 48), (515, 48), (516, 48), (517, 48), (518, 48), (519, 48), (520, 48), (521, 48), (522, 48), (523, 48), -- Revolver

    -- Pink Floyd
    (524, 49), (525, 49), (526, 49), (527, 49), (528, 49), (529, 49), (530, 49), (531, 49), (532, 49), (533, 49), -- The Dark Side of the Moon

    -- Radiohead
    (534, 50), (535, 50), (536, 50), (537, 50), (538, 50), (539, 50), (540, 50), (541, 50), (542, 50), -- Kid A

    -- Led Zeppelin
    (543, 51), (544, 51), (545, 51), (546, 51), (547, 51), (548, 51), (549, 51), (550, 51), -- IV

    -- David Bowie
    (551, 52), (552, 52), (553, 52), (554, 52), (555, 52), (556, 52), (557, 52), (558, 52), (559, 52), (560, 52), (561, 52), -- The Rise and Fall of Ziggy Stardust and the Spiders from Mars

    -- Fleetwood Mac
    (562, 53), (563, 53), (564, 53), (565, 53), (566, 53), (567, 53), (568, 53), (569, 53), (570, 53), (571, 53), (572, 53), -- Rumours

    -- Scorpions
    (573, 54), (574, 54), (575, 54), (576, 54), (577, 54), (578, 54), (579, 54), (580, 54), -- Lovedrive

    -- Motörhead
    (581, 55), (582, 55), (583, 55), (584, 55), (585, 55), (586, 55), (587, 55), (588, 55), (589, 55), (590, 55), -- Overkill

    -- Rainbow
    (591, 56), (592, 56), (593, 56), (594, 56), (595, 56), (596, 56), (597, 56), -- Long Live Rock n Roll

    -- Deep Purple
    (598, 57), (599, 57), (600, 57), (601, 57), (602, 57), (603, 57), (604, 57), (605, 57), -- Burn

    -- Blue Oyster Cult
    (606, 58), (607, 58), (608, 58), (609, 58), (610, 58), (611, 58), (612, 58), (613, 58), -- Secret Treaties

    -- Budgie
    (614, 59), (615, 59), (616, 59), (617, 59), (618, 59), (619, 59), (620, 59) -- Never Turn Your Back on a Friend
;