<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>olshop</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

   
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">




<script language="javascript">
function validate()
{
   var temp = document.register;
   if(temp.fname.value=="" || temp.lname.value=="" || temp.bdate.value=="" || temp.loginname.value=="" || temp.password.value=="" || temp.sanswer.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   if(temp.ch.checked && temp.ownquest.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   return true;
}
function check()
{
    var form = document.register;
    if(!form.ch.checked){
          form.ownquest.disabled=true;
          form.squest.disabled=false;
    }
    else{
          form.ownquest.disabled=false;
          form.squest.disabled=true;
    }
}
</script>
  <script type="text/javascript" src="scripts/general.js"> </script>
   <script type="text/javascript" src="scripts/ts_picker.js"> </script>
</head>
<body>
<% System.out.println("in rg form"); %>
<div id="wrapper">
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                
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
            <div class="col-md-6 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Registration form -olshop</h3>
                    </div>
                    <div class="panel-body">
		

  <form id="form1" action="RegisterAction.jsp" method="post" name="register" onsubmit="return validate()" role="form">
					  
                    <%
					  if(request.getParameter("regs")!=null)
					  {
					%>
                  <font color="red"> <%=request.getParameter("regs")%>	</font>				
                    <%
					  }
					%>     
                 
                    <div class="form-group">
                                    <input class="form-control" placeholder="First Name" type="text" name="fname" autofocus >
                                </div>
                      <div class="form-group">
                                    <input class="form-control" placeholder="Last Name" type="text" name="lname" autofocus >
                                </div>
                                <!-- <div class="form-group">
                                   <p> <input class="form-control" placeholder="Birth Date" type="text" name="bdate" autofocus readonly="readonly"><a href="javascript:show_calendar('document.register.bdate', document.register.bdate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a>
                                </p> 
                                </div>-->
                                
                                
                                <div class="form-group">
                                    <input class="form-control" placeholder="Apt No#" type="text" name="hno" autofocus >
                                </div>
                       <div class="form-group">
                                    <input class="form-control" placeholder="Street Name..." type="text" name="street" autofocus >
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Enter City..." type="text" name="city" autofocus >
                                </div> 
                                                               <div class="form-group">
                                            <label>State</label>
                                            <select class="form-control" name="state">
                                                
                              <option>Tennessee</option>
                              <option>Texas</option>
                              <option>IOWA</option>
                              <option>New York</option>
                              <option>Missouri</option>
                              <option>Mississippi</option>
                              <option>Arkansas</option>
                              <option>Alabama</option>
                              <option>California</option>
                              <option>Utah</option>
                              <option>Washington</option>
                              <option>Delaware</option>
                                            </select>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>State</label>
                                            <select class="form-control" name="country">
                                                <option>United States</option>
                              
                                            </select>
                                        </div>
                                  <div class="form-group">
                                    <input class="form-control" placeholder="Zipcode" type="text" name="pincode" autofocus >
                                </div>     
                               
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mobile Number" type="text" name="phoneno" autofocus >
                                </div>
                                 <div class="form-group">
                                 <input class="form-control" placeholder="E-mail" type="email" autofocus name="email" >
                                    
                                </div>
                                
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username" type="text" name="loginname" autofocus >
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" id="password" autofocus >
                                </div>
                        <div class="form-group">
                                            <label>Security Question</label>
                                            <select class="form-control" name="squest">
                                                <option value="1">What is your favorite pastime?</option>
                              <option value="2">Who your childhood hero?</option>
                              <option value="3">What is the name of your first school?</option>
                              <option value="4">Where did you meet your spouse?</option>
                              <option value="5">What is your favorite sports team?</option>
                              <option value="6">What is your father's middle name?</option>
                              <option value="7">What was your high school mascot?</option>
                              <option value="8">What make was your first car or bike?</option>
                              <option value="9">What is your pet's name?</option>
                              
                                            </select>
                                        </div>
                                        <div class="form-group">
                                    <input class="form-control" placeholder="Answer" name="sanswer" autofocus >
                                </div>
                                        <div class="form-group">
                                        <input name="Input" type="submit" value="Register" class="btn btn-success"/>
                                        <a href="LoginForm.jsp" class="btn btn-primary">Already Member- Sign In</a>
                        </div>
                          
                         
					
				</form>
                

				
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
