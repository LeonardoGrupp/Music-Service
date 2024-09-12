package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.dto.MusicDTO;
import com.example.MusicMicroservice_CopyAllToNew.entites.Genre;
import com.example.MusicMicroservice_CopyAllToNew.entites.Music;
import com.example.MusicMicroservice_CopyAllToNew.repositories.MusicRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.server.ResponseStatusException;
import vo.Album;
import vo.Artist;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class MusicServiceTest {

    private MusicRepository musicRepositoryMock;
    private MusicService musicService;
    private RestTemplate restTemplate;
    private GenreService genreService;

    @BeforeEach
    void setUp() {
        musicRepositoryMock = mock(MusicRepository.class);
        restTemplate = mock(RestTemplate.class);
        genreService = mock(GenreService.class);
        musicService = new MusicService(musicRepositoryMock, restTemplate, genreService);
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

        // Mock album existence check (returns true)
        ResponseEntity<Boolean> albumExistsResponse = new ResponseEntity<>(true, HttpStatus.OK);
        doReturn(albumExistsResponse).when(restTemplate).getForEntity(contains("exists"), eq(Boolean.class));

        // Mock artist existence check (returns true)
        ResponseEntity<Boolean> artistExistsResponse = new ResponseEntity<>(true, HttpStatus.OK);
        doReturn(artistExistsResponse).when(restTemplate).getForEntity(contains("exists"), eq(Boolean.class));

        // Mock the list of albums returned by the album-service
        Album[] albums = { new Album("Album1"), new Album("Album2") };
        ResponseEntity<Album[]> albumListResponse = new ResponseEntity<>(albums, HttpStatus.OK);
        doReturn(albumListResponse).when(restTemplate).getForEntity(contains("getAllAlbums"), eq(Album[].class));

        // Mock the list of artists returned by the artist-service
        Artist[] artists = { new Artist("Artist1"), new Artist("Artist2") };
        ResponseEntity<Artist[]> artistListResponse = new ResponseEntity<>(artists, HttpStatus.OK);
        doReturn(artistListResponse).when(restTemplate).getForEntity(contains("getAllArtists"), eq(Artist[].class));

        // Mock the list of genres returned by the genreService
        List<Genre> genres = Arrays.asList(new Genre("Pop"), new Genre("RNB"));
        when(genreService.findAllGenres()).thenReturn(genres);


        // Mock the repository save
        Music savedMusic = new Music("SongTitle", "url1", "2024-09-02", genres, Arrays.asList(albums), Arrays.asList(artists));
        when(musicRepositoryMock.save(any(Music.class))).thenReturn(savedMusic);

        // Act: Call the service method
        Music result = musicService.createMusic(musicDTO);

        // Assert: Verify that the result matches the expected saved music
        assertEquals(musicDTO.getTitle(), result.getTitle(), "ERROR: Titles was not identical");
        assertEquals(musicDTO.getReleaseDate(), result.getReleaseDate(), "ERROR: Release dates was not identical");
        assertEquals(musicDTO.getGenreInputs().get(0), result.getGenres().get(0).getGenre(), "ERROR: Genres was not identical");
        assertEquals(2, result.getAlbums().size(), "ERROR: Album list sizes was not identical");
        assertEquals(2, result.getArtists().size(), "ERROR: Artist list sizes was not identical");

        // Verify the spy was used and calls were made
        verify(restTemplate, times(4)).getForEntity(contains("exists"), eq(Boolean.class));
        verify(restTemplate, times(1)).getForEntity(contains("getAllAlbums"), eq(Album[].class));
        verify(restTemplate, times(1)).getForEntity(contains("getAllArtists"), eq(Artist[].class));
        verify(genreService).findAllGenres();
    }

    @Test
    void createMusicArtistAndAlbumDontExistShouldReturnMusic() {
        List<String> albumInputs = Arrays.asList("Album1", "Album2");
        List<String> artistInputs = Arrays.asList("Artist1", "Artist2");
        List<String> genreInputs = Arrays.asList("Pop", "RNB");
        MusicDTO musicDTO = new MusicDTO("SongTitle", "url1", "2024-09-02", genreInputs, albumInputs, artistInputs);

        // Mock album existence check (returns true)
        ResponseEntity<Boolean> albumExistsResponse = new ResponseEntity<>(true, HttpStatus.OK);
        doReturn(albumExistsResponse).when(restTemplate).getForEntity(contains("exists"), eq(Boolean.class));

        // Mock artist existence check (returns false for both artists)
        ResponseEntity<Boolean> artistExistsResponse = new ResponseEntity<>(false, HttpStatus.OK);
        doReturn(artistExistsResponse).when(restTemplate).getForEntity(contains("exists"), eq(Boolean.class));

        // Mock the list of albums returned by the album-service
        ResponseEntity<Album> createAlbumResponse1 = new ResponseEntity<>(new Album("Album1"), HttpStatus.OK);
        ResponseEntity<Album> createAlbumResponse2 = new ResponseEntity<>(new Album("Album2"), HttpStatus.OK);
        doReturn(createAlbumResponse1).when(restTemplate).postForEntity(contains("createAlbum"), any(Album.class), eq(Album.class));
        doReturn(createAlbumResponse2).when(restTemplate).postForEntity(contains("createAlbum"), any(Album.class), eq(Album.class));


        // Mock artist creation when artist does not exist
        ResponseEntity<Artist> createArtistResponse1 = new ResponseEntity<>(new Artist("Artist1"), HttpStatus.OK);
        ResponseEntity<Artist> createArtistResponse2 = new ResponseEntity<>(new Artist("Artist2"), HttpStatus.OK);
        doReturn(createArtistResponse1).when(restTemplate).postForEntity(contains("createArtist"), any(Artist.class), eq(Artist.class));
        doReturn(createArtistResponse2).when(restTemplate).postForEntity(contains("createArtist"), any(Artist.class), eq(Artist.class));

        // Mock the list of genres returned by the genreService
        List<Genre> genres = Arrays.asList(new Genre("Pop"), new Genre("RNB"));
        when(genreService.findAllGenres()).thenReturn(genres);

        // Mock the repository save
        Music savedMusic = new Music("SongTitle", "url1", "2024-09-02", genres, Arrays.asList(new Album("Album1"), new Album("Album2")), Arrays.asList(new Artist("Artist1"), new Artist("Artist2")));
        when(musicRepositoryMock.save(any(Music.class))).thenReturn(savedMusic);

        // Act: Call the service method
        Music result = musicService.createMusic(musicDTO);

        // Assert: Verify that the result matches the expected saved music
        assertEquals(musicDTO.getTitle(), result.getTitle(), "ERROR: Titles was not identical");
        assertEquals(musicDTO.getReleaseDate(), result.getReleaseDate(), "ERROR: Release dates was not identical");
        assertEquals(2, result.getAlbums().size(), "ERROR: Album list sizes was not identical");
        assertEquals(2, result.getArtists().size(), "ERROR: Artist list sizes was not identical");

        // Verify that the artist existence check was made and the creation calls were triggered
        verify(restTemplate, times(4)).getForEntity(contains("exists"), eq(Boolean.class));
        verify(restTemplate, times(2)).postForEntity(contains("createAlbum"), any(Album.class), eq(Album.class));
        verify(restTemplate, times(2)).postForEntity(contains("createArtist"), any(Artist.class), eq(Artist.class));
        verify(genreService).findAllGenres();
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

}