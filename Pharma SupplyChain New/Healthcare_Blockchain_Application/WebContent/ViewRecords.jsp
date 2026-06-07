<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <title> Healthcare </title>
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
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">Pharma SupplyCHain</a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item active">
            <a class="nav-link" href="./AdminHome.jsp">
              <i class="material-icons"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="./AdminHome.jsp">
              <i class="material-icons"></i>
              <p>Home Page</p>
            </a>
          </li>
          <!-- <li class="nav-item ">
            <a class="nav-link" href="./AssignDealer.jsp">
              <i class="material-icons"></i>
              <p>Assign Dealer</p>
            </a>
          </li> -->
          <li class="nav-item ">
            <a class="nav-link" href="./AddDealer.jsp">
              <i class="material-icons"></i>
              <p>Add Dealer</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="SignUpPage2.jsp">
              <i class="material-icons"></i>
              <p>SignUp Page</p>
            </a>
          </li>  
          <li class="nav-item active">
            <a class="nav-link" href="ViewRecords.jsp">
              <i class="material-icons"></i>
              <p>View Records</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="./index.jsp?logout">
              <i class="material-icons"></i>
              <p>Logout</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="#pablo">Dashboard</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <form class="navbar-form">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <button type="submit" class="btn btn-white btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="material-icons">dashboard</i>
                  <p class="d-lg-none d-md-block">
                    Stats
                  </p>
                </a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">notifications</i>
                  <span class="notification">5</span>
                  <p class="d-lg-none d-md-block">
                    Some Actions
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Mike John responded to your email</a>
                  <a class="dropdown-item" href="#">You have 5 new tasks</a>
                  <a class="dropdown-item" href="#">You're now friend with Andrew</a>
                  <a class="dropdown-item" href="#">Another Notification</a>
                  <a class="dropdown-item" href="#">Another One</a>
                </div>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <a class="dropdown-item" href="index.jsp?logout">Log out</a>
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
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <!-- <div class="card-icon">
                    <i class="material-icons">content_copy</i>
                  </div> -->
                  <p class="card-category">Used Space</p>
                  <h3 class="card-title">49/50
                    <small>GB</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">warning</i>
                    <a href="#pablo">Get More Space...</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                  <!-- <div class="card-icon">
                    <i class="material-icons">store</i>
                  </div> -->
                  <p class="card-category">Revenue</p>
                  <h3 class="card-title">$34,245</h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">date_range</i> Last 24 Hours
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-danger card-header-icon">
                  <!-- <div class="card-icon">
                    <i class="material-icons">info_outline</i>
                  </div> -->
                  <p class="card-category">Fixed Issues</p>
                  <h3 class="card-title">75</h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">local_offer</i> Tracked from Github
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-info card-header-icon">
                  <!-- <div class="card-icon">
                    <i class="fa fa-twitter"></i>
                  </div> -->
                  <p class="card-category">Followers</p>
                  <h3 class="card-title">+245</h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">update</i> Just Updated
                  </div>
                </div>
              </div>
            </div>
          </div>
         
         <!-- Pharmacy -->
          <div class="row">
            <div class="col-lg-12 col-md-12">
              <div class="card">
                <div class="card-header card-header-warning">
                  <h4 class="card-title">Available Pharma Records</h4>
                  <p class="card-category">Year: 2024-25</p>
                </div>
                <div class="card-body table-responsive">
                  <table class="table table-hover">
                    <thead class="text-warning">
                      <tr>
                      	<th><b>Id</b></th>
                        <th><b>Pharmacy Name</b></th>
						<th><b>Email Id</b></th>
						<th><b>Contact No.</b></th>
						<th><b>Address</b></th>
						<th><b>Status</b></th>
                      </tr>
                      <%
                        int srno=1;
	                    Connection con = Dbconn.conn();
	                  	PreparedStatement pst=con.prepareStatement("SELECT * FROM tblpharmacy where Status='Active'");
	                  	ResultSet rs=pst.executeQuery();
						while(rs.next())
						{
					  %>
                      <tr style="color:black">
                      <td align="center"><%=srno++ %></td>
                        <td><%=rs.getString("Name")%></td>
						<td><%=rs.getString("Email_IDs")%></td>
						<td><%=rs.getString("Mobile_No")%></td>
						<td><%=rs.getString("Address")%></td>
						<td><%=rs.getString("Status")%></td>
					<%
						}
					%>
					</tr></thead>
                  </table>
                  
                  <!-- Supplier --><br><br>
                  <div class="card-header card-header-warning">
                  <h4 class="card-title">Available Supplier Records</h4>
                  <p class="card-category">Year: 2024-25</p>
                </div>
                  <table class="table table-hover">
                    <thead class="text-warning">
                      <tr>
                      	<th><b>Id</b></th>
                        <th><b>Pharmacy Name</b></th>
						<th><b>Email Id</b></th>
						<th><b>Contact No.</b></th>
						<th><b>Address</b></th>
						<th><b>Status</b></th>
                      </tr>
                      <%
                        int srno1=1;
	                    Connection con1 = Dbconn.conn();
	                  	PreparedStatement ps1=con1.prepareStatement("SELECT * FROM tblsupplier where Status='Active'");
	                  	ResultSet rs1=ps1.executeQuery();
						while(rs1.next())
						{
					  %>
                      <tr style="color:black">
                      <td align="center"><%=srno1++ %></td>
                        <td><%=rs1.getString("Name")%></td>
						<td><%=rs1.getString("Email_IDs")%></td>
						<td><%=rs1.getString("Mobile_No")%></td>
						<td><%=rs1.getString("Address")%></td>
						<td><%=rs1.getString("Status")%></td>
						<%
						}
					%>
						<td>
						</td></tr></thead>
                  </table> 
                  
                  <!-- WholeSealer --><br><br>
                  <div class="card-header card-header-warning">
                  <h4 class="card-title">Available WholeSealer Records</h4>
                  <p class="card-category">Year: 2024-25</p>
                </div>
                  <table class="table table-hover">
                    <thead class="text-warning">
                      <tr>
                      	<th><b>Id</b></th>
                        <th><b>Pharmacy Name</b></th>
						<th><b>Email Id</b></th>
						<th><b>Contact No.</b></th>
						<th><b>Address</b></th>
						<th><b>Status</b></th>
                      </tr>
                      <%
                        int srno2=1;
	                    Connection con2 = Dbconn.conn();
	                  	PreparedStatement ps2=con2.prepareStatement("SELECT * FROM tblwholesaler where Status='Active'");
	                  	ResultSet rs2=ps2.executeQuery();
						while(rs2.next())
						{
					  %>
                      <tr style="color:black">
                      <td align="center"><%=srno2++ %></td>
                        <td><%=rs2.getString("Name")%></td>
						<td><%=rs2.getString("Email_IDs")%></td>
						<td><%=rs2.getString("Mobile_No")%></td>
						<td><%=rs2.getString("Address")%></td>
						<td><%=rs2.getString("Status")%></td>
						<%
						}
					%>
						<td>
						</td></tr></thead>
                  </table> 
                  
                  <!-- Insurance --><br><br>
                  <div class="card-header card-header-warning">
                  <h4 class="card-title">Available Insurance Records</h4>
                  <p class="card-category">Year: 2024-25</p>
                </div>
                  <table class="table table-hover">
                    <thead class="text-warning">
                      <tr>
                      	<th><b>Id</b></th>
                        <th><b>Insurance Name</b></th>
						<th><b>Email Id</b></th>
						<th><b>Contact No.</b></th>
						<th><b>Address</b></th>
						<th><b>Status</b></th>
                      </tr>
                      <%
                        int srno3=1;
	                    Connection con3 = Dbconn.conn();
	                  	PreparedStatement ps3=con3.prepareStatement("SELECT * FROM tblinsurance where Status='Active'");
	                  	ResultSet rs3=ps3.executeQuery();
						while(rs3.next())
						{
					  %>
                      <tr style="color:black">
                      <td align="center"><%=srno3++ %></td>
                        <td><%=rs3.getString("Name")%></td>
						<td><%=rs3.getString("Email_IDs")%></td>
						<td><%=rs3.getString("Mobile_No")%></td>
						<td><%=rs3.getString("Address")%></td>
						<td><%=rs3.getString("Status")%></td>
						<%
						}
					%>
						<td>
						</td></tr></thead>
                  </table> 
                  
                  <!-- Hospital --><br><br>
                  <div class="card-header card-header-warning">
                  <h4 class="card-title">Available Hospital Records</h4>
                  <p class="card-category">Year: 2024-25</p>
                </div>
                  <table class="table table-hover">
                    <thead class="text-warning">
                      <tr>
                      	<th><b>Id</b></th>
                        <th><b>Hospital Name</b></th>
						<th><b>Email Id</b></th>
						<th><b>Contact No.</b></th>
						<th><b>Address</b></th>
						<th><b>Status</b></th>
                      </tr>
                      <%
                        int srno4=1;
	                    //Connection con4 = Dbconn.conn();
	                  	PreparedStatement ps4=con1.prepareStatement("SELECT * FROM tblhospital where Status='Active'");
	                  	ResultSet rss=ps4.executeQuery();
						while(rss.next())
						{
					  %>
                      <tr style="color:black">
                      <td align="center"><%=srno4++ %></td>
                        <td><%=rss.getString("Name")%></td>
						<td><%=rss.getString("Email_IDs")%></td>
						<td><%=rss.getString("Mobile_No")%></td>
						<td><%=rss.getString("Address")%></td>
						<td><%=rss.getString("Status")%></td>
						<%
						}
					%>
					<td>
					</td></tr></thead>
                  </table> 
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
 
      <footer class="footer">
        <div class="container-fluid">
          <nav class="float-left">
            <ul>
              <li>
                <a href="#">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="#">
                  About Us
                </a>
              </li>
              <li>
                <a href="#">
                  Blog
                </a>
              </li>
              <li>
                <a href="#">
                  Licenses
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright float-right">
            &copy;
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="material-icons">favorite</i> by
            <a href="#" target="_blank">Creative Tim</a> for a better web.
          </div>
        </div>
      </footer>
    </div>
  </div>
 
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
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }

        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();

    });
  </script>
</body>
</html>
