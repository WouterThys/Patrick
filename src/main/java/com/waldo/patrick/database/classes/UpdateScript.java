package com.waldo.patrick.database.classes;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateScript extends BaseDbObject {

    private long id;
    private int majorVersion;
    private int minorVersion;
    private int buildVersion;
    private String description;
    private String script;

    @Override
    public void initFromReader(ResultSet rs) throws SQLException {
        id = rs.getLong("id");
        majorVersion = rs.getInt("majorVersion");
        minorVersion = rs.getInt("minorVersion");
        buildVersion = rs.getInt("buildVersion");
        description = rs.getString("description");
        script = rs.getString("script");
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getMajorVersion() {
        return majorVersion;
    }

    public void setMajorVersion(int majorVersion) {
        this.majorVersion = majorVersion;
    }

    public int getMinorVersion() {
        return minorVersion;
    }

    public void setMinorVersion(int minorVersion) {
        this.minorVersion = minorVersion;
    }

    public int getBuildVersion() {
        return buildVersion;
    }

    public void setBuildVersion(int buildVersion) {
        this.buildVersion = buildVersion;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getScript() {
        return script;
    }

    public void setScript(String script) {
        this.script = script;
    }
}
