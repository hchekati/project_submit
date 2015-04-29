<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Blank -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">
<%
if(session.getAttribute("role")==null || session.getAttribute("user")==null)
{
   RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp?ls=Session Expired");
   rd.forward(request,response);
}
else if(!(((String)session.getAttribute("role")).equals("admin")))
{
    RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp?ls=You are not authorised user");
    rd.forward(request,response);
}      
%>
</head>

<body>

    <div id="wrapper">

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                
                <a class="navbar-brand" href="AdminHome.jsp">olshop electronics</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                      admin@olshop.com <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="ChangePassword.jsp?role=admin"><i class="fa fa-user fa-fw"></i> Change password</a>
                        </li>
                        <li><a href="ChangeQuestion.jsp?role=admin"><i class="fa fa-gear fa-fw"></i> Change Security Question</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="LogoutAction.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

        </nav>
        <!-- /.navbar-static-top -->

        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    
                    <li>
                        <a href="AdminHome.jsp"><i class="fa fa-dashboard fa-fw"></i>  Home</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>  Products<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="ViewBrands.jsp?header=list">  Suppliers</a>
                            </li>
                            <li>
                                <a href="ViewCategories.jsp?header=list">  Category</a>
                            </li>
                            <li>
                                <a href="ViewItems.jsp?header=list">  Items</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i>  Inventory<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="ViewInventorybyBrand.jsp?header=list">  by Suppliers</a>
                            </li>
                            <li>
                                <a href="ViewInventorybyCategory.jsp?header=list">  by Category</a>
                            </li>
                            <li>
                                <a href="ViewInventorybyItem.jsp?header=list">  by Items</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="ViewQueries.jsp"><i class="fa fa-envelope fa-fw"></i> Customer Queries</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table fa-fw"></i>  Sales<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="UpdateCustomerOrder.jsp"><i class="fa fa-files-o fa-fw"></i> Orders</a>
                            </li>
                            <li>
                                <a href="ViewOrdersAdmin.jsp"><i class="fa fa-files-o fa-fw"></i> Date Wise Orders</a>
                            </li>
                            <li>
                                <a href="Report.jsp"><i class="fa fa-files-o fa-fw"></i> Sales Report</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    
                    
                <!-- /#side-menu -->
            </div>
            
            <!-- /.sidebar-collapse -->
        </nav>
        <!-- /.navbar-static-side -->
        </div>
    
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="bootstrap/js/jquery-1.10.2.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Blank -->

    <!-- SB Admin Scripts - Include with every page -->
    <script src="bootstrap/js/sb-admin.js"></script>

    <!-- Page-Level Demo Scripts - Blank - Use for reference -->

</body>

</html>
