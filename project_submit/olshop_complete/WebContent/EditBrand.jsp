<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.core.util.LoggerManager,java.util.*"%>

<html>

<head>

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
                <div class="col-lg-6">
<h1>Edit Supplier</h1>
	 <jsp:include page="Adminoptions.jsp"/>  
	

	
  <%
     int brandid = Integer.parseInt(request.getParameter("id"));
     try
     {
          Brand aBrand = new BrandDAO().editBrand(brandid); 
  
   %>
                    <form name="f" method="post" action="UpdateBrandAction.jsp">
               <input type="hidden" name="brandid" value="<%=brandid%>"/>
     <div class="form-group">
                          <label>Supplier Name</label>
                                    <input class="form-control"type="text" name="brandname" id="textfield" value="<%=aBrand.getBrandName()%>"/>
                                </div>
          <div class="form-group">
                          <label>Description</label>
                                    <input class="form-control" type="text" name="desc" id="textfield2"  value="<%=aBrand.getBrandDesc()%>"/>
                                </div>
          
        
        
          <input type="submit" name="button" id="button" value="Update" class="btn btn-success"/>
          
  </form>
  <%}
  catch(Exception e)
  {
     LoggerManager.writeLogWarning(e);
  }
   %>
					
</div>
	  </div>
		
	</div>
</div>
<div id="footer">
	
</div>
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
