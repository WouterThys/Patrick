package com.waldo.patrick;

import com.waldo.patrick.database.classes.DbConnection;

import java.io.File;


public class Main {

    private static final String TAG = "MAIN";
    private static final String MODE_UPDATE_SCRIPTS_CREATE = "UPDATESCRIPTS_CREATE";
    private static final String MODE_UPDATE_SCRIPTS_EXECUTE = "UPDATESCRIPTS_EXECUTE";
    private static final String MODE_PROCEDURES = "PROCEDURES";

    private static final int ARG_MODE = 0;
    private static final int ARG_DB_SERVER = 1;
    private static final int ARG_DB_SCHEMA = 2;
    private static final int ARG_DB_USER = 3;
    private static final int ARG_DB_PASSWORD = 4;
    private static final int ARG_FROM_ID = 5;
    private static final int ARG_TARGET_DIR = 6;
    private static final int ARG_TARGET_PROCEDURES = 7;
    private static final int ARG_TARGET_UPDATE_SCRIPTS = 8;

    public static void main(String[] args) {
        // Start up
        String startUpPath = new File("").getAbsolutePath() + File.separator;
        System.out.println("Start up @" + startUpPath);

        // Check
        if (args.length < 5 || args[0] == null) {
            System.out.println("Not enough arguments!");
        } else {

            DbConnection dbConnection;

            try {
                String mode = args[ARG_MODE];
                dbConnection = new DbConnection(
                        args[ARG_DB_SERVER],
                        args[ARG_DB_SCHEMA],
                        args[ARG_DB_USER],
                        args[ARG_DB_PASSWORD]);

                // Start app
                print(TAG, "Start initialize for schema " + dbConnection.getSchema());
                if (!Application.app().initialize(dbConnection)) {
                    error(TAG, "Failed to initialize");
                } else {

                    switch (mode) {
                        case MODE_PROCEDURES:
                            Application.app().createStoredProcedures(args[ARG_TARGET_DIR], args[ARG_TARGET_PROCEDURES]);
                            break;
                        case MODE_UPDATE_SCRIPTS_CREATE:
                            Application.app().createTableUpdateScripts(Long.valueOf(args[ARG_FROM_ID]), args[ARG_TARGET_UPDATE_SCRIPTS]);
                            break;
                        case MODE_UPDATE_SCRIPTS_EXECUTE:
                            Application.app().executeTableUpdateScripts();
                            break;

                            default: error(TAG, "Invalid mode");
                    }
                }

            } catch (Exception e) {
                error(TAG, "Error: ", e);
            }
        }
        System.out.println("Closing up");
    }

    public static void print(String tag, String message) {
        System.out.println(tag + ": " + message);
    }

    public static void error(String tag, String message) {
        System.err.println(tag + ": " + message);
    }

    public static void error(String tag, String message, Throwable t) {
        System.err.println(tag + ": " + message);
        t.printStackTrace();
    }
}
