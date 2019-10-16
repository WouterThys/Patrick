package com.waldo.patrick;

import com.waldo.patrick.database.DbManager;
import com.waldo.patrick.database.classes.DbColumn;
import com.waldo.patrick.database.classes.DbForeignKey;
import com.waldo.patrick.database.classes.DbTable;
import com.waldo.patrick.database.classes.TableType;
import com.waldo.patrick.settings.AppSettings;

import java.io.IOException;
import java.sql.SQLException;

public class Application {

    public static final String TAG = "Application";

    // Singleton
    private static final Application INSTANCE = new Application();
    public static Application app() {
        return INSTANCE;
    }
    private Application() {

    }

    public boolean initialize() {
        Main.print(TAG, "Initialize settings");
        try {
            AppSettings.as().initialize();
        } catch (IOException e) {
            Main.error(TAG, "Initialize settings", e);
            return false;
        }

        Main.print(TAG, "Initialize database");
        try {
            DbManager.db().initialize(
                AppSettings.as().getDbAddress(),
                    AppSettings.as().getDbSchema(),
                    AppSettings.as().getDbUser(),
                    AppSettings.as().getDbPassword()
            );
        } catch (SQLException e){
            Main.error(TAG, "Initialize database", e);
        }

        Main.print(TAG, "Initialized");
        return true;
    }

    public void test() {
        System.out.println("TABLES PER TYPE");
        for (TableType type : TableType.values()) {
            System.out.println(" ------ " + type + " ------");

            for (DbTable table : DbManager.db().getTables(type)) {
                System.out.println(table);
            }

            System.out.println();
        }

        System.out.println("TEST TABLE");
        DbTable table = DbManager.db().findTable("machines");
        System.out.println(" - name: " + table.getName());
        System.out.println(" - type: " + table.getTableType());
        System.out.println(" - columns: ");
        for (DbColumn column : table.getColumns()) {
            System.out.println("\t" + column);
        }
        System.out.println(" - keys: ");
        for (DbForeignKey key : table.getForeignKeys()) {
            System.out.println("\t" + key);
        }

    }

    public void createScripts() {
        // TODO
    }
}
