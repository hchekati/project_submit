<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>olshop - login</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">
<script language="javascript">

function validate()
{
   if(document.login.username.value=="" || document.login.password.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
</script>
</head>

<body>

<div id="wrapper">
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    
                </button>
                <a class="navbar-brand" href="LoginForm.jsp">olshop electronics</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            <li>
            <a href="LoginForm.jsp">Sign In</a>
            </li>
            <li>
            <a href="Registerform.jsp" class="btn btn-success btn-xs">New User - Sign Up for olshop</a>
            </li>
            
            
            </ul>
            </nav>
           
    <div class="container">
    
        <div class="row">
        
            <div class="col-md-4 col-md-offset-4">
           
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In to olshop electronics</h3>
                    </div>
                    <div class="panel-body">
                    <div align="center">
                    <img src="images/logo.jpg"></div>
                        <form id="form1" method="post" action="LoginAction.jsp" name="login" onsubmit="return validate()">
                           
                            
                    <%
					  if(request.getParameter("ls")!=null)
					  {
					%>
                   <font color="green">  <%=request.getParameter("ls")%>		</font>			
                    <%
					  }
					%> 
                                <div class="form-group">
                                    
                                    <input class="form-control" placeholder="username" id="inputtext1" type="text" name="username" value="" autofocus />
                                </div>
                                <div class="form-group">
                                    <input id="inputtext2" class="form-control" placeholder="Password" name="password" type="password" value="" autofocus>
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                
                                <button id="inputsubmit1" type="submit" name="inputsubmit1" value="Sign In" type="button" class="btn btn-primary">Sign In</button>
                              <a href="Registerform.jsp" class="btn btn-success">New User - Sign Up for olshop</a>
                          
                        </form>
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
