package com.med_tracking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.*;


@WebServlet("/AssignDealer")
public class AssignDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	String a[];
	int i = 0;

	public void init(ServletConfig config) throws ServletException {

		try {
			con = Dbconn.conn();
			
		} catch (Exception e) {
			System.out.println("Exe:"+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String shipment = "";
	a = request.getParameterValues("shipment");
	for (i = 0; i < a.length; i++) {
		shipment += a[i] + " ";
		System.out.println(a[i]);
	String TrackingId=request.getParameter("TrackingId");
	String tproduct=request.getParameter("total_product");
	String cost=request.getParameter("cost");
	String dealername=request.getParameter("dealername");
	
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat form = new SimpleDateFormat("HH:mm:ss");
    Date date = new Date();            
    String cdate=dateFormat.format(date);
    String time=form.format(date);
    
    System.out.println("createdate:"+date);
	System.out.println("createtime:"+time);
	
	try {		
		String qur="update tblshipproduct set dealername='"+dealername+"',status='Assign'"
				+ " where id='"+a[i]+"' and TrackingId='"+TrackingId+"'";
		//System.out.println(qur);
		PreparedStatement ps=con.prepareStatement(qur);
		ps.executeUpdate();
		System.out.println("update");
		
		String query = "insert into tbltracking(TrackingId,total_product,dealername,cdate,time,status) values('"+TrackingId+"',"
				+ "'" + tproduct + "','" + dealername + "','" + cdate + "','" + time + "','In Transit')";
		//System.out.println(query);
		PreparedStatement ps2 = con.prepareStatement(query);
		ps2.executeUpdate();

		response.sendRedirect("SupplierProfile.jsp?Assign");
	
	} catch (Exception e) {
		
		System.out.println("Exe on try block:"+e);		
	}	
	}
	}	
}
