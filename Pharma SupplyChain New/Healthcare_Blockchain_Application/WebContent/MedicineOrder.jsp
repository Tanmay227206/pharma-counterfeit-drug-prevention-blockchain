<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <title>Pharma SupplyChain</title>

    <!-- Fonts and Material Icons -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

    <!-- Material Dashboard CSS -->
    <link href="assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
    <link href="assets/demo/demo.css" rel="stylesheet" />

    <!-- Materialize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
        }

        .card {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.16), 0 2px 10px rgba(0, 0, 0, 0.12);
            border-radius: 4px;
            overflow: hidden;
        }

        .card-header {
            background-color: #007bff; /* Material Blue */
            color: white;
            padding: 20px;
            text-align: center;
            font-weight: 500;
            font-size: 1.5rem;
        }

        .card-content {
            padding: 20px;
        }

        .card-category {
            color: #999;
            font-size: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Form Styling */
        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        /* Button Styles */
        .button {
            background-color: #26a69a; /* Teal accent */
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.16), 0 2px 10px rgba(0, 0, 0, 0.12); /* Shadow */
        }

        .button:hover {
            background-color: #2bbbad; /* A bit lighter teal on hover */
        }

        /* Responsive Design (Optional) */
        @media (max-width: 600px) {
            .card-container {
                padding: 10px;
            }
            .col-md-6 {
                width: 100%;
            }
        }
    </style>
</head>
<%
if(request.getParameter("Add")!=null){
	   out.println("<script>alert('Order Placed Successful.......!');</script>"); 
	}
%>
<body class="">
    <div class="wrapper ">

        <!-- Sidebar -->
        <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
            <div class="logo">
                <a href="#" class="simple-text logo-normal">
                    Pharmacy Section
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
					<li class="nav-item "><a class="nav-link"
						href="MedicineStock.jsp"> <i class="material-icons">Medicine</i>
							<p>Medicines Stock</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="MedicineStock.jsp"> <i class="material-icons">Order</i>
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
                                <div class="card-header">
                                    <h3 class="card-title"><b>Order Medicine Stock</b></h3>
                                    <p class="card-category"><b>Manage your Pharmacy Inventory</b></p>
                                </div>
                                <div class="card-content">
                                    <form action="AddMedicine" name="ureg" method="post">
                                        <table class="table">
                                            <tr>
                                                <td><b>Medicine Name :</b></td>
                                                <td><input type="text" class="form-control" name="medicine" required></td>
                                                <td><b>Sub Name :</b></td>
                                                <td><input type="text" class="form-control" name="sub" required></td>
                                            </tr>
                                            <tr>
                                                <td><b>Company :</b></td>
                                                <td><input type="text" class="form-control" name="company" required></td>
                                                <td><b>Type :</b></td>
                                                <td><input type="text" class="form-control" name="type" required></td>
                                            </tr>
                                            <tr>
                                                <td><b>Quantity :</b></td>
                                                <td><input type="text" class="form-control" name="quantity" maxlength="2" required></td>
                                                <td><b>Price Approx :</b></td>
                                                <td><input type="text" class="form-control" name="price" required></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>Products Required on the Basis of :</b></td>
                                                <td colspan="2"><select name="roll" style="width:62%">
													<option selected="selected">------------------ Select Product ------------------</option>
													<option value="Daily">Daily Basis</option>
													<option value="Seasonable">Seasonable Basis</option>
													<option value="Pendamic">Pendamic Basis</option>
												</select></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <button type="submit" class="button"><b>Add</b></button></td>
                                                <td colspan="2" align="center">
                                                    <button type="reset" class="button"><b>Reset</b></button></td>
                                            </tr>
                                        </table>
                                    </form>
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
                        </script>, made with <i class="material-icons">favorite</i> by Healthcare
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <!-- Core JavaScript Files -->
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap-material-design.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

    <!-- Materialize JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems);
        });
    </script>

</body>
</html>