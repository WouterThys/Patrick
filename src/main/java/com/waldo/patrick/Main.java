package com.waldo.patrick;

import com.waldo.patrick.settings.AppSettings;

import java.io.File;
import java.util.Scanner;

public class Main {


    public static void main(String[] args) {
        // Start up
        String startUpPath = new File("").getAbsolutePath() + File.separator;
        System.out.println("Start up @" + startUpPath);
        readArguments(args);

        Scanner scanner = new Scanner(System.in);

        // Start app
        if (!Application.app().initialize()) {
            System.out.println("Failed to initialize");
        } else {
            //Application.app().test();
            Application.app().createScripts();

            String input = scanner.nextLine();
        }
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

    private static void readArguments(String[] args) {
        if (args.length > 0) {
            for (String arg : args) {
                try {
                    System.out.println("Reading main input parameter: " + arg);
                    String[] split = arg.split("=");
                    String param = split[0];
                    String value = split[1];

                    switch (param) {
                       // TODO
                    }
                } catch (Exception e) {
                    System.err.println("Failed to read input params: " + e);
                }
            }
        }
    }

    public static void closeApplication(int status) {
        System.exit(status);
    }
}
