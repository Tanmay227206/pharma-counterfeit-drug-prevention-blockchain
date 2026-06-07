package com.SupplyChain;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;

@WebServlet("/UpdateMedicine")
public class UpdateMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UpdateMedicine() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String medicine = session.getAttribute("medicine").toString();
		System.out.println("Medicine:= "+medicine);
		String company = request.getParameter("company");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		try {
			Connection con = Dbconn.conn();
			PreparedStatement ps = con.prepareStatement("update medicine set company='"+company+"', quantity='"+quantity+"', price='"+price+"' where medicine=?");
			ps.setString(1, medicine);
			ps.executeUpdate();
			response.sendRedirect("MedicineStock.jsp?Update");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
}
