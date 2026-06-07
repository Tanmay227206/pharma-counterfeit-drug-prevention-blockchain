package com.hospital;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Blockchain.ChainConsensus;
import com.algo.HashGeneratorUtils;
import com.connection.Dbconn;

@WebServlet("/hpatientprofileupdate")
public class hpatientprofileupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String Insurance_Company;
	public static String Policy_Name;
	public static String Months;
	public static String Coverage_Msg;

	public hpatientprofileupdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String email = request.getParameter("email");
		String txtfirstname = request.getParameter("txtfirstname");
		String txtmiddlename = request.getParameter("txtmiddlename"), txtlastname = request
				.getParameter("txtlastname");
		String txtdd = request.getParameter("txtdd");
		//String txtmm = request.getParameter("txtmm");
//		String txtyy = request.getParameter("txtyy");
		String bod =txtdd;
		System.out.println("Date=>"+bod);
		String txtsysbp = request.getParameter("txtsysbp"), txtdysbp = request
				.getParameter("txtdysbp"), txtpp = request
				.getParameter("txtpp"), txtcho = request.getParameter("txtcho"), txtldl = request
				.getParameter("txtldl"), txthdl = request
				.getParameter("txthdl");
		Connection con;
		HttpSession session = request.getSession(true);
		String Hospitalemail = (String) session.getAttribute("Hospitalname");
		// String email=(String)session.getAttribute("pemailid");
		
		int i = 0;
		try {
			if(txtsysbp.isEmpty()||txtsysbp.equals(null)||txtsysbp==null) 
			{
				txtsysbp="-";
			}
			 if(txtdysbp.isEmpty()||txtdysbp.equals(null)||txtdysbp==null)
			{
				txtdysbp="-";
			}
			 if(txtpp.isEmpty()||txtpp.equals(null)||txtpp==null)
			{
				txtpp="-";
			}
			 if(txtcho.isEmpty()||txtcho.equals(null)||txtcho==null)
			{
				txtcho="-";
			}
			 if(txtldl.isEmpty()||txtldl.equals(null)||txtldl==null)
			{
				txtldl="-";
			}
			 if(txthdl.isEmpty()||txthdl.equals(null)||txthdl==null)
			{
				txthdl="-";
			}
			con = Dbconn.conn();

			// String
			// sql1="update tblmasterpatient set First_Name='"+txtfirstname+"',Middle_Name='"+txtmiddlename+"',Last_Name='"+txtlastname+"',Birth_Of_Date='"+bod+"',Systolic_BP='"+txtsysbp+"',Dystolic_BP='"+txtdysbp+"',Pulse_Pressure='"+txtpp+"',Cholestrol_Data='"+txtcho+"',Ldl='"+txtldl+"',Hdl='"+txthdl+"' where Email_ID='"+email+"'";
			// Statement st=con.createStatement();
			// st.executeUpdate(sql1);

			String data = email + txtfirstname + txtmiddlename + txtlastname
					+ bod + txtsysbp + txtdysbp + txtpp + txtcho + txtldl
					+ txthdl;
			//ChainConsensus.Consensus(data);
			ChainConsensus.ProofOfWork(data);
			HashGeneratorUtils generatorUtils=new HashGeneratorUtils();
			String hash=generatorUtils.generateSHA256(data);
			System.out.println("Data");
			Statement st0 = con.createStatement();
			String query1 = "select * from tblinfoinsuranceo where PatientEmail='"+ email + "'";
			System.out.println("Insurance Company:= "+query1);
			ResultSet rs1 = st0.executeQuery(query1);
			if(rs1.next()) {
				Insurance_Company = rs1.getString("Insurance_Company");
				System.out.println("Insurance Company Name:= "+Insurance_Company);
				Policy_Name = rs1.getString("Police_Name");
				System.out.println("Insurance Company Police_Name:= "+Policy_Name);
				Months = rs1.getString("Months");
				System.out.println("Insurance Company Months:= "+Months);
				Coverage_Msg = rs1.getString("Coverage_Msg");
				System.out.println("Insurance Company Coverage_Msg:= "+Coverage_Msg);
			}
			PreparedStatement p1;
			String sql = "insert into tblinfohospital(PatientEmail,Insurance_Company,Police_Name,Months,Coverage_Msg,Hospital_Email_ID) values(?,?,?,?,?,?)";   
			p1 = (PreparedStatement) con.prepareStatement(sql);
			p1.setString(1, email);
			p1.setString(2, Insurance_Company);
			p1.setString(3, Policy_Name);
			p1.setString(4, Months);
			p1.setString(5, Coverage_Msg);
			p1.setString(6, Hospitalemail);
			p1.executeUpdate();
			String txtdate = request.getParameter("txtdate");
			String txttime = request.getParameter("txttime");
			String currenttime = txtdate + " " + txttime;
			PreparedStatement p2;
			String sq2 = "insert into tblblockchain(Hospital_Email_ID,BlocKData,Current_Times) values(?,?,?)";
			p2 = (PreparedStatement) con.prepareStatement(sq2);
			p2.setString(1, Hospitalemail);
			p2.setString(2,hash);
			p2.setString(3, currenttime);
			p2.executeUpdate();

			PreparedStatement p20;
			String sq20 = "insert into tblmaster(Transcation_Hash,FromName,ToName,NonceData,PreViewHash,DiseaseFirst,DiseaseSecond,DiseaseThrees,DiseaseFour,DiseaseFive,DiseaseSix) values(?,?,?,?,?,?,?,?,?,?,?)";
			p20 = (PreparedStatement) con.prepareStatement(sq20);
			p20.setString(1, hash);
			p20.setString(2, Hospitalemail);
			p20.setString(3, email);
			p20.setString(4, String.valueOf(HashGeneratorUtils.nonce));
			p20.setString(5, Dbconn.PrevHash3);
			p20.setString(6, txtsysbp);
			p20.setString(7, txtdysbp);
			p20.setString(8, txtpp);
			p20.setString(9, txtcho);
			p20.setString(10, txtldl);
			p20.setString(11, txthdl);
			p20.executeUpdate();

			// /

			PreparedStatement p120;
			String sq120 = "insert into tblmasterpatientnew(First_Name,Middle_Name,Last_Name,Birth_Of_Date,DiseaseFirst,DiseaseSecond,DiseaseThrees,DiseaseFour,DiseaseFive,DiseaseSix,Email_ID,DateShow) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			p120 = (PreparedStatement) con.prepareStatement(sq120);
			p120.setString(1, txtfirstname);
			p120.setString(2, txtmiddlename);
			p120.setString(3, txtlastname);
			p120.setString(4, bod);
			p120.setString(5, txtsysbp);
			p120.setString(6, txtdysbp);
			p120.setString(7, txtpp);
			p120.setString(8, txtcho);
			p120.setString(9, txtldl);
			p120.setString(10, txthdl);
			p120.setString(11, email);
			p120.setString(12, currenttime);
			p120.executeUpdate();

		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}

		{
			pw.println("<script> alert('Update Profile Successfully');</script>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/H_ShowPatient.jsp");
			rd.include(request, response);
		}
	}
}
