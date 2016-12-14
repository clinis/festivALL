package rinte.model;

import java.util.Date;
import java.util.List;

public class Event {
        private int e_id = -1;
        private short type = -1;
        private String name = null;
        private Date date = null;
        private String city = null;
        private String place = null;
        private Date registeredon = null;
        private List<Band> event_bands;


    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public short getType() {
        return type;
    }

    public void setType(short type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Date getRegisteredon() {
        return registeredon;
    }

    public void setRegisteredon(Date registeredon) {
        this.registeredon = registeredon;
    }

    public List<Band> getEvent_bands() {
        return event_bands;
    }

    public void setEvent_bands(List<Band> event_bands) {
        this.event_bands = event_bands;
    }
}
