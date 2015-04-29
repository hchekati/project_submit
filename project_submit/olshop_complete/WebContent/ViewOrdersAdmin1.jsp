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




</head>
<body>
<jsp:include page="AdminSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                <h1>View order details</h1>
	<%
	 String loginname=(String)request.getParameter("loginname");
	System.out.println("loginname url"+loginname);
	  if(((String)session.getAttribute("role")).equals("admin"))
	{%>
	   <jsp:include page="Adminoptions.jsp"/>
	  <%}
	  %>
	

  
                    <form name="f" method="post" action="DeleteBrandAction.jsp">
                    
		      <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                     <tr>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Feedback by User</th>
                  </tr>
                    <%
    
       try
       {
      		CoreHash aCoreHash = new OrdersDAO().listOrderDetails(Integer.parseInt(request.getParameter("orderid")));
      		if(!aCoreHash.isEmpty())
      		{
      		     Enumeration enu = aCoreHash.elements();
      		     Orders aOrder = null;
      		     CoreHash bCoreHash = new BrandDAO().listBrandNames();
      		     CoreHash cCoreHash = new CategoryDAO().listCategoryNames();
      		     CoreHash iCoreHash = new ItemDAO().listItemNames();
      		   FeedbackDAO fb =new FeedbackDAO();
                 while(enu.hasMoreElements())
      		     {
      		           aOrder = (Orders)enu.nextElement();
              %>     
                  <tr>
                    <td><%=bCoreHash.get(new Integer(aOrder.getBrandid()))%></td>
                    <td><%=cCoreHash.get(new Integer(aOrder.getCategoryid()))%></td>
                    <td><%=iCoreHash.get(new Integer(aOrder.getItemid()))%></td>
                    <td>
                      <%=(aOrder.getQuantity())%></td>
                    <td><%=(aOrder.getPrice())%>
                   </td>
                    <td><img src="showitemimage.do?itemid=<%=aOrder.getItemid() %>" height="50"alt=""></td>
                    <%String fb1=fb.fbDesc(loginname,aOrder.getBrandid(),aOrder.getCategoryid(),aOrder.getItemid());
                    if(fb1==null){%>
                    <td><div align="center"><strong>Not Available</strong></div></td>
                    <%}else{ %>
                    <td><div align="center"><strong><%=fb1 %></strong></div></td>
                    <%} %>
                  </tr>
                  <%} }}
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
          </table>
          <div align="center">
              </br></br></br> <a href="UpdateCustomerOrder.jsp" class="btn btn-outline btn-primary" >View All Orders</a>
               <!--  <input type="button" name="button" id="button" value="Back" onclick="javascript:history.back(-1);" class="btn btn-wrning"/>-->
                  </div>
			</form>
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
