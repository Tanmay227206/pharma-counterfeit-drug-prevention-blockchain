<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.*"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Pharma Chat System</title>
    <link href="assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
	<link rel="stylesheet" type="text/css"
		href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<link href="assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
	<link href="assets/demo/demo.css" rel="stylesheet" />
    <style>
        .chat-container { max-width: 800px; margin: auto; padding: 20px; background: #fff; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1);}
        .chat-messages { height: 800px; overflow-y: scroll; padding: 10px; border: 1px solid #ddd;}
        .message { padding: 10px; margin-bottom: 10px; border-radius: 5px; max-width: 70%; word-wrap: break-word;}
        .user { background-color: #dcf8c6; align-self: flex-end; }
        .other { background-color: #f0f0f0; align-self: flex-start; }
        .chat-input { width: 100%; padding: 10px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; }
        .chat-button { background: #007bff; color: white; padding: 10px; border-radius: 5px; cursor: pointer; }
    	.message.user {
            background-color: #dcf8c6;
            /* Light green for user messages */
            text-align: left;
            margin-left: auto; /* Align to the right */
            width: fit-content; /* Adjust width to content */
            max-width: 70%; /* Prevent message from taking up the whole width */
        }

        .message.other {
            background-color: #f0f0f0;
            /* Light gray for other user messages */
            text-align: right;
            margin-right: 340px; /* Align to the left */
            width: fit-content;
            max-width: 70%;
        }
    </style>
</head>
<body>
    <div class="wrapper ">

        <!-- Sidebar -->
        <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
            <div class="logo">
                <a href="#" class="simple-text logo-normal">
                    Pharmacy Section
                </a>
                <div align="center"><img src="images/Chatbot.png" width="80%" height="90%"></div>
            </div>
            <div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item active"><a class="nav-link"
						href="https://www.hindustantimes.com/lifestyle/health/health-news-live-updates-today-january-17-2025-101737077421686.html"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
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
                    	<%
	                    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                        Calendar cal = Calendar.getInstance();
	                        String date = sdf.format(new Date());
                    	%>
                    	<% String Wholersalername=(String)session.getAttribute("Wholersalername"); %>
						Welcome To <a style="color: red;" class="navbar-brand" href="#"><%=Wholersalername %>&nbsp;WholeSeller</a>
                        <% String Pharmacyname = request.getParameter("Pharmacyname"); %>
                    </div>
                     <div class="navbar-wrapper">
                    
                    </div>
                     <div class="collapse navbar-collapse justify-content-end">
               		<ul class="navbar-nav">
							<li class="nav-item dropdown"><a class="nav-link"
								href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="material-icons">person</i>
									<p class="d-lg-none d-md-block">Account</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownProfile">
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="Login">Log out</a>
								</div></li>
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
                                <div class="card-header card-header-primary">
                                    <h3 class="card-title" align="center"><b>Chat with Pharmacist</b></h3>
                                    <p class="card-category" align="center"><b>Communicate with your Pharmacist</b></p>
                                </div>
                                    <div class="card-body">
                                    <div class="chat-container">
									<!-- <h5 class="align-item-center" align="center" style="font-size: 30px; color: red;" > -->
										<h3 align="center"><b>Chat Between <%= session.getAttribute("Wholersalername") %> 
									    	& Pharmacist - <%= request.getParameter("Pharmacyname") %></b></h3>
		                                  <div class="chat-messages" id="chatMessages">
		                                    
		                                <div class="chat-container">

			                            <h5><b>Chat with Pharmacist <u>Mrs.<%=Pharmacyname%></u></b></h5>
			                            
			                            <div class="chat-container">
										<%
											Connection con = Dbconn.conn();
								            String pid = request.getParameter("pid");
								            Wholersalername = session.getAttribute("Wholersalername").toString();
								            Pharmacyname = request.getParameter("Pharmacyname");
								
								            int wid = 0; 
								            PreparedStatement pst = con.prepareStatement("SELECT id FROM tblwholesaler WHERE Name=?");
								            pst.setString(1, Wholersalername);
								            ResultSet rs = pst.executeQuery();
								            if (rs.next()) { wid = rs.getInt("id"); }
								
								            PreparedStatement chatStmt1 = con.prepareStatement("SELECT receiver, message, timestamp FROM tblchat1 WHERE pid='"+pid+"' AND wid='"+wid+"' ORDER BY timestamp ASC");
								            //System.out.println("Message= "+ chatStmt);
								            //chatStmt.setInt(1, wid);
								            //chatStmt.setInt(2, Integer.parseInt(pid));
								            ResultSet chatRs1 = chatStmt1.executeQuery();
										%>
									    <!-- Chat Input Form -->
									    <%-- <form id="chatForm">
									        <input type="hidden" name="pid" value="<%= pid %>">
									        <input type="hidden" name="wid" value="<%= wid %>">
									        <input type="hidden" name="Wholersalername" value="<%= Wholersalername %>">
									        <input type="hidden" name="Pharmacyname" value="<%= Pharmacyname %>">
									        <input type="text" name="message" id="message" class="chat-input" placeholder="Type your message..." required>
									        <button type="submit" class="chat-button">Send</button>
									    </form> --%>
									    
										<form id="chatForm" style="display: flex; align-items: center; gap: 10px;">
										    <input type="hidden" name="pid" value="<%= pid %>">
										    <input type="hidden" name="wid" value="<%= wid %>">
										    <input type="hidden" name="Wholersalername" value="<%= Wholersalername %>">
										    <input type="hidden" name="Pharmacyname" value="<%= Pharmacyname %>">
										    <input type="text" name="message" id="message" class="chat-input" placeholder="Type your message..." required style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
										    <button type="submit" class="chat-button" style="padding: 10px 15px; background: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">Send</button>
										</form>
									
									    <!-- Chat Messages Section (Now Below Input) -->
									    <div class="chat-messages" id="chatMessages">
									        <% 
									            while (chatRs1.next()) {
									            	String receiver = chatRs1.getString("receiver");
									                String message = chatRs1.getString("message");
									                String timestamp = chatRs1.getString("timestamp");
									        %>
									            <div class="message user <%= receiver.equals(Wholersalername) ? "user" : "other" %>">
									                <strong><b><%= receiver %>:</b></strong> <%= message %>
									                <span style="font-size: small; color: gray;"><%= timestamp %></span>
									            </div>
									        <% }
										        PreparedStatement chatStmt = con.prepareStatement("SELECT sender, message, timestamp FROM tblchat WHERE wid='"+wid+"' AND pid='"+pid+"' ORDER BY timestamp ASC");
								                //System.out.println("Message= "+ chatStmt);
								            	ResultSet chatRs = chatStmt.executeQuery();
								            	while (chatRs.next()) {
									                String sender = chatRs.getString("sender");
									                String message = chatRs.getString("message");
									                String timestamp = chatRs.getString("timestamp");
									        %>
									        
									        	<div class="message other <%= sender.equals(Pharmacyname) ? "user" : "other" %>">
									                <strong><b><%= sender %>:</b></strong> <%= message %>
									                <span style="font-size: small; color: gray;"><%= timestamp %></span>
									            </div>
									    	<% } %>
									    </div>
									</div>
		                        </div>
		                    </div>
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
    $(document).ready(function() {
        function refreshChat() {
            $("#chatMessages").load(window.location.href + " #chatMessages");
        }
        //setInterval(refreshChat, 3000);

        $("#chatForm").submit(function(e) {
            e.preventDefault();
            $.ajax({
                url: "SendMessage2.jsp",
                type: "POST",
                data: $(this).serialize(),
                success: function(response) {
                    $("#message").val("");
                    //refreshChat();
                }
            });
        });
    });
</script>
</body>
</html>