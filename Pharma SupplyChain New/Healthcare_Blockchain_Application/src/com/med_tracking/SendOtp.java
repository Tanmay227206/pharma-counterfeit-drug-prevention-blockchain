package com.med_tracking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.EmailAttachmentSender;
import com.connection.*;


@WebServlet("/SendOtp")
public class SendOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	String mobile="";

	public void init(ServletConfig config) throws ServletException {
	
		try {
			con = Dbconn.conn();
		} catch (Exception e) {
			System.out.println("Exe:"+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String Email_ID=request.getParameter("Email_ID");
		String total_product=request.getParameter("total_product");
		String cost=request.getParameter("cost");
		String status=request.getParameter("status");
		String dealername=request.getParameter("dealername");
		String TrackingID=request.getParameter("TrackingID");
		System.out.println("TrackingID= "+TrackingID);
		
		try {
			String qur="select *from tblshipproduct where TrackingID='"+TrackingID+"'";
			PreparedStatement ps=con.prepareStatement(qur);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				//GlobalFunction gf=new GlobalFunction();
				//Email_ID = gf.getMailId(Email_ID);
				//mobile=gf.getMobNo(Mobile_No);
				
				int randomPin   =(int)(Math.random()*9000)+1000;
				String otpe  =String.valueOf(randomPin);
				System.out.println("otpe is:"+otpe);
				
				com.connection.EmailAttachmentSender sendmail= new com.connection.EmailAttachmentSender();
				String Sub="OTP For Authentcation";
				String Msg="Hello '"+TrackingID+"' for login please use OTP for login is:"+otpe;
				session.setAttribute("otpm", otpe);
				System.out.println("To email "+Email_ID);
				sendmail.EmailSending(Email_ID, Sub, Msg);				
				
				System.out.println("Send message");
				
				
				String qur1="update tblshipproduct set otp='"+otpe+"' where TrackingID='"+TrackingID+"'";
				PreparedStatement ps1=con.prepareStatement(qur1);
				//System.out.println("Ps "+ps1);
				int ir=ps1.executeUpdate();
				if(ir>0)
				{
					System.out.println("Update Done");
				}
				else
				{
					System.out.println("Update Fail");
				}
				
				session.setAttribute("otpm", otpe);
				session.setAttribute("TrackingID",TrackingID);
				session.setAttribute("total_product",total_product);
				response.sendRedirect("DeliveryOTP.jsp");
			}
			else{
				response.sendRedirect("MedicineDelivery.jsp?wrong=pid");
			}
		} catch (Exception e) {
			System.out.println("Exe:"+e);
		}	
	}
}
