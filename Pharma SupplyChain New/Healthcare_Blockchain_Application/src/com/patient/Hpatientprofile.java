package com.patient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.connection.Dbconn;

/**
 * Servlet implementation class Hpatientprofile
 */
@WebServlet("/Hpatientprofile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class Hpatientprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hpatientprofile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	String getFileName(Part filePart) {
		for (String cd : filePart.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1)
						.substring(fileName.lastIndexOf('\\') + 1);
				// return cd.substring(cd.indexOf('=') + 1).trim().replace("\"",
				// "") ;
			}

		}

		return null;

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		InputStream inputStream = null;
		Connection con;
		Part filePart = request.getPart("txt_search");
		String fileName = getFileName(filePart);
		inputStream = filePart.getInputStream();
		BufferedReader br = null;
		try {
			// get file path and read file
			br = new BufferedReader(new InputStreamReader(inputStream));
			// file line by line read and check null
			con = Dbconn.conn();
			String data="";
			Statement st1 = (Statement) con.createStatement();
			Statement st2 = (Statement) con.createStatement();
			Statement st3 = (Statement) con.createStatement();
			while ((data = br.readLine()) != null) {
				//System.out.println("Size"+arr);
				String[] arr = data.split("#");
				System.out.println("Size"+arr[0]);
				st1.executeUpdate("insert into tblmasterpatientnew(First_Name,Middle_Name,Last_Name,Birth_Of_Date,DiseaseFirst,DiseaseSecond,DiseaseThrees,DiseaseFour,DiseaseFive,DiseaseSix,Email_ID) values('" + arr[0]
						+ "','" + arr[1] + "','" + arr[2] + "','" + arr[3] + "','" + arr[4] + "','" + arr[5] + "','" + arr[6] + "','" + arr[7] + "','" + arr[8] + "','" + arr[9] + "','" + arr[10] + "')");
				Random r=new Random();
                long num=r.nextInt(1000000000-700000000) + 700000000;
				st2.executeUpdate("insert into tblregister(Name,Email_IDs,Mobile_No,Passwords,Address) values('"+arr[0]+"','"+arr[10]+"','"+num+"','123','Pune')");
				st3.executeUpdate("insert into tblmasterpatient(First_Name,Middle_Name,Last_Name,Birth_Of_Date,Email_ID) values('" + arr[0]+ "','" + arr[1] + "','" + arr[2] + "','" + arr[3] +"','"+arr[10]+"')");

				
			}
			br.close();
			pw.println("<html><script>alert('File Uploaded Sucessfully');</script><body>");
			pw.println("");
			pw.println("</body></html>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/HProfileUpdate.jsp");
			rd.include(request, response);

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// 
			e.printStackTrace();
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}
	}

}
