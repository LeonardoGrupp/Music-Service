package com.example.MusicMicroservice_CopyAllToNew.controllers;

import com.example.MusicMicroservice_CopyAllToNew.dto.MusicDTO;
import com.example.MusicMicroservice_CopyAllToNew.entites.Genre;
import com.example.MusicMicroservice_CopyAllToNew.entites.Music;
import com.example.MusicMicroservice_CopyAllToNew.services.MusicService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.server.ResponseStatusException;
import vo.Album;
import vo.Artist;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.*;

class MusicControllerTest {
    private MusicController musicController;
    private MusicService musicServiceMock;

    @BeforeEach
    void setUp() {
        musicServiceMock = mock(MusicService.class);
        musicController = new MusicController(musicServiceMock);
    }

    @Test
    void getAllMusicShouldReturnList() {
        List<Music> allMusic = Arrays.asList(
                new Music("title1", "url1", "releasedate1"),
                new Music("title2", "url2", "release2"),
                new Music("title3", "url3", "release3"),
                new Music("title4", "url4", "release4")
        );

        when(musicServiceMock.findAllMusic()).thenReturn(allMusic);

        ResponseEntity<List<Music>> response = musicController.getAllMusic();

        assertEquals(allMusic, response.getBody(), "ERROR: Lists was not identical");
        assertEquals(allMusic.size(), response.getBody().size(), "ERROR: Sizes was not identical");

        verify(musicServiceMock).findAllMusic();
    }

    @Test
    void getAllMusicForArtistShouldReturnList() {
        List<Album> albumList = Arrays.asList(new Album("The Marshall Mathers LP"));
        List<Artist> artistList = Arrays.asList(new Artist("Eminem"));
        List<Genre> genreList = Arrays.asList(new Genre("Hip-Hop"));
        List<Music> artistMusic = Arrays.asList(
                new Music("title1", "url1", "releasedate1", genreList, albumList, artistList),
                new Music("title2", "url2", "releasedate2", genreList, albumList, artistList),
                new Music("title3", "url3", "releasedate3", genreList, albumList, artistList),
                new Music("title4", "url4", "releasedate4", genreList, albumList, artistList)
        );

        when(musicServiceMock.findMusicByArtist("Eminem")).thenReturn(artistMusic);

        ResponseEntity<List<Music>> response = musicController.getAllMusicForArtist("Eminem");

        assertEquals(artistMusic, response.getBody(), "ERROR: Lists was not identical");
        assertEquals(artistMusic.get(0).getArtists().get(0), response.getBody().get(0).getArtists().get(0), "ERROR: Artists was not identical");
        assertEquals(artistMusic.size(), response.getBody().size(), "ERROR: Sizes was not identical");

        verify(musicServiceMock).findMusicByArtist("Eminem");
    }

    @Test
    void getAllMusicForAlbumShouldReturnList() {
        List<Album> albumList = Arrays.asList(new Album("The Marshall Mathers LP"));
        List<Artist> artistList = Arrays.asList(new Artist("Eminem"));
        List<Genre> genreList = Arrays.asList(new Genre("Hip-Hop"));
        List<Music> albumMusic = Arrays.asList(
                new Music("title1", "url1", "releasedate1", genreList, albumList, artistList),
                new Music("title2", "url2", "releasedate2", genreList, albumList, artistList),
                new Music("title3", "url3", "releasedate3", genreList, albumList, artistList),
                new Music("title4", "url4", "releasedate4", genreList, albumList, artistList)
        );

        when(musicServiceMock.findMusicByAlbum("The Marshall Mathers LP")).thenReturn(albumMusic);

        ResponseEntity<List<Music>> response = musicController.getAllMusicForAlbum("The Marshall Mathers LP");

        assertEquals(albumMusic, response.getBody(), "ERROR: Lists was not identical");
        assertEquals(albumMusic.size(), response.getBody().size(), "ERROR: Sizes was not identical");
        assertEquals("The Marshall Mathers LP", response.getBody().get(0).getAlbums().get(0).getName(), "ERROR: Albums was not identical");

        verify(musicServiceMock).findMusicByAlbum("The Marshall Mathers LP");
    }

    @Test
    void getAllMusicForGenreShouldReturnList() {
        List<Album> albumList = Arrays.asList(new Album("The Marshall Mathers LP"));
        List<Artist> artistList = Arrays.asList(new Artist("Eminem"));
        List<Genre> genreList = Arrays.asList(new Genre("Hip-Hop"));
        List<Music> genreMusic = Arrays.asList(
                new Music("title1", "url1", "releasedate1", genreList, albumList, artistList),
                new Music("title2", "url2", "releasedate2", genreList, albumList, artistList),
                new Music("title3", "url3", "releasedate3", genreList, albumList, artistList),
                new Music("title4", "url4", "releasedate4", genreList, albumList, artistList)
        );

        when(musicServiceMock.findMusicByGenre("Hip-Hop")).thenReturn(genreMusic);

        ResponseEntity<List<Music>> response = musicController.getAllMusicForGenre("Hip-Hop");

        assertEquals(genreMusic, response.getBody(), "ERROR: Lists was not identical");
        assertEquals(genreMusic.size(), response.getBody().size(), "ERROR: Sizes was not identical");
        assertEquals("Hip-Hop", response.getBody().get(0).getGenres().get(0).getGenre(), "ERROR: Genres was not identical");

        verify(musicServiceMock).findMusicByGenre("Hip-Hop");
    }

    @Test
    void getAllMusicByTypeShouldReturnList() {
        List<Album> albumList = Arrays.asList(new Album("The Marshall Mathers LP"));
        List<Artist> artistList = Arrays.asList(new Artist("Eminem"));
        List<Genre> genreList = Arrays.asList(new Genre("Hip-Hop"));
        List<Music> typeMusic = Arrays.asList(
                new Music("title1", "url1", "releasedate1", genreList, albumList, artistList),
                new Music("title2", "url2", "releasedate2", genreList, albumList, artistList),
                new Music("title3", "url3", "releasedate3", genreList, albumList, artistList),
                new Music("title4", "url4", "releasedate4", genreList, albumList, artistList)
        );

        when(musicServiceMock.findMusicByType("music")).thenReturn(typeMusic);

        ResponseEntity<List<Music>> response = musicController.getAllMusicByType("music");

        assertEquals(typeMusic, response.getBody(), "ERROR: Lists was not identical");
        assertEquals(typeMusic.size(), response.getBody().size(), "ERROR: Sizes was not identical");
        assertEquals("music", response.getBody().get(0).getType(), "ERROR: Types was not identical");

        verify(musicServiceMock).findMusicByType("music");
    }

    @Test
    void getMusicByUrlShouldReturnMusic() {
        Music music = new Music("title", "url", "releaseDate");

        when(musicServiceMock.findMusicByUrl("url")).thenReturn(music);

        ResponseEntity<Music> response = musicController.getMusicByUrl("url");

        assertEquals("title", response.getBody().getTitle(), "ERROR: Music Titles was not identical");

        verify(musicServiceMock).findMusicByUrl("url");
    }

    @Test
    void createMusicShouldReturnMedia() {
        List<String> albumInputs = Arrays.asList("The Slim Shady LP");
        List<String> artistInputs = Arrays.asList("Eminem");
        List<String> genreInputs = Arrays.asList("Hip-Hop");
        MusicDTO musicDTO = new MusicDTO("The Real Slim Shady", "url1", "2000-02-22", genreInputs, albumInputs, artistInputs);

        List<Album> albumList = Arrays.asList(new Album("The Slim Shady LP"));
        List<Artist> artistList = Arrays.asList(new Artist("Eminem"));
        List<Genre> genreList = Arrays.asList(new Genre("Hip-Hop"));
        Music musicToBeCreated = new Music(musicDTO.getTitle(), musicDTO.getUrl(), musicDTO.getReleaseDate(), genreList, albumList, artistList);

        when(musicServiceMock.createMusic(musicDTO)).thenReturn(musicToBeCreated);

        ResponseEntity<Music> response = musicController.createMusic(musicDTO);

        assertEquals("The Real Slim Shady", response.getBody().getTitle(), "ERROR: Music was not identical");

        verify(musicServiceMock).createMusic(musicDTO);
    }

    @Test
    void createMusicNoTypeShouldReturnException() {
        List<String> albumInputs = Arrays.asList("The Slim Shady LP");
        List<String> artistInputs = Arrays.asList("Eminem");
        List<String> genreInputs = Arrays.asList("Hip-Hop");
        MusicDTO musicDTO = new MusicDTO("title", "url1", "2022-02-02", genreInputs, albumInputs, artistInputs);

        when(musicServiceMock.createMusic(musicDTO)).thenThrow(new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Type was not provided"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.createMusic(musicDTO);
        }, "ERROR: Exception not thrown");

        assertEquals("ERROR: Music Type was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).createMusic(musicDTO);
    }

    @Test
    void createMusicNoTitleShouldReturnException() {
        List<String> albumInputs = Arrays.asList("The Slim Shady LP");
        List<String> artistInputs = Arrays.asList("Eminem");
        List<String> genreInputs = Arrays.asList("Hip-Hop");
        MusicDTO musicDTO = new MusicDTO("", "url1", "2022-02-02", genreInputs, albumInputs, artistInputs);

        when(musicServiceMock.createMusic(musicDTO)).thenThrow(new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Title was not provided"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.createMusic(musicDTO);
        }, "ERROR: Exception not thrown");

        assertEquals("ERROR: Music Title was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).createMusic(musicDTO);
    }

    @Test
    void createMusicNoUrlShouldReturnException() {
        List<String> albumInputs = Arrays.asList("The Slim Shady LP");
        List<String> artistInputs = Arrays.asList("Eminem");
        List<String> genreInputs = Arrays.asList("Hip-Hop");
        MusicDTO musicDTO = new MusicDTO("The Real Slim Shady", "", "2022-02-02", genreInputs, albumInputs, artistInputs);

        when(musicServiceMock.createMusic(musicDTO)).thenThrow(new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music URL was not provided"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.createMusic(musicDTO);
        }, "ERROR: Exception not thrown");

        assertEquals("ERROR: Music URL was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).createMusic(musicDTO);
    }

    @Test
    void createMusicNoReleaseDateShouldReturnException() {
        List<String> albumInputs = Arrays.asList("The Slim Shady LP");
        List<String> artistInputs = Arrays.asList("Eminem");
        List<String> genreInputs = Arrays.asList("Hip-Hop");
        MusicDTO musicDTO = new MusicDTO("The Real Slim Shady", "url", "", genreInputs, albumInputs, artistInputs);

        when(musicServiceMock.createMusic(musicDTO)).thenThrow(new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Release date was not provided"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.createMusic(musicDTO);
        }, "ERROR: Exception not thrown");

        assertEquals("ERROR: Music Release date was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).createMusic(musicDTO);
    }

    @Test
    void createMusicNoGenreShouldReturnException() {
        List<String> albumInputs = Arrays.asList("The Slim Shady LP");
        List<String> artistInputs = Arrays.asList("Eminem");
        List<String> genreInputs = Arrays.asList("Hip-Hop");
        MusicDTO musicDTO = new MusicDTO("The Real Slim Shady", "url1", "2022-02-02", genreInputs, albumInputs, artistInputs);

        when(musicServiceMock.createMusic(musicDTO)).thenThrow(new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Genre was not provided"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.createMusic(musicDTO);
        }, "ERROR: Exception not thrown");

        assertEquals("ERROR: Music Genre was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).createMusic(musicDTO);
    }

    @Test
    void createMusicNoAlbumInputsShouldReturnException() {
        List<String> albumInputs = Arrays.asList("");
        List<String> artistInputs = Arrays.asList("Eminem");
        List<String> genreInputs = Arrays.asList("Hip-Hop");
        MusicDTO musicDTO = new MusicDTO("The Real Slim Shady", "url1", "2022-02-02", genreInputs, albumInputs, artistInputs);

        when(musicServiceMock.createMusic(musicDTO)).thenThrow(new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Album was not provided"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.createMusic(musicDTO);
        }, "ERROR: Exception not thrown");

        assertEquals("ERROR: Music Album was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).createMusic(musicDTO);
    }

    @Test
    void createMusicNoArtistShouldReturnException() {
        List<String> albumInputs = Arrays.asList("The Slim Shady LP");
        List<String> artistInputs = Arrays.asList("");
        List<String> genreInputs = Arrays.asList("Hip-Hop");
        MusicDTO musicDTO = new MusicDTO("The Real Slim Shady", "", "2022-02-02", genreInputs, albumInputs, artistInputs);

        when(musicServiceMock.createMusic(musicDTO)).thenThrow(new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Artist was not provided"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.createMusic(musicDTO);
        }, "ERROR: Exception not thrown");

        assertEquals("ERROR: Music Artist was not provided", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_ACCEPTABLE, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).createMusic(musicDTO);
    }

    @Test
    void updateMusicShouldReturnMedia() {
        List<Album> albumList = Arrays.asList(new Album("album1"));
        List<Artist> artistList = Arrays.asList(new Artist("artist1"));
        List<Genre> genreList = Arrays.asList(new Genre("Hip-Hop"));
        long musicId = 1;
        Music existingMusic = new Music("title1", "url1", "2022-02-02", genreList, albumList, artistList);
        existingMusic.setId(musicId);

        List<String> albumInputs = Arrays.asList("other album");
        List<String> artistInputs = Arrays.asList("other artist");
        List<String> genreInputs = Arrays.asList("other genre");
        MusicDTO newInfo = new MusicDTO("new title", "url2", "2024-09-02", genreInputs, albumInputs, artistInputs);

        List<Album> newMediaAlbumList = Arrays.asList(new Album("other album"));
        List<Artist> newMediaArtistList = Arrays.asList(new Artist("other artist"));
        List<Genre> newMediaGenreList = Arrays.asList(new Genre("other genre"));
        Music newMusicInfo = new Music("new title", "url2", "2024-09-02", newMediaGenreList, newMediaAlbumList, newMediaArtistList);

        when(musicServiceMock.updateMusic(musicId, newInfo)).thenReturn(newMusicInfo);

        ResponseEntity<Music> response = musicController.updateMusic(musicId, newInfo);

        assertEquals("new title", response.getBody().getTitle(), "ERROR: Titles was not identical");

        verify(musicServiceMock).updateMusic(musicId, newInfo);
    }

    @Test
    void updateMediaInvalidIdShouldReturnException() {
        List<String> albumList = Arrays.asList("new album");
        List<String> artistList = Arrays.asList("new artist");
        List<String> genreList = Arrays.asList("new genre");

        long musicId = 1;
        MusicDTO newInfo = new MusicDTO("new title", "url1", "2022-02-02", genreList, albumList, artistList);

        when(musicServiceMock.updateMusic(musicId, newInfo)).thenThrow(new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: Could not find music with id: " + musicId));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.updateMusic(musicId, newInfo);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Could not find music with id: " + musicId, response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).updateMusic(musicId, newInfo);
    }

    @Test
    void deleteMusicShouldReturnString() {
        long musicId = 1;
        Music musicToDelete = new Music("title", "url1", "1991-01-19");
        musicToDelete.setId(musicId);

        when(musicServiceMock.deleteMusic(musicId)).thenReturn("Music successfully deleted");

        ResponseEntity<String> response = musicController.deleteMusic(musicId);

        assertEquals("Music successfully deleted", response.getBody(), "ERROR: Strings was not identical");

        verify(musicServiceMock).deleteMusic(musicId);
    }

    @Test
    void deleteMusicShouldReturnException() {
        long musicId = 1;

        when(musicServiceMock.deleteMusic(musicId)).thenThrow(new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: Could not find music with id: " + musicId));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.deleteMusic(musicId);
        }, "ERROR: Exceptions was not thrown");

        assertEquals("ERROR: Could not find music with id: " + musicId, response.getReason(), "ERROR: Exceptions was not identical");

        verify(musicServiceMock).deleteMusic(musicId);
    }

    @Test
    void playMusicShouldReturnString() {
        String url = "url";
        Music music = new Music("The Real Slim Shady", url, "2000-01-01");

        when(musicServiceMock.playMusic(url)).thenReturn("Playing " + music.getType() + ": " + music.getTitle());

        String result = musicServiceMock.playMusic(url);

        assertEquals("Playing music: The Real Slim Shady", result, "ERROR: Strings was not identical");

        verify(musicServiceMock).playMusic(url);
    }

    @Test
    void playMusicShouldReturnException() {
        String url = "url";

        when(musicServiceMock.playMusic(url)).thenThrow(new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: Music with URL not found"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.playMusic(url);
        }, "ERROR: Exceptions was not thrown");

        assertEquals("ERROR: Music with URL not found", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).playMusic(url);
    }

    @Test
    void likeMusicShouldReturnString() {
        Music musicToLike = new Music("title", "url", "release");
        musicToLike.setLikes(0);

        when(musicServiceMock.likeMusic(musicToLike.getUrl())).thenReturn("Liked Music: " + musicToLike.getTitle());

        String result = musicServiceMock.likeMusic(musicToLike.getUrl());

        assertEquals("Liked Music: " + musicToLike.getTitle(), result, "ERROR: Strings was not identical");

        verify(musicServiceMock).likeMusic(musicToLike.getUrl());
    }

    @Test
    void likeMusicNotFoundShouldReturnException() {
        String url = "url";

        when(musicServiceMock.likeMusic(url)).thenThrow(new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: Music with URL not found"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.likeMusic(url);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music with URL not found", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).likeMusic(url);
    }

    @Test
    void disLikeMusicShouldReturnString() {
        Music musicToDisLike = new Music("title", "url", "release");
        musicToDisLike.setLikes(0);

        when(musicServiceMock.disLikeMusic(musicToDisLike.getUrl())).thenReturn("Disliked Music: " + musicToDisLike.getTitle());

        String result = musicServiceMock.disLikeMusic(musicToDisLike.getUrl());

        assertEquals("Disliked Music: " + musicToDisLike.getTitle(), result, "ERROR: Strings was not identical");

        verify(musicServiceMock).disLikeMusic(musicToDisLike.getUrl());
    }

    @Test
    void disLikeMusicShouldReturnException() {
        String url = "url";

        when(musicServiceMock.disLikeMusic(url)).thenThrow(new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: Music with URL not found"));

        ResponseStatusException response = assertThrows(ResponseStatusException.class, () -> {
            musicController.disLikeMusic(url);
        }, "ERROR: Exception was not thrown");

        assertEquals("ERROR: Music with URL not found", response.getReason(), "ERROR: Exceptions was not identical");
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode(), "ERROR: Status Codes was not identical");

        verify(musicServiceMock).disLikeMusic(url);
    }
}