package rinte.model;

import java.util.Date;

public class User {
        private int u_id = -1;
        private String username = null;
        private String password = null;
        private short isadmin = -1;
        private Date registeredon = null;

        public boolean valid;

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public short getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(short isadmin) {
        this.isadmin = isadmin;
    }

    public Date getRegisteredon() {
        return registeredon;
    }

    public void setRegisteredon(Date registeredon) {
        this.registeredon = registeredon;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean newValid) {
        valid = newValid;
    }
}