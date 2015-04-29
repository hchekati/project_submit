<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.olshop.model.*,com.dts.olshop.dao.*,com.dts.core.util.*,java.util.*"%>

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
<jsp:include page="CustomerSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">


	
 	<jsp:include page="customeroptions.jsp"/>  
	  
	
<h1>View Query Status</h1>
                    
                    <form name="f" method="post" action="DeleteQueryAction.jsp">
 
    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
    
      <tr>
      <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	     CoreHash aCoreHash = new CoreHash();
	     try{
             int queryid = 0;
             QueryDAO querydao = new QueryDAO();
             aCoreHash = querydao.getQueryStatus((String)session.getAttribute("user"));
         	if(!aCoreHash.isEmpty())
         	{
       	%>
        <th>
          <input type="checkbox" name="ch" id="checkbox" onclick="SetChecked('ch')"/>        
        </th>
        
        <th>Query Date</th>
        <th>Description</th>
        
        <th>Solution</th>
      </tr>
          <%
             Enumeration enu = aCoreHash.elements();
             Query aQuery;
             while(enu.hasMoreElements())     
            {
               aQuery = (Query)enu.nextElement();
               queryid = aQuery.getQueryid();
           %>
      <tr>
              <td><input name="ch" type="checkbox" id="checkbox2" onclick="check1()" value="<%=queryid%>"/></td> 
      
        <td><div align="center" class="style7">
         
        <%=DateWrapper.parseDate(aQuery.getQueryDate1())%>
        </div></td>
        <td><%=aQuery.getDescription() %></td>
     
      
      
      <td>
        <%
        if(aQuery.getStatus().trim().equalsIgnoreCase("Solved"))
        {
         %>
        
        <a href="ViewSolution.jsp?id=<%=queryid%>" type="button" class="btn btn-success">View</a>
        <%} else{%>
        No Reply Yet
        <%} %>
        </td>
      
      </tr>
      <%
      }
      }
      else 
      {%>
         <tr><td><div align="center" class="style3"><strong>No Records Found</strong></div></td>
         </tr>
      <%}
      }
      catch(Exception e){}
       
       %>
      
          
          &nbsp;
          <%if(!aCoreHash.isEmpty())
          {%>
          <tr>
        <td colspan="6"><div align="center">
         
          <input type="submit" name="button2" id="button2" value="Delete" class="btn btn-danger"/>
          <%}%>
        </div></td>
      </tr>
     
    </table>
  </form>
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
