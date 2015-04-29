<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.dae.model.Profile,com.dts.olshop.dao.DealersDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
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

    <!-- SB Admin CSS - Include with every page -->
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">





<script language="javascript" src="scripts/general.js"></script>
</head>
<body>

<div id="menu">
	<ul>
	    <jsp:include page="Adminoptions.jsp"/>  
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
  <table width="681" border="0">
<tr>
                    <td width="675">
<fieldset>
					<legend><span class="style3">View Active Dealers</span></legend>
                    <br />
                    <form name="f" method="post" action="ChangeStatus.jsp">
               <input type="hidden" name="page" value="ViewActiveDealers.jsp"/>
    <table width="677" border="0" align="center" bordercolor="#8692E3">
    
      <tr bgcolor="#509C16">
      <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	      CoreList aCoreList = new CoreList();
	      CoreHash dCoreHash = new CoreHash();
	      int count =0;
	     try{
             String loginname = "";
             int status = 0;
             DealersDAO dealersdao = new DealersDAO();
             
             dCoreHash = dealersdao.getDealers();  
             if(!dCoreHash.isEmpty())
         	{
         if(header.equals("list") && role.equals("admin"))
         {
       %>
        <td width="18"><div align="center">
          
          <input type="checkbox" name="ch" id="checkbox" onclick="SetChecked('ch')"/>
        
        </div></td>
        <%
        	}
        %>
        <td width="93"><div align="center" class="style8">Login Name</div></td>
        <td width="182"><div align="center" class="style8">Dealer Name</div></td>
        <td width="143"><div align="center" class="style8">Area</div></td>
        <td width="170"><div align="center" class="style8">Contact No</div></td>
        <td width="45"><div align="center" class="style8">Status</div></td>
      </tr>
          <%
          	Enumeration enu = dCoreHash.elements();
          	Profile profile;
          	while (enu.hasMoreElements()) {
          		profile = (Profile) enu.nextElement();
          		loginname = profile.getLoginID();
          				         				
          %>
      
      <%
      	String flag = "false";
      	if(profile.getStatus()==1)
      	{
      		count =1;
      	%>
      	<tr bgcolor="#CEC9FA">
      	<%
      		if (header.equals("list")) 
      		{
      			flag = "true";
      %>
      
        <td bgcolor="#C3D7BA"><input name="ch" type="checkbox" id="checkbox2" onclick="check1()" value="<%=loginname%>,<%=profile.getStatus()%>"/></td> <%
 	}
 %> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><a href="EditDealer.jsp?id=<%=loginname%>&tpage=ViewActiveDealers.jsp?header=list"><%=loginname%></a></div></td> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><a href="EditDealer.jsp?id=<%=loginname%>&tpage=ViewActiveDealers.jsp?header=list"><%=profile.getFirstName()%> <%=profile.getLastName()%></a></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><%=profile.getCity()%></span></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><%=profile.getPhoneNo()%></span></div></td>
        
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7">
        Active</span></div></td>
      </tr>
      <%
      	}}
      		} else {
      %>
         <tr><td height="24" colspan="5"><div align="center" class="style3"><strong>No Records Found</strong></div></td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	if (header.equals("list")) {
      %>
      <tr>
        <td colspan="6"><div align="center">
         
          <input type="button" name="button" id="button" value="Add New" onClick="javascript:location.href='DispatchController?page=AddNewDealer.jsp'"/>
          &nbsp;
          <%
          	if (count == 1) {
          %>
          <input type="submit" name="button2" id="button2" value="Change Status"/>
          <%
          	}
          %>
        </div></td>
      </tr>
       <%
       	}
       %>
    </table>
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
