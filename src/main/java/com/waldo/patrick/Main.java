package com.waldo.patrick;

import java.io.File;
import java.util.Scanner;

public class Main {


    public static void main(String[] args) {
        String startUpPath = new File("").getAbsolutePath() + File.separator;
        System.out.println("Start up @" + startUpPath);
        readArguments(args);

        Scanner scanner = new Scanner(System.in);

        System.out.println("Give some input");
        String input = scanner.nextLine();
        System.out.println("Input=" + input);
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
