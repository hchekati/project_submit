<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.olshop.dao.*,com.dts.olshop.model.*,com.dts.core.util.*,java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>olshop</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Forms -->

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">

</head>



  
  <body>
  <form id="form2" method="post" action="SearchResult.jsp" name="search" onSubmit="javascript:if(document.search.brandid.value=='' && document.search.categoryid.value==''&& document.search.itemid.value==''){alert('select Any Search Criteria');}">
    <table width="155" border="0">
  <tr>
    <td width="41" height="24">
      <div align="left">Brand</div>
   </td>
    <td width="120"><div align="left">
      <select name="brandid" id="select" >
        <option>--Select--</option>
        <%
		  		try
		  		{
		  		   CoreHash bCoreHash = new BrandDAO().listBrandNames();
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int brandid1 = 0;
		  		   int brandid = 0;
		  		   if(request.getParameter("brandid")!=null)
		  		   {
		  		      try
		  		      {
		  		        brandid1 = Integer.parseInt(request.getParameter("brandid"));
		  		      }
		  		      catch(Exception e){}   		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  		   		brandid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(brandid==brandid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
        <option value="<%=brandid%>" <%=select%>><%=bCoreHash.get(new Integer(brandid))%></option>  		 
           <%}
		  		}
		  		catch(Exception e)
		  		{
		  		   LoggerManager.writeLogWarning(e);
		  		}
		  %>
      </select>
    </div></td>
  </tr>
  <tr>
    <td height="24">
      <div align="left">Category</div>
   </td>
    <td><div align="left">
      <select name="categoryid" id="select" onChange="javascript: location.href='#?categoryid='+document.search.categoryid.value+'&brandid='+document.search.brandid.value;">
        <option>--Select--</option>
        <%
		  		try
		  		{
		  		   CoreHash bCoreHash = new CategoryDAO().listCategoryNames();
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int categoryid1 = 0;
		  		   int categoryid = 0;
		  		   if(request.getParameter("categoryid")!=null)
		  		   {
		  		    try
		  		      {
		  		        categoryid1 = Integer.parseInt(request.getParameter("categoryid")); 
		  		      }
		  		      catch(Exception e){} 		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  		   		categoryid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(categoryid==categoryid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
        <option value="<%=categoryid%>" <%=select%>><%=bCoreHash.get(new Integer(categoryid))%></option>
        <%}
		  		}
		  		catch(Exception e)
		  		{
		  		   LoggerManager.writeLogWarning(e);
		  		}
		  %>
      </select>
    </div></td>
  </tr>
  <tr>
    <td height="24">
      <div align="left">Item</div>
    </td>
    <td><div align="left">
      <select name="itemid" id="select" >
        <option>--Select--</option>
        <%
             if(request.getParameter("categoryid")!=null)
             {
		  		try
		  		{
		  		   CoreHash bCoreHash = new ItemDAO().listItemsByCategory(Integer.parseInt(request.getParameter("categoryid")));
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int itemid1 = 0;
		  		   int itemid = 0;
		  		   if(request.getParameter("itemid")!=null)
		  		   {
		  		   try
		  		      {
		  		        itemid1 = Integer.parseInt(request.getParameter("itemid"));
		  		      }
		  		      catch(Exception e){} 
		  		         		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  		   		itemid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(itemid==itemid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
        <option value="<%=itemid%>" <%=select%>><%=((Item)bCoreHash.get(new Integer(itemid))).getItemName()%></option>  		 
           <%}
		  		}
		  		catch(Exception e)
		  		{
		  		   LoggerManager.writeLogWarning(e);
		  		}
		  		}
		  %>
      </select>
    </div></td>
  </tr>
  <tr>
    <td colspan="2">        
      <div align="center">
        <input id="inputsubmit2" type="submit" name="inputsubmit2" value="Search" class="button" />        
        </div></td>
    </tr>
</table>

	<p align="center" class="tiny">&nbsp;</p>
					</form>
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
