package com.waldo.patrick.database.classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

public class DbForeignKey extends BaseDbObject {

    private String tableName;
    private String columnName;

    private String refTableName;
    private String refColumnName;

    public DbForeignKey() {

    }

    @Override
    public String toString() {
        return "DbForeignKey{" +
                "name='" + name + '\'' +
                ", tableName='" + tableName + '\'' +
                ", columnName='" + columnName + '\'' +
                ", refTableName='" + refTableName + '\'' +
                ", refColumnName='" + refColumnName + '\'' +
                '}';
    }

    @Override
    public void initFromReader(ResultSet rs) throws SQLException {
        name = rs.getString("CONSTRAINT_NAME");
        tableName = rs.getString("TABLE_NAME");
        columnName = rs.getString("COLUMN_NAME");
        refColumnName = rs.getString("REFERENCED_TABLE_NAME");
        refColumnName = rs.getString("REFERENCED_COLUMN_NAME");
    }

    //region Getters/Setters

    public String getTableName() {
        if (tableName == null) {
            tableName = "";
        }
        return tableName;
    }

    public String getColumnName() {
        if (columnName == null) {
            columnName = "";
        }
        return columnName;
    }

    public String getRefTableName() {
        if (refTableName == null) {
            refTableName = "";
        }
        return refTableName;
    }

    public String getRefColumnName() {
        if (refColumnName == null) {
            refColumnName = "";
        }
        return refColumnName;
    }

    //endregion

}
