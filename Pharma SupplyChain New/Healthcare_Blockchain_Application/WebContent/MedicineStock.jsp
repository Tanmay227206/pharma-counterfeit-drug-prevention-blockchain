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
if(request.getParameter("Add")!=null){
	   out.println("<script>alert('Stock updated Successful.......!');</script>"); 
	}
if(request.getParameter("Update")!=null){
	   out.println("<script>alert('Record updated Successful.......!');</script>"); 
	}
%>
<body class="">
    <div class="wrapper ">

        <!-- Sidebar -->
        <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
            <div class="logo">
                <a href="#" class="simple-text logo-normal">
                    WholeSeller Section
                </a>
                <div align="center"><img src="images/Med.jpg" width="70%" height="60%"></div>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
					<li class="nav-item active"><a class="nav-link"
						href="https://www.hindustantimes.com/lifestyle/health/health-news-live-updates-today-january-17-2025-101737077421686.html"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="PharmacyProfile.jsp"> <i class="material-icons">Profile</i>
							<p>Pharmacy Profile</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="AddMedicineStock.jsp"> <i class="material-icons">Medicine</i>
							<p>Add Medicine Stock</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="MedicineStock.jsp"> <i class="material-icons">Medicine</i>
							<p>Medicines Stock</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="MedicineOrder.jsp"> <i class="material-icons">Order</i>
							<p>Place Medicine Order</p>
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
                        <% String Pharmacyname = (String) session.getAttribute("Pharmacyname"); %>
                        Welcome To <a style="color: red;" class="navbar-brand" href="#"><%=Pharmacyname %> Pharmacy</a>
                    </div>
                    <div class="collapse navbar-collapse justify-content-end">
                    	<ul class="navbar-nav">
						  <li class="nav-item dropdown">
						    <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						      <i class="fa fa-commenting" aria-hidden="true"></i>  <!-- Chatbot Icon -->
						      <p class="d-lg-none d-md-block">Account</p>
						    </a>
						    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
						      <div class="dropdown-divider"></div>
						      <a class="dropdown-item" href="MedicineOrder.jsp">ChatBot</a>
						    </div>
						  </li>
						</ul>
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
			                  <h3 class="card-title"><b>Medicines Stock</b></h3>
			                  <p class="card-category"><b>Manage your Pharmacy Inventory</b></p>		              
			                     </div>	
			                     	<div align="right">
		                                <form action="MedicineStock.jsp" method="get">
									       <input type="text" name="search" style="color:black;font-family:verdana;font-size:100%;width:150px;height:27px;text-algin:right;" required/>
									              <button type="submit" class="btn btn-default btn">Search</button>
								   		</form>
								   		</div>
		                                <div>
		                                    <h2 align="center"><b>Available Medicines Stock</b></h2>
										<br>
										<div align="center">
										<table border="1px" cellpadding="15px" cellspacing="15px" >
										<tr>
											<th>Sr.No.</th>
											<th>Medicine Name</th>
											<th>Sub Name</th>
											<th>Company</th>
											<th>Medicine Type</th>
											<th>Quantity</th>
											<th>Price</th>
											<th>Action</th>
										</tr>
									<%
									int srno=1;
									//String prescription_for = session.getAttribute("prescription_for").toString();
									HttpSession session2=request.getSession();
									Connection con = Dbconn.conn();
									if(request.getParameter("search")!=null){
									 	String search = request.getParameter("search");
									  	System.out.println("Search Query:= "+search);
									  	
									  	PreparedStatement ps= con.prepareStatement("select * from medicine where medicine='"+search+"'");
										ResultSet rs=ps.executeQuery();
										if(rs.next())
										{
											//System.out.println("prescription_for:=="+ prescription_for);
											//System.out.println("Medicine==="+rs.getString("medicine"));
											session.setAttribute("medicine", rs.getString("medicine"));
											//session.setAttribute("prescription_for", prescription_for);
											String id = rs.getString("id");
										//}
										%>
										<form action="BuyMedicine" method="post">
										<tr align="center">
											<td><%=srno++ %>
											<input type="hidden" name="id" value="<%=id%>"></td>
											<td><input type="text" style="width:115px;height:28px;" name="cust_name" Placeholder="Enter cust_name" required></td>
											<td><input type="text" style="width:99px;height:28px;" name="medicine" value="<%=rs.getString("medicine") %>"></td>
											<td><input type="text" style="width:99px;height:28px;" name="sub" value="<%=rs.getString("sub") %>"></td>
											<td><input type="text" style="width:99px;height:28px;" name="company" value="<%=rs.getString("company") %>"></td>
											<td><input type="text" style="width:80px;height:28px;" name="quantity" value="<%=rs.getString("quantity") %>"></td>
											<td><i class="fa fa-inr" style="font-size:14px">
											<input type="text" style="width:80px;height:28px;" name="price" value="<%=rs.getString("price") %>"></i></td>
											<td><input type="submit" value="Add to Cart"></td>
										</tr>
										</form>
									<%
										}
									}
									%>
									</table>
									<br>
									<table border="1px" cellpadding="15px" cellspacing="15px" >
										<tr>
											<th>Sr.No.</th>
											<th>Medicine Name</th>
											<th>Sub Name</th>
											<th>Company</th>
											<th>Medicine Type</th>
											<th>Quantity</th>
											<th>Price</th>
											<th>Added By</th>
											<th>Action</th>
										</tr>
									<%
									PreparedStatement ps1 = con.prepareStatement("select * from medicine");
									ResultSet rs1 = ps1.executeQuery();
									while(rs1.next())
									{
										%>
									
										<tr align="center">
												<td><%=srno++ %></td>
												<td><%=rs1.getString("medicine") %></td>
												<td><%=rs1.getString("sub") %></td>
												<td><%=rs1.getString("company") %></td>
												<td><%=rs1.getString("type") %></td>
												<td><%=rs1.getString("quantity") %></td>
												<td><i class="fa fa-inr" style="font-size:14px">&nbsp;<%=rs1.getString("price") %></i></td>
												<td><%=rs1.getString("username") %></td>
												<td><a href="UpdateMedicine.jsp?medicine=<%=rs1.getString("medicine") %>" class="btn btn-info btn">
		          									<span class="glyphicon glyphicon-arrow-up"></span> Update</a></td>
											<%
												}
											%>
										</tr>
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