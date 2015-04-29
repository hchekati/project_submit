<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.core.util.CoreHash,java.util.*"%>
<%@ page import="com.dts.olshop.dao.*,com.dts.olshop.model.*,com.dts.core.util.*,java.util.*" %>

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
<jsp:include page="CustomerSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-6">


<h1>Search to Buy</h1>
	
	 
	   <%
	 if(((String)session.getAttribute("role")).equals("customer"))
	    {
	 %>
	  <jsp:include page="customeroptions.jsp"/> 
	   <%}
	    %>
	    <fieldset>
	<form id="form2" method="post" action="UserSearch.jsp" name="search" onSubmit="javascript:if(document.search.brandid.value=='' && document.search.categoryid.value==''&& document.search.itemid.value==''){alert('select Any Search Criteria');}">
	<div class="form-group"><label>Brand/ Suppliers</label>
                                            <select class="form-control" name="brandid" id="select" >
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
		  		      try
		  		      {
		  		        brandid1 = Integer.parseInt(request.getParameter("brandid"));
		  		      }
		  		      catch(Exception e){}   		    
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
                                        <div class="form-group">
                                            <label>Category</label>
                                            <select class="form-control" name="categoryid" id="categoryid" onchange="javascript: location.href='UserSearch.jsp?categoryid='+document.search.categoryid.value+'&brandid='+document.search.brandid.value;">
        <option>--Select--</option>
        <%
		  		try
		  		{
		  		   CoreHash bCoreHash = new CategoryDAO().listCategoryNames();
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int categoryid1 = 0;
		  		   int categoryid = 0;
		  		   if(request.getParameter("categoryid")!=null)
		  		   {
		  		    try
		  		      {
		  		        categoryid1 = Integer.parseInt(request.getParameter("categoryid")); 
		  		      }
		  		      catch(Exception e){} 		    
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
                                        <div class="form-group">
                                            <label>Item</label>
                                            <select class="form-control" name="itemid" id="select" >
        <option>--Select--</option>
        <%
             if(request.getParameter("categoryid")!=null)
             {
		  		try
		  		{
		  		   CoreHash bCoreHash = new ItemDAO().listItemsByCategory(Integer.parseInt(request.getParameter("categoryid")));
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int itemid1 = 0;
		  		   int itemid = 0;
		  		   if(request.getParameter("itemid")!=null)
		  		   {
		  		   try
		  		      {
		  		        itemid1 = Integer.parseInt(request.getParameter("itemid"));
		  		      }
		  		      catch(Exception e){} 
		  		         		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  		   		itemid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(itemid==itemid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
        <option value="<%=itemid%>" <%=select%>><%=((Item)bCoreHash.get(new Integer(itemid))).getItemName()%></option>  		 
        <%}
		  		}
		  		catch(Exception e)
		  		{
		  		   LoggerManager.writeLogWarning(e);
		  		}
		  		}
		  %>
      </select>
                                        </div>
                                        
                                        <input id="inputsubmit2" type="submit" name="inputsubmit2" value="Search" class="btn btn-default" />
                                        
</form>
</fieldset>

<h1 class="page-header">Available Items</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           These are the available items at olshop
                           
                        </div>
                        <!-- /.panel-heading -->
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                            <form name="f" method="post" action="DeleteBrandAction.jsp">
                            <%if(request.getParameter("status")!=null)
					     {%>
                           <%=request.getParameter("status")%>
						 <%}%>
<%if(request.getParameter("status")!=null)
					     {%>
                           <%=request.getParameter("status")%>
						 <%}%>
<%
					  int count = 0;
					  if(session.getAttribute("nci")!=null)
					  {
					      count = ((Integer)session.getAttribute("nci")).intValue();
					  }
					  %>
                      <p><%=count%> Item(s) are in Cart.</p>
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                   
                                    <thead>
                                        <tr>
        <th>Brand/ Supplier</th>                                   
<th>Category</th>
<th>Item</th>
<th>Price $</th>
<th>Add to Cart</th>
                                         
                                        </tr>
                                        
                                    </thead>
                                    <%
    
       try
       {
      		int categoryid = 0;
      		if(!request.getParameter("categoryid").equals("--Select--"))
      		      categoryid = Integer.parseInt(request.getParameter("categoryid"));
      		      
      		int brandid = 0;
      		if(!request.getParameter("brandid").equals("--Select--"))
      		      brandid = Integer.parseInt(request.getParameter("brandid"));
      		      
      		int itemid = 0;
      		if(!request.getParameter("itemid").equals("--Select--"))
      		      itemid = Integer.parseInt(request.getParameter("itemid"));
      		
      		CoreHash aCoreHash = new InventoryDAO().searchInventory(brandid, categoryid, itemid);
      		if(!aCoreHash.isEmpty())
      		{
      		     Enumeration enu = aCoreHash.elements();
      		     Inventory aInventory = null;
      		     CoreHash bCoreHash = new BrandDAO().listBrandNames();
      		     CoreHash cCoreHash = new CategoryDAO().listCategoryNames();
      		     CoreHash iCoreHash = new ItemDAO().listItemNames();
      		         
       %>
                      
                 
             <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aInventory = (Inventory)enu.nextElement(); 
					   price = aInventory.getPrice();
              %>     
                                    <tbody>
                     <tr class="gradeA">
                   
                                            <td><%=bCoreHash.get(new Integer(aInventory.getBrandID()))%></td>
                                            <td><%=cCoreHash.get(new Integer(aInventory.getCategoryID()))%></td>
                                            <td><%=iCoreHash.get(new Integer(aInventory.getItemID()))%></td>
                                            <td><%=price%></td>
                                            <td><a href="AddtoCart.jsp?brandid=<%=aInventory.getBrandID() %>&categoryid=<%=aInventory.getCategoryID() %>&itemid=<%=aInventory.getItemID() %>""><button type="button" class="btn btn-info btn-circle"><i class="fa fa-check"></i>
                            </button></a></td>
                                            
                                        </tr>
                                        <%} }}
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
                                        
                                    </tbody>
                                </table>
                               </form>
                               
                            </div>
                            <!-- /.table-responsive -->
                            
                            
                        </div>
                        <!-- /.panel-body -->
                        
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            

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
