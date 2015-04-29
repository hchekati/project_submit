<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.dts.dae.dao.ProfileDAO,com.dts.dae.model.Profile,com.dts.dae.dao.SecurityDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>olshop</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">

</head>



  
  <body>
  <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
  <%
  String target="ChangePassword.jsp"; 
  try{
   		Profile rb = new Profile();
        rb.setPassword(request.getParameter("oldpassword"));
        rb.setLoginID(request.getParameter("username"));
        rb.setNewPassword(request.getParameter("newpassword"));
        
        boolean flag=new SecurityDAO().changePassword(rb);
              
        if(flag) 
           target = target+"?status=Password Successfully changed"; 
        else  
            target = target+"?status=Password Change Failed";
      }catch(Exception e){} 
        RequestDispatcher rd = request.getRequestDispatcher(target);
        rd.forward(request,response);    
  %>
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
