
<%@ page import="com.dts.olshop.dao.InventoryDAO,com.dts.olshop.model.Inventory,com.dts.core.util.LoggerManager"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
        Inventory inventory = null;
     	String pageexe = request.getParameter("page");
     	//System.out.println("1");
     	String type = request.getParameter("type");
     	//System.out.println("2");
     	String value = request.getParameter("value");
     	//System.out.println("3");
     	String button = request.getParameter("button");
     	//ystem.out.println("4");
     	String target = pageexe + "?header=list&"+type+"="+value;
     	//System.out.println("5");
     	//System.out.println("====="+target);
     	int count = Integer.parseInt(request.getParameter("count")); 
     
     	System.out.println(count);
     	try {
     	
     	        InventoryDAO aInventorydao = new InventoryDAO();
     			String ch[] = new String[count];
     			Integer brandid[] = new Integer[count];
     			Integer categoryid[] = new Integer[count];
     			Integer itemid[] = new Integer[count];
     			Integer quantity[] = new Integer[count];
     			Double price[] = new Double[count];
     		
     			for (int i = 0,j=0; i<count; i++) {
     		    	inventory = new Inventory();
     		    	ch[i] =  request.getParameter("ch"+(i));
     		    	System.out.println("This is ch vali"+ch[i]);
     		    	if(ch[i]!=null)
     		    	{
     		        	brandid[j] = new Integer(ch[i].substring(0,ch[i].indexOf(",")));
     		        	System.out.println("--------------");
     		        	System.out.println(brandid[j]);
     		        	inventory.setBrandID(brandid[j].intValue());
     		        	categoryid[j] = new Integer(ch[i].substring(ch[i].indexOf(",")+1,ch[i].lastIndexOf(",")));
     		        	System.out.println(categoryid[j]);
     		        	inventory.setCategoryID(categoryid[j].intValue());
     		        	itemid[j] = new Integer(ch[i].substring(ch[i].lastIndexOf(",")+1,ch[i].length()));
     		        	System.out.println(itemid[j]);
     		        	inventory.setItemID(itemid[j].intValue());
                 		quantity[j] = new Integer(request.getParameter("quantity"+i));
                 		System.out.println(quantity[j]);
                 		inventory.setQuantity(quantity[j].intValue());
                		price[j] = new Double(request.getParameter("price"+i));
                		System.out.println(price[j]);
                		inventory.setPrice(price[j].doubleValue());
                		System.out.println("-----------------");
                		if(button.equals("Update"))
     	                {
                			aInventorydao.updateInventory(inventory);
                		}
                		else	
                		{
                		    aInventorydao.deleteInventory(inventory);
                		}
                		j++;
                	}
     			}
     	} catch (Exception e) {
     	    e.printStackTrace();
     		LoggerManager.writeLogWarning(e);
     	}
     	response.sendRedirect(target);
     	//RequestDispatcher rd = request.getRequestDispatcher(target);
     	//rd.forward(request, response);
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
