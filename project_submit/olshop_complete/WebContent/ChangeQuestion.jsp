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





 <script type="text/javascript" src="scripts/general.js"> </script>
   <script type="text/javascript" src="scripts/ts_picker.js"> </script>
<script language="javascript">
function validate()
{
   var temp = document.register;
   if(temp.username.value=="" || temp.password.value=="" || temp.sanswer.value=="")
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
                <div class="col-lg-5">
<h1>Change Secret Question</h1>

                      <% if(request.getParameter("status")!=null)
					  {%>
                          <span class="style5"><%=request.getParameter("status")%></span>
                          <%}%>
                    
                   <form action="ChangequestionAction.jsp" method="post" name="register" onSubmit="return validate()">
                      <div class="form-group" >
                          <label>User Name</label>
                                    <input class="form-control" type="text" name="username" value="<%=(String)session.getAttribute("user")%>" readonly/>
                                </div>
                                         
                       
                        <div class="form-group" >
                          <label>Password</label>
                                    <input class="form-control" type="password" name="password"/>
                                </div>
                          <div class="form-group">
                                            <label>Secret question</label>
                                            <select class="form-control">
                                                <option value="1">What is your favorite pastime?</option>
                              <option value="2">Who was your childhood hero?</option>
                              <option value="3">What was the name of your first school?</option>
                              <option value="4">Where did you meet your spouse?</option>
                              <option value="5">What is your favorite sports team?</option>
                              <option value="6">What is your father's middle name?</option>
                              <option value="7">What was your high school mascot?</option>
                              <option value="8">What make was your first car or bike?</option>
                              <option value="9">What is your pet's name?</option>
                                            </select>
                                            </div>
                          <div class="form-group" >
                          <label>Answer</label>
                                    <input class="form-control" name="sanswer" type="text"/>
                                </div>
                          
                              <input name="Input" type="submit" value="Change" class="btn btn-success"/>
                            
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
