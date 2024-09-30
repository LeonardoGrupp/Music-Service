package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.entites.Artist;
import java.util.List;

public interface ArtistServiceInterface {
    List<Artist> getAllArtists();
    Artist getArtistByName(String name);
    boolean artistExist(String name);
    Artist createArtist(Artist artist);

}
