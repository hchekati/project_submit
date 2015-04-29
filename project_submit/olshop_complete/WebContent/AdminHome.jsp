<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    

    <!-- Custom CSS for the '4 Col Portfolio' Template -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">
    

    <title>olshop</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">

</head>



<body>
<jsp:include page="AdminSidebar.jsp"/>

           <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                

		<jsp:include page="Adminoptions.jsp"/> 
	
		
	
	<div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Welcome
                    <small><%
    if (request.getParameter("msg") == null) {%>
    	
    <%} else {%>
    	<font color="red"><%= request.getParameter("msg") %></font>, olshop electronics
   <% }
%></small>
                </h1>
            </div>

        </div>
 <div class="row">

            <div class="col-md-3 portfolio-item">
                <a href="#S">
                    <img class="img-responsive" src="images/apple.png">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/samsung.jpeg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/lenovo.jpg">
                </a>
            </div>

            

        </div>
<br>
 <div class="row">

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/microsoft.png">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/asus.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/dell.jpg">
                </a>
            </div>

            

        </div>
<br>
 <div class="row">

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/hp.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/htc.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/intel.jpg">
                </a>
            </div>

            

        </div>
<br>
        <div class="row">

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/lenovo.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/logitech.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/asus.jpg">
                </a>
            </div>

            

        </div>
<br>
        <div class="row">

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/panasonic.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/philips.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/seagate.jpg">
                </a>
            </div>

            

        </div>
<br>
        <div class="row">

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/sony.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/toshiba.jpg">
                </a>
            </div>

            <div class="col-md-3 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="images/wdpassport.jpg">
                </a>
            </div>

            
        </div>
</div>
</div>
</div>
</div>

<!-- Core Scripts - Include with every page -->
    <script src="bootstrap/js/jquery-1.10.2.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Forms -->

    <!-- SB Admin Scripts - Include with every page -->
    <script src="bootstrap/js/sb-admin.js"></script>

    <!-- Page-Level Demo Scripts - Forms - Use for reference -->
</body>
</html>
