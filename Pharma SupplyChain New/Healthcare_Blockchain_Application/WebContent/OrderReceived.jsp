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
if(request.getParameter("Done")!=null){
   out.println("<script>alert('Admin Login Successfully...');</script>"); 
	}
if(request.getParameter("Insert")!=null){
	   out.println("<script>alert('Records Inserted Successfully...');</script>"); 
	}
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);

String booked=request.getParameter("ship");
if(booked!=null){
	out.print("<script>alert('Product Conform Successfully..!!')</script>");
}
%>
<body class="">
    <div class="wrapper ">

        <!-- Sidebar -->
        <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
            <div class="logo">
				<a href="SupplierProfile.jsp" class="simple-text logo-normal">
					Pharma SupplyChain </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item active"><a class="nav-link"
						href="SupplierProfile.jsp"> <i class="material-icons">Dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="SupplierProfile.jsp"> <i class="material-icons">Profile</i>
							<p>Supplier Profile</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="OrderReceived.jsp"> <i class="material-icons">Orders</i>
							<p>Medicine Orders</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="AssignDealer.jsp"> <i class="material-icons">Dealer</i>
							<p>Assign Dealer</p>
					</a></li>
				</ul>
            </div>
        </div>

        <!-- Main Panel -->
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <% String Suppliername = (String) session.getAttribute("Suppliername"); %>
                        Welcome To <a style="color: red;" class="navbar-brand" href="#"><%=Suppliername %> Supplier</a>
                    </div>
                    <div class="collapse navbar-collapse justify-content-end">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="#" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">person</i>
                                    <p class="d-lg-none d-md-block">Account</p>
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
			                  <h3 class="card-title"><b>Medicines Order</b></h3>
			                  <p class="card-category"><b>Manage your Medicine Order Inventory</b></p>		              
			                     </div>	
			                     	<div align="right">
		                            <%
					                	int id=1;
					                 	Connection con = Dbconn.conn();
					            		PreparedStatement pst=con.prepareStatement("SELECT * FROM tblmedicine where cost='0'");
					            		ResultSet rs=pst.executeQuery();
					            		boolean hasRecords = false; // Flag to indicate if there are any records
					                %>
					               
					                  <table class="table table-hover">
					                    <thead class="text-warning">
					                    <tr>
					                    	<th>ID</th>
					                      	<td>Shipment</td>
					                      	<th>Cost</th>
					                      	<th>Medicine Name</th>
					                      	<th>Medicine Sub Name</th>
					                      	<th>Company name</th>
					                      	<th>Medicine Quantity</th>
					                      	<th>Order Date</th>
					                        <th>Action</th>
					                        <th>.</th>
					                        <th>.</th>
					                    </tr>
					                    </thead>
					                    <%
											while(rs.next())
											{
												hasRecords = true;  // There are records now.
										%>
					                    <tbody>
					                       <form action="ShipProduct" method="post">
					                      <tr>
					                      	<td><%=id++ %></td>
					                      	<td align="center"><input type="checkbox" name="shipment" value="<%=rs.getString("id")%>" required></td>
					                        <td><input type ="text" name="cost" id="cost" required>
					                        	<input type="hidden" name="Email_ID" value="<%=rs.getString("Email_ID")%>">
					                        	<input type="hidden" name="hospital" value="<%=rs.getString("hospital")%>"></td>
					                        <td><%=rs.getString("medname")%></td>
											<td><%=rs.getString("submedname")%></td>
											<td><%=rs.getString("company")%></td>
											<td><%=rs.getString("quantity")%> Nos.
												<input type="hidden" name="quantity" value="<%=rs.getString("quantity")%>"></td>
											<td><%=rs.getString("createdate")%></td>
											<td><button type="submit">Ship Product</button></td>
					                      </tr>
					                      </form>
					                    </tbody>
					                  <%
											}
										%>
										</table>
										<%
                                        	if (!hasRecords) { // If there are no records
                                        %>
                                        	<h3 align="center">No Product is pending</h3>
                                        <%
                                        }
                                        %>
					                </div>
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