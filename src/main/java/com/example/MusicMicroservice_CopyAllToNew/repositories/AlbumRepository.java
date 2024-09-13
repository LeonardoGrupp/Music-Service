package com.example.MusicMicroservice_CopyAllToNew.repositories;

import com.example.MusicMicroservice_CopyAllToNew.entites.Album;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AlbumRepository extends JpaRepository<Album, Long> {
    Album findAlbumByName(String name);
}
