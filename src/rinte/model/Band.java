package rinte.model;

import java.util.Date;

public class Band {
    private int b_id = -1;
    private String name = null;
    private String artists = null;
    private Date registeredon = null;

    public Band() { }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
