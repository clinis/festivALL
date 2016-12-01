/**
 * Created by dinis on 30/11/16.
 */
package jdbc.datamodel;

import java.util.Calendar;

public class Event {
        private int e_id;
        private short type;
        private String name;
        private Calendar date;
        private String city;
        private String local;

    public int getID() {
        return e_id;
    }

    public void setID(int e_id) {
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

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
        this.date = date;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }
}
