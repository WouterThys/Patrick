package com.waldo.patrick.settings;

import com.waldo.patrick.Main;
import com.waldo.patrick.database.classes.TableType;
import com.waldo.patrick.utils.ResourceManager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class AppSettings {

    // Singleton
    private static final AppSettings INSTANCE = new AppSettings();
    public static AppSettings as() {
        return INSTANCE;
    }
    private AppSettings() {

    }

    private ResourceManager resourceManager;
    private HashMap<TableType, List<String>> defaultColumnsMap;

    public void initialize() throws IOException {
        resourceManager = new ResourceManager("settings/", "app.properties");
    }


    public String getDbAddress() {
        return resourceManager.readString("db.Address");
    }

    public String getDbSchema() {
        return resourceManager.readString("db.Schema");
    }

    public String getDbUser() {
        return resourceManager.readString("db.User");
    }

    public String getDbPassword() {
        return resourceManager.readString("db.Password");
    }


    public boolean isDefaultColumn(TableType type, String columnName) {
        if (defaultColumnsMap == null) {
            createDefaultColumnMap();
        }
        if (defaultColumnsMap.containsKey(type)) {
            return defaultColumnsMap.get(type).contains(columnName.toLowerCase());
        }
        return false;
    }

    private void createDefaultColumnMap() {
        defaultColumnsMap = new HashMap<>();
        for (TableType type : TableType.values()) {
            try {
                List<String> columnNames = new ArrayList<>();
                String defaultColumnsString = resourceManager.readString("defaultColumns." + type);
                if (defaultColumnsString != null && !defaultColumnsString.isEmpty()) {
                    for (String column : defaultColumnsString.split(";")) {
                        if (!column.isEmpty()) {
                            columnNames.add(column.toLowerCase());
                        }
                    }
                }
                defaultColumnsMap.put(type, columnNames);
            } catch (Exception e) {
                Main.error("Settings", "createDefaultColumnMap", e);
            }
        }
    }


}
