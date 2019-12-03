package com.waldo.patrick.database;

import com.mysql.cj.jdbc.MysqlDataSource;
import com.waldo.patrick.Main;
import com.waldo.patrick.database.classes.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DbManager {

    private static final String TAG = "DBMANAGER";
    private static final String CONNECTION_STRING = "jdbc:mysql://%s/%s?zeroDateTimeBehavior=convertToNull&connectTimeout=20000&socketTimeout=30000&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static final String sqlLoadTables = "SELECT * FROM information_schema.tables where table_schema='%s';";
    private static final String sqlLoadForeignKeys = "SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = '%s';";
    private static final String sqlLoadColumns = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '%s' ORDER BY ORDINAL_POSITION;";
    private static final String sqlGetUpdateScripts = "SELECT id, majorVersion, minorVersion, buildVersion, description, script from ww.updatescripts WHERE id >= %d";

    // Singleton
    private static final DbManager INSTANCE = new DbManager();

    public static DbManager db() {
        return INSTANCE;
    }

    private DbManager() {

    }

    // Database
    private MysqlDataSource dataSource;

    private String address;
    private String schema;
    private String userName;
    private String password;

    // Data
    private List<DbTable> dbTableList;
    private List<DbColumn> dbColumnList;
    private List<DbForeignKey> dbForeignKeyList;

    // region Setup
    public void initialize(DbConnection connection) throws SQLException {
        initialize(connection.getAddress(), connection.getSchema(), connection.getUser(), connection.getPassword());
    }

    public void initialize(String address, String schema, String userName, String password) throws SQLException {
        this.address = address;
        this.schema = schema;
        this.userName = userName;
        this.password = password;

        setupDataSource();
        if (!testConnection()) {
            throw new SQLException("Failed to connect with db " + address);
        }
    }


    private void setupDataSource() {
        dataSource = new MysqlDataSource();

        dataSource.setUrl(String.format(CONNECTION_STRING, getAddress(), getSchema()));
        dataSource.setUser(getUserName());
        dataSource.setPassword(getPassword());
    }

    private boolean testConnection() throws SQLException {
        String sql = "SELECT 1;";

        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement stmt = connection.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }
    //endregion

    //region Logic
    public List<DbTable> getAllTables() {
        if (dbTableList == null) {
            refreshTables();
        }
        return dbTableList;
    }

    public List<DbColumn> getAllColumns() {
        if (dbColumnList == null) {
            refreshColumns();
        }
        return dbColumnList;
    }

    public List<DbForeignKey> getAllForeignKeys() {
        if (dbForeignKeyList == null) {
            refreshForeignKeys();
        }
        return dbForeignKeyList;
    }


    public List<DbTable> getTables(TableType... types) {
        List<DbTable> tables = new ArrayList<>();
        List<TableType> typeList = Arrays.asList(types);
        for (DbTable table : getAllTables()) {
            if (typeList.contains(table.getTableType())) {
                tables.add(table);
            }
        }
        return tables;
    }

    public List<DbColumn> getColumns(DbTable table) {
        List<DbColumn> columns = new ArrayList<>();
        for (DbColumn column : getAllColumns()) {
            if (column.getTableName().equalsIgnoreCase(table.getName())) {
                columns.add(column);
            }
        }
        return columns;
    }

    public List<DbForeignKey> getForeignKeys(DbTable table) {
        List<DbForeignKey> foreignKeys = new ArrayList<>();
        for (DbForeignKey key : getAllForeignKeys()) {
            if (key.getTableName().equalsIgnoreCase(table.getName())) {
                foreignKeys.add(key);
            }
        }
        return foreignKeys;
    }


    public DbTable findTable(String name) {
        return findByName(name, getAllTables());
    }

    public DbColumn findColumn(String name) {
        return findByName(name, getAllColumns());
    }

    public DbForeignKey findForeignKey(String name) {
        return findByName(name, getAllForeignKeys());
    }

    public <T extends IDbObject> T findByName(String name, List<T> findIn) {
        for (T t : findIn) {
            if (t.getName().equalsIgnoreCase(name)) {
                return t;
            }
        }
        return null;
    }


    public void refreshAll() {
        refreshTables();
        refreshColumns();
        refreshForeignKeys();
    }

    public void refreshTables() {
        String sql = String.format(sqlLoadTables, getSchema());
        dbTableList = new ArrayList<>();
        dbTableList.addAll(getFromDb(sql, DbTable::new));
    }

    public void refreshColumns() {
        String sql = String.format(sqlLoadColumns, getSchema());
        dbColumnList = new ArrayList<>();
        dbColumnList.addAll(getFromDb(sql, DbColumn::new));
    }

    public void refreshForeignKeys() {
        String sql = String.format(sqlLoadForeignKeys, getSchema());
        dbForeignKeyList = new ArrayList<>();
        dbForeignKeyList.addAll(getFromDb(sql, DbForeignKey::new));
    }

    private interface ICreateNew<T extends IDbObject> {
        T onCreateNew();
    }
    private <T extends IDbObject> List<T> getFromDb(String sql, ICreateNew<T> creator) {
        List<T> result = new ArrayList<>();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    T t = creator.onCreateNew();
                    t.initFromReader(rs);
                    result.add(t);
                }
            }
        } catch (SQLException e) {
            Main.error(TAG, "getFromDb", e);
        }
        return result;
    }


    public List<UpdateScript> readUpdateScripts(long fromId) {
        String sql = String.format(sqlGetUpdateScripts, fromId);
        return getFromDb(sql, UpdateScript::new);
    }

    //endregion

    //region Getters/Setters
    public String getAddress() {
        if (address == null) {
            address = "";
        }
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
        setupDataSource();
    }

    public String getSchema() {
        if (schema == null) {
            schema = "";
        }
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
        setupDataSource();
    }

    public String getUserName() {
        if (userName == null) {
            userName = "";
        }
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
        setupDataSource();
    }

    public String getPassword() {
        if (password == null) {
            password = "";
        }
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
        setupDataSource();
    }
    //endregion

}
