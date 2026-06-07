package com.med_tracking;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.glxn.qrgen.image.ImageType;
import com.connection.*;

@WebServlet("/ShipProduct")
public class ShipProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	String a[];
	String aa[];
	int i = 0;
	int totalAmount = 0;
	//int ptotal = 0;
	String smedname, ssubmedname, scompany, squantity, screatedate = "";
	int pid = 0;
	String email = "";

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
		String uid = (String) session.getAttribute("id");
		String firstname = (String) session.getAttribute("firstname");

		String cost = request.getParameter("cost");
		System.out.println("Cost:="+cost);
		
		String shipment = "";
		a = request.getParameterValues("shipment");
		for (i = 0; i < a.length; i++) {

			shipment += a[i] + " ";
			System.out.println(a[i]);
			System.out.println(i + 1);
			//ptotal = i + 1;
			try {
				String hospital = "", Email_ID = "";
				String qur = "select * from tblmedicine where id='"+a[i]+"'";
				System.out.println(qur);
				PreparedStatement ps = con.prepareStatement(qur);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {					
					Email_ID = rs.getString("Email_ID");
					hospital = rs.getString("hospital");
					String medname = rs.getString("medname");
					String submedname = rs.getString("submedname");
					String company = rs.getString("company");
					String quantity = rs.getString("quantity");
					String createdate = rs.getString("createdate");
					System.out.println(Email_ID+"."+hospital);
					String qur1 = "UPDATE tblmedicine SET cost='" + cost + "' where id='" + a[i] + "'";
					
					System.out.println(qur1);
					PreparedStatement ps1 = con.prepareStatement(qur1);
					ps1.executeUpdate();

					String q = "select sum(cost) from tblmedicine where id='" + a[i] + "'";
					System.out.println(q);
					PreparedStatement pst = con.prepareStatement(q);
					ResultSet rst = pst.executeQuery();
					if (rst.next()) {
						totalAmount = rst.getInt(1);

						System.out.println("kk is:" + totalAmount);
					}
				}

				System.out.println("Cost is:" + cost);

			} catch (Exception e) {
				System.out.println(e);
			}
		}

		try {
			int id = 0;
    		String temp_id = "CH202021";
    		PreparedStatement ps11=con.prepareStatement("SELECT * FROM tblshipproduct ORDER BY ID DESC LIMIT 1");
 			ResultSet rs11=ps11.executeQuery();
 			 if(rs11.next())
 			 {
 			    id=rs11.getInt("id");
 			 }
 			 int a = id+1;
 			 String TrackingId = temp_id + a;
 			 System.out.println("Medicine TrackingId is ="+TrackingId);
 			 
 			String Email_ID = request.getParameter("Email_ID");
			String hospital = request.getParameter("hospital");
			String quantity = request.getParameter("quantity");
			String query = "insert into tblshipproduct(TrackingId,Email_ID,hospitalname,total_product,cost) values('"+TrackingId+"',"
					+ "'" + Email_ID + "','" + hospital + "','" + quantity + "','" + totalAmount + "')";
			//System.out.println(query);
			PreparedStatement ps2 = con.prepareStatement(query);
			ps2.executeUpdate();
			
			//shipment = "";
			aa = request.getParameterValues("shipment");
			for (i = 0; i < aa.length; i++) {
				shipment += aa[i] + " ";
			String qur1 = "update tblmedicine set TrackingId='"+TrackingId+"' where id='" +aa[i]+"'";
			PreparedStatement ps1 = con.prepareStatement(qur1);
			ps1.executeUpdate();
			}
			String qur3 = "select *from tblshipproduct where TrackingId='"+TrackingId+"'and Email_ID='" + Email_ID + "' and total_product='"+quantity+"' and cost='"+totalAmount+"'";
			//System.out.println(qur3);
			PreparedStatement ps3 = con.prepareStatement(qur3);
			ResultSet rs3 = ps3.executeQuery();
			if (rs3.next()) {
				TrackingId = rs3.getString("TrackingId");
				Email_ID = rs3.getString("Email_ID");
				String tproduct = rs3.getString("total_product");
				String tcost = rs3.getString("cost");
				//String payment = rs3.getString("payment");

				String AllProductData = "Product TrackingId is: " + TrackingId + "\n" + "User Name is: " + Email_ID + "\n"
						+ "Total Product  is: " + tproduct + "\n" + "Tolat Cost is: " + tcost; 
						/*+ " \n"
						+ "Product Status : " + payment;*/

				System.out.println(AllProductData);

				ByteArrayOutputStream out = net.glxn.qrgen.QRCode.from(AllProductData).to(ImageType.PNG).stream();

				try {

					String filename = TrackingId + " " + ".png";
					FileOutputStream fout = new FileOutputStream(new File("D:\\Shopping\\" + filename));

					fout.write(out.toByteArray());

					fout.flush();
					fout.close();

					GlobalFunction gf = new GlobalFunction();
					email = gf.getMailId(Email_ID);

					String host = "smtp.gmail.com";
					String port = "465";
					String mailFrom = "college2021project@gmail.com";
					String password = "Ritesh1432";

					// message info
					String mailTo = email;
					String subject = "New email with attachments";
					String message = "I have some attachments for you.";

					// attachments
					String[] attachFiles = new String[1];
					attachFiles[0] = "D:\\Shopping\\" + filename;

					EmailAttachmentSender emailAttachmentSender = new EmailAttachmentSender();

					emailAttachmentSender.sendEmailWithAttachments(host, port, password, mailTo, subject, message,
							attachFiles);
					System.out.println("Send Email");

					response.sendRedirect("AssignDealer.jsp?ship=product");

				} catch (FileNotFoundException ex) {

					ex.printStackTrace();
					System.out.println("Exe:" + ex);
				}

			}

		} catch (Exception e) {
			System.out.println("Exe:" + e);
		}
	}
}
