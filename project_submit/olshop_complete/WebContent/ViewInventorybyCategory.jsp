<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Item,com.dts.olshop.dao.ItemDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
<%@  page import="com.dts.olshop.model.Category,com.dts.olshop.dao.CategoryDAO,com.dts.core.util.CoreList"%>
<%@  page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.olshop.model.Inventory,com.dts.olshop.dao.InventoryDAO"%>


<html>

<head>


    <meta charset="utf-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>

    <title>olshop</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->
<link href="bootstrap/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">





<script language="javascript" src="scripts/general.js"></script>
</head>
<body>
<jsp:include page="AdminSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-5">



	 <%
	  if(((String)session.getAttribute("role")).equals("admin"))
	  {
	 %>
	 <jsp:include page="Adminoptions.jsp"/>
	 <%}
	 %>
	  <br></br>
  <form id="form1" method="post" action="ViewInventorybyCategory.jsp?header=<%=request.getParameter("header")%>" name="inventory">
    <div class="form-group"><label>Inventory by Category</label>
          <select class="form-control" name="categoryid" id="select" onchange="javascript:if(document.inventory.categoryid.value==''){alert('select Any Brand');}else{ document.inventory.submit();}">
          <option>--Select--</option>
          <%int i=0;
		  		try
		  		{
		  		   CoreHash bCoreHash = new CategoryDAO().listCategoryNames();
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int categoryid1 = 0;
		  		   int categoryid = 0;
		  		   if(request.getParameter("categoryid")!=null)
		  		   {
		  		        categoryid1 = Integer.parseInt(request.getParameter("categoryid")); 		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  		   		categoryid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(categoryid==categoryid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
		  		   <option value="<%=categoryid%>" <%=select%>><%=bCoreHash.get(new Integer(categoryid))%></option>  		 
		  		<%}
		  		}
		  		catch(Exception e)
		  		{
		  		   LoggerManager.writeLogWarning(e);
		  		}
		  %>
          </select>
		</div>
    </form>
  
  
  
 
  <%
        if(request.getParameter("categoryid")!=null) 
        {
    %>
    
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Following are available at olshop
                           
                        </div>
                        
      
      
      <form name="f" method="post" action="UDInventoryAction.jsp">
      <input type="hidden" name="page" value="ViewInventorybyCategory.jsp"/>
      <input type="hidden" name="type" value="categoryid"/>
      <input type="hidden" name="value" value="<%=request.getParameter("categoryid")%>"/>
      
      
    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                   
                                    <thead>
                                        <tr>     <%
  
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	      CoreList inCoreList = new CoreList();
	      CoreHash bCoreHash = new CoreHash();
	      CoreHash cCoreHash = new CoreHash();
	      CoreHash iCoreHash = new CoreHash();
	      
	     try{
             int categoryid = 0;
             int itemid = 0;
             ItemDAO itemdao = new ItemDAO();
             CategoryDAO categorydao = new CategoryDAO();
             BrandDAO branddao = new BrandDAO();
             InventoryDAO inventorydao = new InventoryDAO(); 
             
             inCoreList = inventorydao.InventoryByCategory(Integer.parseInt(request.getParameter("categoryid")));
             iCoreHash = itemdao.listItemNames(); 
             cCoreHash = categorydao.listCategoryNames(); 
             bCoreHash = branddao.listBrandNames();
             
             Inventory inventory = new Inventory();
             
             if(!inCoreList.isEmpty())
         	{
         if(header.equals("list") && role.equals("admin"))
         {
       %>
      <th>
          
         <!--   <input type="checkbox" name="ch" id="checkbox" onclick="SetChecked('ch')"/> -->
        
        </th> 
        <%
        	}
        %>
        
        <th>Brand</th>
        <th>Category</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price/Item</th>
         <%
	  if(header.equals("list"))
	  {
	 %>
        <th>New Quantity</th>
        <th>New Price</th>
        <%} %>
      </tr>
      </thead>
          <%
          	Enumeration enu = inCoreList.elements();
          	int quantity = 0;
          	double price = 0;
          			Item item;
          			int brandid = 0;
          		
          			while (enu.hasMoreElements()) {
          				i=i+1;
          				inventory = (Inventory) enu.nextElement();
          				itemid = inventory.getItemID();
          				categoryid = inventory.getCategoryID();
          				quantity = inventory.getQuantity();
						price = inventory.getPrice();
						brandid = inventory.getBrandID();
          		         		
          %>
      <tr>
      <%
      	String flag = "false";
      				if (header.equals("list")) {
      					flag = "true";
      %>
        <td><input name="ch<%=i%>" type="checkbox" id="checkbox2" value="<%=brandid%>,<%=request.getParameter("categoryid")%>,<%=itemid%>"/></td> <%
 	}
 %> 
        <td><%=bCoreHash.get(new Integer(brandid))%></td> 
        <td><%=cCoreHash.get(new Integer(request.getParameter("categoryid")))%></td> 
        <td><%=iCoreHash.get(new Integer(itemid))%></td>
        <td><%=quantity%></td>
        <td><%=price%></td>
         <%
	  if(header.equals("list"))
	  {
	 %>
        <td>
              <input name="quantity<%=i%>" type="text" value="<%=quantity%>" size="10" />
        </td>
        <td>
              <input name="price<%=i%>" type="text" value="<%=price%>" size="10" />
        </td>
        <%} %>
      </tr>
      <%i++;
      	}%> 
      		<%} else {
      %>
         <tr><td ><strong>No Records Found</strong></td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	if (header.equals("list")) {
      %>
       </table>
    
      <div align="center">
       
          <input class="btn btn-success" type="button" name="button" id="button" value="Add New" onClick="javascript:location.href='DispatchController?page=AddNewInventory.jsp'"/>
          &nbsp;
          <%int ii=i; %>
      <input type="hidden" name="count" value="<%=ii%>"/>
          <%if(!inCoreList.isEmpty())
         	{ %>
          <input class="btn btn-primary" type="submit" name="button" id="button2" value="Update"/>  &nbsp; &nbsp;<input  class="btn btn-danger" type="submit" name="button" id="button2" value="Delete"/>
          <%} %>
        
       <%
       	}}
       %>
       </div>
   
  </form>
            
</div>
	  </div>
		
	</div>
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
