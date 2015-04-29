<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.olshop.dao.InventoryDAO,com.dts.olshop.model.Inventory,com.dts.core.util.LoggerManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


  <!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
    
    <title>My JSP 'AddNewInventoryAction.jsp' starting page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">

</head>


  
  
  <body>
  
  <%
      String target = "ViewInventorybyBrand.jsp?header=list";
      try
      {
          int brandid = Integer.parseInt(request.getParameter("brandid"));
          int categoryid = Integer.parseInt(request.getParameter("categoryid"));
          int itemid = Integer.parseInt(request.getParameter("itemid"));
          int quantity = Integer.parseInt(request.getParameter("quantity"));
          double price = Double.parseDouble(request.getParameter("price"));
          
          Inventory inventory = new Inventory();
          
          inventory.setBrandID(brandid);
          inventory.setCategoryID(categoryid);
          inventory.setItemID(itemid);
          inventory.setQuantity(quantity);
          inventory.setPrice(price);
          
          boolean flag = new InventoryDAO().addInventory(inventory);
          }
          catch(Exception e)
          {
             LoggerManager.writeLogWarning(e);
          }
          
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
