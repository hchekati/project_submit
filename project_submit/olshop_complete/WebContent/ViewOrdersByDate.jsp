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
<jsp:include page="CustomerSidebar.jsp"/>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">

<h1>View Your Orders By Date</h1><br/><br/>
	
	 <%
	 String loginname=(String)session.getAttribute("user");
System.out.println(loginname);
       String loginid=(String)session.getAttribute("username");
	
	 if(((String)session.getAttribute("role")).equals("customer"))
	    {
	 %>
   <jsp:include page="customeroptions.jsp"/>  
	   <%}
	    %> 
	  
	
 
                    
                    <form name="bydate" method="post" action="ViewOrdersByDate.jsp">
                      <div align="center">
                    <strong>Ordered Date</strong> <input type="date" name="orderdate"/> <input type="submit" value="get Details" class="btn btn-primary"/></br></br>
                           <!--  <a href="javascript:show_calendar('document.bydate.orderdate', document.bydate.orderdate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a>&nbsp;</div> -->
                       
                       <%System.out.println(request.getParameter("orderdate")); %>
                      
                        <%
        try
        {
            
        	if(request.getParameter("orderdate")!=null)
        	{
      			String orderdate = request.getParameter("orderdate");
      			CoreHash aCoreHash = new OrdersDAO().listOrder(orderdate,loginname);
      			if(!aCoreHash.isEmpty())
      			{
      		    	 Enumeration enu = aCoreHash.elements();
      		     	 Orders aOrder = null;   
       %>
                        
                      
		        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                     <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    </tr>
             <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aOrder = (Orders)enu.nextElement(); 
					   price = aOrder.getPrice();
              %>     
                  <tr>
                    <td><a href="ViewOrderDetails.jsp?orderid=<%=(aOrder.getOrderID())%>" class="btn btn-outline btn-warning btn-xs">Feedback: Order <%=(aOrder.getOrderID())%></a></td>
                    <td><%=DateWrapper.parseDate(aOrder.getOrderDate1())%></td>
                    <td><%=(aOrder.getTotalamount())%></td>
                    <td><%=(aOrder.getStatus())%></td>
                    </tr>
                  <%}
      		%>
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
				
				
			
		      </td>
          </tr>
        </table>
</div>
	  </div>
		
	</div>
</div>
<div id="footer">
	
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
