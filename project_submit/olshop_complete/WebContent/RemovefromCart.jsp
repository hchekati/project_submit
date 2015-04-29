<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.olshop.dao.*,com.dts.olshop.model.*,com.dts.core.util.*,java.util.*" %>
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
  <%
   String status = "status=Item Remove failed";
   try
   {
       CoreHash aCoreHash = (CoreHash)session.getAttribute("cart");
       Integer key = new Integer(request.getParameter("id"));
       int nic = ((Integer)session.getAttribute("nci")).intValue();
       
       if(aCoreHash.remove(key)!=null)
       {
          status = "status=Item Removed From Cart";
          nic--;
          session.setAttribute("cart",aCoreHash);
          session.setAttribute("nci",new Integer(nic));
       }
       
   }
   catch(Exception e)
   {
      LoggerManager.writeLogWarning(e);
   }
   response.sendRedirect("ViewCart.jsp?"+status);
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
