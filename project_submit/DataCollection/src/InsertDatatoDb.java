 

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;



public class InsertDatatoDb {
	
	private final static String jdbcDriver = "com.mysql.jdbc.Driver";
	private static Object driverObject = null;
	private final static String url = "jdbc:mysql://127.0.0.1:3306/";
	private final static String db = "olshop";
	private final static String user = "root";
	private final static String pass = "root";

	public InsertDatatoDb() {
		if (driverObject == null) {
			try {
				driverObject = Class.forName(jdbcDriver).newInstance();
			} catch (ClassNotFoundException e) {
				System.out.println("Couldn't find the driver class.");
			} catch (Exception e) {
				System.out
						.println("Other problems with loading the driver class.");
			}
		}
	}


	public static void insertData() {
		//int productId=1166;
		//int quantityAvailable=1000;
		Connection con = null;
		ResultSet rs = null;
		//int ItemID=923;
		//ScoreBean points = new ScoreBean();
		try {
			try {
				con = DriverManager.getConnection(url + db, user, pass);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Statement st = null;
			try {
				st = con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			/*
			* INSERT INTO table_name (column1, column2, column3,...) VALUES
			* (value1, value2, value3,...)
			*/
			File f = new File("C:\\Users\\HariCharan\\Desktop\\Images");
			ArrayList<File> files = new ArrayList<File>(Arrays.asList(f.listFiles()));
			boolean updated=false;
		   for(File f1 : files)
		   {
			   System.out.println("siz3"+files.size());
		   	String productType = f1.getName();
		   	System.out.println("Name"+productType);
		   	String name= f1.getName();
	   		String names[]=name.split("_");
	   		String ItemID=names[0];
	   		
	   		String CategoryID=names[1];
	   		String ItemName=names[2];
	   		String ItemDesc=names[3].substring(0, names[3].length()-4);
	   		System.out.println(f1.getAbsolutePath());
	   		String image=f1.getAbsolutePath().replace("\\", "/");
	   		System.out.println("image"+image);
		   	//ArrayList<File> files1 = new ArrayList<File>(Arrays.asList(f1.listFiles()));
		   /*	for(File f2:files1)
		   	{
		   		String name= f2.getName();
		   		String names[]=name.split("_");
		   		String ItemID=names[0];
		   		String CategoryID=names[1];
		   		String ItemName=names[2];
		   		String ItemDesc=names[3];
		   		String image=f2.getAbsolutePath().replace("\\", "\\\\")+f2.getName();
		   		//String price = names[0];
		   		//String productName=names[1];
		   		//productId++;
		   		
		   		//System.out.println("productId "+productId+" productName "+productName+" price "+price+" quantityAvailable "+quantityAvailable+" productType "+productType+"\n");*/
		   		String queryToInsert = "insert into olshop.item(ItemID,CategoryID,ItemName,ItemDesc,image) values ('"+ItemID+"','"+CategoryID+"','"+ItemName+"','"+ItemDesc+"',LOAD_FILE('"+image+"'));";
	   		
					System.out.println(queryToInsert);
					try {
						st.execute(queryToInsert);
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
		   	
				//ItemID=ItemID+1;
		   	
		   	}
		   }
		finally
		{
			
		}
			
		
		   	
	}
	
	public static void main(String args[])
	{
	insertData();	
	}
}


