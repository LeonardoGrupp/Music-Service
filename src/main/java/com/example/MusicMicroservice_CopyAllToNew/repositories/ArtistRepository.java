package com.example.MusicMicroservice_CopyAllToNew.repositories;

import com.example.MusicMicroservice_CopyAllToNew.entites.Artist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArtistRepository extends JpaRepository<Artist, Long> {
    Artist findArtistByName(String name);

}
