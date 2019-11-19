package com.waldo.patrick;

import com.waldo.patrick.database.DbManager;
import com.waldo.patrick.database.classes.DbColumn;
import com.waldo.patrick.database.classes.DbConnection;
import com.waldo.patrick.database.classes.DbTable;
import com.waldo.patrick.database.classes.TableType;
import com.waldo.patrick.scripts.StoredProcedure;
import com.waldo.patrick.settings.AppSettings;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Application {

    public static final String TAG = "Application";

    private static final String selectStatement = "USE `%s`;\n" +
            "DROP procedure IF EXISTS `%sSelectAll`;\n" +
            "\n" +
            "DELIMITER $$\n" +
            "USE `%s`$$\n" +
            "CREATE DEFINER=`root`@`localhost` PROCEDURE `%sSelectAll`()\n" +
            "BEGIN\n" +
            "\n" +
            "\tSELECT * FROM %s;\n" +
            "\n" +
            "END$$" +
            "\n" +
            "\n" +
            "DELIMITER ; ";


    private static final String updateStatement = "USE `%s`;\n" +
            "DROP procedure IF EXISTS `%sUpdate`;\n" +
            "\n" +
            "DELIMITER $$\n" +
            "USE `%s`$$\n" +
            "CREATE DEFINER=`root`@`localhost` PROCEDURE `%sUpdate`(" +
            "%s\n" +
            "  " + "updateId int\n" +
            ")\n" +
            "BEGIN\n" +
            "  UPDATE\n" +
            "\t%s\n" +
            "  SET" +
            "\t%s\n" +
            "\tlastModified = current_timestamp()\n" +
            "  WHERE\n" +
            "\tid = updateId;\n" +
            "END$$\n" +
            "\n" +
            "DELIMITER ;";

    private static final String insertStatement = "USE `%s`;\n" +
            "DROP procedure IF EXISTS `%sInsert`;\n" +
            "\n" +
            "DELIMITER $$\n" +
            "USE `%s`$$\n" +
            "CREATE DEFINER=`root`@`localhost` PROCEDURE `%sInsert`(" +
            "%s\n" +
            "  " + "OUT lid int\n" +
            ")\n" +
            "BEGIN\n" +
            "  INSERT INTO %s(" +
            "\t%s\n" +
            "\tlastModified)\n" +
            "  VALUES(" +
            "\t%s\n" +
            "\tnow());\n" +
            "  SET lid = last_insert_id();\n" +
            "END$$\n" +
            "\n" +
            "DELIMITER ;";

    private static final String deleteStatement = "USE `%s`;\n" +
            "DROP procedure IF EXISTS `%sDelete`;\n" +
            "\n" +
            "DELIMITER $$\n" +
            "USE `%s`$$\n" +
            "CREATE DEFINER=`root`@`localhost` PROCEDURE `%sDelete`(\n" +
            "  deleteId int(11)\n" +
            ")\n" +
            "BEGIN\n" +
            " DELETE FROM %s WHERE id = deleteId;\n" +
            "END$$\n" +
            "\n" +
            "DELIMITER ;";

    // Singleton
    private static final Application INSTANCE = new Application();
    static Application app() {
        return INSTANCE;
    }
    private Application() {
    }

    private String filePath;
    private String updateScriptName;

    boolean initialize(DbConnection dbConnection, String filePath, String updateScriptName) {
        this.filePath = filePath;
        this.updateScriptName = updateScriptName;

        Main.print(TAG, "Initialize settings");
        try {
            AppSettings.as().initialize();
        } catch (IOException e) {
            Main.error(TAG, "Initialize settings", e);
            return false;
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

    public void createScripts() {

        createSelectAllScripts(); // Voor Data en Type
        createUpdateScripts(); // Voor Data, Type
        createInsertScripts(); // Voor Data, Type, Link
        createDeleteScripts(); // Voor Data, Type, Link

        createUpdateScript(updateScriptName);
    }

    private void createSelectAllScripts() {
        ArrayList<StoredProcedure> selectAllProcedures = new ArrayList<>();
        for (DbTable table : DbManager.db().getTables(TableType.Data, TableType.Type)) {
            StoredProcedure selectAllProcedure = new StoredProcedure();
            selectAllProcedure.setName(table.getName() + "SelectAll");
            // Vul '%s' in in 'selectStatement' String
            String content = String.format(selectStatement, table.getSchema(), table.getName(), table.getSchema(), table.getName(), table.getName());
            selectAllProcedure.setContent(content);
            selectAllProcedures.add(selectAllProcedure);
        }

        createFiles(selectAllProcedures);
    }

    private void createUpdateScripts() {
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
        createFiles(updateProcedures);
    }


    private void createInsertScripts() {
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
        createFiles(insertProcedures);
    }

    private void createDeleteScripts() {
        // Data and Type
        ArrayList<StoredProcedure> deleteProcedures = new ArrayList<>();
        for (DbTable table : DbManager.db().getTables(TableType.Data, TableType.Type)) {
            StoredProcedure selectAllProcedure = new StoredProcedure();
            selectAllProcedure.setName(table.getName() + "Delete");

            String content = String.format(deleteStatement, table.getSchema(), table.getName(), table.getSchema(), table.getName(), table.getName());

            selectAllProcedure.setContent(content);
            deleteProcedures.add(selectAllProcedure);
        }

        // Link


        createFiles(deleteProcedures);
    }


    private void createFiles(ArrayList<StoredProcedure> procedures) {
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

    private void createUpdateScript(String name) {
        if (filePath != null && !filePath.isEmpty()) {
            File directory = new File(filePath);
            if (directory.exists()) {
                File[] files = directory.listFiles();
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
                        writer.print("");
                        writer.close();

                        // Charset for read and write
                        Charset charset = StandardCharsets.UTF_8;

                        for (Path path : inputs) {
                            List<String> lines = Files.readAllLines(path, charset);
                            Files.write(output, lines, charset, StandardOpenOption.CREATE,
                                    StandardOpenOption.APPEND);
                        }
                    } catch (Exception e) {
                        Main.error(TAG, "Create update scripts", e);
                    }


//                    for (File f : files) {
//                        try {
//                            Main.print(TAG, "Executing " + f.getName());
//                            DbManager.db().execute(f);
//                        } catch (Exception e) {
//                            Main.error(TAG, "Executing " + f.getName() + " failed", e);
//                        }
//                    }
                }
            }
        }
    }
}
