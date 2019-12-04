package com.waldo.patrick;

import com.waldo.patrick.database.classes.DbConnection;

import java.io.File;


public class Main {

    /*
    * PARAMETERS
    * -------------------------------------
    *  - MODE 'UPDATESCRIPTS_CREATE'
    *  -> UPDATESCRIPTS_CREATE <DB_SERVER> <DB_SCHEMA> <DB_USER> <DB_PASSWORD> <FROM_ID> <TARGET_UPDATE_SCRIPT>
    *
    *  - MODE 'PROCEDURES'
    *  -> PROCEDURES <DB_SERVER> <DB_SCHEMA> <DB_USER> <DB_PASSWORD> <TARGET_DIR> <PROCEDURE_SCRIPT>
    *
    *  - MODE 'UPDATESCRIPTS_EXECUTE'
    *  -> UPDATESCRIPTS_EXECUTE <DB_SERVER> <DB_SCHEMA> <DB_USER> <DB_PASSWORD> <TARGET_DIR> <VERSION>
    *
    * */

    private static final String TAG = "MAIN";
    private static final String MODE_UPDATE_SCRIPTS_CREATE = "UPDATESCRIPTS_CREATE";
    private static final String MODE_UPDATE_SCRIPTS_EXECUTE = "UPDATESCRIPTS_EXECUTE";
    private static final String MODE_PROCEDURES = "PROCEDURES";

    private static final int ARG_MODE = 0;
    private static final int ARG_DB_SERVER = 1;
    private static final int ARG_DB_SCHEMA = 2;
    private static final int ARG_DB_USER = 3;
    private static final int ARG_DB_PASSWORD = 4;

    // PROCEDURES params
    private static final int ARG_TARGET_DIR = 5;
    private static final int ARG_TARGET_PROCEDURES = 6;

    // UPDATESCRIPTS_CREATE params
    private static final int ARG_FROM_ID = 5;
    private static final int ARG_TARGET_UPDATE_SCRIPTS = 6;

    // UPDATESCRIPTS_EXECUTE params
    private static final int ARG_VERSION = 5;



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

                switch (mode) {
                    case MODE_PROCEDURES:
                        print(TAG, "Running on mode " + mode + ". Start initialize for schema " + dbConnection.getSchema());
                        if (!Application.app().initialize(dbConnection)) {
                            error(TAG, "Failed to initialize");
                            return;
                        }
                        Application.app().createStoredProcedures(args[ARG_TARGET_DIR], args[ARG_TARGET_PROCEDURES]);
                        break;
                    case MODE_UPDATE_SCRIPTS_CREATE:
                        print(TAG, "Running on mode " + mode + ". Start initialize for schema " + dbConnection.getSchema());
                        if (!Application.app().initialize(dbConnection)) {
                            error(TAG, "Failed to initialize");
                            return;
                        }
                        Application.app().createTableUpdateScripts(Long.valueOf(args[ARG_FROM_ID]), args[ARG_TARGET_UPDATE_SCRIPTS]);
                        break;
                    case MODE_UPDATE_SCRIPTS_EXECUTE:
                        print(TAG, "Running on mode " + mode + ". Start initialize for schema " + dbConnection.getSchema());
                        if (!Application.app().initialize(dbConnection)) {
                            error(TAG, "Failed to initialize");
                            return;
                        }
                        String[] split = args[ARG_VERSION].split("\\.");
                        Application.app().executeTableUpdateScripts(Integer.valueOf(split[0]), Integer.valueOf(split[1]), Integer.valueOf(split[2]));
                        break;

                    default: error(TAG, "Invalid mode");
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
