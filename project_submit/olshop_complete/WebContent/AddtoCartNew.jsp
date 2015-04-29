<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.core.util.*,com.dts.olshop.dao.*,com.dts.olshop.model.*" %>
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

    <meta name="description" content="">
    <meta name="author" content="">
    <title>olshop</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->
<link href="bootstrap/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">
<!-- Custom CSS for the '4 Col Portfolio' Template -->
    <link href="bootstrap/css/4-col-portfolio.css" rel="stylesheet">
    <link href="bootstrap/css/1-col-portfolio.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">

</head>



  
  <body>
     <%
     int brandid = Integer.parseInt(request.getParameter("brandid")); 
     int categoryid = Integer.parseInt(request.getParameter("categoryid"));
     int itemid = Integer.parseInt(request.getParameter("itemid"));
     String searchitem=request.getParameter("searchitem");
     boolean flag = false;
        
     try
     {
        int count = 0;
        CoreHash aCoreHash = new CoreHash();
        if(session.getAttribute("nci")!=null)
        {
             count = ((Integer)session.getAttribute("nci")).intValue();
             aCoreHash = (CoreHash)session.getAttribute("cart");
        }
           
        Orders aOrder = new Orders();  
        aOrder.setBrandid(brandid);
        aOrder.setCategoryid(categoryid);
        aOrder.setItemid(itemid);
        
        Integer key = new Integer(brandid+""+categoryid+""+itemid);
       
        if(aCoreHash.put(key,aOrder)==null)
        {
        		count++;
        		flag = true;
        		session.setAttribute("cart", aCoreHash);
		        session.setAttribute("nci",new Integer(count));
        		
        }
              }
      catch(Exception e)
      {
         LoggerManager.writeLogWarning(e);
      }
      
      String status1 = "";
      
      if(flag)
         status1 = "Item added to Cart";
      else
         status1 = "Item already added to cart";   
         
      response.sendRedirect("searchgrid.jsp?searchitem="+searchitem+"&status1="+status1);
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
