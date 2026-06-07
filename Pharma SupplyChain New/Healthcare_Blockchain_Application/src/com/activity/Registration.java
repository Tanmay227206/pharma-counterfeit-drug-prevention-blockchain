package com.activity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import detailsregister.InsertInfo;
import detailsregister.User_details;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Registration() {
        super();
        // Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Auto-generated method stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        String name = request.getParameter("txtname");
        String emailid = request.getParameter("email");
        String mobile = request.getParameter("txtmobile");
        String password = request.getParameter("txtpwd");
        String address = request.getParameter("txtaddress");
        String gender = request.getParameter("gender");
        String roll = request.getParameter("roll");  // Get selected roll.
        User_details uid = new User_details();

        // Set user details object, and save all relevant credentials.
        uid.setUsername(name);
        uid.setemail(emailid);
        uid.setMonbileNo(mobile);
        uid.setpwd(password);
        uid.setAddr(address);
        uid.setgender(gender);
        uid.setMonbileNo(address); // Use a method in User_details to set this property

        int i = 0; //Database Response

        if (roll.equals("Patient")) {
            String hospital_name = request.getParameter("hospital_name");
            i = InsertInfo.insertPatient(uid, hospital_name);
        } else if (roll.equals("Hospital")) {
            i = InsertInfo.inserthospital(uid);
        } else if (roll.equals("Insurance")) {
            i = InsertInfo.insertInsurance(uid);
        } else if (roll.equals("Pharmacy")) {
            i = InsertInfo.insertPharmacy(uid);
        } else if (roll.equals("Supplier")) {
            i = InsertInfo.insertSupplier(uid);
        } else if (roll.equals("Wholesaler")) {
            i = InsertInfo.insertWholesaler(uid);
        }

        if (i != 0) {
            System.out.println("Data Inserted Successful ");
            pw.println("<script> alert('Register Successfully with Roll: " + roll + "');</script>"); //For a new account
            //response.sendRedirect("AdminHome.jsp?Insert");
            if (roll.equals("Patient")) {
                response.sendRedirect("index.jsp?insert");
             }
             else {
                 response.sendRedirect("AdminHome.jsp?Insert");
             }
        } else {
            pw.println("<script> alert('Registration Failed. Please try again.');</script>"); //For an existing account
            response.sendRedirect("SignUpPage2.jsp?fail");
            // pw.print(" Wrong ID and Password");
        }
    }
}
		