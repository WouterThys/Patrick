package com.waldo.patrick.database.classes;

public class DbConnection {

    //    db.Address=192.168.0.248
//    db.Schema=ww
//    db.User=waldo
//    db.Password=waldow

    private String address;
    private String schema;
    private String user;
    private String password;

    public DbConnection(String address, String schema, String user, String password) {
        this.address = address;
        this.schema = schema;
        this.user = user;
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
