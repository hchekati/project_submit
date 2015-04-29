<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.core.util.CoreHash,java.util.*"%>
<%@ page import="com.dts.olshop.dao.*,com.dts.olshop.model.*,com.dts.core.util.*,java.util.*,com.dts.dae.model.Profile;" %>

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
<script language="javascript" src="scripts/ts_picker.js"></script>
</head>
<body>
<jsp:include page="AdminSidebar.jsp"/>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">


	
	 <%
	 

       String loginid=(String)session.getAttribute("username");
	
	 if(((String)session.getAttribute("role")).equals("admin"))
	    {
	 %>
   <jsp:include page="Adminoptions.jsp"/>  
	   <%}
	    %> 
	  
	
 
                    <br></br>
                    <form name="bydate" method="post" action="ViewOrdersAdmin.jsp">
                      <div align="center">
                    <strong>Ordered Date</strong> <input type="date" name="orderdate"/> <input type="submit" value="get Details" class="btn btn-primary"/> 
 </div>
                           <!--  <a href="javascript:show_calendar('document.bydate.orderdate', document.bydate.orderdate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a>&nbsp;</div> -->
                       <%System.out.println("jeffa"); %>
                       <%System.out.println(request.getParameter("orderdate")); %>
                       <%System.out.println(loginid); %>
                        <%
        try
        {
            
        	if(request.getParameter("orderdate")!=null)
        	{
      			String orderdate = request.getParameter("orderdate");
      			CoreHash aCoreHash = new OrdersDAO().listOrderAdmin(orderdate);
      			if(!aCoreHash.isEmpty())
      			{
      		    	 Enumeration enu = aCoreHash.elements();
      		     	 Orders aOrder = null;   
       %><h1 class="page-header">Orders By Date</h1>
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
                        
                      <div class="panel-body">
                            <div class="table-responsive">
		        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                     <thead><tr>
                    <th>Order ID</th>
                    <th>User</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Action</th>
                    </tr></thead><tbody>
             <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aOrder = (Orders)enu.nextElement(); 
					   price = aOrder.getPrice();
              %>     
                  <tr>
                    <td><a href="ViewOrdersAdmin1.jsp?orderid=<%=(aOrder.getOrderID())%>" class="btn btn-outline btn-warning btn-xs">View Order <%=(aOrder.getOrderID())%></a></td>
                    <td><%=aOrder.getLoginname()%></td>
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
      		</tbody>
      	  </table> 
             </div>
             <%}else{ %>
                      <div align="center" class="style21">No Orders Placed</div>
                      <%} }}
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
          
        
               </form>
				
				
			
		     
</div>
	  </div>
		
	</div>
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
