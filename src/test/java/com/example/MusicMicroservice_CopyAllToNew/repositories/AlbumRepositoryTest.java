package com.example.MusicMicroservice_CopyAllToNew.repositories;

import com.example.MusicMicroservice_CopyAllToNew.entites.Album;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@DataJpaTest
@ActiveProfiles("test")
class AlbumRepositoryTest {

    @Autowired
    private AlbumRepository albumRepository;

    @Test
    void existsByNameIgnoreCaseShouldReturnTrue() {
        Album album = new Album("theAlbum");
        albumRepository.save(album);

        boolean isTrue = albumRepository.existsByNameIgnoreCase("theAlbum");

        assertTrue(isTrue, "ERROR: was False");
    }

    @Test
    void existsByNameIgnoreCaseShouldReturnFalse() {
        boolean isFalse = albumRepository.existsByNameIgnoreCase("album");

        assertFalse(isFalse, "ERROR: was True");
    }
}