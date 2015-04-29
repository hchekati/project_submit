package com.dts.core.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.dts.core.model.AbstractDataObject;
import com.dts.core.util.LoggerManager;

public class AbstractDataAccessObject {
private final static String jdbcDriver = "com.mysql.jdbc.Driver";
private static Object driverObject = null;
private final static String url = "jdbc:mysql://127.0.0.1:3306/";
private final static String db = "olshop";
private final static String user = "root";
private final static String pass = "root";

	Connection con=null;
	static Properties props;
	/**
	 * @return the props
	 */
	public Properties getProperties() {
		return props;
	}

	/**
	 * @param props the props to set
	 */
	public void setProperties(Properties props) {
		this.props = props;
	}
	public Connection getConnection() throws SQLException
	
	{
		System.out.println( "rrr1");
		if (driverObject == null) {
			try {
				System.out.println( "rrr2");
				driverObject = Class.forName(jdbcDriver).newInstance();
			} catch (ClassNotFoundException e) {
				System.out.println("Couldn't find the driver class.");
			} catch (Exception e) {
				System.out
						.println("Other problems with loading the driver class.");
			}
		}
	    System.out.println("url + db"+url + db);
		con = DriverManager.getConnection(url + db, user, pass);
		con.setAutoCommit(false);
		return con;
		/*try 
		{
			Properties p = getProperties();
			Class.forName(p.getProperty("driver"));
			con = DriverManager.getConnection(p.getProperty("url"),p.getProperty("duser"),p.getProperty("dpass"));
           
			/* String JNDI=p.getProperty("JNDI_NAME");
       		InitialContext ic;
			try 
			{
				ic = new InitialContext();
				DataSource ds=(DataSource)ic.lookup(JNDI);
            	con=ds.getConnection();
			} catch (NamingException ne) {
				LoggerManager.writeLogWarning(ne);
			}*/
		/*}
		catch (ClassNotFoundException cnf)
		{
			LoggerManager.writeLogWarning(cnf);
		}
		catch (SQLException se)
		{
			LoggerManager.writeLogWarning(se);
		}
		return con;
	}
	*/
	}
	// get Sequence ID
	public int getSequenceID(String tableName, String pkid)
	{
		int id = 0;
		try
		{
			con = getConnection();
			con.setAutoCommit(false);
			Statement st = con.createStatement();
			con.setAutoCommit(false);
			ResultSet rs = st.executeQuery("select max("+pkid+") from "+tableName); 
			if(rs.next())
				id=rs.getInt(1);
			id++;
		}
		catch(SQLException se)
		{
			LoggerManager.writeLogWarning(se);
		}
		catch(Exception e)
		{
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(SQLException se)
			{
			    LoggerManager.writeLogWarning(se);	
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return id;
	}
}
