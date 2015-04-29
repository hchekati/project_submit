<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.core.util.CoreHash,java.util.*"%>

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





<script language="javascript" src="scripts/general.js"></script>
<script language="javascript">
function validate()
{
   if(document.changepassword.username.value=="" || document.changepassword.oldpassword.value=="" || document.changepassword.newpassword.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
</script>
</head>
<body>



	<%
	    if(((String)session.getAttribute("role")).equals("admin"))
	    {
	 %>
	  <jsp:include page="Adminoptions.jsp"/>
	  <jsp:include page="AdminSidebar.jsp"/>
	   <%}
	   if(((String)session.getAttribute("role")).equals("customer"))
	    {
	 %>
	   <jsp:include page="customeroptions.jsp"/>
	   <jsp:include page="CustomerSidebar.jsp"/>
	   <%}
	    %> 
	
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-6">
  <h1>Change Password</h1>
  
                      <% if(request.getParameter("status")!=null)
					  {%>
                          <span class="style5"><%=request.getParameter("status")%></span>
                          <%}%>
                    
                    <form name="changepassword" action="ChangepasswordAction.jsp" onSubmit="return validate()">
                     <div class="form-group" >
                          <label>User Name</label>
                                    <input class="form-control" type="text" name="username" emsg="Username is required" value="<%=(String)session.getAttribute("user") %>" readonly/>
                                </div>
                       
                           
                          <div class="form-group">
                          <label>Old Password</label>
                                    <input class="form-control" type="password" name="oldpassword" emsg="Password is required"/>
                                </div>
                            <div class="form-group">
                          <label>New Password</label>
                                    <input class="form-control" type="password" name="newpassword" emsg="Password is required" y/>
                                </div>
                          
                           
                                <input type="submit" name="Submit" value="Change" class="btn btn-success"/>
                                &nbsp;
                                <input type="reset" name="Submit2" value="Reset" class="btn ntn-primary"/>
                             
                           
                      
                    </form>
			
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
