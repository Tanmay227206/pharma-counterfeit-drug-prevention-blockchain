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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>    

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
            flex-grow: 1; 
            display: flex;
            flex-direction: column;
        }
        table {
            border-collapse: collapse; 
            width: 90%;
            border-radius: 10px;     
            overflow: hidden; 
            margin-bottom: 0;      
        }
        th, td {
            text-align: left;
            padding: 8px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        thead {
            background-color: #333;
            color: black;
        }        
        .center-content {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        /* Styles to hide elements during printing */
        @media print {
            body * {
                visibility: hidden !important; 
            }
            #MedicineBill, #MedicineBill * {
                visibility: visible !important;  
            }
            #MedicineBill {
                position: absolute;
                left: 0 !important;
                top: 0 !important;
            }
        }
    </style>
</head>
<%
if(request.getParameter("add")!=null){
	   out.println("<script>alert('Add to Cart Medicine Successful.......!');</script>"); 
	}
%>
<body class="">
    <div class="wrapper ">

        <!-- Sidebar -->
        <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
            <div class="logo">
                <a href="WholesellerProfile.jsp" class="simple-text logo-normal">
                    WholeSeller Section
                </a>
                <div align="center"><img src="images/Med.jpg" width="70%" height="60%"></div>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
					<li class="nav-item active"><a class="nav-link"
						href="PharmacyHome.jsp"> <i class="material-icons">dashboard</i>
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
                                <a class="nav-link" href="#" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">person</i>
                                    <p class="d-lg-none d-md-block">
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
			                  <h3 class="card-title"><b>Medicines Stock</b></h3>
			                  <p class="card-category"><b>Manage your Pharmacy Inventory</b></p>		              
			                     </div>	
		                           <div>
		                              <h3 align="center"><b>Added in to Cart and Bill</b></h3>
									<br>
									<div align="center">
									<%
										String cust_name = request.getParameter("cust_name");
										Connection con = Dbconn.conn();
									%>
									<button onclick="printForm()">Print Form</button>
                					<button onclick="generatePDF()">Download PDF</button>
									<div id="MedicineBill">							
									<table>
										<thead>
										<tr>
											<th>Sr.No.</th>
											<th>Customer Name</th>
											<th>Medicine Name</th>
											<th>Company</th>
											<th>Bill Date</th>
											<th>Quantity</th>
											<th>Price</th>
											<th>Action</th>
										</tr>
										</thead>
											<%
												int srno = 1;
												PreparedStatement ps = con
														.prepareStatement("select * from booked_medicine where cust_name='" + cust_name + "'");
												System.out.println("PS=" + ps);
												String quantity = "";
												String price = "";
												int total = 0;
												double totalPrice = 0;
												ResultSet rs = ps.executeQuery();
												while (rs.next()) {
													System.out.println("prescription_for:=-" + cust_name);
													quantity = rs.getString("quantity");
													price = rs.getString("price");
													int q = Integer.parseInt(quantity);
													double p = Double.parseDouble(price); 
													total = (int) (q * p); 
											%>
											<tbody>
											<tr align="center">
												<td><%=srno++ %></td>
												<td><%=rs.getString("cust_name") %></td>
												<td><%=rs.getString("medicine") %></td>
												<td><%=rs.getString("company") %></td>
												<td><%=rs.getString("bill_date") %></td>
												<td><%=q %></td>
												
												<td><i class="fa fa-inr" style="font-size:14px"> <%=total %>.00</i></td>
												
												<td><a href="DeleteMedicine?med_id=<%=rs.getString("med_id")%>" class="btn btn-info btn">
		          									<span class="ace-icon fa fa-trash-o bigger-120"></span> Delete</a></td>
											<%
												totalPrice=totalPrice+total;
												}
											%>
										</tr>
										<tr>
											<td colspan="6" style="text-align:right"><b>Total Amount:</b></td>
											<td style="width:15%"><i class="fa fa-inr" style="font-size:14px"> <%=totalPrice %></i></td>
											<td></td>
										</tr>
										</tbody>
									</table>
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
  <script>
    function printForm() {
        window.print(); // Trigger the browser's print functionality
    }

    function generatePDF() {
        // Get the customer name from session attribute
        var cust_name = "<%= request.getParameter("cust_name") != null ? request.getParameter("cust_name") : "Unknown" %>";

        if (!cust_name || cust_name.trim() === "") {
            alert("Customer name is missing!");
            cust_name = "Unknown"; // Fallback to prevent empty filename
        }

        const { jsPDF } = window.jspdf;
        const elementHTML = document.getElementById('MedicineBill'); // Get the form content
        const filename = `MedicineBill_${cust_name}.pdf`; // Ensure customer name appears in filename

        html2canvas(elementHTML, {
            scale: 2,  // Improve quality
            useCORS: true // Handle cross-origin images
        }).then(canvas => {
            const pdf = new jsPDF('p', 'pt', 'a4');
            const imgData = canvas.toDataURL('image/png');

            const imgWidth = 595; // A4 width in px
            const imgHeight = (canvas.height * imgWidth) / canvas.width;

            pdf.addImage(imgData, 'PNG', 0, 20, imgWidth, imgHeight);
            pdf.save(filename); // Save PDF with correct name
        }).catch(error => {
            console.error("Error generating PDF:", error);
            alert("Error while generating PDF. Please try again!");
        });
    }
</script>

</body>
</html>
