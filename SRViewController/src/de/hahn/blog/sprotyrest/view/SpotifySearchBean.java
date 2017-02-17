package de.hahn.blog.sprotyrest.view;

import com.wrapper.spotify.Api;
import com.wrapper.spotify.exceptions.WebApiException;
import com.wrapper.spotify.methods.TrackSearchRequest;
import com.wrapper.spotify.methods.TrackSearchRequest.Builder;
import com.wrapper.spotify.models.Page;
import com.wrapper.spotify.models.SimpleArtist;
import com.wrapper.spotify.models.Track;

import java.io.IOException;

import java.util.List;

import javax.faces.event.ActionEvent;

import oracle.adf.share.logging.ADFLogger;

public class SpotifySearchBean {
    private static ADFLogger logger = ADFLogger.createADFLogger(SpotifySearchBean.class);

    public SpotifySearchBean() {
    }

    public void onSearch(ActionEvent actionEvent) {
        Api api = Api.DEFAULT_API;
        Builder builder = api.searchTracks("sorry");
        TrackSearchRequest build = builder.build();
        Page<Track> page = null;
        try {
            page = build.get();
        } catch (WebApiException e1) {
            e1.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        List<Track> items = page.getItems();
        StringBuilder sb = new StringBuilder();
        for (Track t : items) {
            sb.append("Album: ").append(t.getAlbum().getName()).append(" Track: ").append(t.getName()).append(" Dauer: ").append(t.getDuration());
            List<SimpleArtist> artistsList = t.getArtists();
            StringBuilder artists = new StringBuilder();
            artists.append(" Artist: ");
            for (SimpleArtist artist : artistsList) {
                artists.append(artist.getName()).append(", ");
            }
            sb.append(artists.toString()).append("\n");
        }
        logger.info("Information:" + sb.toString());
    }
}
