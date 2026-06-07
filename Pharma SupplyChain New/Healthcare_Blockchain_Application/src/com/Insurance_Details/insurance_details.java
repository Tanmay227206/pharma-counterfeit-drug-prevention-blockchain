package com.Insurance_Details;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Dbconn;

/**
 * Servlet implementation class insurance_details
 */
@WebServlet("/insurance_details")
public class insurance_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insurance_details() {
        super();
        // 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		try {
			
			String Email_IDs=request.getParameter("email");
			String Company_Name=request.getParameter("txtcompany");
			String Mobile_Number=request.getParameter("txtmobile");
			String Web_Site=request.getParameter("txtwebsite");
			String Address=request.getParameter("txtaddress");
			String Policy_No=request.getParameter("txtpolicyno");
			String Policy_Name=request.getParameter("txtpolicename");
			String Policy_Tenue=request.getParameter("txtpolicytenue");
			String Base_Premium=request.getParameter("txtbasepremium");
			String Coverage_Info=request.getParameter("txtCoverage");
			String txtamount=request.getParameter("txtamount");
			
			Connection con;
			PreparedStatement p1;
			con = Dbconn.conn();
		
			
			
			String sql="insert into tblInsurance_Details(Email_IDs,Company_Name,Mobile_Number,Web_Site,Address,Policy_No,Policy_Name,Policy_Tenue,Base_Premium,Coverage_Info,Policy_Amount) values(?,?,?,?,?,?,?,?,?,?,?)";   
			p1=(PreparedStatement) con.prepareStatement(sql);
			p1.setString(1,Email_IDs);
			p1.setString(2,Company_Name);
			p1.setString(3,Mobile_Number);
			p1.setString(4,Web_Site);
			p1.setString(5,Address);
			
			p1.setString(6,Policy_No);
			p1.setString(7,Policy_Name);
			p1.setString(8,Policy_Tenue);
			p1.setString(9,Base_Premium);
			p1.setString(10,Coverage_Info);
			p1.setString(11,txtamount);
			p1.executeUpdate();
			
			
			
//		String sql="insert into tblInsurance_Details(Email_IDs,Insurance_Company,Police_Name,Months,Coverage_Msg) values(?,?,?,?,?)";   
//		p1=(PreparedStatement) con.prepareStatement(sql);
//		p1.setString(1,emailid);
//		p1.setString(2,insurancename);
//		p1.setString(3,policename);
//		p1.setString(4,months);
//		p1.setString(5,coveragemsg);
//		p1.executeUpdate();
		}catch (ClassNotFoundException | SQLException e) {
			// 
			e.printStackTrace();
		}
		pw.println("<script> alert('Save Successfully');</script>");
		RequestDispatcher rd = request.getRequestDispatcher("/InsuranceDetails.jsp");
		rd.include(request, response); 
	}

}
