package com.fileinfo;


import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.connection.Dbconn;

public class downloads {
	public static String datafinal=null;
	public static String filedownload(String username,String filename,String servername)
	{
		try {
			int i=0;
			Connection conn = Dbconn.conn();
			Statement StInsert = conn.createStatement();
			
			{
        	ResultSet rs=StInsert.executeQuery("select * from fileinfo where user='"+username+"' and filename='"+filename+"' ");
        	if(!rs.isBeforeFirst())
        	{
        			
        	}
        	else{
        	if(rs.next()){
        		datafinal=rs.getString("data");
        		 
           
         	}
        	// fw.close();
        	}
        	 i++;
			}
			
		} catch (ClassNotFoundException e) {
			// 
			e.printStackTrace();
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		} 
		return datafinal;
	}
	public static void main(String[] args) {
		
	}

}
