package com.SupplyChain;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Dbconn;

@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("Order_ID");

        //Database connection information
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = Dbconn.conn();
            String updateQuery = "UPDATE tblorder SET Order_Status = 'Order Accepted' WHERE Order_ID = ?";
            ps = con.prepareStatement(updateQuery);
            ps.setString(1, orderId);  //Set the new string

            //Execute
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Order Status Updated Successfully to Order Accepted");
                response.sendRedirect("ViewOrders.jsp?accept"); //Back to view order
            } else {
                System.err.println("Error updating order status: No rows updated.");
                response.sendRedirect("ViewOrders.jsp?error=updateFailed");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error updating order status: " + e.getMessage());
            response.sendRedirect("ViewOrders.jsp?error=dbError");
            e.printStackTrace();
        } 
    }
}