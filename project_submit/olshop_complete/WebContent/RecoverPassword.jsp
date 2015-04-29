<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>olshop</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">




<script language="javascript">
function validateQues()
{
   var temp = document.recover;
   if(temp.username.value=="" ||  temp.sanswer.value=="")
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
function validate()
{
   if(document.login.username.value=="" || document.login.password.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
function check()
{
    var form = document.recover;
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

<div id="menu">
	<ul>
		<jsp:include page="Generaloptions.html"/> 
	</ul>
</div>
<div id="wrapper">
	<div id="col-one">
		<div class="boxed">
			<h2 class="title">Login</h2>
			<div class="content">
				<form id="form1" method="post" action="LoginAction.jsp" onsubmit="return validate()" name="login">
					<fieldset>
					<legend>Sign-In</legend>
                    <div align="center">
                    <%
					  if(request.getParameter("ls")!=null)
					  {
					%>
                    <span class="style2"><%=request.getParameter("ls")%>					</span>
                    <%
					  }
					%>     
                                   </div>
                    <label for="inputtext1">Username:</label>
					<input id="inputtext1" type="text" name="username" value="" class="textfield" />
					<label for="inputtext2">Password:</label>
					<input id="inputtext2" type="password" name="password" value="" class="textfield" />
					<input id="inputsubmit1" type="submit" name="inputsubmit1" value="Sign In" class="button" />
					<p class="tiny"><a href="RecoverPassword.jsp">Forgot your password?</a></p>
					<p class="tiny">&nbsp;</p>
					<p class="tiny"><a href="Registerform.jsp">New User Sign Up !...</a></p>
				  </fieldset>
				</form>
			</div>
		</div>
		<div class="boxed">
			<h2 class="title"> Search</h2>
	  <div class="content">
				
					<fieldset>
					<legend>Search</legend>
				<!--	<jsp:include page="Search.jsp"/>  -->
				  </fieldset>
				
			</div>
		</div>
		
	</div>
	<div id="col-two">
		<div class="boxed">
			<h2 class="title">Welcome to CSM</h2>
	  <div class="content">
				<p><img src="images/it-31.jpg"/></p>
		  </div>
		</div>
		<div class="boxed">
			<h2 class="title">Recover password</h2>
	  		

  <form action="RecoverPasswordAction.jsp" method="post" name="recover" onsubmit="return validateQues()" ><fieldset>
					  <div align="center">
                    <%
					  if(request.getParameter("status")!=null)
					  {
					%>
                    <span class="style2"><%=request.getParameter("status")%>					</span>
                    <%
					  }
					%>     
                    </div>
                    <br />
                    <table border="0">
                      <tr>
                        <td><span class="style3">Login Name </span></td>
                        <td><input type="text" name="username" />                        </td>
                      </tr>
                      <tr>
                        <td><span class="style3">Secret Question</span></td>
                        <td><select name="squest">
                            <option value="1">What is your favorite pastime?</option>
                            <option value="2">Who was your childhood hero?</option>
                            <option value="3">What was the name of your first school?</option>
                            <option value="4">Where did you meet your spouse?</option>
                            <option value="5">What is your favorite sports team?</option>
                            <option value="6">What is your father's middle name?</option>
                            <option value="7">What was your high school mascot?</option>
                            <option value="8">What make was your first car or bike?</option>
                            <option value="9">What is your pet's name?</option>
                        </select></td>
                      </tr>
                      <tr>
                        <td colspan="2"><span class="style3">
                        <input type="checkbox" name="ch" value="1" onclick="check(recover)" />
                        Own Question </span></td>
                      </tr>
                      <tr>
                        <td><span class="style3">Own Question </span></td>
                        <td><input type="text" name="ownquest" disabled="disabled" />                        </td>
                      </tr>
                      <tr>
                        <td><span class="style3">Secret Answer </span></td>
                        <td><input name="sanswer" type="text" /></td>
                      </tr>
                      <tr>
                        <td colspan="2"><div align="center">
                            <div align="center">
                          <input name="Input" type="submit" value="Recover" />
                          &nbsp;</div></td>
                      </tr>
                    </table>
  </fieldset>
				</form>
                

				
		</div>
	</div>
	<div id="col-three">
		<div class="boxed">
			<h2 class="title">Available Brands</h2>
			<div class="content">
				<jsp:include page="Scroll.html"/>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	
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
