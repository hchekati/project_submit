<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.core.util.CoreHash,java.util.*"%>
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
    boolean flag=false;;
    String status = "status=Order Not Placed";
     try
     {
         String brandid[] = request.getParameterValues("brandid");
         String categoryid[] = request.getParameterValues("categoryid");
         String itemid[] = request.getParameterValues("itemid");
         
         String quantity[] = request.getParameterValues("quantity");
         String price[] = request.getParameterValues("price");
         
         Orders singleOrders = null;
         Orders totalOrders = new Orders();
         CoreHash aCoreHash = new CoreHash();
         try
         {
         	for(int i=1; brandid[i]!=null;i++)
         	{
            	singleOrders = new Orders();
            
           		singleOrders.setBrandid(Integer.parseInt(brandid[i]));
            	singleOrders.setCategoryid(Integer.parseInt(categoryid[i]));
            	singleOrders.setItemid(Integer.parseInt(itemid[i]));
            	singleOrders.setQuantity(Integer.parseInt(quantity[i]));
            	singleOrders.setPrice(Float.parseFloat(price[i]));
            
          	    aCoreHash.put(new Integer(i),singleOrders);
         	}
         }
         catch(ArrayIndexOutOfBoundsException aiob)
         {
             LoggerManager.writeLogWarning(aiob);
         }
         
         double total = Double.parseDouble(request.getParameter("total"));
         
         
         
         totalOrders.setTotalamount(total);
         totalOrders.setLoginname((String)session.getAttribute("user"));
         totalOrders.setOrderDate(DateWrapper.parseDate(new Date()));
         totalOrders.setStatus("Pending");
         
         flag = new OrdersDAO().placeTotalOrder(totalOrders, aCoreHash);
         
         if(flag)
         {
             status = "status=Please Enter Credit Card Details";
             session.removeAttribute("cart");
             session.removeAttribute("nci");
         }
     }
     catch(Exception e)
     {
        LoggerManager.writeLogWarning(e);
     }
     if(flag)
     {
     response.sendRedirect("CreditCards.jsp?"+status);
     }
     else{
    	 response.sendRedirect("searchgrid.jsp?"+status);
     }
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
