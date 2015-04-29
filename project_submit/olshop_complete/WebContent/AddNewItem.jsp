<%@ page import="com.dts.olshop.model.Item,com.dts.olshop.model.Category,com.dts.olshop.dao.ItemDAO,com.dts.olshop.dao.CategoryDAO,com.dts.core.util.CoreHash,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
<script language="javascript" src="scripts/general.js"></script>


</head>



<body>
<jsp:include page="AdminSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-6">
<h1>New Item</h1>



	 <jsp:include page="Adminoptions.jsp"/> 
		
  
   <form name="f" method="post" action="AddItemAction.jsp">
 
  
      <div class="form-group">
           <label>Category</label>
           <select class="form-control" name="categoryid" id="textfield">
           <option>--select--</option>
           <%
                CoreHash aCoreHash = new CoreHash();
                Category aCategory = new Category();
                aCoreHash = new CategoryDAO().listCategories();
                Enumeration enu = aCoreHash.elements();
                while(enu.hasMoreElements())
                {
                   aCategory = (Category)enu.nextElement();
                   System.out.println("--------"+aCategory.getCategoryID());
                 %>
                   <option value="<%=aCategory.getCategoryID()%>"><%=aCategory.getCategoryName()%></option>
                   
                <% }
            
             %>

                                            </select>
                                        </div>
                                          
      <div class="form-group">
            <label>Item Name</label>
                <input class="form-control" type="text" name="itemname" id="textfield"/>
      </div>
      <div class="form-group">
            <label>Description</label>
                <input class="form-control" type="text" name="desc" id="textfield2"/>
      </div>
      <div align="center" class="col-lg-3">
          
          <input class="btn btn-success" type="submit" name="button" id="button" value="Add"/>
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
