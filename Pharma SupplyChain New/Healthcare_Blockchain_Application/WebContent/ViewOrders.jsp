<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Healthcare</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
    <link href="assets/demo/demo.css" rel="stylesheet" />

    <!-- Custom Styles -->
    <style>
       .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            display: flex; /* Make card a flex container */
            flex-direction: column; /* Stack content vertically */
            height: 100%; /* Ensure all cards are the same height */
        }
        .card-header {
            background-color: #f44336;
            color: white;
            text-align: center;
            padding: 12px;
        }
        .card-body {
            padding: 15px;
            flex-grow: 1; /* Allow the body to take up remaining space */
            display: flex;
            flex-direction: column;
        }
        .table {
            width: 100%;
            margin-bottom: 0;
        }
        .table th,
        .table td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .table th {
            background-color: #f2f2f2;
        }
        .center-content {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<%
if(request.getParameter("accept")!=null){
	   out.println("<script>alert('Order Accepted......!');</script>"); 
	}
%>
<body class="">
  <div class="wrapper ">
    <!-- Sidebar -->
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
      <div class="logo">
        <a href="WholesellerProfile.jsp" class="simple-text logo-normal">
          WholeSeller Section
        </a><div align="center"><img src="images/Med.jpg" width="70%" height="60%"></div>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item active">
            <a class="nav-link" href="WholesellerProfile.jsp">
              <i class="material-icons"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="WholesellerProfile.jsp">
              <i class="material-icons"></i>
              <p>Wholesealer Profile</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="ViewOrders.jsp">
              <i class="material-icons"></i>
              <p>View Orders</p>
            </a>
          </li>
        </ul>
      </div>
    </div>

    <!-- Main Panel -->
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <% String Wholersalername=(String)session.getAttribute("Wholersalername"); %>
            Welcome To <a style="color: red;" class="navbar-brand" href="#"><%=Wholersalername %> WholeSeller</a>
          </div>
          <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
              <li class="nav-item dropdown">
                <a class="nav-link" href="#" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="index.jsp?logout">Log out</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <!-- Content Section -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary"><br>
                  <h3 class="card-title"><b>Medicine Orders</b></h3>
                  <p class="card-category"><b>From Pharmacies and Suppliers</b></p>
                </div>
                <div class="card-body table-responsive">
                  <table class="table table-hover">
                    <thead class="text-warning">
                      <tr>
                        <th><b>Order ID</b></th>
                        <th><b>Order Date</b></th>
                        <th><b>Pharmacy/Supplier</b></th>
                        <th><b>Medicines</b></th>
                        <th><b>Quantity</b></th>
                        <th><b>Total Amount</b></th>
                        <th><b>Status</b></th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        Connection con = Dbconn.conn();
                        String query = "SELECT * FROM tblorder"; //All order names
                        PreparedStatement pst = con.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();

                        while (rs.next()) {
                       %>
                      <tr style="color:black">
                        <td><%= rs.getString("Order_ID") %></td>
                        <td><%= rs.getString("Order_Date") %></td>
                        <td><%= rs.getString("Pharmacy_Supplier") %></td>
                        <td><%= rs.getString("Medicines") %></td>
                        <td><%= rs.getString("Quantity") %></td>
                        <td><%= rs.getString("Total_Amount") %></td>
                        
                        <% String orderStatus = rs.getString("Order_Status"); %>
                        		<% if (orderStatus.equals("Pending")) { // Check Order_Status		
					        %>
		          				<td class="center-content">
		          					<form method="post" action="UpdateOrderStatus">
		          						<input type="hidden" name="Order_ID" value="<%= rs.getString("Order_ID") %>"/>
		          						<button type="submit" class="btn btn-info btn">
		          						<span class="glyphicon glyphicon-shopping-cart"></span>Accept Order</button>
		          					</form>
		          				</td>
						<%} else {%>
		         			<td class="center-content"><b>Order Accepted</b></td> 
						<%}%>
                      </tr>
                       <%
                        	}
                        %>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <footer class="footer">
        <div class="container-fluid">
          <div class="copyright float-right">
            ©
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="material-icons">favorite</i> by Healthcare.
          </div>
        </div>
      </footer>
    </div>
  </div>

  <!-- JavaScript Libraries -->
  <script src="assets/js/core/jquery.min.js"></script>
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script src="assets/js/plugins/moment.min.js"></script>
  <script src="assets/js/plugins/sweetalert2.js"></script>
  <script src="assets/js/plugins/jquery.validate.min.js"></script>
  <script src="assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <script src="assets/js/plugins/bootstrap-selectpicker.js"></script>
  <script src="assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <script src="assets/js/plugins/jquery.dataTables.min.js"></script>
  <script src="assets/js/plugins/bootstrap-tagsinput.js"></script>
  <script src="assets/js/plugins/jasny-bootstrap.min.js"></script>
  <script src="assets/js/plugins/fullcalendar.min.js"></script>
  <script src="assets/js/plugins/jquery-jvectormap.js"></script>
  <script src="assets/js/plugins/nouislider.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <script src="assets/js/plugins/arrive.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <script src="assets/js/plugins/chartist.min.js"></script>
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <script src="assets/js/material-dashboard.js?v=2.1.1" type="text/javascript"></script>
  <script src="assets/demo/demo.js"></script>
</body>
</html>