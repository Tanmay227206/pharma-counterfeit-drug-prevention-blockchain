package com.med_tracking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.glxn.qrgen.exception.QRGenerationException;

import com.connection.*;
import com.google.zxing.EncodeHintType;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

@WebServlet("/Prescription")
public class Prescription extends HttpServlet {
	
	private String host;
	private String port;
	private String user;
	private String pass;
	
	private static final long serialVersionUID = 1L;

	@Override
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,IOException {
    	ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
		System.out.println("Hello");
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	HttpSession session = request.getSession(); 	
    	try{
    		long s_time=System.currentTimeMillis();
    		
    		String filePath = "E:\\NewWorkspace\\Healthcare_Blockchain_Application\\WebContent\\QRCode\\";
    		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
    		SimpleDateFormat form = new SimpleDateFormat("HH:mm:ss");
            Date date = new Date();            
            String createdate=dateFormat.format(date);
            String createtime=form.format(date);
            
            System.out.println("createdate:"+createdate);
			System.out.println("createtime:"+createtime);
            Map hintMap = new HashMap();
    		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
    		
    		int id = 0;
    		String temp_id = "OD202021";
    		Connection con = Dbconn.conn();
    		PreparedStatement ps11=con.prepareStatement("SELECT * FROM tblmedicine ORDER BY ID DESC LIMIT 1");
 			ResultSet rs11=ps11.executeQuery();
 			 if(rs11.next())
 			 {
 			    id=rs11.getInt("id");
 			 }
 			 int a = id+1;
 			 String OrderId = temp_id + a;
 			 System.out.println("Medicine OrderId is ="+OrderId);
 			
 			String Email_ID = session.getAttribute("Email_ID").toString();
 			String Hospitalname = session.getAttribute("Hospitalname").toString();
 			System.out.println("Hospital Name= "+Hospitalname);
    		String medname = request.getParameter("medname");
    		String submedname = request.getParameter("submedname");
    		String company=request.getParameter("company");
    		String quantity = request.getParameter("quantity");
    		//String data=TrackingId+ medname+ submedname+ company+ quantity;
    		
    		String data="Medicine Order id is: "+OrderId+"\n"+"Medicine Name is: "+medname+"\n"+"Sub Name is: "+submedname+"\n"+"Company Name is: "+company+" \n"+"Product Quntity: "+quantity+" \n"+"Product Cost: "+quantity;
    		System.out.println(data);
    		
    		 //OTPProtocol SendMail = new OTPProtocol();
             Statement st = con.createStatement();
             Statement stat = con.createStatement();

             ResultSet rs = st.executeQuery("select * from tblmedicine where OrderId='"+OrderId+"'");
          
             if(rs.next())
             {
                 response.sendRedirect("HSearch_Hospital.jsp?Exist=Exist");
             }else{
            	 
               //GF gf1=new GF();  
            	
            	 String files = filePath+"//"+OrderId+".png";
            	 QRCodeGenerator QR = new QRCodeGenerator();
            	 QR.createQRCode(data, files, hintMap, 200, 200);
            	 long e_time=System.currentTimeMillis();
            	 System.out.println("Start time : "+s_time);
            	 System.out.println("End time : "+e_time);
            	 long t_time=e_time-s_time;
            	 System.out.println("Total time  : "+t_time);
            	 System.out.println(files);
            	 //System.out.println("dddd"); TrackingId
            	 
                 int r = st.executeUpdate("insert into tblmedicine (OrderId,Email_ID,hospital,medname,submedname,company,quantity,createdate,createtime)"
                 		+ " values('"+OrderId+"','"+Email_ID+"','"+Hospitalname+"','"+medname+"','"+submedname+"','"+company+"','"+quantity+"','"+createdate+"','"+createtime+"')");
                 if(r>0){
                     
                	 //System.out.println("insert");
                 	//////////send mail   
                 }
                 response.sendRedirect("HospitalProfile.jsp?success=success"); 
             }
         } catch (Exception e) { e.getMessage();
                       e.printStackTrace();
         }finally{
    		out.close();	
    	}
	}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
