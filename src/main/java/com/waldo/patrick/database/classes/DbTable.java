package com.waldo.patrick.database.classes;

import com.waldo.patrick.database.DbManager;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class DbTable extends BaseDbObject {

    private String schema;
    private String comment;
    private int version;
    private int rows;
    private long autoIncrement;
    private Date createTime;
    private Date updateTime;

    private TableType tableType;
    private List<DbForeignKey> foreignKeys;
    private List<DbColumn> columns;

    @Override
    public String toString() {
        return "DbTable{" +
                "name='" + name + '\'' +
                ", schema='" + schema + '\'' +
                ", rows=" + rows +
                ", autoIncrement=" + autoIncrement +
                ", tableType=" + tableType +
                '}';
    }

    @Override
    public void initFromReader(ResultSet rs) throws SQLException {
        name = rs.getString("TABLE_NAME");
        schema = rs.getString("TABLE_SCHEMA");
        comment = rs.getString("TABLE_COMMENT");
        version = rs.getInt("VERSION");
        rows = rs.getInt("TABLE_ROWS");
        autoIncrement = rs.getLong("AUTO_INCREMENT");
        createTime = rs.getDate("CREATE_TIME");
        updateTime = rs.getDate("UPDATE_TIME");
    }

    public List<DbColumn> getColumns() {
        if (columns == null) {
            columns = DbManager.db().getColumns(this);
        }
        return columns;
    }

    public List<DbForeignKey> getForeignKeys() {
        if (foreignKeys == null) {
            foreignKeys = DbManager.db().getForeignKeys(this);
        }
        return foreignKeys;
    }

    public TableType getTableType() {
        if (tableType == null) {
            // Special tables
            if (getName().equalsIgnoreCase("updatescripts") ||
                getName().equalsIgnoreCase("settings")) {
                tableType = TableType.Other;
            }
            // Links
            else if (getName().startsWith("link")) {
                tableType = TableType.Link;
            }
            // Custom data
            else if (getName().endsWith("_customdata")) {
                tableType = TableType.CustomData;
            }
            // Types
            else if (getName().endsWith("types")) {
                tableType = TableType.Type;
            }
            // Logs
            else if (getName().endsWith("slog")) {
                tableType = TableType.Log;
            }
            // Data
            else {
                tableType = TableType.Data;
            }

        }
        return tableType;
    }

    //region Getters/Setters

    public String getSchema() {
        if (schema == null) {
            schema = "";
        }
        return schema;
    }

    public String getComment() {
        if (comment == null) {
            comment = "";
        }
        return comment;
    }

    public int getVersion() {
        return version;
    }

    public int getRows() {
        return rows;
    }

    public long getAutoIncrement() {
        return autoIncrement;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    //endregion
}
