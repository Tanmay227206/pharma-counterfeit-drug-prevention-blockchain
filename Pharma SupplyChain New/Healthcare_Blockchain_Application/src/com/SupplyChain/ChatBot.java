package com.SupplyChain;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;

@WebServlet("/ChatBot")
public class ChatBot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ChatBot() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		String chat = request.getParameter("chat");
        String rdate = request.getParameter("Rdate");
        String wid = request.getParameter("wid");
        HttpSession session = request.getSession();
        String Pharmacyname = session.getAttribute("Pharmacyname").toString();
        String pid = request.getParameter("pid");

        //Connection con = null;
        PreparedStatement ps = null;

        try {
        	Connection con = Dbconn.conn();  //Get a connection
            String sql = "INSERT INTO tblchat1 (pid,wid,Pharmacyname,chat,Rdate) VALUES (?,?,?,?,?)"; 
            ps = con.prepareStatement(sql);
            ps.setString(1, pid); 
            ps.setString(2, wid);   
            ps.setString(3, Pharmacyname);
            ps.setString(4, chat);
            ps.setString(5, rdate);
           
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Message saved successfully!");
            } else {
                System.out.println("Failed to save message.");
            }

           response.sendRedirect("ChatBot.jsp?wid=" + wid);

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the error properly (e.g., show an error page)
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }
}