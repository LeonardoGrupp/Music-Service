package com.example.MusicMicroservice_CopyAllToNew.services;

import com.example.MusicMicroservice_CopyAllToNew.dto.MusicDTO;
import com.example.MusicMicroservice_CopyAllToNew.entites.Genre;
import com.example.MusicMicroservice_CopyAllToNew.entites.Music;
import com.example.MusicMicroservice_CopyAllToNew.repositories.MusicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.server.ResponseStatusException;
import vo.Album;
import vo.Artist;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class MusicService implements MusicServiceInterface {

    private MusicRepository musicRepository;
    private RestTemplate restTemplate;
    private GenreService genreService;

    @Autowired
    public MusicService(MusicRepository musicRepository, RestTemplate restTemplate, GenreService genreService) {
        this.musicRepository = musicRepository;
        this.restTemplate = restTemplate;
        this.genreService = genreService;
    }

    @Override
    public List<Music> findAllMusic() {
        return musicRepository.findAll();
    }

    @Override
    public List<Music> findMusicByArtist(String artistName) {
        List<Music> musicByArtist = new ArrayList<>();

        for (Music music : musicRepository.findAll()) {
            for (Artist artist : music.getArtists()) {
                if (artistName.toLowerCase().equals(artist.getName().toLowerCase())) {
                    musicByArtist.add(music);
                }
            }
        }

        return musicByArtist;
    }

    @Override
    public List<Music> findMusicByAlbum(String albumName) {
        List<Music> musicByAlbum = new ArrayList<>();

        for (Music music : musicRepository.findAll()) {
            for (Album album : music.getAlbums()) {
                if (albumName.toLowerCase().equals(album.getName().toLowerCase())) {
                    musicByAlbum.add(music);
                }
            }
        }

        return musicByAlbum;
    }

    @Override
    public List<Music> findMusicByGenre(String genreName) {
        List<Music> musicByGenre = new ArrayList<>();

        for (Music music : musicRepository.findAll()) {
            for (Genre genre : music.getGenres()) {
                if (genreName.toLowerCase().equals(genre.getGenre().toLowerCase())) {
                    musicByGenre.add(music);
                }
            }
        }

        return musicByGenre;
    }

    @Override
    public Music findMusicByUrl(String url) {
        return musicRepository.findMusicByUrl(url);
    }

    @Override
    public Music findMusicById(long id) {
        Optional<Music> optionalMusic = musicRepository.findById(id);

        if (optionalMusic.isPresent()) {
            return optionalMusic.get();
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: Could not find music with id: " + id);
        }
    }

    @Override
    public Music createMusic(MusicDTO musicDTO) {
        if (musicDTO.getTitle().isEmpty() || musicDTO.getTitle() == null) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Title was not provided");
        }
        if (musicDTO.getUrl().isEmpty() || musicDTO.getUrl() == null) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music URL was not provided");
        }
        if (musicDTO.getReleaseDate().isEmpty() || musicDTO.getReleaseDate() == null) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Release date was not provided");
        }
        if (musicDTO.getGenreInputs().isEmpty() || musicDTO.getGenreInputs() == null) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Genre was not provided");
        }
        if (musicDTO.getAlbumInputs().isEmpty() || musicDTO.getAlbumInputs() == null) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Album was not provided");
        }
        if (musicDTO.getArtistInputs().isEmpty() || musicDTO.getArtistInputs() == null) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "ERROR: Music Artist was not provided");
        }

        musicDTO.setType("music");

        for (String genreName : musicDTO.getGenreInputs()) {
            boolean genreExist = genreService.genreExists(genreName);

            if (!genreExist) {
                genreService.create(new Genre(genreName));
            }
        }

        // Check to see if album exist
        for (String albumName : musicDTO.getAlbumInputs()) {
            ResponseEntity<Boolean> albumNameResponse = restTemplate.getForEntity("lb://album-service/album/exists/" + albumName, Boolean.class);

            Boolean albumExist = albumNameResponse.getBody();

            if (!albumExist) {
                ResponseEntity<Album> createAlbum = restTemplate.postForEntity("lb://album-service/album/createAlbum", new Album(albumName), Album.class);
            }

        }

        // Check to see if artist exist
        for (String artistName : musicDTO.getArtistInputs()) {
            ResponseEntity<Boolean> artistNameResponse = restTemplate.getForEntity("lb://artist-service/artist/exists/" + artistName, Boolean.class);

            Boolean artistExist = artistNameResponse.getBody();

            if (!artistExist) {
                ResponseEntity<Artist> createArtist = restTemplate.postForEntity("lb://artist-service/artist/createArtist", new Artist(artistName), Artist.class);
            }
        }


        return musicRepository.save(new Music(musicDTO.getTitle(), musicDTO.getUrl(), musicDTO.getReleaseDate(), getAllGenres(musicDTO), getAllAlbums(musicDTO), getAllArtists(musicDTO)));
    }

    @Override
    public List<Genre> getAllGenres(MusicDTO musicDTO) {
        List<Genre> genreList = genreService.findAllGenres();

        List<Genre> genres = new ArrayList<>();

        if (genres != null) {
            for (Genre genre : genreList) {
                for (String genreName : musicDTO.getGenreInputs()) {
                    if(genreName.toLowerCase().equals(genre.getGenre().toLowerCase())) {
                        genres.add(genre);
                    }
                }
            }
        }

        return genres;
    }

    @Override
    public List<Album> getAllAlbums(MusicDTO musicDTO) {
        ResponseEntity<Album[]> allAlbumsArray = restTemplate.getForEntity("lb://album-service/album/getAllAlbums", Album[].class);

        List<Album> albumList = new ArrayList<>();

        if (allAlbumsArray != null) {
            for (Album album : allAlbumsArray.getBody()) {
                for (String albumName : musicDTO.getAlbumInputs()) {
                    if (albumName.toLowerCase().equals(album.getName().toLowerCase())) {
                        albumList.add(album);
                    }
                }
            }
        }

        return albumList;
    }

    @Override
    public List<Artist> getAllArtists(MusicDTO musicDTO) {
        ResponseEntity<Artist[]> allArtistsArray = restTemplate.getForEntity("lb://artist-service/artist/getAllArtists", Artist[].class);
        List<Artist> artistList = new ArrayList<>();
        if (allArtistsArray != null) {
            for (Artist artist : allArtistsArray.getBody()) {
                for (String artistName : musicDTO.getArtistInputs()) {
                    if (artistName.toLowerCase().equals(artist.getName().toLowerCase())) {
                        artistList.add(artist);
                    }
                }
            }
        }

        return artistList;
    }

    @Override
    public Music updateMusic(long id, MusicDTO newMusicInfo) {
        Music existingMusic = findMusicById(id);

        if (newMusicInfo.getTitle() != null && !newMusicInfo.getTitle().isEmpty()) {
            existingMusic.setTitle(newMusicInfo.getTitle());
        }
        if (newMusicInfo.getReleaseDate() != null && !newMusicInfo.getReleaseDate().isEmpty()) {
            existingMusic.setReleaseDate(newMusicInfo.getReleaseDate());
        }
        if (newMusicInfo.getAlbumInputs() != null && !newMusicInfo.getAlbumInputs().isEmpty()) {

            List<Album> albums = getAllAlbums(newMusicInfo);

            existingMusic.setAlbums(albums);
        }
        if (newMusicInfo.getGenreInputs() != null && !newMusicInfo.getGenreInputs().isEmpty()) {

            List<Genre> genres = getAllGenres(newMusicInfo);

            existingMusic.setGenres(genres);
        }
        if (newMusicInfo.getArtistInputs() != null && !newMusicInfo.getArtistInputs().isEmpty()) {

            List<Artist> artists = getAllArtists(newMusicInfo);

            existingMusic.setArtists(artists);
        }

        return musicRepository.save(existingMusic);
    }

    @Override
    public String deleteMusic(long id) {
        Music musicToDelete = findMusicById(id);

        musicRepository.delete(musicToDelete);

        return "Music successfully deleted";
    }

    @Override
    public String playMusic(String url) {
        Music musicToPlay = musicRepository.findMusicByUrl(url);

        if (musicToPlay == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: Music with URL not found");
        }

        musicToPlay.countPlay();

        List<Genre> genres = musicToPlay.getGenres();
        for (Genre genre : genres) {
            genre.countPlay();
        }

        musicRepository.save(musicToPlay);

        return "Playing " + musicToPlay.getType() + ": " + musicToPlay.getTitle();
    }

    @Override
    public String likeMusic(String url) {
        Music musicToLike = musicRepository.findMusicByUrl(url);

        if (musicToLike == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: music with URL not found");
        }

        musicToLike.addLike();

        List<Genre> genres = musicToLike.getGenres();
        for (Genre genre : genres) {
            genre.addLike();
        }

        return "Liked music: " + musicToLike.getTitle();
    }

    @Override
    public String disLikeMusic(String url) {
        Music musicToDisLike = musicRepository.findMusicByUrl(url);

        if (musicToDisLike == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "ERROR: music with URL not found");
        }

        musicToDisLike.addDisLike();

        return "Disliked " + musicToDisLike.getType() + ": " + musicToDisLike.getTitle();
    }

    @Override
    public Boolean checkIfMusicExistByUrl(String url) {
        Music music = musicRepository.findMusicByUrl(url);

        return music != null;
    }
}
