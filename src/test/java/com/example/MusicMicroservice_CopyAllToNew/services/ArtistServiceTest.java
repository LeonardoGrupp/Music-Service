package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.entites.Artist;
import com.example.MusicMicroservice_CopyAllToNew.repositories.ArtistRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class ArtistServiceTest {
    private ArtistRepository artistRepositoryMock;
    private ArtistService artistService;

    @BeforeEach
    void setUp() {
        artistRepositoryMock = mock(ArtistRepository.class);
        artistService = new ArtistService(artistRepositoryMock);
    }

    @Test
    void getAllArtistsShouldReturnList() {
        List<Artist> artists = Arrays.asList(new Artist("artist1"), new Artist("artist2"), new Artist("artist3"));

        when(artistRepositoryMock.findAll()).thenReturn(artists);

        List<Artist> response = artistService.getAllArtists();

        assertEquals(artists, response, "ERROR: Lists was not identical");

        verify(artistRepositoryMock).findAll();
    }

    @Test
    void artistExistShouldReturnTrue() {
        when(artistRepositoryMock.existsByNameIgnoreCase("name")).thenReturn(true);

        boolean isTrue = artistService.artistExist("name");

        assertTrue(isTrue, "ERROR: was False");

        verify(artistRepositoryMock).existsByNameIgnoreCase("name");
    }

    @Test
    void artistExistShouldReturnFalse() {
        when(artistRepositoryMock.existsByNameIgnoreCase("name")).thenReturn(false);

        boolean isFalse = artistService.artistExist("name");

        assertFalse(isFalse, "ERROR: was True");

        verify(artistRepositoryMock).existsByNameIgnoreCase("name");
    }

    @Test
    void createArtistShouldReturnArtist() {
        Artist artist = new Artist("Eminem");

        when(artistRepositoryMock.save(artist)).thenReturn(artist);

        Artist response = artistService.createArtist(artist);

        assertEquals(artist, response, "ERROR: Artist and response was not identical");
    }
}