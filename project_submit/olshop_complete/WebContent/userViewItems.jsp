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
<jsp:include page="CustomerSidebar.jsp"/>


	
	 <%
	 
	 if(((String)session.getAttribute("role")).equals("customer"))
	 {
	  %>
	 <jsp:include page="customeroptions.jsp"/>
	 <%} %>
	 
	 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">

 <h1 class="page-header">Items</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           These are available at olshop
                        </div>
                        <!-- /.panel-heading -->
                        <form name="f" method="post" action="DeleteBrandAction.jsp">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
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
        
        %>
                                    <thead>
                                        <tr>
                                        <th>Category</th>
                                            <th>Item Name</th>
                                            <th>Description</th>
                                         <th>Image</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                     <tr class="gradeA">
                     <%
          	Enumeration enu = aCoreList.elements();
          			Item item;
          			while (enu.hasMoreElements()) {
          				item = (Item) enu.nextElement();
          				itemid = item.getItemID();
          				categoryid = item.getCategoryID();
          				
          %>
                                            <td><%=cCoreHash.get(new Integer(categoryid))%></td>
                                            <td><span style="max-width:150px;"><%=item.getItemName()%></span></td>
                                            <td><span style="max-width:150px;"><%=item.getItemDesc()%></span></td>
                                            <td><img src="showitemimage.do?itemid=<%=itemid %>" height="50"alt=""></td>
                                        </tr> 
                                        <%
      	}
      		} else {
      %>
         <tr class="gradeA"><td >No Records Found</td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	
       %>
                                        
                                    </tbody>
                                </table>
                               
                            </div>
                            <!-- /.table-responsive -->
                            
                            
                        </div>
                        <!-- /.panel-body -->
                        </form>
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
