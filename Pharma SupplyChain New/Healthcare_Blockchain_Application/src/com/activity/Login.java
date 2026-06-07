package com.activity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import detailsregister.InsertInfo;
import detailsregister.User_details;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
        // Empty Contructor
    }

    public void init() {
        // Reset hit counter.
        // Not used in the login page
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Log Out
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        session.invalidate();

        out.println("<script type=\"text/javascript\">");
        out.println("alert('You are successfully logged out!');");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("/LoginPage.jsp");
        rd.include(request, response);
        out.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        System.out.println("Login Servlet");
        String emailid = request.getParameter("email");
        String Password = request.getParameter("password");
        String roll = request.getParameter("roll");
        String id = request.getParameter("id");
        System.out.println("Email-ID=>" + emailid);
        System.out.println("Password=>" + Password + "\tRoll:" + roll);
        String msg = "0";

        if (roll.equals("Patient")) {
            session.setAttribute("pemailid", emailid);
            session.setAttribute("emailid", emailid);
            msg = InsertInfo.searchPatient(emailid, Password);
            session.setAttribute("pname", InsertInfo.pname);
        }
        // NEW CODE: Handle Admin User - Static Admin
        else if (roll.equals("Admin") && emailid.equals("admin") && Password.equals("admin")) {
            //Hard Coded Password
            System.out.println("Admin Login");
            msg = "2";

        }
        // Hospital Lookup: 2
        else if (roll.equals("Hospital")) {
            msg = InsertInfo.searchHospital(emailid, Password);
            System.out.println("Email-ID=>" + emailid);
            session.setAttribute("Hospitalname", InsertInfo.Hospitalname);
        } //Pharmacy Lookup: 3
        else if (roll.equals("Pharmacy")) {
            msg = InsertInfo.searchPharmacy(emailid, Password);
            session.setAttribute("Pharmacyname", InsertInfo.Pharmacyname);
            //session.setAttribute("pid", InsertInfo.id);
        } // Supplier Lookup: 4
        else if (roll.equals("Supplier")) {
            msg = InsertInfo.searchSupplier(emailid, Password);
            session.setAttribute("Suppliername", InsertInfo.Suppliername);
        } // WholeSeller Lookup: 5
        else if (roll.equals("Wholesaler")) {
            msg = InsertInfo.searchWholesaler(emailid, Password);
            session.setAttribute("Wholersalername", InsertInfo.Wholersalername);
            //session.setAttribute("wid", InsertInfo.id);
        } // Insurance Lookup: 6
        else if (roll.equals("Insurance")) {
            msg = InsertInfo.searchInsurance(emailid, Password);
            session.setAttribute("Insurancename", InsertInfo.Insurancename);
        } else {
          System.out.println("InCorrect Roll Value: Did not Match any user, hospital, etc");
        }

        // Determine the correct action to redirect
        if (msg.equals("1")) {
            pw.println("<script> alert('Login Successfully Patient');</script>");
            response.sendRedirect("PatientProfile.jsp?Login");
            
        } else if (msg.equals("2")) {
            //HospitalProfile
            pw.println("<script> alert('Login Successfully Hospital Admin');</script>");
            response.sendRedirect("HospitalProfile.jsp?Login");
            
        } else if (msg.equals("3")) {
        	pw.println("<script> alert('Login Successfully Insurance');</script>");
            response.sendRedirect("InsuranceProfile.jsp?Login"); 
        } 
        else if (msg.equals("7")) {
            pw.println("<script> alert('Login Successfully Pharmacy');</script>");
            response.sendRedirect("PharmacyProfile.jsp?Login");
            
        } else if (msg.equals("8")) {
        	pw.println("<script> alert('Login Successfully Supplier');</script>");
            response.sendRedirect("SupplierProfile.jsp?Login");
            
        } else if (msg.equals("9")) {
        	pw.println("<script> alert('Login Successfully Wholesaler');</script>");
            response.sendRedirect("WholesellerProfile.jsp?Login");   
      
        } else {
            pw.println("<script> alert('Login Fail Try Again');</script>");
            response.sendRedirect("LoginPage.jsp?fail");
        }
    }
}