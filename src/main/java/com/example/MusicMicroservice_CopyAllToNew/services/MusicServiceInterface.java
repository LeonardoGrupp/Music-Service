package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.dto.MusicDTO;
import com.example.MusicMicroservice_CopyAllToNew.entites.Genre;
import com.example.MusicMicroservice_CopyAllToNew.entites.Music;
import vo.Album;
import vo.Artist;

import java.util.List;

public interface MusicServiceInterface {

    List<Music> findAllMusic();
    List<Music> findMusicByArtist(String artistName);
    List<Music> findMusicByAlbum(String albumName);
    List<Music> findMusicByGenre(String genreName);
    Music findMusicByUrl(String url);
    Music findMusicById(long id);
    Music createMusic(MusicDTO musicDTO);
    List<Genre> getAllGenres(MusicDTO musicDTO);
    List<Album> getAllAlbums(MusicDTO musicDTO);
    List<Artist> getAllArtists(MusicDTO musicDTO);
    Music updateMusic(long id, MusicDTO newMusicInfo);
    String deleteMusic(long id);
    String playMusic(String url);
    String likeMusic(String url);
    String disLikeMusic(String url);
}
