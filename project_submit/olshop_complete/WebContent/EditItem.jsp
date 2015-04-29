<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Item,com.dts.olshop.model.Category,com.dts.olshop.dao.CategoryDAO,com.dts.olshop.dao.ItemDAO,com.dts.core.util.LoggerManager,com.dts.core.util.CoreHash,java.util.*"%>

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
<body>
<jsp:include page="AdminSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-6">

	 <jsp:include page="Adminoptions.jsp"/>  
	<h1>Edit Item</h1>
  <%
     int itemid = Integer.parseInt(request.getParameter("id"));
     try
     {
          Item aItem = new ItemDAO().editItem(itemid); 
  
   %>
                    <form name="f" method="post" action="UpdateItemAction.jsp">
               <input type="hidden" name="itemid" value="<%=itemid%>"/>
    <div class="form-group">
                                            <label>Category</label>
                                            <select class="form-control" name="categoryid" id="textfield">
                                                <%
                CoreHash aCoreHash = new CoreHash();
                Category aCategory = new Category();
                aCoreHash = new CategoryDAO().listCategories();
                Enumeration enu = aCoreHash.elements();
                int categoryid = 0;
                while(enu.hasMoreElements())
                {
                   aCategory = (Category)enu.nextElement();
                   categoryid = aCategory.getCategoryID();
                   String select="";
                   if(categoryid == aItem.getCategoryID())
                      select = "selected";
                 %>
                   <option value="<%=categoryid%>" <%=select%>><%=aCategory.getCategoryName()%></option>
                   
                <% }
            
             %>
                                            </select>
                                        </div>
          
         <div class="form-group">
                          <label>Item Name</label>
                                    <input class="form-control" type="text" name="itemname" id="textfield" value="<%=aItem.getItemName()%>"/>
                                </div>
         
         <div class="form-group">
                          <label>Description</label>
                                    <input class="form-control" type="text" name="desc" id="textfield2"  value="<%=aItem.getItemDesc()%>"/>
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
