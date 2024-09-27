package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.entites.Album;
import com.example.MusicMicroservice_CopyAllToNew.repositories.AlbumRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class AlbumServiceTest {
    private AlbumRepository albumRepositoryMock;
    private AlbumService albumService;

    @BeforeEach
    void setUp() {
        albumRepositoryMock = mock(AlbumRepository.class);
        albumService = new AlbumService(albumRepositoryMock);
    }

    @Test
    void getAllAlbumsShouldReturnList() {
        List<Album> albums = Arrays.asList(new Album("album1"), new Album("album2"), new Album("album3"), new Album("album4"));

        when(albumRepositoryMock.findAll()).thenReturn(albums);

        List<Album> response = albumService.getAllAlbums();

        assertEquals(albums, response, "ERROR: Albums was not identical to repsonse");

        verify(albumRepositoryMock).findAll();
    }

    @Test
    void albumExistShouldReturnTrue() {
        String albumName = "name";

        when(albumRepositoryMock.existsByNameIgnoreCase("name")).thenReturn(true);

        boolean isTrue = albumService.albumExist(albumName);

        assertTrue(isTrue, "ERROR: was False");

        verify(albumRepositoryMock).existsByNameIgnoreCase(albumName);
    }

    @Test
    void albumExistShouldReturnFalse() {
        String albumName = "name";

        when(albumRepositoryMock.existsByNameIgnoreCase("name")).thenReturn(false);

        boolean isFalse = albumService.albumExist(albumName);

        assertFalse(isFalse, "ERROR: was True");

        verify(albumRepositoryMock).existsByNameIgnoreCase(albumName);
    }

    @Test
    void createAlbumShouldReturnAlbum() {
        Album album = new Album("the album");

        when(albumRepositoryMock.save(album)).thenReturn(album);

        Album theResponse = albumService.createAlbum(album);

        assertEquals(album, theResponse, "ERROR: Album and response was not identical");

        verify(albumRepositoryMock).save(album);
    }
}