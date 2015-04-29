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
                <div class="col-lg-12">
<%
    if (request.getParameter("successmsg") == null) {
        
    } else {%>
    	<h5><font color="red"><%= request.getParameter("successmsg") %></font></h5>
   <% }
%>
	
	 <jsp:include page="customeroptions.jsp"/>  
	 <h1 class="page-header">Order Details</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Order Details
                        </div>
                        <!-- /.panel-heading -->
               
                       
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                 
                                    <form id="form2" method="post" action="UserSearch.jsp" name="search" onSubmit="javascript:if(document.search.brandid.value=='' && document.search.categoryid.value==''&& document.search.itemid.value==''){alert('select Any Search Criteria');}">
                    </form>
                             
            
                    <form name="f" method="post" action="DeleteBrandAction.jsp">
           <%
        try
        {
      		String loginname = (String)session.getAttribute("user");
      		CoreHash aCoreHash = new OrdersDAO().listOrders(loginname);
      		if(!aCoreHash.isEmpty())
      		{
      		     Enumeration enu = aCoreHash.elements();
      		     Orders aOrder = null;   
       %>
        <thead>
                                        <tr><th>Order Number</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    </tr>
                    </thead><tbody> 
                    <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aOrder = (Orders)enu.nextElement(); 
					   price = aOrder.getPrice();
              %>     
                 <tr>
                    <td><a href="ViewOrderDetails.jsp?orderid=<%=(aOrder.getOrderID())%>" class="btn btn-outline btn-warning btn-xs"> Feedback: Order <%=(aOrder.getOrderID())%></a></td>
                    <td><%=(aOrder.getOrderDate1())%></td>
                    <td><%=(aOrder.getTotalamount())%></td>
                    <td><%=(aOrder.getStatus())%></td>
                    </tr>
                  <%}
      		%>
      		</tbody></form>
      	  </table> 
             </div>
             <%}else{ %>
                      <div align="center" class="style21">No Orders Placed</div>
                      <%} }
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
               
               </div>
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
