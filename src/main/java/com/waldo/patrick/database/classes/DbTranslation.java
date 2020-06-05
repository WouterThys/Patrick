package com.waldo.patrick.database.classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class DbTranslation extends BaseDbObject {

    private long id;
    private String code;
    private String description;
    private String type;
    private boolean enabled;
    private Date lastModified;
    private String nl;
    private String en;
    private String fr;

    @Override
    public void initFromReader(ResultSet rs) throws SQLException {
        id = rs.getLong("id");
        code = rs.getString("code");
        description = rs.getString("description");
        type = rs.getString("type");
        enabled = rs.getBoolean("enabled");
        lastModified = rs.getDate("lastModified");
        nl = rs.getString("nl");
        en = rs.getString("en");
        fr = rs.getString("fr");
    }


    public String getDateString() {
        if (lastModified == null) {
            long millis = System.currentTimeMillis();
            lastModified = new Date(millis);
        }
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(getLastModified());
    }


    public long getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public String getType() {
        return type;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public Date getLastModified() {
        return lastModified;
    }

    public String getNl() {
        if (nl != null) {
            nl = nl.replace("'", "\\'");
        }
        return nl;
    }

    public String getEn() {
        if (en != null) {
            en = en.replace("'", "\\'");
        }
        return en;
    }

    public String getFr() {
        if (fr != null) {
            fr = fr.replace("'", "\\'");
        }
        return fr;
    }
}
