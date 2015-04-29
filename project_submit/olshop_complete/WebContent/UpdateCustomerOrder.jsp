<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.dae.model.*,com.dts.dae.dao.*,com.dts.core.util.CoreHash,java.util.*"%>
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
<jsp:include page="AdminSidebar.jsp"/>
	
 <jsp:include page="Adminoptions.jsp"/>  
	  <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
	
  <h1 class="page-header">Customer Orders</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Orders
                        </div>
                        <!-- /.panel-heading -->
					
                    <form id="form2" method="post" action="UserSearch.jsp" name="search" onSubmit="javascript:if(document.search.brandid.value=='' && document.search.categoryid.value==''&& document.search.itemid.value==''){alert('select Any Search Criteria');}">
                    </form>
                             
             
                    <form name="f" method="post" action="DeleteBrandAction.jsp">
           <%
        try
        {
      		String loginname = (String)session.getAttribute("user");
      		CoreHash dCoreHash = new CustomerDAO().getCustomers();
      		session.setAttribute("dealers", dCoreHash);
      		CoreHash aCoreHash = new OrdersDAO().listOrdersOfAllUser("customer");
      		session.setAttribute("tpage", "UpdateCustomerOrder.jsp");
      		if(!aCoreHash.isEmpty())
      		{
      		     Enumeration enu = aCoreHash.elements();
      		     Orders aOrder = null;   
       %>
                     <div class="panel-body">
                            <div class="table-responsive">
		        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
		        <thead>
                     <tr>
                    <th>View Details</th>
                    <th>User</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Action</th></th>
                    </tr>
                    </thead> <tbody>
             
             <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aOrder = (Orders)enu.nextElement(); 
					   price = aOrder.getPrice();
              %>   
              
              
                  <tr>
                    <td><a href="ViewOrdersAdmin1.jsp?orderid=<%=(aOrder.getOrderID())%>&loginname=<%=(aOrder.getLoginname())%>" class="btn btn-outline btn-warning btn-xs">View Order <%=(aOrder.getOrderID())%></a></td>
                    <td><%=(aOrder.getLoginname())%></td>
                    <td><%=DateWrapper.parseDate(aOrder.getOrderDate1())%></td>
                    <td><%=(aOrder.getTotalamount())%></td>
                    <td><%=(aOrder.getStatus())%></td>
                    <%if(aOrder.getStatus().equals("Pending")){ %>
                    <td><a href="ChangeOrderStatus.jsp?orderid=<%=(aOrder.getOrderID())%>&status=1"><strong>Accept </a><span class="style3"><strong> || </strong></span> <strong><a href="ChangeOrderStatus.jsp?orderid=<%=(aOrder.getOrderID())%>&status=2"> Reject</a></strong></td>
                    <%} else{%>
                    <td>Reviewed</td>
                    <%} %>
                    </tr>
                  <%}
      		%>
      	  
         
             <%}else{ %>
                      <div align="center" class="style21">No Orders Placed</div>
                      <%} }
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
      	</tbody>
          </table>
          </form>
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
