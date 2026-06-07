package com.SupplyChain;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;

@WebServlet("/AddMedicine")
public class AddMedicine extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddMedicine() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Retrieve parameters from the request
        String medicine = request.getParameter("medicine");
        String sub = request.getParameter("sub");
        String company = request.getParameter("company");
        String type = request.getParameter("type");
        String quantityStr = request.getParameter("quantity"); // Get as String first
        String priceStr = request.getParameter("price"); //Get string from database

        // Get pharmacy name from session
        HttpSession session = request.getSession();
        String pharmacyName = (String) session.getAttribute("Pharmacyname");

        // Validate data
        if (medicine == null || sub == null || company == null || type == null || quantityStr == null || priceStr == null
                || pharmacyName == null) {
            System.err.println("Missing required parameters in the request");
            response.sendRedirect("MedicineOrder.jsp?fail=missingParams");
            return;
        }

        //Parse the String and set them in the system

        try {
          //Now Parse The String and set the Double format from price, and parse Integer from quantity.
            int quantity = Integer.parseInt(quantityStr);
            double price = Double.parseDouble(priceStr);

            //Generate 1-8 chars.  Helps to prevent duplicate values.
            String orderId = generateRandomOrderId(6);

            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            String orderDate = df.format(new Date());

            Connection con = null;
            PreparedStatement psMedicine = null;
            PreparedStatement psOrder = null;

            try {
                //Connect
                con = Dbconn.conn();

                //Start the Insert Data into Medicine table
                String sqlMedicine = "INSERT INTO medicine (medicine, sub, company, type, quantity, price, username) VALUES (?, ?, ?, ?, ?, ?, ?)";
                psMedicine = con.prepareStatement(sqlMedicine);
                psMedicine.setString(1, medicine);
                psMedicine.setString(2, sub);
                psMedicine.setString(3, company);
                psMedicine.setString(4, type);
                psMedicine.setInt(5, quantity);
                psMedicine.setDouble(6, price);
                psMedicine.setString(7, pharmacyName);

                int medicineResult = psMedicine.executeUpdate(); //Insert to the database

                if(medicineResult > 0) {
                    //1.  Insert the Data into the tblorder, so a function exists.

                     String sqlOrder = "INSERT INTO tblorder (Order_ID, Order_Date, Pharmacy_Supplier, Medicines, Quantity, Total_Amount, Order_Status) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    psOrder = con.prepareStatement(sqlOrder);
                    psOrder.setString(1, orderId);
                    psOrder.setString(2, orderDate);
                    psOrder.setString(3, pharmacyName);
                    psOrder.setString(4, medicine);
                    psOrder.setString(5, String.valueOf(quantity));  // Convert Quantity
                    psOrder.setString(6, String.valueOf(price));  // Convert Price.
                    psOrder.setString(7, "Pending"); //Status

                      //Add more details.
                     int orderResult = psOrder.executeUpdate();

                    if(orderResult > 0) {
                         //Now if it is successfuly, reload to page
                        //con.commit();
                        response.sendRedirect("MedicineOrder.jsp?Add");

                    } else {
                        response.sendRedirect("MedicineOrder.jsp?fail");

                    }
                } else {
                  System.err.println("Error adding to medicine and/or tblorder");
                    response.sendRedirect("MedicineOrder.jsp?fail");
                }

            } catch (Exception e) {
                System.err.println("Error in servlet: " + e.getMessage());
                e.printStackTrace();

            }
            //Close the connection in the correct method
            finally {
                if (psMedicine != null) try { psMedicine.close(); } catch (SQLException e) {System.err.println("Could not close Medicine."); }
                if (psOrder != null) try { psOrder.close(); } catch (SQLException e) {System.err.println("Could not close porder.");}
                if (con != null) try { con.close(); } catch (SQLException e) {System.err.println("Could not close Connections.");}
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid number format for quantity or price: " + e.getMessage());
            response.sendRedirect("MedicineOrder.jsp?fail=invalidNumberFormat");
        }
    }

    private String generateRandomOrderId(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random rng = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(characters.charAt(rng.nextInt(characters.length())));
        }
        return sb.toString();
    }
}