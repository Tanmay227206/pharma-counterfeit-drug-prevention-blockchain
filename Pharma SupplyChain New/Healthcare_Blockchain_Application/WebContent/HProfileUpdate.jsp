<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.util.Date"%>
    <%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="com.connection.Dbconn"%>
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
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
      <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">Pharma SupplyChain</a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
           <li class="nav-item active  ">
            <a class="nav-link" href="HospitalProfile.jsp"><p>Dashboard</p></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="H_ShowPatient.jsp"><p>User Profile</p></a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="Search_Hospital.jsp"><p>User Profile Search</p></a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="showblockchain.jsp"><p>Show Block Chain</p></a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
           <% String Hospitalname=(String)session.getAttribute("Hospitalname"); %>
           Welcome To <a style="color: red;" class="navbar-brand" href="#"><%=Hospitalname %></a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">  
            <ul class="navbar-nav">                        
              <li class="nav-item dropdown">
                <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block"> Account</p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="Login">Log out</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">Create Block Chain</h4>
                  <p class="card-category">Complete your profile</p>
                </div>
                
                <%
                String id=request.getParameter("Checkbox");//(String)session.getAttribute("pemailid");
                //String pname=(String)session.getAttribute("pname");
                String email="";
                String fname="",mname="",lname="",bod="";
               
                Connection con = Dbconn.conn();
                Statement st = con.createStatement();
                Statement st1 = con.createStatement();
				String query1 = "select * from tblregister where ID_Patient='"+ id + "'";
				ResultSet rs1 = st.executeQuery(query1);
				if(rs1.next()) 
				{
					email=rs1.getString("Email_IDs");
					String query01 = "select * from tblmasterpatient where Email_ID='"+ email + "'";
					ResultSet rs = st1.executeQuery(query01);
					if(rs.next()) 
					{
						fname=rs.getString("First_Name");
						mname=rs.getString("Middle_Name");
						lname=rs.getString("Last_Name");
						bod=rs.getString("Birth_Of_Date");	
					}
				}
                
                %>
                <div class="card-body">
                  <form action="hpatientprofileupdate" method="post">
                    <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email address</label>
                          <input type="text" class="form-control" name="email" value="<%=email %>"  readonly="readonly">
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                        <% 
                        Date day=new Date();
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        String date = simpleDateFormat.format(new Date());
                        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("HH:mm:ss");
                        String time = simpleDateFormat1.format(new Date());
                        %>
                          <label class="bmd-label-floating">Current Date</label>
                          <input type="text" class="form-control" required="required" value="<%=date %>" name="txtdate" readonly="readonly" >
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                         <label class="bmd-label-floating">Current Time</label>
                          <input type="text" class="form-control" required="required" value="<%=time %>" name="txttime" readonly="readonly">
                        </div>
                      </div>
                    </div>
                     <label class="bmd-label-floating" style="color: purple;"> Full Name</label>
                    <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label class="bmd-label-floating">First Name</label>
                          <input type="text" class="form-control" required="required" value="<%=fname %>" name="txtfirstname" required>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">Middle Name</label>
                          <input type="text" class="form-control" required="required" value="<%=mname %>" name="txtmiddlename" required>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Last Name</label>
                          <input type="text" class="form-control" required="required" value="<%=lname %>" name="txtlastname" required>
                        </div>
                      </div>
                    </div>
                    <label class="bmd-label-floating" style="color: purple;"> Birth Date</label>
                    <div class="row">
                     <div class="col-md-4">
                      
                        <div class="form-group">
                          <label class="bmd-label-floating">Birth Date</label>
                          <input type="date" class="form-control" required="required" value="<%=bod %>" name="txtdd" required>
                        </div>
                      </div>
                    
                    </div>
                     <label class="bmd-label-floating" style="color: purple;"> Information</label>
                    <div class="row">
                     <div class="col-md-4">
                      
                        <div class="form-group">
                          <label class="bmd-label-floating">Disease First</label>
                          <input type="text" class="form-control" name="txtsysbp">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Disease Second</label>
                          <input type="text" class="form-control" name="txtdysbp">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Disease Threes</label>
                          <input type="text" class="form-control" name="txtpp">
                        </div>
                      </div>
                                     
                    </div>
                    
                    <label class="bmd-label-floating" style="color: purple;">Information</label>
                    <div class="row">
                     <div class="col-md-4">
                      
                        <div class="form-group">
                          <label class="bmd-label-floating">Disease Four</label>
                          <input type="text" class="form-control" name="txtcho">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Disease Five</label>
                          <input type="text" class="form-control" name="txtldl">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Disease Six</label>
                          <input type="text" class="form-control" name="txthdl">
                        </div>
                      </div>
                                     
                    </div>
                    
                    
                 <input type="submit" name="submit" class="btn btn-primary pull-left" value="Transaction">
                   
                    <div class="clearfix"></div>
                  </form>
                </div>
              </div>
            </div>
           
          </div>
        </div>
      </div>
      </div>
  </div>
   <script src="assets/js/core/jquery.min.js"></script>
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="assets/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="assets/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="assets/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="assets/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="assets/js/plugins/arrive.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/material-dashboard.js?v=2.1.1" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="assets/demo/demo.js"></script>
  </body>

</html>
