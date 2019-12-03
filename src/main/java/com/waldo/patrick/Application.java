package com.waldo.patrick;

import com.waldo.patrick.database.DbManager;
import com.waldo.patrick.database.classes.*;
import com.waldo.patrick.scripts.StoredProcedure;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

class Application {

    private static final String TAG = "Patrick";

    private String selectStatement;
    private String updateStatement;
    private String insertStatement;
    private String deleteStatement;
    private String deleteLinkStatement;
    private String insertLinkStatement;
    private String insertUpdateScriptStatement;

    // Singleton
    private static final Application INSTANCE = new Application();

    static Application app() {
        return INSTANCE;
    }

    private Application() {
    }

    boolean initialize(DbConnection dbConnection) {

        Main.print(TAG, "Reading config");
        try {
            readConfigData();
        } catch (IOException e) {
            Main.error(TAG, "Reading config", e);
        }

        Main.print(TAG, "Initialize database");
        try {
            DbManager.db().initialize(dbConnection);
        } catch (SQLException e) {
            Main.error(TAG, "Initialize database", e);
        }

        Main.print(TAG, "Initialized");
        return true;
    }

    private void readConfigData() throws IOException {
        selectStatement = readFileAsString("selectStatement.txt");
        updateStatement = readFileAsString("updateStatement.txt");
        insertStatement = readFileAsString("insertStatement.txt");
        deleteStatement = readFileAsString("deleteStatement.txt");
        deleteLinkStatement = readFileAsString("deleteLinkStatement.txt");
        insertLinkStatement = readFileAsString("insertLinkStatement.txt");
        insertUpdateScriptStatement = readFileAsString("insertUpdateScriptStatement.txt");
    }

    private String readFileAsString(String fileName) throws IOException {
        String result = "";
        try (InputStream in = getClass().getClassLoader().getResourceAsStream(fileName)) {
            if (in != null) {
                byte[] targetArray = new byte[in.available()];
                if (in.read(targetArray) > 0) {
                    result = new String(targetArray);
                }
            }
        }
        return result;
    }

    // region Stored Procedures
    void createStoredProcedures(String filePath, String updateScriptName) {

        createSelectAllScripts(filePath);
        createUpdateScripts(filePath);
        createInsertScripts(filePath);
        createDeleteScripts(filePath);

        createUpdateScript(filePath, updateScriptName);
    }

    private void createSelectAllScripts(String filePath) {
        ArrayList<StoredProcedure> selectAllProcedures = new ArrayList<>();
        for (DbTable table : DbManager.db().getTables(TableType.Data, TableType.Type)) {
            StoredProcedure selectAllProcedure = new StoredProcedure();
            selectAllProcedure.setName(table.getName() + "SelectAll");
            // Vul '%s' in in 'selectStatement' String
            String content = String.format(selectStatement, table.getSchema(), table.getName(), table.getSchema(), table.getName(), table.getName());
            selectAllProcedure.setContent(content);
            selectAllProcedures.add(selectAllProcedure);
        }

        createFiles(filePath, selectAllProcedures);
        Main.print(TAG, "Select statements created");
    }

    private void createUpdateScripts(String filePath) {
        ArrayList<StoredProcedure> updateProcedures = new ArrayList<>();

        for (DbTable table : DbManager.db().getTables(TableType.Data, TableType.Type)) {
            StoredProcedure updateProcedure = new StoredProcedure();
            updateProcedure.setName(table.getName() + "Update");

            StringBuilder lijst1 = new StringBuilder();

            for (DbColumn column : table.getColumns()) {
                if ((!column.getName().equals("id")) && (!column.getName().equals("deleted")) && (!column.getName().equals("lastModified"))) {
                    lijst1.append("\n" + "  ").append(column.getName()).append(" ").append(column.getDataType()).append(" ").append(column.getRightTypeAmount()).append(",");
                }

            }
            StringBuilder lijst2 = new StringBuilder();
            for (DbColumn column : table.getColumns()) {
                if ((!column.getName().equals("id")) && (!column.getName().equals("deleted")) && (!column.getName().equals("lastModified"))) {
                    lijst2.append("\n" + "\t").append(column.getName()).append(" = ").append(column.getName()).append(",");
                }
            }
            String content = String.format(updateStatement,
                    table.getSchema(),
                    table.getName(),
                    table.getSchema(),
                    table.getName(),
                    lijst1.toString(),
                    table.getName(),
                    lijst2.toString());

            updateProcedure.setContent(content);
            updateProcedures.add(updateProcedure);

        }
        createFiles(filePath, updateProcedures);
        Main.print(TAG, "Update statements created");
    }


    private void createInsertScripts(String filePath) {
        ArrayList<StoredProcedure> insertProcedures = new ArrayList<>();

        for (DbTable table : DbManager.db().getTables(TableType.Data, TableType.Type)) {
            StoredProcedure insertProcedure = new StoredProcedure();
            insertProcedure.setName(table.getName() + "Insert");

            StringBuilder lijst1 = new StringBuilder();

            for (DbColumn column : table.getColumns()) {
                if ((!column.getName().equals("id")) && (!column.getName().equals("deleted")) && (!column.getName().equals("lastModified"))) {
                    lijst1.append("\n" + "  ").append(column.getName()).append(" ").append(column.getDataType()).append(" ").append(column.getRightTypeAmount()).append(",");
                }
            }
            StringBuilder lijst2 = new StringBuilder();
            for (DbColumn column : table.getColumns()) {
                if ((!column.getName().equals("id")) && (!column.getName().equals("deleted")) && (!column.getName().equals("lastModified"))) {
                    lijst2.append("\n" + "\t").append(column.getName()).append(",");
                }
            }

            String content = String.format(insertStatement,
                    table.getSchema(),
                    table.getName(),
                    table.getSchema(),
                    table.getName(),
                    lijst1.toString(),
                    table.getName(),
                    lijst2.toString(),
                    lijst2.toString());

            insertProcedure.setContent(content);
            insertProcedures.add(insertProcedure);
        }

        // Link
        for (DbTable table : DbManager.db().getTables(TableType.Link)) {
            StoredProcedure insertProcedure = new StoredProcedure();
            insertProcedure.setName(table.getName() + "Insert");

            String content = String.format(insertLinkStatement,
                    table.getSchema(),
                    table.getName(),
                    table.getSchema(),
                    table.getName(),
                    table.getName(),
                    table.getColumns().get(1).getName(), // Not very clean..
                    table.getColumns().get(2).getName());

            insertProcedure.setContent(content);
            insertProcedures.add(insertProcedure);
        }

        createFiles(filePath, insertProcedures);
        Main.print(TAG, "Insert statements created");
    }

    private void createDeleteScripts(String filePath) {
        // Data and Type
        ArrayList<StoredProcedure> deleteProcedures = new ArrayList<>();
        for (DbTable table : DbManager.db().getTables(TableType.Data, TableType.Type)) {
            StoredProcedure deleteProcedure = new StoredProcedure();
            deleteProcedure.setName(table.getName() + "Delete");

            String content = String.format(deleteStatement, table.getSchema(), table.getName(), table.getSchema(), table.getName(), table.getName());

            deleteProcedure.setContent(content);
            deleteProcedures.add(deleteProcedure);
        }

        // Link
        for (DbTable table : DbManager.db().getTables(TableType.Link)) {
            StoredProcedure deleteProcedure = new StoredProcedure();
            deleteProcedure.setName(table.getName() + "Delete");

            String content = String.format(deleteLinkStatement,
                    table.getSchema(),
                    table.getName(),
                    table.getSchema(),
                    table.getName(),
                    table.getName(),
                    table.getColumns().get(1).getName(),
                    table.getColumns().get(2).getName());

            deleteProcedure.setContent(content);
            deleteProcedures.add(deleteProcedure);
        }

        createFiles(filePath, deleteProcedures);
        Main.print(TAG, "Delete statements created");
    }


    private void createFiles(String filePath, ArrayList<StoredProcedure> procedures) {
        if (filePath != null && !filePath.isEmpty()) {
            File path = new File(filePath);
            if (!path.exists()) {
                if (!path.mkdirs()) {
                    Main.error(TAG, "Failed to create directory " + filePath);
                }
            }
            for (StoredProcedure procedure : procedures) {
                try {
                    PrintWriter writer = new PrintWriter(filePath + "\\" + procedure.getName() + ".sql", "UTF-8");
                    writer.print(procedure.getContent());
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void createUpdateScript(String filePath, String name) {
        if (filePath != null && !filePath.isEmpty()) {
            File directory = new File(filePath);
            if (directory.exists()) {
                File[] files = directory.listFiles((dir, fileName) -> fileName.toLowerCase().endsWith(".sql"));
                if (files != null) {

                    try {
                        // Input files
                        List<Path> inputs = new ArrayList<>();
                        for (File f : files) {
                            inputs.add(f.toPath());
                        }

                        // Output file
                        Path output = Paths.get(name);
                        PrintWriter writer = new PrintWriter(output.toFile().getAbsolutePath());
                        writer.print("USE " + DbManager.db().getSchema() + ";");
                        writer.close();

                        // Charset for read and write
                        Charset charset = StandardCharsets.UTF_8;

                        for (Path path : inputs) {
                            List<String> lines = Files.readAllLines(path, charset);
                            Files.write(output, lines, charset, StandardOpenOption.CREATE, StandardOpenOption.APPEND);
                        }
                        Main.print(TAG, "Update script created at " + filePath);
                    } catch (Exception e) {
                        Main.error(TAG, "Create update scripts", e);
                    }
                } else {
                    Main.error(TAG, "No update script created because " + filePath + " contains no sql files");
                }
            } else {
                Main.error(TAG, "No update script created because " + filePath + " does not exist");
            }
        } else {
            Main.error(TAG, "No update script created because file path is empty");
        }
    }

    // endregion

    // region Update Scripts

    void createTableUpdateScripts(long fromId, String fileName) {
        List<UpdateScript> updateScripts = DbManager.db().readUpdateScripts(fromId);

        try {
            Path output = Paths.get(fileName);
            PrintWriter writer = new PrintWriter(fileName);
            writer.print("");
            writer.close();

            // Charset for read and write
            Charset charset = StandardCharsets.UTF_8;
            List<String> lines = new ArrayList<>();
            for (UpdateScript script : updateScripts) {
                String statement = String.format(insertUpdateScriptStatement,
                        script.getId(),
                        script.getMajorVersion(),
                        script.getMinorVersion(),
                        script.getBuildVersion(),
                        script.getScript(),
                        script.getDescription());
                lines.add(statement);
            }
            if (lines.size() > 0) {
                Files.write(output, lines, charset, StandardOpenOption.CREATE, StandardOpenOption.APPEND);
                Main.print(TAG, "Update script created at " + fileName);
            } else {
                Main.print(TAG, "No update scripts found");
            }
        } catch (Exception e) {
            Main.error(TAG, "Create update scripts failed", e);
        }
    }

    // endregion
}
