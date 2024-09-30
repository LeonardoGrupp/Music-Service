package com.example.MusicMicroservice_CopyAllToNew.repositories;

import com.example.MusicMicroservice_CopyAllToNew.entites.Genre;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@ActiveProfiles("test")                                                             // kör konfigurationen från application-test.properties
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)       // Gör en rollback efter varje test så att inget förändras i H2-databasen
class GenreRepositoryTest {

    @Autowired
    private GenreRepository genreRepository;

    @BeforeEach
    void setUp() {

    }

    @Test
    void findGenreByGenre() {
        genreRepository.save(new Genre("Rock"));

        Genre response = genreRepository.findGenreByGenre("Rock");

        assertEquals("Rock", response.getGenre(), "ERROR: Genres was not identical");
    }
}