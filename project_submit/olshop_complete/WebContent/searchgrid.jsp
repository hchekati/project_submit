<!DOCTYPE html>
<%@ page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.core.util.CoreHash,java.util.*"%>
<%@ page import="com.dts.olshop.dao.*,com.dts.olshop.model.*,com.dts.core.util.*,java.util.*" %>
<%@ page import="java.io.IOException,java.io.OutputStream" %>

<html lang="en">

<head>

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




<script language="javascript" src="scripts/general.js"></script>


<script type="text/javascript" src="prototype.js"></script>
	<script type="text/javascript" src="effects.js"></script>
	<script type="text/javascript" src="controls.js"></script>
	
	
	

<script language="javascript" src="scripts/general.js"></script>
</head>
<body>




<jsp:include page="CustomerSidebar.jsp"/>


<div id="page-wrapper">
<div class="row">
                <div align="center" class="col-lg-7" align="center">
                <jsp:include page="customeroptions.jsp"/>
                

<br>
<!-- <form action="searchgrid.jsp" placeholder="Search here">
                      <div align="center"> 
                    <strong>Search </strong> <input placeholder="hai" type="text" name="searchitem" id="searchitem"/> 
                    <input type="submit" name="send" value="Search" class="btn btn-success" />
	</form><br><br>-->
	
<form action="searchgrid.jsp">

 <div class="form-group input-group" align="center">

                                            <input type="text" placeholder="Samsung, Apple, and more....." class="form-control" name="searchitem" id="searchitem" />
                                            <span class="input-group-btn">
                                                <input type="submit" name="send" value="Search" class="btn btn-primary" ><i class="fa fa-search"></i>
                                                
                                                </span>
                                                </div>
</form><br><br>
	
	 
	   <%
	 if(((String)session.getAttribute("role")).equals("customer"))
	    {
	 %>
	  <jsp:include page="customeroptions.jsp"/> 
	   <%}
	    %>
	  
				<!-- <form action="UserSearch1.jsp">
				
				<div class="form-group" class="col-lg-6" >
                          <label>Search Item</label>
                                    <input class="form-control" type="text" name="searchitem" id="searchitem"/>
                                    
                                </div>
				<input class="form-control" type="submit" name="send" value="Search" class="btn btn-success"/> -->
				<script type="text/javascript">	
		new Ajax.Autocompleter("searchitem","hint","list");
	</script>
				  <%if(request.getParameter("status")!=null)
					     {%>
                       <font color="red"><b>    <%=request.getParameter("status")%></b></font>
						 <%}%>
						 <%if(request.getParameter("status1")!=null)
					     {%>
                       <font color="red"><b>    <%=request.getParameter("status1")%></b></font>
						 <%}%>
					<br>	
					<%if(request.getParameter("ls")!=null)
					     {%>
                       <font color="red"><b>    <%=request.getParameter("ls")%></b></font>
						 <%}%> 
						
			<div class="container">			 
               
            <div class="row">

            <div class="col-lg-12">
                
            </div>

        </div>
                 
				<%if(request.getParameter("searchitem")!=null){
					
					
					
				String searchitem=request.getParameter("searchitem");
				
				int brandid=new BrandDAO().getBrandid(searchitem);
				//System.out.println("this is brandid"+brandid);
				BrandDAO brandDAO=new BrandDAO();
				CategoryDAO categoryDAO=new CategoryDAO();
				ItemDAO itemdao=new ItemDAO();
				InventoryDAO inventoryDAO=new InventoryDAO();
				
				if(brandid!=0){
				
			%>
				
			
			
			
				
				<% CoreHash acorhash=inventoryDAO.getInventoryDetails(brandid);
				Enumeration aEnumeration=acorhash.elements();
				while(aEnumeration.hasMoreElements())
				{
				Inventory inventory=(Inventory)aEnumeration.nextElement();
				int brandid1=inventory.getBrandID();
				String brandname=brandDAO.getBrandname(brandid1);
				int categoryid=inventory.getCategoryID();
				String categoryname=categoryDAO.getCategoryname(categoryid);
				int itemid=inventory.getItemID();
				
				String itemname=itemdao.getItemname(itemid);
				int qty=inventory.getQuantity();
				double price=inventory.getPrice(); 
				//byte[] img=itemdao.getItemImage(itemid);
				//System.out.println("item id in manage jsp"+itemid);
				%>
				

        
				  
<div class="row">

            <div class="col-lg-3 col-md-3">
                <a href="#">
                    
                    <img class="img-responsive" src="showitemimage.do?itemid=<%=itemid %>" alt="">
                </a>
            </div>

            <div class="col-lg-4 col-md-4">
            <h3><%=itemname%></h3>
                <h4>Price: $<%=price%></h4>
                <p><%=brandname%> - <%=categoryname%></p>
                <a class="btn btn-warning" href="AddtoCartNew.jsp?brandid=<%=inventory.getBrandID() %>&categoryid=<%=inventory.getCategoryID() %>&itemid=<%=inventory.getItemID() %>&searchitem=<%=searchitem %>">Add to Cart <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>

        </div>


                  <%} %>
				<% }
				
				
				
				else{
				int categoryid=categoryDAO.getCategoryname(searchitem);
				//System.out.println("cateogryid"+categoryid);
				
				
				if(categoryid!=0){
				
					%>
				
			
						
				<%
				CoreHash acorhash=inventoryDAO.getCategoryInventoryDetails(categoryid);
				Enumeration aEnumeration=acorhash.elements();
				while(aEnumeration.hasMoreElements())
				{
				Inventory inventory=(Inventory)aEnumeration.nextElement();
				int brandid1=inventory.getBrandID();
				String brandname=brandDAO.getBrandname(brandid1);
				int categoryid1=inventory.getCategoryID();
				String categoryname=categoryDAO.getCategoryname(categoryid);
				int itemid=inventory.getItemID();
				String itemname=itemdao.getItemname(itemid);
				int qty=inventory.getQuantity();
				double price=inventory.getPrice(); 
				%>
					<div class="row">

            <div class="col-lg-3 col-md-3">
                <a href="#">
                    
                    <img class="img-responsive" src="showitemimage.do?itemid=<%=itemid %>" alt="">
                </a>
            </div>

            <div class="col-lg-4 col-md-4">
            <h3><%=itemname%></h3>
                <h4>Price: $<%=price%></h4>
                <p><%=brandname%> - <%=categoryname%></p>
                <a class="btn btn-warning" href="AddtoCartNew.jsp?brandid=<%=inventory.getBrandID() %>&categoryid=<%=inventory.getCategoryID() %>&itemid=<%=inventory.getItemID() %>&searchitem=<%=searchitem %>">Add to Cart <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>

        </div>
				 
			<% 	}} 
				
				else{
			int itemid=itemdao.getItemname(searchitem);
				//System.out.println("itemid"+itemid);
				
				
				
				if(itemid!=0){
				%>
				
			
				<% 
				CoreHash acorhash=inventoryDAO.getItemInventoryDetails(itemid);
				Enumeration aEnumeration=acorhash.elements();
				while(aEnumeration.hasMoreElements())
				{
				Inventory inventory=(Inventory)aEnumeration.nextElement();
				int brandid1=inventory.getBrandID();
				String brandname=brandDAO.getBrandname(brandid1);
				int categoryid1=inventory.getCategoryID();
				String categoryname=categoryDAO.getCategoryname(categoryid);
				int itemid1=inventory.getItemID();
				String itemname=itemdao.getItemname(itemid);
				int qty=inventory.getQuantity();
				double price=inventory.getPrice(); 
			%>
				
			 
				<div class="row">

            <div class="col-lg-3 col-md-3">
                <a href="#">
                    
                    <img class="img-responsive" src="showitemimage.do?itemid=<%=itemid %>" alt="">
                </a>
            </div>

            <div class="col-lg-4 col-md-4">
            <h3><%=itemname%></h3>
                <h4>Price: $<%=price%></h4>
                <p><%=brandname%> - <%=categoryname%></p>
                <a class="btn btn-warning" href="AddtoCartNew.jsp?brandid=<%=inventory.getBrandID() %>&categoryid=<%=inventory.getCategoryID() %>&itemid=<%=inventory.getItemID() %>&searchitem=<%=searchitem %>">Add to Cart <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>

        </div>
				
			 <%}}else{%>
			 <h4><font color="red">No such Items</font></h4>
			 <%
			 }%>
		
				<%}}
				
				}%>
				
			
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
