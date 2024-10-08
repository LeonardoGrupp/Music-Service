package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.dto.MusicDTO;
import com.example.MusicMicroservice_CopyAllToNew.entites.Genre;
import com.example.MusicMicroservice_CopyAllToNew.entites.Music;
import com.example.MusicMicroservice_CopyAllToNew.entites.Album;
import com.example.MusicMicroservice_CopyAllToNew.entites.Artist;
import com.example.MusicMicroservice_CopyAllToNew.repositories.MusicRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class MusicServiceTest {

    private MusicRepository musicRepositoryMock;
    private MusicService musicService;
    private GenreService genreService;
    private AlbumService albumService;
    private ArtistService artistService;

    @BeforeEach
    void setUp() {
        musicRepositoryMock = mock(MusicRepository.class);
        genreService = mock(GenreService.class);
        albumService = mock(AlbumService.class);
        artistService = mock(ArtistService.class);
        musicService = new MusicService(musicRepositoryMock, genreService, albumService, artistService);
    }

    @Test
    void findAllMusicShouldReturnList() {
        List<Music> allMusicList = Arrays.asList(
                new Music("The Way I Am", "url1", "1999-01-01"), // The Marshall Mathers LP
                new Music("Slim Shady", "url2", "1998-02-03"), // The Slim Shady LP
                new Music("Eminem låt 3", "url3", "1997-07-07"), // The Marshall Mathers LP
                new Music("Diamonds", "url4", "2005-06-05"), // Loud
                new Music("Waiting For Love", "url5", "2011-11-02"), // Stories
                new Music("Talk To Myself", "url6", "2013-12-31"), // Stories
                new Music("Hey Brother", "url7", "2010-02-05") // True
        );

        when(musicRepositoryMock.findAll()).thenReturn(allMusicList);

        List<Music> response = musicService.findAllMusic();

        assertEquals(allMusicList, response, "ERROR: Music lists was not identical");
        assertEquals(7, response.size(), "ERROR: Sizes was not identical");
        assertEquals("The Way I Am", response.get(0).getTitle(), "ERROR: Titles was not identical");

        verify(musicRepositoryMock).findAll();
    }

    @Test
    void findMusicByArtistShouldReturnList() {
        Artist eminem = new Artist("Eminem");
        Album album = new Album("Eminem album");
        Genre genre = new Genre("Hip-Hop");
        List<Music> eminemMusicList = Arrays.asList(
                new Music("The Way I Am", "url1", "1999-01-01", Arrays.asList(genre), Arrays.asList(album), Arrays.asList(eminem)),
                new Music("Slim Shady", "url2", "1998-02-03", Arrays.asList(genre), Arrays.asList(album), Arrays.asList(eminem)),
                new Music("Eminem låt 3", "url3", "1997-07-07", Arrays.asList(genre), Arrays.asList(album), Arrays.asList(eminem))
        );

        when(musicRepositoryMock.findAll()).thenReturn(eminemMusicList);

        List<Music> response = musicService.findMusicByArtist("Eminem");

        assertEquals(eminemMusicList, response, "ERROR: Music lists was not identical");
        assertEquals(3, response.size(), "ERROR: Sizes was not identical");
        assertEquals("Slim Shady", response.get(1).getTitle(), "ERROR: Artists was not identical");

        verify(musicRepositoryMock).findAll();
    }

    @Test
    void findMusicByAlbumShouldReturnList() {
        Artist avicii = new Artist("Avicii");
        Album stories = new Album("Stories");
        Genre genre = new Genre("EDM");
        List<Music> albumMusicList = Arrays.asList(
                new Music("Waiting For Love", "url1", "2011-11-02", Arrays.asList(genre), Arrays.asList(stories), Arrays.asList(avicii)),
                new Music("Talk To Myself", "url2", "2013-12-31", Arrays.asList(genre), Arrays.asList(stories), Arrays.asList(avicii))
        );

        when(musicRepositoryMock.findAll()).thenReturn(albumMusicList);

        List<Music> response = musicService.findMusicByAlbum("Stories");

        assertEquals(albumMusicList, response, "ERROR: Music lists was not identical");
        assertEquals(2, response.size(), "ERROR: Sizes was not identical");
        assertEquals(stories, response.get(0).getAlbums().get(0), "ERROR: Albums was not identical");

        verify(musicRepositoryMock).findAll();
    }

    @Test
    void findMusicByGenreShouldReturnList() {
        Artist avicii = new Artist("Avicii");
        Album stories = new Album("Stories");
        Genre genre = new Genre("EDM");
        List<Music> genreMusicList = Arrays.asList(
                new Music("Waiting For Love", "url1", "2011-11-02", Arrays.asList(genre), Arrays.asList(stories), Arrays.asList(avicii)),
                new Music("Talk To Myself", "url2", "2013-12-31", Arrays.asList(genre), Arrays.asList(stories), Arrays.asList(avicii))
        );

        when(musicRepositoryMock.findAll()).thenReturn(genreMusicList);

        List<Music> response = musicService.findMusicByGenre("EDM");

        assertEquals(genreMusicList, response, "ERROR: Music lists was not identical");
        assertEquals(2, response.size(), "ERROR: Sizes was not identical");
        assertEquals(genre, response.get(0).getGenres().get(0), "ERROR: Genres was not identical");

        verify(musicRepositoryMock).findAll();
    }

    @Test
    void findMusicByUrlShouldReturnMusic() {
        Music music = new Music("titel", "url", "releasedate");

        when(musicRepositoryMock.findMusicByUrl("url")).thenReturn(music);

        Music response = musicService.findMusicByUrl("url");

        assertEquals(music, response, "ERROR: Music was not identical");

        verify(musicRepositoryMock).findMusicByUrl("url");
    }

    @Test
    void findMusicByIdShouldReturnMusic() {
        Music music = new Music("Clint Eastwood", "url1", "2001-03-05");
        music.setId(1);

        long musicId = 1;

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(music));

        Music response = musicService.findMusicById(musicId);

        assertEquals(musicId, response.getId(), "ERROR: IDs was not identical");
        assertEquals("Clint Eastwood", response.getTitle(), "ERROR: Titles was not identical");

        verify(musicRepositoryMock).findById(musicId);
    }

    @Test
    void findMusicByIdShouldReturnException() {
        long musicId = 1;

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.empty());

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.findMusicById(musicId);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Could not find music with id: " + musicId, response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicRepositoryMock).findById(musicId);
    }

    @Test
    void createMusicShouldReturnMusic() {
        // Arrange: Prepare mock data
        List<String> albumInputs = Arrays.asList("Album1", "Album2");
        List<String> artistInputs = Arrays.asList("Artist1", "Artist2");
        List<String> genreInputs = Arrays.asList("Pop", "RNB");
        MusicDTO musicDTO = new MusicDTO("SongTitle", "url1", "2024-09-02", genreInputs, albumInputs, artistInputs);

        List<Album> albums = Arrays.asList(new Album("Album1"), new Album("Album2"));
        List<Artist> artists = Arrays.asList(new Artist("Artist1"), new Artist("Artist2"));
        List<Genre> genres = Arrays.asList(new Genre("Pop"), new Genre("RNB"));
        Music music = new Music("SongTitle", "url1", "2024-09-02", genres, albums, artists);

        Music savedMusic = musicRepositoryMock.save(music);

        // Mock album existence check (returns true)
        when(musicRepositoryMock.save(music)).thenReturn(music);

        Music response = musicService.createMusic(musicDTO);

        assertEquals(savedMusic, response, "ERROR: Responses was not the same");

        verify(musicRepositoryMock).save(music);
    }

    @Test
    void createMusicNoTitleShouldReturnException() {
        List<String> albumStringList = Arrays.asList("Good Girl Gone Bad");
        List<String> artistStringList = Arrays.asList("Rihanna", "Jay-Z");
        List<String> genreStringList = Arrays.asList("Pop", "RNB");
        MusicDTO musicDTO = new MusicDTO("", "url", "release", albumStringList, genreStringList, artistStringList);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.createMusic(musicDTO);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music Title was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicRepositoryMock, never()).save(any(Music.class));
    }

    @Test
    void createMusicNoUrlShouldReturnException() {
        MusicDTO musicDTO = new MusicDTO("title", "", "release");
        List<String> albumStringList = Arrays.asList("Good Girl Gone Bad");
        List<String> artistStringList = Arrays.asList("Rihanna", "Jay-Z");
        List<String> genreStringList = Arrays.asList("Pop", "RNB");
        musicDTO.setAlbumInputs(albumStringList);
        musicDTO.setArtistInputs(artistStringList);
        musicDTO.setGenreInputs(genreStringList);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.createMusic(musicDTO);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music URL was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicRepositoryMock, never()).save(any(Music.class));
    }

    @Test
    void createMusicNoReleaseDateShouldReturnException() {
        MusicDTO musicDTO = new MusicDTO("title", "url", "");
        List<String> albumStringList = Arrays.asList("Good Girl Gone Bad");
        List<String> artistStringList = Arrays.asList("Rihanna", "Jay-Z");
        List<String> genreStringList = Arrays.asList("Pop", "RNB");
        musicDTO.setAlbumInputs(albumStringList);
        musicDTO.setArtistInputs(artistStringList);
        musicDTO.setGenreInputs(genreStringList);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.createMusic(musicDTO);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music Release date was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicRepositoryMock, never()).save(any(Music.class));
    }

    @Test
    void createMusicNoGenreShouldReturnException() {
        MusicDTO musicDTO = new MusicDTO("title", "url", "release");
        List<String> albumStringList = Arrays.asList("Good Girl Gone Bad");
        List<String> artistStringList = Arrays.asList("Rihanna", "Jay-Z");
        musicDTO.setAlbumInputs(albumStringList);
        musicDTO.setArtistInputs(artistStringList);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.createMusic(musicDTO);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music Genre was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicRepositoryMock, never()).save(any(Music.class));
    }

    @Test
    void createMusicNoAlbumShouldReturnException() {
        MusicDTO musicDTO = new MusicDTO("title", "url", "release");
        List<String> artistStringList = Arrays.asList("Rihanna", "Jay-Z");
        List<String> genreStringList = Arrays.asList("Pop", "RNB");
        musicDTO.setArtistInputs(artistStringList);
        musicDTO.setGenreInputs(genreStringList);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.createMusic(musicDTO);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music Album was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicRepositoryMock, never()).save(any(Music.class));
    }

    @Test
    void createMusicNoArtistShouldReturnException() {
        MusicDTO musicDTO = new MusicDTO("title", "url", "release");
        List<String> albumStringList = Arrays.asList("Good Girl Gone Bad");
        List<String> genreStringList = Arrays.asList("Pop", "RNB");
        musicDTO.setAlbumInputs(albumStringList);
        musicDTO.setGenreInputs(genreStringList);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.createMusic(musicDTO);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music Artist was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicRepositoryMock, never()).save(any(Music.class));
    }

    @Test
    void getAllGenresShouldReturnList() {
        List<String> genreStrings = Arrays.asList("Pop", "RNB");
        List<String> albumStrings = Arrays.asList("Album");
        List<String> artistStrings = Arrays.asList("Artist");

        MusicDTO musicDTO = new MusicDTO("titel", "url", "release", genreStrings, albumStrings, artistStrings);

        List<Genre> genres = Arrays.asList(new Genre("Pop"), new Genre("RNB"));

        when(genreService.findAllGenres()).thenReturn(genres);

        List<Genre> responseList = musicService.getAllGenres(musicDTO);

        assertEquals(genres, responseList, "ERROR: Lists was not identical");

        verify(genreService).findAllGenres();
    }

    @Test
    void getAllAlbumsShouldReturnList() {
        List<String> genreStrings = Arrays.asList("Pop");
        List<String> albumStrings = Arrays.asList("Good Girl Gone Bad", "Come Clarity");
        List<String> artistStrings = Arrays.asList("Artist");

        MusicDTO musicDTO = new MusicDTO("titel", "url", "release", genreStrings, albumStrings, artistStrings);

        List<Album> albums = Arrays.asList(new Album("Good Girl Gone Bad"), new Album("Come Clarity"));

        when(albumService.getAllAlbums()).thenReturn(albums);

        List<Album> responseList = musicService.getAllAlbums(musicDTO);

        assertEquals(albums, responseList, "ERROR: Lists was not identical");

        verify(albumService).getAllAlbums();
    }

    @Test
    void getAllArtistsShouldReturnList() {
        List<String> genreStrings = Arrays.asList("Pop");
        List<String> albumStrings = Arrays.asList("Good Girl Gone Bad");
        List<String> artistStrings = Arrays.asList("Rihanna", "Jay-Z");

        MusicDTO musicDTO = new MusicDTO("titel", "url", "release", genreStrings, albumStrings, artistStrings);

        List<Artist> artists = Arrays.asList(new Artist("Rihanna"), new Artist("Jay-Z"));

        when(artistService.getAllArtists()).thenReturn(artists);

        List<Artist> responseList = musicService.getAllArtists(musicDTO);

        assertEquals(artists, responseList, "ERROR: Lists was not identical");

        verify(artistService).getAllArtists();
    }

    @Test
    void updateMusicShouldReturnMusic() {
        long musicId = 1;
        Music existingMusic = new Music("Umbrella", "url1", "2002-02-02");
        existingMusic.setId(musicId);

        MusicDTO newInfo = new MusicDTO("Waiting For Love", "url2", "2011-11-02");

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(existingMusic));
        when(musicRepositoryMock.save(existingMusic)).thenReturn(existingMusic);

        Music response = musicService.updateMusic(musicId, newInfo);

        assertEquals("Waiting For Love", response.getTitle(), "ERROR: Titles was not identical");
        assertEquals("2011-11-02", response.getReleaseDate(), "ERROR: ReleaseDates was not identical");

        verify(musicRepositoryMock).findById(musicId);
        verify(musicRepositoryMock).save(existingMusic);
    }

    @Test
    void updateMusicInvalidIdShouldReturnException() {
        long musicId = 1;
        MusicDTO newInfo = new MusicDTO("title", "url1", "2022-02-02");

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.empty());

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.updateMusic(musicId, newInfo);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Could not find music with id: " + musicId, response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes not identical");

        verify(musicRepositoryMock).findById(musicId);
    }

    @Test
    void updateMusicOnlyTypeShouldReturnMusic() {
        long musicId = 1;
        Music existingMusic = new Music("Umbrella", "url1", "2002-02-02");
        existingMusic.setId(musicId);

        MusicDTO newInfo = new MusicDTO("", "", "");

        Music updatedMusic = new Music("Umbrella", "url1", "2002-02-02");

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(existingMusic));
        when(musicRepositoryMock.save(existingMusic)).thenReturn(updatedMusic);

        Music response = musicService.updateMusic(musicId, newInfo);

        assertEquals("music", response.getType(), "ERROR: Types was not identical");
        assertEquals("url1", response.getUrl(), "ERROR: URLs was not identical");

        verify(musicRepositoryMock).findById(musicId);
        verify(musicRepositoryMock).save(existingMusic);
    }

    @Test
    void updateMusicOnlyTitleShouldReturnMusic() {
        long musicId = 1;
        Music existingMusic = new Music("Umbrella", "url1", "2002-02-02");
        existingMusic.setId(musicId);

        MusicDTO newInfo = new MusicDTO("Cheers", "", "");

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(existingMusic));
        when(musicRepositoryMock.save(existingMusic)).thenReturn(existingMusic);

        Music response = musicService.updateMusic(musicId, newInfo);

        assertEquals("Cheers", response.getTitle(), "ERROR: Titles was not identical");
        assertEquals("url1", response.getUrl(), "ERROR: URLs was not identical");

        verify(musicRepositoryMock).findById(musicId);
        verify(musicRepositoryMock).save(existingMusic);
    }

    @Test
    void updateMusicOnlyReleaseDateShouldReturnMusic() {
        long musicId = 1;
        Music existingMusic = new Music("Umbrella", "url1", "2002-02-02");
        existingMusic.setId(musicId);

        MusicDTO newInfo = new MusicDTO("", "", "2024-09-06");

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(existingMusic));
        when(musicRepositoryMock.save(existingMusic)).thenReturn(existingMusic);

        Music response = musicService.updateMusic(musicId, newInfo);

        assertEquals("2024-09-06", response.getReleaseDate(), "ERROR: Release dates was not identical");
        assertEquals("url1", response.getUrl(), "ERROR: URLs was not identical");

        verify(musicRepositoryMock).findById(musicId);
        verify(musicRepositoryMock).save(existingMusic);
    }

    @Test
    void updateMusicOnlyAlbumInputsShouldReturnMusic() {
        List<Album> albumList = Arrays.asList(new Album("album"));
        List<Artist> artistList = Arrays.asList(new Artist("artist"));
        List<Genre> genreList = Arrays.asList(new Genre("Pop"));
        long musicId = 1;
        Music existingMusic = new Music("Umbrella", "url1", "2002-02-02", genreList, albumList, artistList);
        existingMusic.setId(musicId);

        List<String> albumStringInputs = Arrays.asList("new album");
        List<String> artistStringInputs = Collections.emptyList();
        List<String> genreStringInputs = Arrays.asList("new genre");

        MusicDTO newInfo = new MusicDTO("", "", "2024-09-06", genreStringInputs, albumStringInputs, artistStringInputs);

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(existingMusic));
        when(musicRepositoryMock.save(existingMusic)).thenReturn(existingMusic);

        Music response = musicService.updateMusic(musicId, newInfo);

        assertEquals("2024-09-06", response.getReleaseDate(), "ERROR: Release dates was not identical");
        assertEquals("url1", response.getUrl(), "ERROR: URLs was not identical");

        verify(musicRepositoryMock).findById(musicId);
        verify(musicRepositoryMock).save(existingMusic);
    }
    @Test
    void updateMusicOnlyGenreShouldReturnMusic() {
        List<Album> albumList = Arrays.asList(new Album("album"));
        List<Artist> artistList = Arrays.asList(new Artist("artist"));
        List<Genre> genreList = Arrays.asList(new Genre("Pop"));
        long musicId = 1;
        Music existingMusic = new Music("Umbrella", "url1", "2002-02-02", genreList, albumList, artistList);
        existingMusic.setId(musicId);

        List<String> albumStringInputs = Collections.emptyList();
        List<String> artistStringInputs = Collections.emptyList();
        List<String> genreStringInputs = Arrays.asList("Pop", "RNB");
        MusicDTO newInfo = new MusicDTO("", "", "", genreStringInputs, albumStringInputs, artistStringInputs);

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(existingMusic));
        when(musicRepositoryMock.save(existingMusic)).thenReturn(existingMusic);

        Music response = musicService.updateMusic(musicId, newInfo);

        assertEquals("Umbrella", response.getTitle(), "ERROR: Titles was not identical");
        assertEquals("artist", response.getArtists().get(0).getName(), "ERROR: Genres was not identical");

        verify(musicRepositoryMock).findById(musicId);
        verify(musicRepositoryMock).save(existingMusic);
    }

    @Test
    void updateMusicOnlyArtistInputsShouldReturnMusic() {
        List<Album> albumList = Arrays.asList(new Album("album"));
        List<Artist> artistList = Arrays.asList(new Artist("artist"));
        List<Genre> genreList = Arrays.asList(new Genre("genre"));
        long musicId = 1;
        Music existingMusic = new Music("Umbrella", "url1", "2002-02-02", genreList, albumList, artistList);
        existingMusic.setId(musicId);

        List<String> albumStringInputs = Collections.emptyList();
        List<String> genreStringInputs = Collections.emptyList();
        List<String> artistStringInputs = Arrays.asList("new artist");

        MusicDTO newInfo = new MusicDTO("", "", "2024-09-06", genreStringInputs, albumStringInputs, artistStringInputs);

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(existingMusic));
        when(musicRepositoryMock.save(existingMusic)).thenReturn(existingMusic);

        Music response = musicService.updateMusic(musicId, newInfo);

        assertEquals("2024-09-06", response.getReleaseDate(), "ERROR: Release dates was not identical");
        assertEquals("genre", response.getGenres().get(0).getGenre(), "ERROR: Genres was not identical");

        verify(musicRepositoryMock).findById(musicId);
        verify(musicRepositoryMock).save(existingMusic);
    }

    @Test
    void deleteMusicShouldReturnString() {
        long musicId = 1;
        Music musicToBeDeleted = new Music("Umbrella", "url1", "2001-11-11");
        musicToBeDeleted.setId(musicId);

        when(musicRepositoryMock.findById(musicId)).thenReturn(Optional.of(musicToBeDeleted));

        String response = musicService.deleteMusic(musicId);

        assertEquals("Music successfully deleted", response, "ERROR: Strings was not identical");

        verify(musicRepositoryMock).findById(musicId);
        verify(musicRepositoryMock).delete(musicToBeDeleted);
    }

    @Test
    void playMusicShouldReturnString() {
        String url = "url";
        Music music = new Music("The Real Slim Shady", url, "releasdate");
        List<Genre> genreList = Arrays.asList(new Genre("Rock"), new Genre("Pop"));
        music.setGenres(genreList);

        when(musicRepositoryMock.findMusicByUrl(url)).thenReturn(music);

        String result = musicService.playMusic(url);

        assertEquals("Playing " + music.getType() + ": " + music.getTitle(), result, "ERROR: Strings was not identical");

        verify(musicRepositoryMock).findMusicByUrl(url);
    }

    @Test
    void playMusicShouldReturnException() {
        String nonExistingURL = "url";

        when(musicRepositoryMock.findMusicByUrl(nonExistingURL)).thenReturn(null);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.playMusic(nonExistingURL);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music with URL not found", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes was not identical");
    }

    @Test
    void likeMusicShouldReturnString() {
        String url = "url";
        Music musicToLike = new Music("The Real Slim Shady", url, "releasedate");
        musicToLike.setLikes(0);
        List<Genre> genreLists = Arrays.asList(new Genre("Rock"), new Genre("Pop"));
        musicToLike.setGenres(genreLists);

        when(musicRepositoryMock.findMusicByUrl(url)).thenReturn(musicToLike);

        String result = musicService.likeMusic(url);

        assertEquals(1, musicToLike.getLikes(), "ERROR: Total likes was not identical");
        assertEquals("Liked music: " + musicToLike.getTitle(), result, "ERROR: Strings was not identical");
    }

    @Test
    void likeMusicIdNotFoundShouldReturnException() {
        String nonExistingURL = "url";

        when(musicRepositoryMock.findMusicByUrl(nonExistingURL)).thenReturn(null);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.likeMusic(nonExistingURL);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: music with URL not found", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes was not identical");
    }

    @Test
    void disLikeMusicShouldReturnString() {
        String url = "url";
        Music musicToDisLike = new Music("The Real Slim Shady", url, "releasedate");
        musicToDisLike.setDisLikes(0);

        when(musicRepositoryMock.findMusicByUrl(url)).thenReturn(musicToDisLike);

        String result = musicService.disLikeMusic(url);

        assertEquals(1, musicToDisLike.getDisLikes(), "ERROR: Total likes was not identical");
        assertEquals("Disliked " + musicToDisLike.getType() + ": " + musicToDisLike.getTitle(), result, "ERROR: Strings was not identical");
    }

    @Test
    void disLikeMusicIdNotFoundShouldReturnException() {
        String nonExistingURL = "url";

        when(musicRepositoryMock.findMusicByUrl(nonExistingURL)).thenReturn(null);

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicService.disLikeMusic(nonExistingURL);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: music with URL not found", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes was not identical");
    }

    @Test
    void checkIfMusicExistByUrlShouldReturnTrue() {
        String url = "url";
        Music music = new Music("title", "url", "release");

        when(musicRepositoryMock.findMusicByUrl(url)).thenReturn(music);

        Boolean response = musicService.checkIfMusicExistByUrl(url);

        assertTrue(response, "ERROR: Response was false");

        verify(musicRepositoryMock).findMusicByUrl(url);
    }

    @Test
    void checkIfMusicExistByUrlShouldReturnFalse() {
        String url = "url";

        when(musicRepositoryMock.findMusicByUrl(url)).thenReturn(null);

        Boolean response = musicService.checkIfMusicExistByUrl(url);

        assertFalse(response, "ERROR: Response was true");

        verify(musicRepositoryMock).findMusicByUrl(url);
    }
}