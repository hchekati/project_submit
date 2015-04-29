package com.dts.core.db;

import java.sql.SQLException;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.model.AbstractDataObject;

/**
 *
 * @author
 */
public class DBFactory {
	
    public DBFactory() throws SQLException 
    {
    	new AbstractDataAccessObject().getConnection();
    }	
}
