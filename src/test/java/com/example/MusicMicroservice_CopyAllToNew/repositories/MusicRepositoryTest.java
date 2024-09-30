package com.example.MusicMicroservice_CopyAllToNew.repositories;

import com.example.MusicMicroservice_CopyAllToNew.entites.Music;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@ActiveProfiles("test")                                                             // kör konfigurationen från application-test.properties
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)       // Gör en rollback efter varje test så att inget förändras i H2-databasen
class MusicRepositoryTest {

    @Autowired
    private MusicRepository musicRepository;
    private Music music1;

    @BeforeEach
    void setUp() {
        music1 = new Music("The Way I Am", "url99", "2002-02-22");
        Music rnb1 = new Music("Cheer (Drink to That", "url3", "2009-07-14");
        Music rnb2 = new Music("Diamonds", "url4", "2010-06-02");

        musicRepository.save(music1);
        musicRepository.save(rnb1);
        musicRepository.save(rnb2);
    }

    @Test
    void findMusicByUrlShouldReturnMusic() {
        Music music = musicRepository.findMusicByUrl("url99");

        assertEquals(music, music1, "ERROR: Music was not identical");
    }
}