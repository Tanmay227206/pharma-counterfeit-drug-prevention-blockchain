package com.SupplyChain;

import java.io.IOException;
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

@WebServlet("/ChatBotW")
public class ChatBotW extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ChatBotW() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		String chat = request.getParameter("chat");
        String rdate = request.getParameter("Rdate");
        String pid = request.getParameter("pid");
        HttpSession session = request.getSession();
        String Wholersalername = session.getAttribute("Wholersalername").toString();
        String wid = request.getParameter("wid");

        //Connection con = null;
        PreparedStatement ps = null;

        try {
        	Connection con = Dbconn.conn(); 
            String sql = "INSERT INTO tblchat (wid,pid,Wholersalername,chat,Rdate) VALUES (?,?,?,?,?)"; 
            ps = con.prepareStatement(sql);
            ps.setString(1, wid); 
            ps.setString(2, pid);   
            ps.setString(3, Wholersalername);
            ps.setString(4, chat);
            ps.setString(5, rdate);
           
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Message saved successfully!");
            } else {
                System.out.println("Failed to save message.");
            }

           response.sendRedirect("ChatBotW.jsp?pid=" + pid);

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the error properly (e.g., show an error page)
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }
}