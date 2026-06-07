package com.fileinfo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;
import com.fileinfo.downloads;

/**
 * Servlet implementation class userfiledownload
 */
@WebServlet("/userfiledownload")
public class userfiledownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static Connection conns;
	public long startingtime,endingtime,totaltime;
	public userfiledownload() {
		super();
		// 
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ServletOutputStream op = response.getOutputStream();
		HttpSession session=request.getSession(true);
		startingtime=System.currentTimeMillis();
		String fileName = request.getParameter("filenamedb");
		String arr[]=fileName.split(",");
		String username=(String)session.getAttribute("name");
		System.out.println("file Name===>" + arr[0]+"Server Name=>"+arr[1]);
		String servername=arr[1];
		String filename=arr[0];
		String datafinal = null;
		try {
				datafinal=downloads.filedownload(username,filename,servername);
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		endingtime=System.currentTimeMillis();
		totaltime=endingtime-startingtime;
		try {
			conns = Dbconn.conn();
		
		java.sql.Statement st=conns.createStatement();
		st.executeUpdate("update masterinfo set downloadtime='"+String.valueOf(totaltime)+"' where user='"+username+"' and filename='"+filename+"'");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setHeader("Content-Type", "application/octet-stream");
		response.setContentType("text/plain");
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ filename + "\"");
		op.println(datafinal);
		op.close();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 
	}

}
