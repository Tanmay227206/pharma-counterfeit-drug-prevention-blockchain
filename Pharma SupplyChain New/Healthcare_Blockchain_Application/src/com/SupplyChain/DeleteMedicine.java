package com.SupplyChain;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Dbconn;

@WebServlet("/DeleteMedicine")
public class DeleteMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteMedicine() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("id");
		String cust_name = request.getParameter("cust_name");
		
		try {
			Connection con = Dbconn.conn();
			PreparedStatement ps=con.prepareStatement("DELETE FROM `booked_medicine` WHERE id = '"+id+"'");
			System.out.println("PS= "+ ps);
			int i=ps.executeUpdate();
		    if(i>0)
		    {
		    	response.sendRedirect("MedicineCustBill.jsp?delete&cust_name=" + cust_name);
		    }
		    else{
		    	response.sendRedirect("MedicineCustBill.jsp?fail");
		    }    	
		    }
		catch(Exception e)
		{
			System.out.println(e);
		}	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
