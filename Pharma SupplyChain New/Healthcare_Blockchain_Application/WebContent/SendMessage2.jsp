<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*, java.text.*"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Connection con = Dbconn.conn();
	int wid = Integer.parseInt(request.getParameter("wid"));
	int pid = Integer.parseInt(request.getParameter("pid"));
    String receiver  = request.getParameter("Wholersalername");
    String message = request.getParameter("message");
   	//String Pharmacyname = request.getParameter("Pharmacyname");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String timestamp = sdf.format(new Date());

    try {
        PreparedStatement pst = con.prepareStatement("INSERT INTO tblchat1 (pid, wid, receiver, message, timestamp) VALUES (?, ?, ?, ?, ?)");
        pst.setInt(1, pid);
        pst.setInt(2, wid);
        pst.setString(3, receiver);
        pst.setString(4, message);
        pst.setString(5, timestamp);
        pst.executeUpdate();
        out.print("Message sent");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
