package com.med_tracking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.*;

public class GlobalFunction {
	
	public String getMailId(String uname)
	{
		String email="";
		
		try {
			
			Connection con = Dbconn.conn();
			String qur="select Email_IDs from tblregister where Name='"+uname+"'";
    		System.out.println(qur);
    		PreparedStatement ps=con.prepareStatement(qur);
    		ResultSet rs=ps.executeQuery();
    		
    	if(rs.next())
    	{
    		email=rs.getString("Email_IDs");
    	}
    					
		} catch (Exception e) {
			System.out.println("Exe:"+e);
		}
		System.out.println("Patient Mail ID "+email);
		return email;		
	}
		
public String getMobNo(String username)
{
	String mob="";
	
	try {
		
		Connection con = Dbconn.conn();
		String qur="select Mobile_No from tblregister where Name='"+username+"'";
		//System.out.println(qur);
		PreparedStatement ps=con.prepareStatement(qur);
		ResultSet rs=ps.executeQuery();
		
	if(rs.next())
	{
		mob=rs.getString("Mobile_No");
	}
				
	} catch (Exception e) {
		System.out.println("Exe:"+e);
	}
		
	return mob;	
}
}
