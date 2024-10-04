package com.example.MusicMicroservice_CopyAllToNew.entites;

import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class MusicTest {

    @Test
    void getIdShouldReturnZero() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        long result = music.getId();
        assertEquals(0, result);
    }

    @Test
    void setIdShouldSetIdToFour() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.setId(4);
        long result = music.getId();
        assertEquals(4, result);
    }

    @Test
    void getTypeShouldReturnMusic() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        String result = music.getType();
        assertEquals("music", result);
    }

    @Test
    void setTypeShouldSetTypeToPod() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.setType("pod");
        String result = music.getType();
        assertEquals("pod", result);
    }

    @Test
    void getTitleShouldReturnMusic1() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        String result = music.getTitle();
        assertEquals("Music1", result);
    }

    @Test
    void setTitleShouldSetTitleToMusic2() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.setTitle("Music2");
        String result = music.getTitle();
        assertEquals("Music2", result);
    }

    @Test
    void getUrlShouldReturnURL1() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        String result = music.getUrl();
        assertEquals("URL1", result);
    }

    @Test
    void setUrlShouldSetUrlToURL4() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.setUrl("URL4");
        String result = music.getUrl();
        assertEquals("URL4", result);
    }

    @Test
    void getReleaseDateShouldReturnReleaseDate() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        String result = music.getReleaseDate();
        assertEquals("2024-12-24", result);
    }

    @Test
    void setReleaseDateShouldUpdateReleaseDate() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.setReleaseDate("1978-01-01");
        String result = music.getReleaseDate();
        assertEquals("1978-01-01", result);
    }

    @Test
    void getPlayCounterShouldReturnZero() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        int result = music.getPlayCounter();
        assertEquals(0, result);
    }

    @Test
    void setPlayCounterShouldUpdatePlayCounterToFour() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.setPlayCounter(4);
        int result = music.getPlayCounter();
        assertEquals(4, result);
    }

    @Test
    void getLikesShouldReturnZero() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        int result = music.getLikes();
        assertEquals(0, result);
    }

    @Test
    void setLikesShouldUpdateLikesToFour() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.setLikes(4);
        int result = music.getLikes();
        assertEquals(4, result);
    }

    @Test
    void getDisLikesShouldReturnZero() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        int result = music.getDisLikes();
        assertEquals(0, result);
    }

    @Test
    void setDisLikesShouldUpdatePlayCounterToFour() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.setDisLikes(4);
        int result = music.getDisLikes();
        assertEquals(4, result);
    }

    @Test
    void getGenresShouldReturnEmptyGenreList() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        assertTrue(music.getGenres().isEmpty());
    }

    @Test
    void setGenresShouldUpdateGenreList() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        List<Genre> genres = new ArrayList<>();
        genres.add(new Genre("Rock"));
        genres.add(new Genre("Pop"));
        music.setGenres(genres);
        assertEquals("Pop", music.getGenres().get(1).getGenre());
    }

    @Test
    void getAlbumsShouldReturnEmptyAlbumList() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        assertTrue(music.getAlbums().isEmpty());
    }

    @Test
    void setAlbumsShouldUpdateAlbumList() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        List<Album> album = new ArrayList<>();
        album.add(new Album("Rock in Rio"));
        album.add(new Album("Alchemy"));
        music.setAlbums(album);
        assertEquals("Alchemy", music.getAlbums().get(1).getName());
    }

    @Test
    void getArtistsShouldReturnEmptyArtistList() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        assertTrue(music.getArtists().isEmpty());
    }

    @Test
    void setArtistsShouldUpdateArtistList() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        List<Artist> artist = new ArrayList<>();
        artist.add(new Artist("Iron Maiden"));
        artist.add(new Artist("Dire Straits"));
        music.setArtists(artist);
        assertEquals("Dire Straits", music.getArtists().get(1).getName());
    }

    @Test
    void countPlayShouldIncreasePlayCounterFromZeroToOne() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.countPlay();
        int result = music.getPlayCounter();
        assertEquals(1, result);
    }

    @Test
    void resetPlayShouldResetPlayCounterToZero() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.countPlay();
        music.resetPlayCounter();
        int result = music.getPlayCounter();
        assertEquals(0, result);
    }

    @Test
    void addLikeShouldIncreaseLikesWithOne() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.addLike();
        int result = music.getLikes();
        assertEquals(1, result);
    }

    @Test
    void resetLikesShouldResetLikesToZero() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.addLike();
        music.resetLikes();
        int result = music.getLikes();
        assertEquals(0, result);
    }

    @Test
    void addDisLikeShouldIncreaseDisLikesWithOne() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.addDisLike();
        int result = music.getDisLikes();
        assertEquals(1, result);
    }

    @Test
    void resetDisLikesShouldResetDisLikesToZero() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.addDisLike();
        music.resetDisLikes();
        int result = music.getDisLikes();
        assertEquals(0, result);
    }

    @Test
    void resetPlayCounterLikesAndDisLikesShouldResetPlayCounterLikesAndDisLikesToZero() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        music.countPlay();
        music.addLike();
        music.addDisLike();
        music.resetPlayCounterLikesAndDisLikes();
        assertEquals(0, music.getPlayCounter());
        assertEquals(0, music.getLikes());
        assertEquals(0, music.getDisLikes());
    }

    @Test
    void ConstructorShouldReturnRightValuesCombinedWithEmptyValues() {
        Music music = new Music("Music1", "URL1", "2024-12-24");
        assertEquals("Music1", music.getTitle());
        assertEquals("URL1", music.getUrl());
        assertEquals("2024-12-24", music.getReleaseDate());
        assertTrue(music.getGenres().isEmpty());
        assertTrue(music.getAlbums().isEmpty());
        assertTrue(music.getArtists().isEmpty());
    }

    @Test
    void ConstructorShouldReturnRightValues() {
        List<Genre> genres = new ArrayList<>();
        genres.add(new Genre("Heavy Metal"));
        genres.add(new Genre("Rock"));
        List<Album> albums = new ArrayList<>();
        albums.add(new Album("Rock in Rio"));
        albums.add(new Album("Alchemy"));
        List<Artist> artists = new ArrayList<>();
        artists.add(new Artist("Iron Maiden"));
        artists.add(new Artist("Dire Straits"));

        Music music = new Music("Music1", "URL1", "2024-12-24", genres, albums, artists);

        assertNotNull(music);
        assertEquals("music", music.getType());  // Kontrollera att typfältet är korrekt satt
        assertEquals("Music1", music.getTitle());
        assertEquals("URL1", music.getUrl());
        assertEquals("2024-12-24", music.getReleaseDate());
        assertEquals("Rock", music.getGenres().get(1).getGenre());
        assertEquals("Rock in Rio", music.getAlbums().get(0).getName());
        assertEquals("Dire Straits", music.getArtists().get(1).getName());
    }

    @Test
    void ConstructorShouldReturnRightValueForId() {
        Music music = new Music();
        assertEquals(0, music.getId());
    }
}