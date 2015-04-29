<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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





<script language="javascript">

function validate()
{
   if(document.login.username.value=="" || document.login.password.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
</script>
</head>
<body>

<div id="menu">
	<ul>
		<jsp:include page="Generaloptions.html"/> 
	</ul>
</div>
<div id="wrapper">
	<div id="col-one">
		<div class="boxed">
			<h2 class="title">Login</h2>
			<div class="content">
				<form id="form1" method="post" action="LoginAction.jsp" name="login" onsubmit="return validate()">
					<fieldset>
					<legend>Sign-In</legend>
                    <div align="center">
                    <%
					  if(request.getParameter("ls")!=null)
					  {
					%>
                    <span class="style2"><%=request.getParameter("ls")%>					</span>
                    <%
					  }
					%>     
                                   </div>
                    <label for="inputtext1">Username:</label>
					<input id="inputtext1" type="text" name="username" value="" class="textfield" />
					<label for="inputtext2">Password:</label>
					<input id="inputtext2" type="password" name="password" value="" class="textfield" />
					<input id="inputsubmit1" type="submit" name="inputsubmit1" value="Sign In" class="button" />
					<p class="tiny"><a href="RecoverPassword.jsp">Forgot your password?</a></p>
					<p class="tiny">&nbsp;</p>
					<p class="tiny"><a href="Registerform.jsp">New User Sign Up !...</a></p>
				  </fieldset>
				</form>
			    </div>
		</div>
		<div class="boxed">
			<h2 class="title"> Search</h2>
	  <div class="content">
				
					<fieldset>
					<legend>Search</legend>
					<jsp:include page="Search.jsp"/>  
                    </fieldset>
				
			</div>
		</div>
		
	</div>
	<div id="col-two">
		<div class="boxed">
			<h2 class="title">Welcome to CSM</h2>
	  <div class="content">
				<p><img src="images/it-31.jpg"/></p>
				 <%
    
       try
       {
      		int categoryid = 0;
      		if(!request.getParameter("categoryid").equals("--Select--"))
      		      categoryid = Integer.parseInt(request.getParameter("categoryid"));
      		      
      		int brandid = 0;
      		if(!request.getParameter("brandid").equals("--Select--"))
      		      brandid = Integer.parseInt(request.getParameter("brandid"));
      		      
      		int itemid = 0;
      		if(!request.getParameter("itemid").equals("--Select--"))
      		      itemid = Integer.parseInt(request.getParameter("itemid"));
      		
      		CoreHash aCoreHash = new InventoryDAO().searchInventory(brandid, categoryid, itemid);
      		if(!aCoreHash.isEmpty())
      		{
      		     Enumeration enu = aCoreHash.elements();
      		     Inventory aInventory = null;
      		     CoreHash bCoreHash = new BrandDAO().listBrandNames();
      		     CoreHash cCoreHash = new CategoryDAO().listCategoryNames();
      		     CoreHash iCoreHash = new ItemDAO().listItemNames();
      		         
       %>
				<span class="style5">Search Results</span>
                <span class="style5">:</span>
        <div align="left">
		        <table width="342" border="1" align="left" bordercolor="#FFFFFF">
                  <tr>
                    <td width="67" bgcolor="#39552D"><div align="center"><span class="style4">Brand</span></div></td>
                    <td width="94" bgcolor="#39552D"><div align="center"><span class="style4">Category</span></div></td>
                    <td width="95" bgcolor="#39552D"><div align="center" class="style4">Item</div></td>
                    <td width="68" bgcolor="#39552D"><div align="center" class="style4">Price</div></td>
                  </tr>
             <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aInventory = (Inventory)enu.nextElement(); 
					   price = aInventory.getPrice();
              %>     
                  <tr>
                    <td bgcolor="#DDEAD7"><span class="style9"><%=bCoreHash.get(new Integer(aInventory.getBrandID()))%></span></td>
                    <td bgcolor="#DDEAD7"><span class="style9"><%=cCoreHash.get(new Integer(aInventory.getCategoryID()))%></span></td>
                    <td bgcolor="#DDEAD7"><span class="style9"><%=iCoreHash.get(new Integer(aInventory.getItemID()))%></span></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style9"><%=price%></div></td>
                  </tr>
                  <%} %>
          </table>
        </div>
        <p>&nbsp;        </p>
        <p>
          <%}}
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
        </p>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
        </div>
		</div>
  </div>
	<div id="col-three">
		<div class="boxed">
			<h2 class="title">Available Brands</h2>
			<div class="content">
				<jsp:include page="Scroll.html"/>
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
