package com.activity;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.*;

@WebServlet("/DealerLogin")
public class DealerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	String email,pswd,query,msg;
	PreparedStatement pst;
	ResultSet rs=null;
	HttpSession session=null;
	
	public void init(ServletConfig config) throws ServletException {
		try {
			con=Dbconn.conn();
			} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession();
		
		email=request.getParameter("email");
		pswd=request.getParameter("pswd");
		query="SELECT * FROM tbldealer WHERE email='"+email+"' and pswd='"+pswd+"'";
		//System.out.println(query);
		try {
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			if(rs.next())
			{
				//String firstname = rs.getString("firstname");
				//String lastname = rs.getString("lastname");
				session.setAttribute("firstname", rs.getString("firstname"));
				session.setAttribute("lastname", rs.getString("lastname"));
				response.sendRedirect("DealerHome.jsp?Done");
			}
			else
			{
				response.sendRedirect("DealerLogin.jsp?Result=faillogin");	
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}
