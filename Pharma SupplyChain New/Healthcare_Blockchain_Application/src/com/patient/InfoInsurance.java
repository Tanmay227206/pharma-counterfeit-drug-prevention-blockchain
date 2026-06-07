package com.patient;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;

/**
 * Servlet implementation class InfoInsurance
 */
@WebServlet("/InfoInsurance")
public class InfoInsurance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public static String Insurance_Company;
       public static String Police_Name;
       public static String Months;
       public static String Coverage_Msg;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoInsurance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		String[] id = request.getParameterValues("Checkbox");
		String PatientName=(String)session.getAttribute("pname");
		String PatientEmail=(String)session.getAttribute("pemailid");
		try {
			Connection con = Dbconn.conn();
			for (String s : id) {
				
				Statement st = con.createStatement();
				String query1 = "select * from tblinsurance_details where T_ID='"+ s + "'";
				System.out.println(query1);
				ResultSet rs1 = st.executeQuery(query1);
				if(rs1.next()) {
				
				PreparedStatement p1;
				String sql="insert into tblinfoinsurance(PatientName,PatientEmail,Company_Name,Mobile_Number,Web_Site,Address,Policy_No,Policy_Name,Policy_Tenue,Base_Premium,Coverage_Info,Policy_Amount,Email_IDs) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";    
				p1=(PreparedStatement) con.prepareStatement(sql);
				p1.setString(1,PatientName);
				p1.setString(2,PatientEmail);
				p1.setString(3,rs1.getString("Company_Name"));
				p1.setString(4,rs1.getString("Mobile_Number"));
				p1.setString(5,rs1.getString("Web_Site"));
				p1.setString(6,rs1.getString("Address"));
				
				p1.setString(7,rs1.getString("Policy_No"));
				p1.setString(8,rs1.getString("Policy_Name"));
				p1.setString(9,rs1.getString("Policy_Tenue"));
				p1.setString(10,rs1.getString("Base_Premium"));
				p1.setString(11,rs1.getString("Coverage_Info"));
				p1.setString(12,rs1.getString("Policy_Amount"));
				p1.setString(13,rs1.getString("Email_IDs"));
				p1.executeUpdate();
				
				PreparedStatement ps1;
				String sql1="insert into tblinfoinsuranceo(PatientName,PatientEmail,Insurance_Company,Police_Name,Months,Coverage_Msg) values(?,?,?,?,?,?)";    
				ps1=(PreparedStatement) con.prepareStatement(sql1);
				ps1.setString(1,PatientName);
				ps1.setString(2,PatientEmail);
				ps1.setString(3,rs1.getString("Company_Name"));
				ps1.setString(4,rs1.getString("Policy_Name"));
				ps1.setString(5,rs1.getString("Policy_Tenue"));
				ps1.setString(6,rs1.getString("Coverage_Info"));
				ps1.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		pw.println("<html><script>alert('Insurance Save Successfully');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		RequestDispatcher rd = request.getRequestDispatcher("/ShowInsurancePatient.jsp");
		rd.include(request, response);
	}

}
