package com.waldo.patrick.database.classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

public class UpdateScript extends BaseDbObject {

    private long id;
    private int majorVersion;
    private int minorVersion;
    private int buildVersion;
    private String description;
    private String script;

    private Date executed;
    private ScriptState state;
    private String message;

    @Override
    public void initFromReader(ResultSet rs) throws SQLException {
        id = rs.getLong("id");
        majorVersion = rs.getInt("majorVersion");
        minorVersion = rs.getInt("minorVersion");
        buildVersion = rs.getInt("buildVersion");
        description = rs.getString("description");
        script = rs.getString("script");

        executed = rs.getDate("executed");
        state = ScriptState.fromInt(rs.getInt("state"));
        message = rs.getString("message");
    }

    public void updateState(ScriptState state) {
        this.state = state;
        setExecuted();
    }

    private void setExecuted() {
        Calendar calendar = Calendar.getInstance();
        java.util.Date currentDate = calendar.getTime();
        executed = new java.sql.Date(currentDate.getTime());
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

    public Date getExecuted() {
        return executed;
    }

    public ScriptState getState() {
        if (state == null) {
            state = ScriptState.Pending;
        }
        return state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
