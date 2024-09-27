package com.example.MusicMicroservice_CopyAllToNew.repositories;

import com.example.MusicMicroservice_CopyAllToNew.entites.Artist;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@ActiveProfiles("test")
class ArtistRepositoryTest {

    @Autowired
    private ArtistRepository artistRepository;

    @Test
    void existsByNameIgnoreCaseShouldReturnTrue() {
        Artist artist = new Artist("Rick Ross");
        artistRepository.save(artist);

        boolean isTrue = artistRepository.existsByNameIgnoreCase("Rick Ross");

        assertTrue(isTrue, "ERROR: was False");
    }

    @Test
    void existsByNameIgnoreCaseShouldReturnFalse() {
        boolean isFalse = artistRepository.existsByNameIgnoreCase("Rick Ross");

        assertFalse(isFalse, "ERROR: was True");
    }
}