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

import com.connection.*;

@WebServlet("/VerifyOtp")
public class VerifyOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	public void init(ServletConfig config) throws ServletException {

		try {
			con = Dbconn.conn();
		} catch (Exception e) {
			System.out.println("Exe:" + e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		//String TrackingID = (String) session.getAttribute("TrackingID");
		String total_product = (String) session.getAttribute("total_product");
		
		String otpm=session.getAttribute("otpm").toString();
		//String email=session.getAttribute("email").toString();
		String TrackingID=session.getAttribute("TrackingID").toString();
		String otpe=request.getParameter("otpe");
		System.out.println("OYPE: "+otpe+" OTPM: "+otpm+" TrackingID: "+TrackingID);
		if(otpe.equals(otpm))

		//String otp = request.getParameter("otp");

		try {
			PreparedStatement ps = con.prepareStatement("select otp from tblshipproduct where TrackingID='" + TrackingID + "' and otp='" + otpe + "'");
			//PreparedStatement ps = con.prepareStatement(qur);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				String qur1 = "update tblshipproduct set payment='Done', status='Delivered' where TrackingID='" + TrackingID
						+ "'";
				PreparedStatement ps1 = con.prepareStatement(qur1);
				ps1.executeUpdate();

				String qur2 = "update tbltracking set status='Delivered' where TrackingID='" + TrackingID
						+ "'";
				PreparedStatement ps2 = con.prepareStatement(qur2);
				ps2.executeUpdate();

				response.sendRedirect("DealerHome.jsp?deliver=product");
			}

			else {
				response.sendRedirect("DeliveryOTP.jsp?wrong=otp");
			}
		} catch (Exception e) {
			System.out.println("exe:" + e);
		}
	}
}
