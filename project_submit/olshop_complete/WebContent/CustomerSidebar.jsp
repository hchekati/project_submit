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
else if(!(((String)session.getAttribute("role")).equals("customer")))
{
    RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp?ls=You are not authorised user");
    rd.forward(request,response);
}      
%>
<script language="JavaScript" src="scripts/mm_menu.js"></script>
<script language="JavaScript1.2">mmLoadMenus();</script>
</head>

<body>

    <div id="wrapper">

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                
                <a color="red" class="navbar-brand" href="CustomerHome.jsp">olshop electronics</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <%=session.getAttribute("user")%>@olshop.com  <i class="fa fa-caret-down"></i>
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
                        <a href="CustomerHome.jsp"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Products<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="userViewBrands.jsp?header=view"> Brands</a>
                            </li>
                            <li>
                                <a href="userViewCategories.jsp?header=view"> Category</a>
                            </li>
                            <li>
                                <a href="userViewItems.jsp?header=view"> Items</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i>  Buy<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                        <li>
                                <a href="searchgrid.jsp"><i class="fa fa-search fa-fw"></i> Search Items</a>
                            </li>
                            <li>
                                <a href="searchgrid1.jsp"><i class="fa fa-search fa-fw"></i> Search</a>
                            </li>
                            
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit fa-fw"></i> Queries<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="Queries.jsp"><i class="fa fa-edit fa-fw"></i> Send</a>
                            </li>
                            <li>
                                <a href="ViewQueryStatus.jsp"><i class="fa fa-comment fa-fw"></i> View</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="ViewCart.jsp"><i class="fa fa-upload fa-fw"></i>View Cart</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-tasks fa-fw"></i> Orders<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="CustomerOrderStatus.jsp"> All Orders</a>
                            </li>
                            <li>
                                <a href="ViewOrdersByDate.jsp"> Orders by Date</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                   
                </ul>
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
