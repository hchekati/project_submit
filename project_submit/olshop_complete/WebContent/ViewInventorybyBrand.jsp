<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Item,com.dts.olshop.dao.ItemDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
<%@  page import="com.dts.olshop.model.Category,com.dts.olshop.dao.CategoryDAO,com.dts.core.util.CoreList"%>
<%@  page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.olshop.model.Inventory,com.dts.olshop.dao.InventoryDAO"%>

<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
	 if(((String)session.getAttribute("role")).equals("customer"))
	    {
	 %>
	  <jsp:include page="customeroptions.jsp"/> 
	   <%}
	    %>
<br></br>
 		<form id="form2" method="post" action="ViewInventorybyBrand.jsp?header=<%=request.getParameter("header")%>" name="inventory">
				<div class="form-group"><label>Inventory by Brand</label>
                <select class="form-control" name="brandid" id="select" onchange="javascript:if(document.inventory.brandid.value==''){alert('select Any Brand');}else{ document.inventory.submit();}" >
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
		  		   <option value="<%=brandid%>" <%=select%>><%=bCoreHash.get(new Integer(brandid))%></option>  		 
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
        if(request.getParameter("brandid")!=null) 
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
                           These are the available at olshop
                           
                        </div>
      <form name="f" method="post" action="UDInventoryAction.jsp">
      <input type="hidden" name="page" value="ViewInventorybyBrand.jsp"/>
      <input type="hidden" name="type" value="brandid"/>
      <input type="hidden" name="value" value="<%=request.getParameter("brandid")%>"/>
    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                   
                                    <thead>
                                        <tr>     <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	      CoreList inCoreList = new CoreList();
	      CoreHash bCoreHash = new CoreHash();
	      CoreHash cCoreHash = new CoreHash();
	      CoreHash iCoreHash = new CoreHash();
	      int i=0;
	     try{
             int categoryid = 0;
             int itemid = 0;
             ItemDAO itemdao = new ItemDAO();
             CategoryDAO categorydao = new CategoryDAO();
             BrandDAO branddao = new BrandDAO();
             InventoryDAO inventorydao = new InventoryDAO(); 
             
             inCoreList = inventorydao.InventoryByBrand(Integer.parseInt(request.getParameter("brandid")));
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
          
          <b><!-- <input type="checkbox" name="ch" id="checkbox" onclick="SetChecked('ch')"/> -->    
        
        </th>
        <%
        	}
        %>
        <th>Brand    </th>
        <th>Category </th>
        <th>Item     </th>
        <th>Quantity </th>
        <th>Price    </th>
         <%
	  if(header.equals("list"))
	  {
	 %>
        <th>New Quantity</th>
        <th>New Price </th>
        <%} %>
      </tr>
      </thead><tbody>
      
          <%
          	Enumeration enu = inCoreList.elements();
          	int quantity = 0;
          	double price = 0;
          			Item item;
          			
          			while (enu.hasMoreElements()) {
          				i=i+1;
          				inventory = (Inventory) enu.nextElement();
          				itemid = inventory.getItemID();
          				categoryid = inventory.getCategoryID();
          				quantity = inventory.getQuantity();
						price = inventory.getPrice();
          		         	System.out.println("This is i"+i);	
          %>
      <tr>
      <%
      	String flag = "false";
      				if (header.equals("list")) {
      					flag = "true";
      %>
        <td ><input name="ch<%=i%>" type="checkbox" id="checkbox2" value="<%=request.getParameter("brandid")%>,<%=categoryid%>,<%=itemid%>"/></td> <%
 	}
 %> 
        <td><%=bCoreHash.get(new Integer(request.getParameter("brandid")))%></td> 
        <td><%=cCoreHash.get(new Integer(categoryid))%></td> 
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
       
        <td >
              <input name="price<%=i%>" type="text" value="<%=price%>" size="10" />
        </td>
         <%} %>
    
      
      </tr>	
      
      <%
     
      	}%>
      	
      	
      
      		
      		
      		
      		<%} else {
      %>
         <tr><td><strong>No Records Found</strong></td>
         </tr>
      <%
      	}
        
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	if (header.equals("list")) {
      %></tbody>
      </table>
    
      <div align="center">
        <input type="hidden" name="count1" value="<%=i%>"/>
      <input class="btn btn-success" type="button" name="button"
      	id="button" value="Add New" onClick="javascript:location.href='DispatchController?page=AddNewInventory.jsp'" />
      &nbsp;
      <%System.out.println("This is final i"+i);	 %>
      <%int ii=i; %>
      <input type="hidden" name="count" value="<%=ii%>"/>
      <%if(!inCoreList.isEmpty())
         	{ %>
          <input  class="btn btn-primary" type="submit" name="button" id="button2" value="Update"/>  &nbsp; &nbsp;<input class="btn btn-danger"  type="submit" name="button" id="button2" value="Delete"/>
          <%} %>
        
       <%
       	}}
       %>
       </div>
   
  </form>
              </table>
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
