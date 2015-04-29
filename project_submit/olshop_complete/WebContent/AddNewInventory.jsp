
<%@ page import="com.dts.olshop.model.Item,com.dts.olshop.model.Category,com.dts.olshop.dao.ItemDAO,com.dts.olshop.dao.CategoryDAO,com.dts.core.util.CoreHash,java.util.*"%>
<%@ page import="com.dts.core.util.LoggerManager,com.dts.olshop.dao.BrandDAO,com.dts.olshop.dao.InventoryDAO" %>
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
<jsp:include page="AdminSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-5">


<h1>Add New Inventory</h1>

	<jsp:include page="Adminoptions.jsp"/>
		
                  <form  method="post" action="AddInventoryAction.jsp" name="inventory">
 
        <div class="form-group">
                <label>Brand</label>
                <select class="form-control" name="brandid" id="select" onchange="javascript:if(document.inventory.brandid.value==''){alert('select Any Brand');}else{location.href='AddNewInventory.jsp?brandid='+document.inventory.brandid.value}">
                <option>--Select--</option>
          <%
		  		try
		  		{
		  		   CoreHash bCoreHash = new BrandDAO().listBrandNames();
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int brandid1 = 0;
		  		   int brandid = 0;
		  		   if(request.getParameter("brandid")!=null)
		  		   {
		  		        brandid1 = Integer.parseInt(request.getParameter("brandid")); 		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  		   		brandid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(brandid==brandid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
		  		   <option value="<%=brandid%>" <%=select%>> <%=bCoreHash.get(new Integer(brandid))%> </option>  		 
		  		<%}%>
          
          </select>
          </div>
                                       
       <div class="form-group">
          <label>Category</label>
           <select class="form-control" name="categoryid" id="textfield"  onchange="javascript:if(document.inventory.categoryid.value==''){alert('select Any Category');}if(document.inventory.brandid.value==''){alert('select Any Brand');}else{location.href='AddNewInventory.jsp?brandid='+document.inventory.brandid.value+'&categoryid='+document.inventory.categoryid.value;}">
           <option>--select--</option>
            <%
            
                CoreHash aCoreHash = new CoreHash();
                Category aCategory = new Category();
                aCoreHash = new CategoryDAO().listCategories(); 
                enu = aCoreHash.elements();
                int categoryid = 0;
                while(enu.hasMoreElements())
                {
                   aCategory = (Category)enu.nextElement();
                   categoryid=aCategory.getCategoryID();
                   select = "";
                   if(request.getParameter("categoryid")!=null)
                   {
                   		if(categoryid ==Integer.parseInt(request.getParameter("categoryid")))
                   		{
                       		select = "selected";
                   		}
                   }	
                 %>
               
                   <option value="<%=aCategory.getCategoryID()%>" <%=select%>><%=aCategory.getCategoryName()%></option>
                   
                <% }
               
                 %>
                </select>
         </div>
                                          
       <div class="form-group">
             <label>Item</label>
             <select class="form-control" name="itemid" id="select2">
             <option>--select--</option>
            <%
            if(request.getParameter("brandid")!=null && request.getParameter("categoryid")!=null)
            {
            	 aCoreHash = new CoreHash();
            	 aCategory = new Category();
                aCoreHash = new InventoryDAO().listItemsbyBrandCategory(request.getParameter("brandid"),request.getParameter("categoryid")); 
                enu = aCoreHash.keys();
                int itemid = 0;
                while(enu.hasMoreElements())
                {
                  itemid = Integer.parseInt(enu.nextElement().toString());
                 %>
                   <option value="<%=itemid%>"><%=aCoreHash.get(new Integer(itemid))%></option>
                   
                <% }
                }
                }
                catch(Exception e)
                {
                    LoggerManager.writeLogWarning(e);
                }%>

               </select>
          </div>
                                       
      <div class="form-group">
                          <label>Quantity</label>
                                    <input class="form-control" name="quantity" type="text" id="textfield" value="0"/>
      </div>
                                    
      <div class="form-group">
                          <label>Price/item</label>
                                    <input class="form-control" name="price" type="text" id="textfield2" value="0"/>
     </div>
                         
            <div align="center" class="col-lg-3">
          
          <input class="btn btn-primary" type="submit" name="button" id="button" value="Add"/>
          &nbsp;</div>
      
    
  </form>
					
</div>
	  </div>
		
	</div>

<div id="footer">
	
</div>



<!-- Core Scripts - Include with every page -->
    <script src="bootstrap/js/jquery-1.10.2.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Tables -->
    <script src="bootstrap/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="bootstrap/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <!-- SB Admin Scripts - Include with every page -->
    <script src="bootstrap/js/sb-admin.js"></script>

    <!-- Page-Level Demo Scripts - Forms - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    </script>
    </body>
</html>
