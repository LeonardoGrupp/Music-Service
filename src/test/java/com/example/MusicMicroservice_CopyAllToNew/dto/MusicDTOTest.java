package com.example.MusicMicroservice_CopyAllToNew.dto;

import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class MusicDTOTest {

    @Test
    void getTypeShouldReturnType() {
        MusicDTO musicdto = new MusicDTO("DTO1", "Url1", "2000-01-01");
        assertEquals("music", musicdto.getType());
    }

    @Test
    void setTypeShouldChangeTypeToPod() {
        MusicDTO musicdto = new MusicDTO("DTO1", "Url1", "2000-01-01");
        musicdto.setType("pod");
        assertEquals("pod", musicdto.getType());
    }

    @Test
    void getTitleShouldReturnTitle() {
        MusicDTO musicdto = new MusicDTO("DTO1", "Url1", "2000-01-01");
        assertEquals("DTO1", musicdto.getTitle());
    }

    @Test
    void setTitleShouldChangeTitleToDTO2() {
        MusicDTO musicdto = new MusicDTO("DTO1", "Url1", "2000-01-01");
        musicdto.setTitle("DTO2");
        assertEquals("DTO2", musicdto.getTitle());
    }

    @Test
    void getUrlShouldReturnUrl() {
        MusicDTO musicdto = new MusicDTO("DTO1", "Url1", "2000-01-01");
        assertEquals("Url1", musicdto.getUrl());
    }

    @Test
    void setUrlShouldChangeUrlToUrl2() {
        MusicDTO musicdto = new MusicDTO("DTO1", "Url1", "2000-01-01");
        musicdto.setUrl("Url2");
        assertEquals("Url2", musicdto.getUrl());
    }

    @Test
    void getReleaseDateShouldReturnReleaseDate() {
        MusicDTO musicdto = new MusicDTO("DTO1", "Url1", "2000-01-01");
        assertEquals("2000-01-01", musicdto.getReleaseDate());
    }

    @Test
    void setReleaseDateShouldChangeReleaseDate() {
        MusicDTO musicdto = new MusicDTO("DTO1", "Url1", "2000-01-01");
        musicdto.setReleaseDate("2222-01-01");
        assertEquals("2222-01-01", musicdto.getReleaseDate());
    }

    @Test
    void getGenresInputsShouldReturnEmptyGenreList() {
        MusicDTO musicdto = new MusicDTO("Music1", "URL1", "2024-12-24");
        assertTrue(musicdto.getGenreInputs().isEmpty());
    }

    @Test
    void setGenresInputsShouldUpdateGenreList() {
        MusicDTO musicdto = new MusicDTO("Music1", "URL1", "2024-12-24");
        List<String> genres = new ArrayList<>();
        genres.add("Rock");
        genres.add("Pop");
        musicdto.setGenreInputs(genres);
        assertEquals("Pop", musicdto.getGenreInputs().get(1));
    }

    @Test
    void getAlbumInputsShouldReturnEmptyAlbumList() {
        MusicDTO musicdto = new MusicDTO("Music1", "URL1", "2024-12-24");
        assertTrue(musicdto.getAlbumInputs().isEmpty());
    }

    @Test
    void setAlbumInputsShouldUpdateAlbumList() {
        MusicDTO musicdto = new MusicDTO("Music1", "URL1", "2024-12-24");
        List<String> albums = new ArrayList<>();
        albums.add("Rock in Rio");
        albums.add("Alchemy");
        musicdto.setAlbumInputs(albums);
        assertEquals("Alchemy", musicdto.getAlbumInputs().get(1));
    }

    @Test
    void getArtistInputsShouldReturnEmptyArtistList() {
        MusicDTO musicdto = new MusicDTO("Music1", "URL1", "2024-12-24");
        assertTrue(musicdto.getArtistInputs().isEmpty());
    }

    @Test
    void setArtistInputsShouldUpdateArtistList() {
        MusicDTO musicdto = new MusicDTO("Music1", "URL1", "2024-12-24");
        List<String> artists = new ArrayList<>();
        artists.add("Iron Maiden");
        artists.add("Dire Straits");
        musicdto.setArtistInputs(artists);
        assertEquals("Dire Straits", musicdto.getArtistInputs().get(1));
    }

    @Test
    void ConstructorShouldReturnEmptyAndNullResults() {
        MusicDTO musicdto = new MusicDTO();
        assertNull(musicdto.getType());
        assertNull(musicdto.getTitle());
        assertNull(musicdto.getUrl());
        assertNull(musicdto.getReleaseDate());
        assertTrue(musicdto.getGenreInputs().isEmpty());
        assertTrue(musicdto.getAlbumInputs().isEmpty());
        assertTrue(musicdto.getArtistInputs().isEmpty());
    }

    @Test
    void ConstructorShouldReturnRightValuesCombinedWithEmptyValues() {
        MusicDTO musicdto = new MusicDTO("Music1", "URL1", "2024-12-24");
        assertEquals("Music1", musicdto.getTitle());
        assertEquals("URL1", musicdto.getUrl());
        assertEquals("2024-12-24", musicdto.getReleaseDate());
        assertEquals("music", musicdto.getType());
        assertTrue(musicdto.getGenreInputs().isEmpty());
        assertTrue(musicdto.getAlbumInputs().isEmpty());
        assertTrue(musicdto.getArtistInputs().isEmpty());
    }

    @Test
    void ConstructorShouldReturnRightValues() {
        List<String> genres = Arrays.asList("Heavy Metal", "Rock");
        List<String> albums = Arrays.asList("Rock in Rio", "Alchemy");
        List<String> artists = Arrays.asList("Iron Maiden", "Dire Straits");
        MusicDTO musicdto = new MusicDTO("Music1", "URL1", "2024-12-24", genres, albums, artists);

        assertNotNull(musicdto);
        assertEquals("music", musicdto.getType());  // Kontrollera att typfältet är korrekt satt
        assertEquals("Music1", musicdto.getTitle());
        assertEquals("URL1", musicdto.getUrl());
        assertEquals("2024-12-24", musicdto.getReleaseDate());
        assertEquals(Arrays.asList("Heavy Metal", "Rock"), musicdto.getGenreInputs());
        assertEquals(Arrays.asList("Rock in Rio", "Alchemy"), musicdto.getAlbumInputs());
        assertEquals(Arrays.asList("Iron Maiden", "Dire Straits"), musicdto.getArtistInputs());
    }
}