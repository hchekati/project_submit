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

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">





<script language="javascript" src="scripts/general.js"></script>
</head>
<body>

<div id="menu">
	<ul>
	
<!-- <jsp:include page="Adminoptions.jsp"/>  -->
	  
	</ul>
</div>
<div id="wrapper">
  <div id="col-two1">
	  <div class="boxed">
		<h2 class="title">Welcome to CSM</h2>
      
			<h3 align="right">
	    <a align="right"><script language="JavaScript" type="text/javascript">
      </script></a></h3>
<div class="content">
  <table width="674" border="0">
<tr>
                    <td width="668">
	  <fieldset>
					<legend><span class="style3">Dealer Orders</span></legend>
                    <div align="center"><form id="form2" method="post" action="UserSearch.jsp" name="search" onSubmit="javascript:if(document.search.brandid.value=='' && document.search.categoryid.value==''&& document.search.itemid.value==''){alert('select Any Search Criteria');}">
                    </form>
                             
              </div>
                    <form name="f" method="post" action="DeleteBrandAction.jsp">
           <%
        try
        {
      		String loginname = (String)session.getAttribute("user");
      		CoreHash dCoreHash = new DealersDAO().getDealers();
      		session.setAttribute("dealers", dCoreHash);
      		CoreHash aCoreHash = new OrdersDAO().listOrdersOfAllUser("dealer"); 
      		session.setAttribute("tpage", "UpdateDealerOrder.jsp");
      		if(!aCoreHash.isEmpty())
      		{
      		     Enumeration enu = aCoreHash.elements();
      		     Orders aOrder = null;   
       %>
                      <div align="left">
                      <br/>
		        <table width="0" border="0" align="center">
                     <tr>
                    <td width="79" bgcolor="#39552D"><div align="center" class="style19"><span class="style4">Order ID</span></div></td>
                    <td width="109" bgcolor="#39552D"><div align="center" class="style19"><span class="style4">LoginName</span></div></td>
                    <td width="104" bgcolor="#39552D"><div align="center" class="style19"><span class="style4">Order Date</span></div></td>
                    <td width="111" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Total Amount</strong></div></td>
                    <td width="93" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Status</strong></div></td>
                    <td bgcolor="#39552D"><div align="center" class="style10 style4 style20"></div></td>
                    </tr>
             <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aOrder = (Orders)enu.nextElement(); 
					   price = aOrder.getPrice();
              %>     
                  <tr>
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><a href="ViewOrderDetails.jsp?orderid=<%=(aOrder.getOrderID())%>"><%=(aOrder.getOrderID())%></a></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center"><strong><a href="EditDealer.jsp?id=<%=aOrder.getLoginname()%>&tpage=UpdateDealerOrder.jsp"><%=(aOrder.getLoginname())%></a></strong></div></td>
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><%=DateWrapper.parseDate(aOrder.getOrderDate1())%></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><%=(aOrder.getTotalamount())%></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style14"><%=(aOrder.getStatus())%></div></td>
                    <%if(aOrder.getStatus().equals("Pending")){ %>
                    <td bgcolor="#DDEAD7"><span class="style22"><strong><a href="ChangeOrderStatus.jsp?orderid=<%=(aOrder.getOrderID())%>&status=1">Accept</a></strong> <span class="style3"><strong>|</strong></span> <strong><a href="ChangeOrderStatus.jsp?orderid=<%=(aOrder.getOrderID())%>&status=2">Reject</a></strong></span></td>
                    <%} %>
                    </tr>
                  <%}
      		%>
      	  </table> 
             </div>
             <%}else{ %>
                      <div align="center" class="style21">No Orders Placed</div>
                      <%} }
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
          
        
               </form>
					</fieldset>
				
			
	        </td>
          </tr>
        </table>
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
