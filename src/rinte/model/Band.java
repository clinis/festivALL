package rinte.model;

import java.util.Date;

public class Band {
    private int bid = -1;
    private String name = null;
    private String image = null;
    private String artists = null;
    private Date registeredon = null;

    public Band() { }

    public int getID() {
        return bid;
    }

    public void setID(int bid) {
        this.bid = bid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getArtists() {
        return artists;
    }

    public void setArtists(String artists) {
        this.artists = artists;
    }

    public Date getRegisteredon() {
        return registeredon;
    }

    public void setRegisteredon(Date registeredon) {
        this.registeredon = registeredon;
    }
}
