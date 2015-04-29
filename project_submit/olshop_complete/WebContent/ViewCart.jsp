<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.Item,com.dts.olshop.dao.ItemDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
<%@  page import="com.dts.olshop.model.*,com.dts.olshop.dao.*,com.dts.core.util.CoreList"%>
<%@  page import="com.dts.olshop.model.Brand,com.dts.olshop.dao.BrandDAO,com.dts.olshop.model.Inventory,com.dts.olshop.dao.InventoryDAO"%>


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
<script type="text/javascript">
function calculate(form)
  {
  
  var total="00.00"; 
  var count=0;
     validate(form);
     for(var i=1;document.order.iprice[i]!=null;i++)
     { 
           if(document.order.quantity[i].value<=0)
            {
                alert("Quantity must be greater than Zero");
                document.order.quantity[i].value=1;
            }    
                document.order.price[i].value = (document.order.iprice[i].value)*(document.order.quantity[i].value);
                total=parseFloat(total)+parseFloat(document.order.price[i].value);
                document.order.total.value=total;
                
      }             
  }
function validate(form)
{
   for(var i=1;document.order.iprice[i]!=null;i++)
   {
       if(parseInt(document.order.quantity[i].value) > parseInt(document.order.iquantity[i].value))
       {
            alert("Not sufficient inventory");
            document.order.quantity[i].value = document.order.iquantity[i].value;
           //  calculate(form);
            return false;
       }   
   }
   return true;
}
</script>
</head>

<body onload="calculate()">
<jsp:include page="CustomerSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">

	 
	<%
	 if(((String)session.getAttribute("role")).equals("customer"))
	    {
	 %>
	   <jsp:include page="customeroptions.jsp"/> 
	   <%}
	    %> 
	    
	<h1 class="page-header">Cart Details</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Cart Details
                        </div>
                        <!-- /.panel-heading -->
               
                        <form  method="post" action="PlaceOrder.jsp" name="order" onsubmit="return validate(order)">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                 
                                    <thead>
                                        <tr>
                                        <%
        
	      CoreList inCoreList = new CoreList();
	      CoreHash bCoreHash = new CoreHash();
	      CoreHash cCoreHash = new CoreHash();
	      CoreHash iCoreHash = new CoreHash();
	      
	     try{
             int categoryid = 0;
             int itemid = 0;
             ItemDAO itemdao = new ItemDAO();
             CategoryDAO categorydao = new CategoryDAO();
             BrandDAO branddao = new BrandDAO();
             InventoryDAO inventorydao = new InventoryDAO(); 
             
             if(session.getAttribute("cart")!=null && !((CoreHash)session.getAttribute("cart")).isEmpty())
         	 {
               Inventory inventory = null;
               iCoreHash = itemdao.listItemNames(); 
               cCoreHash = categorydao.listCategoryNames(); 
               bCoreHash = branddao.listBrandNames();
               
               Orders order = new Orders(); 
               CoreHash aCoreHash = (CoreHash)session.getAttribute("cart");
               Enumeration enu = aCoreHash.elements();
               
        %>
                                            <th>Brand<input type="hidden" name="brandid" value="0"/></th>
                                            <th>Category<input type="hidden" name="categoryid" value="0"/></th>
                                            <th>Item<input type="hidden" name="itemid" value="0"/></th>
                                            <th>Inventory<input type="hidden" name="iquantity" value="0"/></th>
                                            <th>Price/ Item<input type="hidden" name="iprice" value="0"/></th>
                                            <th>Quantity<input type="hidden" name="quantity" value="0"/></th>
                                            <th>Amount<input type="hidden" name="price" value="0"/></th>
                                            <th>Remove from Cart</th>
                                         
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
          	
          	int quantity = 0;
          	double price = 0;
          			Item item;
          			int brandid = 0;
          			int i=0;
          			while (enu.hasMoreElements()) 
          			{
          				order = (Orders) enu.nextElement();
          				itemid = order.getItemid();
          				categoryid = order.getCategoryid();
          				brandid = order.getBrandid();
          		        inventory = new InventoryDAO().getInventory(brandid, categoryid, itemid);     		
          %>
                     <tr class="gradeA">
                     
                
                                            <td> <input type="hidden" name="brandid" value="<%=brandid%>"/><%=bCoreHash.get(new Integer(brandid))%></td>
                                            <td><input type="hidden" name="categoryid" value="<%=categoryid%>"/><%=cCoreHash.get(new Integer(categoryid))%></td>
                                            <td><input type="hidden" name="itemid" value="<%=itemid%>"/><%=iCoreHash.get(new Integer(itemid))%></td>
                                            <td><input name="iquantity" type="text" value="<%=inventory.getQuantity()%>" size="5" readonly/></td>
                                            <td><input name="iprice" type="text" value="<%=inventory.getPrice()%>" size="5" readonly/></td>
                                            <td><input name="quantity" type="text" value="1" size="5"  onkeyup="calculate(order)"/></td>
                                            <td><input name="price" type="text" value="<%=inventory.getPrice()%>" size="5" readonly/></td>
                                            <td><div align="center"><a href="RemovefromCart.jsp?id=<%=brandid%><%=categoryid%><%=itemid%>"><button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                            </button></a></div></td>
                                            
                                        </tr>
                                        <%i++;
      	}%>
      	
      	
      	 <input type="hidden" name="count" value="<%=i%>"/>
      	
       </tbody>
                                </table>
        <div align="center">
        <strong>Total Amount  </strong>
        <input name="total" type="text" size="8" readonly /><br><br>
        
        
        
      
        
         
         
          <input type="submit" name="button" id="button2" class="btn btn-success" value="Place Order"/>  &nbsp; &nbsp;<input type="button" name="button" id="button2" value="Back" onclick="javascript:history.back(-1);"/>
         
        </div>
       <%
       	}
       else {
      %>
         <tr><td height="24" colspan="8"><div align="center" class="style3"><input type="hidden" name="iprice"/><strong>No Items in the Cart</strong></div></td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	
      %>                             
                                    
                               
                    
                               
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
