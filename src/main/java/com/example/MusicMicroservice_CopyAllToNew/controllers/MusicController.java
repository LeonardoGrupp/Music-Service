package com.example.MusicMicroservice_CopyAllToNew.controllers;

import com.example.MusicMicroservice_CopyAllToNew.entites.Music;
import com.example.MusicMicroservice_CopyAllToNew.dto.MusicDTO;
import com.example.MusicMicroservice_CopyAllToNew.services.MusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/music")
public class MusicController {

    private MusicService musicService;

    @Autowired
    public MusicController(MusicService musicService) {
        this.musicService = musicService;
    }

    @GetMapping("/all")
    public ResponseEntity<List<Music>> getAllMusic() {
        return ResponseEntity.ok(musicService.findAllMusic());
    }

    @GetMapping("/artist/{artist}")
    public ResponseEntity<List<Music>> getAllMusicForArtist(@PathVariable("artist") String artist) {
        return ResponseEntity.ok(musicService.findMusicByArtist(artist));
    }

    @GetMapping("/album/{album}")
    public ResponseEntity<List<Music>> getAllMusicForAlbum(@PathVariable("album") String album) {
        return ResponseEntity.ok(musicService.findMusicByAlbum(album));
    }

    @GetMapping("/genre/{genre}")
    public ResponseEntity<List<Music>> getAllMusicForGenre(@PathVariable("genre") String genre) {
        return ResponseEntity.ok(musicService.findMusicByGenre(genre));
    }

    @GetMapping("/get/{url}")
    public ResponseEntity<Music> getMusicByUrl(@PathVariable("url") String url) {
        return ResponseEntity.ok(musicService.findMusicByUrl(url));
    }

    @PostMapping("/create")
    public ResponseEntity<Music> createMusic(@RequestBody MusicDTO musicDTO) {
        return ResponseEntity.ok(musicService.createMusic(musicDTO));
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Music> updateMusic(@PathVariable("id") long id, @RequestBody MusicDTO newMusicInfo) {
        return ResponseEntity.ok(musicService.updateMusic(id, newMusicInfo));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteMusic(@PathVariable("id") long id) {
        return ResponseEntity.ok(musicService.deleteMusic(id));
    }

    @GetMapping("/play/{url}")
    public ResponseEntity<String> playMusic(@PathVariable("url") String url) {
        return ResponseEntity.ok(musicService.playMusic(url));
    }

    @GetMapping("/like/{url}")
    public ResponseEntity<String> likeMusic(@PathVariable("url") String url) {
        return ResponseEntity.ok(musicService.likeMusic(url));
    }

    @GetMapping("/dislike/{url}")
    public ResponseEntity<String> disLikeMusic(@PathVariable("url") String url) {
        return ResponseEntity.ok(musicService.disLikeMusic(url));
    }

    @GetMapping("/exists/{url}")
    public ResponseEntity<Boolean> musicExist(@PathVariable("url") String url) {
        return ResponseEntity.ok(musicService.checkIfMusicExistByUrl(url));
    }
}
