<%@ page language="java" pageEncoding="ISO-8859-1"%>
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
	<% System.out.println("in login action"); %>
		<br> 
		<%
			String target = "LoginForm.jsp?ls=Invalid username and password";
				try{
				 Profile  rb=new Profile();
				 String username = request.getParameter("username");
		         rb.setLoginID(username);
		         rb.setPassword(request.getParameter("password"));
		         
		         String role=new SecurityDAO().loginCheck(rb);
		         if(role.equals("admin"))
		         { 
		            target = "AdminHome.jsp?msg="+username;
		            session.setAttribute("user",username);
		            session.setAttribute("role",role);
		         } 
		        
		         else if(role.equals("customer"))
		         { 
		            target = "CustomerHome.jsp?msg="+username;
		            session.setAttribute("user",username);
		            session.setAttribute("role",role);
		         } 
		         else  
		            target = "LoginForm.jsp?ls=Invalid username and password";
		            }catch(Exception e){e.printStackTrace();} 
		        RequestDispatcher rd = request.getRequestDispatcher(target);
		        rd.forward(request,response);
		%>
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
