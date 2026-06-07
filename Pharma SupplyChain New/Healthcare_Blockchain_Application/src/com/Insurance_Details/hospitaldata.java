package com.Insurance_Details;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.algo.HashGeneratorUtils;
import com.connection.Dbconn;

/**
 * Servlet implementation class hospitaldata
 */
@WebServlet("/hospitaldata")
public class hospitaldata extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String Insurance_Company;
    public static String Police_Name;
    public static String Months;
    public static String Coverage_Msg;
    
    public static String First_Name=null,Last_Name=null,Birth_Of_Date=null,Systolic_BP=null,Dystolic_BP=null,Pulse_Pressure=null,Cholestrol_Data=null,Ldl=null,Hdl=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hospitaldata() {
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
		String Hospitalemail=(String)session.getAttribute("hospitalname");
		String PatientEmail=request.getParameter("txtpname");
		try {
			Connection con = Dbconn.conn();
			for (String s : id) {
				
				
				Statement st = con.createStatement();
				String query1 = "select * from tblinfoinsurance where I_IDs='"+ s + "'";
				ResultSet rs1 = st.executeQuery(query1);
				while (rs1.next()) {
					 Insurance_Company=rs1.getString("Insurance_Company");
					 Police_Name=rs1.getString("Police_Name");
					 Months=rs1.getString("Months");
					Coverage_Msg=rs1.getString("Coverage_Msg");
				}
				
				Statement st1 = con.createStatement();
				String query = "select * from tblmasterpatient where Email_ID='"+ PatientEmail + "'";
				ResultSet rs12 = st1.executeQuery(query);
				while (rs12.next()) {
					First_Name=rs12.getString("First_Name");
					Last_Name=rs12.getString("Last_Name");
					Birth_Of_Date=rs12.getString("Birth_Of_Date");
					Systolic_BP=rs12.getString("Systolic_BP");
					Dystolic_BP=rs12.getString("Dystolic_BP");
					Pulse_Pressure=rs12.getString("Pulse_Pressure");
					Cholestrol_Data=rs12.getString("Cholestrol_Data");
					Ldl=rs12.getString("Ldl");
					Hdl=rs12.getString("Hdl");
					
				}
				Date day=new Date();
				String currenttime=day.toString();
				
				PreparedStatement p1;
				String data=PatientEmail+Insurance_Company+Police_Name+Months+Coverage_Msg+s+First_Name+Last_Name+Birth_Of_Date+Systolic_BP+Dystolic_BP+Pulse_Pressure+Cholestrol_Data+Ldl+Hdl;
				//HashGeneratorUtils generatorUtils=new HashGeneratorUtils();
				//String shadata=generatorUtils.generateSHA256(data);
				//ChainConsensus.Consensus(data);
				HashGeneratorUtils generatorUtils=new HashGeneratorUtils();
				String hash=generatorUtils.generateSHA256(data);
				String sql="insert into tblinfohospital(PatientEmail,Insurance_Company,Police_Name,Months,Coverage_Msg,Hospital_Email_ID) values(?,?,?,?,?,?)";
				p1=(PreparedStatement) con.prepareStatement(sql);
				p1.setString(1,PatientEmail);
				p1.setString(2,Insurance_Company);
				p1.setString(3,Police_Name);
				p1.setString(4,Months);
				p1.setString(5,Coverage_Msg);
				p1.setString(6,Hospitalemail);
				p1.executeUpdate();
				
				PreparedStatement p2;
				String sq2="insert into tblblockchain(Hospital_Email_ID,BlocKData,Current_Times) values(?,?,?)";
				p2=(PreparedStatement) con.prepareStatement(sq2);
				p2.setString(1,Hospitalemail);
				p2.setString(2,hash);
				p2.setString(3,currenttime);
				p2.executeUpdate();
				
				
				PreparedStatement p20;
				String sq20="insert into tblmaster(Transcation_Hash,FromName,ToName,NonceData,PreViewHash,DiseaseFirst,DiseaseSecond,DiseaseThrees,DiseaseFour,DiseaseFive,DiseaseSix) values(?,?,?,?,?,?,?,?,?,?,?)";
				p20=(PreparedStatement) con.prepareStatement(sq20);
				p20.setString(1,hash);
				p20.setString(2,Hospitalemail);
				p20.setString(3,PatientEmail);
				p20.setString(4,String.valueOf(generatorUtils.nonce));
				p20.setString(5,Dbconn.PrevHash3);
				p20.setString(6,Systolic_BP);
				p20.setString(7,Dystolic_BP);
				p20.setString(8,Pulse_Pressure);
				p20.setString(9,Cholestrol_Data);
				p20.setString(10,Ldl);
				p20.setString(11,Hdl);
				p20.executeUpdate();
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		pw.println("<html><script>alert('Save Successfully');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		RequestDispatcher rd = request.getRequestDispatcher("/ShowInsuranceandPatient.jsp");
		rd.include(request, response);
	}

}
