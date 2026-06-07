package com.SupplyChain;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;

@WebServlet("/BuyMedicine")
public class BuyMedicine extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BuyMedicine() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cust_name = request.getParameter("cust_name");
        String medId = request.getParameter("id");
        String medicine = request.getParameter("medicine");
        String company = request.getParameter("company");
        String quantityStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price");

        //Convert string to integer to make data valid.
        int quantity = 0;
        double price = 0.0;
        try {
            quantity = Integer.parseInt(quantityStr);
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            System.err.println("Error parsing quantity or price: " + e.getMessage());
            response.sendRedirect("MedicineCustBill.jsp?error=invalidData");
            return;  // Exit to prevent further processing
        }

        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date dateobj = new Date();
        String bDate = df.format(dateobj);

        Connection con = null;
        PreparedStatement psInsert = null;
        PreparedStatement psUpdate = null;

        try {
        	con = Dbconn.conn();
            //Disable auto commit to perform transaction management
            con.setAutoCommit(false);

            // 1. Insert into booked_medicine
            String insertQuery = "INSERT INTO booked_medicine (med_id, cust_name, medicine, company, quantity, price, bill_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            psInsert = con.prepareStatement(insertQuery);

            //Preparing a cleaner data:
            psInsert.setString(1, medId);
            psInsert.setString(2, cust_name);
            psInsert.setString(3, medicine);
            psInsert.setString(4, company);
            psInsert.setInt(5, quantity);
            psInsert.setDouble(6, price);
            psInsert.setString(7, bDate);
            psInsert.setString(8, "AddCart");

            int insertResult = psInsert.executeUpdate();

            // Check and run
            if (insertResult > 0) {

                // 2. Update Medicine Quantity in the medicine table
                String updateQuery = "UPDATE medicine SET quantity = quantity - ? WHERE id = ?";
                psUpdate = con.prepareStatement(updateQuery);
                psUpdate.setInt(1, quantity);
                psUpdate.setString(2, medId);

                //Check and run
                int updateResult = psUpdate.executeUpdate();

                if (updateResult > 0) {
                    con.commit(); // Successful: Commit the transaction
                    response.sendRedirect("MedicineCustBill.jsp?add&cust_name=" + cust_name);
                    System.out.println("Transacion success");
                } else {
                    con.rollback();  //Failed update; rollback
                    System.err.println("Medicine Stock UPDATE Failed for medicine Id: " + medId);
                    response.sendRedirect("MedicineStock.jsp?error=stockUpdateFailed");
                }
            } else {
                con.rollback();
                System.err.println("Booked Medicine INSERT Failed for medicine id: " + medId);
                response.sendRedirect("MedicineStock.jsp?error=bookingFailed");
            }

        } catch (ClassNotFoundException | SQLException e) {
            try {
                if (con != null) con.rollback();  //Rollback the transaction if it fails to add
            } catch (SQLException ex) {
                System.err.println("Rollback failed: " + ex.getMessage());
            }
            System.err.println("Exception in BuyMedicine Servlet: " + e.getMessage());
            response.sendRedirect("MedicineStock.jsp?error=exception");
            e.printStackTrace();
        } 
    }
}