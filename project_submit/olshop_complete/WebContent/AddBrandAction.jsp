<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO"%>
<%@page import="com.dts.core.util.LoggerManager;"%>
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

   <title>My JSP 'AddBrandAction.jsp' starting page</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">

</head>


  
  
  <body>
     <%
        try
        { 
        	String brandname = request.getParameter("brandname");
        	String desc = request.getParameter("desc");
        
        	Brand aBrand = new Brand();
        	aBrand.setBrandName(brandname);
        	aBrand.setBrandDesc(desc);
        
        	BrandDAO aBrandDAO = new BrandDAO();
        	boolean flag = aBrandDAO.addBrand(aBrand);
        }
        catch(Exception e)
        {
           LoggerManager.writeLogWarning(e);
        }
        	RequestDispatcher rd = request.getRequestDispatcher("ViewBrands.jsp?header=list");
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
