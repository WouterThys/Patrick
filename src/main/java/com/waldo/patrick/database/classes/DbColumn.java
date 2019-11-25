package com.waldo.patrick.database.classes;

import com.waldo.patrick.database.DbManager;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DbColumn extends BaseDbObject {

    private String tableName;
    private int ordinal;
    private String defaultValue;
    private boolean isNullable;
    private boolean isPrimaryKey;
    private String dataType;//
    private int characterLength;
    private int numericPrecision;//

    private DbTable table;

    @Override
    public String toString() {
        return "DbColumn{" +
                "name='" + name + '\'' +
                ", ordinal=" + ordinal +
                ", isPrimaryKey=" + isPrimaryKey +
                ", dataType='" + dataType + '\'' +
                ", tableName='" + tableName + '\'' +
                '}';
    }

    @Override
    public void initFromReader(ResultSet rs) throws SQLException {
        name = rs.getString("COLUMN_NAME");
        tableName = rs.getString("TABLE_NAME");
        ordinal = rs.getInt("ORDINAL_POSITION");
        defaultValue = rs.getString("COLUMN_DEFAULT");
        dataType = rs.getString("DATA_TYPE");
        characterLength = rs.getInt("CHARACTER_MAXIMUM_LENGTH");
        numericPrecision = rs.getInt("NUMERIC_PRECISION");
        String nullable = rs.getString("IS_NULLABLE");
        String key = rs.getString("COLUMN_KEY");
        isNullable = nullable.equalsIgnoreCase("YES");
        isPrimaryKey = key.equalsIgnoreCase("PRI");
    }

    public DbTable getTable() {
        if (table == null) {
            table = DbManager.db().findTable(getTableName());
        }
        return table;
    }

//    public boolean isDefaultColumn() {
//        DbTable table = getTable();
//        return AppSettings.as().isDefaultColumn(table.getTableType(), getName());
//    }

    //region Getters/Setters

    public String getTableName() {
        if (tableName == null) {
            tableName = "";
        }
        return tableName;
    }

    public int getOrdinal() {
        return ordinal;
    }

    public String getDefaultValue() {
        if (defaultValue == null) {
            defaultValue = "";
        }
        return defaultValue;
    }

    public String getRightTypeAmount() {
        if (dataType.contains("int")) {
            return "(" + getCorrectedPrecision() + ")";
        }
        if (getDataType().contains("char")) {
            return "(" + getCharacterLength() + ")";
        }

        return "";
    }

    private int getCorrectedPrecision() {
        return numericPrecision + 1;
    }

    public boolean isNullable() {
        return isNullable;
    }

    public boolean isPrimaryKey() {
        return isPrimaryKey;
    }

    public String getDataType() {
        if (dataType == null) {
            dataType = "";
        }
        return dataType;
    }

    public int getCharacterLength() {
        return characterLength;
    }

    public int getNumericPrecision() {
        return numericPrecision;
    }

    //endregion
}
