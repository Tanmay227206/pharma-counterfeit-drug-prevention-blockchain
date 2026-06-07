package com.med_tracking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.*;

@WebServlet("/AddDealer")
public class AddDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection con=null;
	String firstname,lastname,email,pswd,id,dob,gender,mobile,query,doj,msg;
	Connection gc=null;
	PreparedStatement pst;
	//EmailSending es=null;
	ResultSet rs=null;
	int count=0;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			con = Dbconn.conn();
			//es=new EmailSending();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		firstname=request.getParameter("firstname");
		lastname=request.getParameter("lastname");
		email=request.getParameter("email");
		dob=request.getParameter("dob");
		gender=request.getParameter("gender");
		mobile=request.getParameter("mobile");
		pswd=PasswordGenrator.skKeyGenerate();
		System.out.println("Password is:="+pswd);
		DateFormat df=new SimpleDateFormat("dd/MM/yyyy");
		doj=df.format(new Date());
		
		query="select * from tbldealer where email like '"+email+"' and mobile like '"+mobile+"'";
		try {
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			if(rs.next())
			{
				response.sendRedirect("AddDealer.jsp?Result=available");		
			}
			else
			{
				query="INSERT INTO tbldealer (firstName,lastName,email,mobile,gender,dob,pswd) VALUES ('"+firstname+"','"+lastname+"','"+email+"','"+mobile+"','"+gender+"','"+dob+"','"+pswd+"')";
			    //System.out.println(query);
				pst=con.prepareStatement(query);
				count=pst.executeUpdate();
				if(count==1)
				{
					String abc = "8908";
		            String msgC ="hello "+firstname+",\nYour registration completed by shop owner.\n Your email : "+email+" \nPassword is : "+pswd;
		            String myURL = "http://sms.wecreatead.com/API/WebSMS/Http/v1.0a/index.php";
		            //SMS sms=new SMS();
		            //sms.callURL(myURL,msgC,mobile);
		            response.sendRedirect("SupplierProfile.jsp?Result=Done");
				}
				else
				{
					response.sendRedirect("AddDealer.jsp?Result=fail");	
				}	
			}
		} catch (SQLException e) {
			System.out.println(e);
		}	
	}
}
