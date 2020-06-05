package com.waldo.patrick.database.classes;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface IDbObject {

    String getName();

    void initFromReader(ResultSet rs) throws SQLException;

}
