package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.entites.Artist;
import com.example.MusicMicroservice_CopyAllToNew.repositories.ArtistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ArtistService implements ArtistServiceInterface{

    private ArtistRepository artistRepository;

    @Autowired
    public ArtistService(ArtistRepository artistRepository) {
        this.artistRepository = artistRepository;
    }

    public List<Artist> getAllArtists() {
        return artistRepository.findAll();
    }

    public Artist getArtistByName(String name) {
        Optional<Artist> optionalArtist = artistRepository.findByNameIgnoreCase(name);

        return optionalArtist.orElse(null);
    }

    public boolean artistExist(String name) {
        return artistRepository.existsByNameIgnoreCase(name);
    }

    public Artist createArtist(Artist artist) {
        return artistRepository.save(artist);
    }
}
