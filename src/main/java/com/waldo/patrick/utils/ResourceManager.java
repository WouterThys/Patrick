package com.waldo.patrick.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;

public class ResourceManager {

    // Variables
    private final Properties properties = new Properties();

    public ResourceManager(String propertiesUrl, String fileName) throws IOException {
        Path resourcePath = Paths.get(propertiesUrl, fileName);
        try(InputStream is = this.getClass().getClassLoader().getResourceAsStream(resourcePath.toString())) {
            properties.load(is);
        }
    }

    public String readString(String key) {
        return properties.getProperty(key);
    }

    public int readInteger(String key) {
        int result = 0;
        try {
            result = Integer.parseInt(readString(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public double readDouble(String key) {
        double result = 0;
        try {
            result = Double.parseDouble(readString(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public long readLong(String key) {
        long result = 0;
        try {
            result = Long.parseLong(readString(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean readBoolean(String key) {
        boolean result = false;
        try {
            result = Boolean.parseBoolean(readString(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
