package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.entites.Album;
import java.util.List;

public interface AlbumServiceInterface {

    List<Album> getAllAlbums();
    Album getAlbumByName(String name);
    boolean albumExist(String name);
    Album createAlbum(Album album);

}
