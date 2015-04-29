<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Item,com.dts.olshop.dao.ItemDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
<%@  page import="com.dts.olshop.model.Category,com.dts.olshop.dao.CategoryDAO,com.dts.core.util.CoreList"%>


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
                <div class="col-lg-12">



	<ul>
	
	 <jsp:include page="Adminoptions.jsp"/>
	 
	</ul>
 <h1 class="page-header">Items</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Items
                        </div>
                        <!-- /.panel-heading -->

                    
 
  
  <form name="f" method="post" action="DeleteItemAction.jsp">
  <div class="panel-body">
                            <div class="table-responsive">
  <table class="table table-striped table-bordered table-hover" id="dataTables-example">
  <thead>
      
      <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	      CoreList aCoreList = new CoreList();
	      CoreHash cCoreHash = new CoreHash();
	     try{
             int categoryid = 0;
             int itemid = 0;
             ItemDAO itemdao = new ItemDAO();
             CategoryDAO categorydao = new CategoryDAO();
             aCoreList = itemdao.listItems();
             cCoreHash = categorydao.listCategoryNames();  
             if(!aCoreList.isEmpty())
         	{
         if(header.equals("list") && role.equals("admin"))
         {
       %>
        <tr>
        <th>
          
          <input type="checkbox" name="ch" id="checkbox" onclick="SetChecked('ch')"/>
        
        </th>
        <%
        	}
        %>
        
        <th>Category</th>
        <th>Name</th>
        <th>Description</th>
        <th>Image</th>
 </tr></thead>
          <tbody>
          <%
          	Enumeration enu = aCoreList.elements();
          			Item item;
          			while (enu.hasMoreElements()) {
          				item = (Item) enu.nextElement();
          				itemid = item.getItemID();
          				categoryid = item.getCategoryID();
          				
          %>
          
      <tr>
      <%
      	String flag = "false";
      				if (header.equals("list")) {
      					flag = "true";
      %>
        <td><input name="ch" type="checkbox" id="checkbox2" onclick="check1()" value="<%=itemid%>"/></td> 
        <%}%> 
        <td><%=cCoreHash.get(new Integer(categoryid))%></td> 
        <td>
         <%
          if(((String)session.getAttribute("role")).equals("admin"))
          {
         %>
        <a href="EditItem.jsp?id=<%=itemid%>"><%=item.getItemName()%></a>
        <%} %>
        </td>
        <td><%=item.getItemDesc()%></td>
        <td><div align="center"><img src="showitemimage.do?itemid=<%=itemid %>" height="50"alt=""></img></div></td>
      </tr>
      <%
      	}
         } 
        else {
      %>
         <tr><td><strong>No Records Found</strong></td>
         </tr>
         </tbody>
      <%
      	}}
	     catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	if (header.equals("list")) {
      %>
      
      </table>
         <div align="center">
          <input class="btn btn-success" type="button" name="button" id="button" value="Add New" onClick="javascript:location.href='DispatchController?page=AddNewItem.jsp'"/>
          &nbsp;
          <%
          	if (!aCoreList.isEmpty()) {
          %>
          <input class="btn btn-danger" type="submit" name="button2" id="button2" value="Delete"/>
          <%
          	}
          %>
        <%
       	}
       %>
    </div>
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
