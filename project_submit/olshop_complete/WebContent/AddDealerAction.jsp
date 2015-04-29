<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.dts.dae.dao.ProfileDAO,com.dts.dae.model.Profile"%>
<%@page import="com.dts.core.util.LoggerManager"%> 
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

    <title>My JSP 'RegisterAction.jsp' starting page</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">

</head>



	<body>
		<br>
		<%
			String target="AdminHome.jsp?regs=Registration Failed"; 
				try{
				 Profile rb = new Profile(); 
		        rb.setFirstName(request.getParameter("fname")); 
		        rb.setLastName(request.getParameter("lname")); 
		        rb.setBirthDate(request.getParameter("bdate")); 
		        rb.setHno(request.getParameter("hno"));
		        rb.setStreet(request.getParameter("street"));
		        rb.setCity(request.getParameter("city")); 
		        rb.setState(request.getParameter("state")); 
		        rb.setCountry(request.getParameter("country"));
		        rb.setPincode(request.getParameter("pincode"));
		        rb.setPhoneNo(request.getParameter("phoneno"));
		        rb.setEmail(request.getParameter("email")); 
		        rb.setStatus(1); 
		        rb.setFirstLogin(0); 
		        rb.setLoginID(request.getParameter("loginname")); 
		        rb.setLoginType("dealer"); 
		        rb.setPassword(request.getParameter("password")); 
		        int questid=0; 
		        if(request.getParameter("ch")!=null) 
		        { 
		            rb.setSecretQuestionID(questid); 
		            rb.setOwnSecretQuestion(request.getParameter("ownquest")); 
		        } 
		        else 
		        { 
		            questid=Integer.parseInt(request.getParameter("squest")); 
		            rb.setSecretQuestionID(questid); 
		            rb.setOwnSecretQuestion("Not Mentioned"); 
		        } 
		        rb.setSecretAnswer(request.getParameter("sanswer")); 
		        rb.setLocale(request.getLocale().toString()); 
		        boolean flag=new ProfileDAO().registration(rb);
		        
		        if(flag) 
		           target = "AdminHome.jsp?ls=Registration Success"; 
		        else  
		            target = "AdminHome.jsp?regs=Registration Failed"; 
		            }catch(Exception e)
		            {
		               LoggerManager.writeLogInfo(e);
		            }
		        response.sendRedirect(target);
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
