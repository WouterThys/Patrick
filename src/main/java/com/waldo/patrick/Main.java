package com.waldo.patrick;

import com.waldo.patrick.database.classes.DbConnection;

import java.io.File;


public class Main {

    private static final String TAG = "MAIN";

    public static void main(String[] args) {
        // Start up
        String startUpPath = new File("").getAbsolutePath() + File.separator;
        System.out.println("Start up @" + startUpPath);

        // Check
        if (args.length < 4 || args[0] == null) {
            System.out.println("Not enough arguments!");
        } else {

            DbConnection dbConnection;
            String filePath = ".";
            String updateScriptName = "updatescript.sql";
            try {
                dbConnection = new DbConnection(
                        args[0],
                        args[1],
                        args[2],
                        args[3]);

                if (args.length >= 5) {
                    filePath = args[4];
                }
                if (args.length >= 6) {
                    updateScriptName = args[5];
                }

                // Start app
                print(TAG, "Start initialize for schema " + dbConnection.getSchema());
                if (!Application.app().initialize(dbConnection, filePath, updateScriptName)) {
                    error(TAG, "Failed to initialize");
                } else {
                    Application.app().createScripts();
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
