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

@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	String username,password,query,msg;
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
		
		username=request.getParameter("username");
		password=request.getParameter("password");
		query="SELECT * FROM tbladmin WHERE username='"+username+"' and password='"+password+"'";
		//System.out.println(query);
		try {
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			if(rs.next())
			{
				session.setAttribute("id", rs.getString("userName"));
				response.sendRedirect("AdminHome.jsp?Done");
			}
			else
			{
				response.sendRedirect("AdminLogin.jsp?Result=faillogin");	
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}
