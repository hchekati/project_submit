<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.crsm.model.*,com.dts.crsm.dao.*,com.dts.core.util.*,java.util.*"%>

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
<jsp:include page="AdminSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">

	
 <jsp:include page="Adminoptions.jsp"/>  
	  
	<h1 class="page-header">Customer Queries</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Queries
                        </div>
                        <!-- /.panel-heading -->

  
				
                    <form name="f" method="post" action="DeleteBrandAction.jsp">
 <div class="panel-body">
                            <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
    
     
      <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	     CoreHash aCoreHash = new CoreHash();
	     try{
             int queryid = 0;
             QueryDAO querydao = new QueryDAO();
             aCoreHash = querydao.getQueryStatus(); 
         	if(!aCoreHash.isEmpty())
         	{
       	%>
       	<thead>
         <tr>
        <th>User ID</th>
        <th>Query Date</th>
        <th>Description</th>
        <th>Status</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
          <%
             Enumeration enu = aCoreHash.elements();
             Query aQuery;
             while(enu.hasMoreElements())     
            {
               aQuery = (Query)enu.nextElement();
               queryid = aQuery.getQueryid();
           %>
      <tr>
              <td><%=aQuery.getCustomerID()%></td>
        <td>
         
        <%=DateWrapper.parseDate(aQuery.getQueryDate1())%>
        </td>
        <td><%=aQuery.getDescription() %></td>
        <td><%=aQuery.getStatus() %></td>
        <td>
        <%
        if(aQuery.getStatus().trim().equalsIgnoreCase("Process"))
        {
         %>
        
        <a href="SendSolution.jsp?id=<%=queryid%>" type="button" class="btn btn-success">Reply</a>
        <%} %>
        </td>
        
      </tr>
    
     <%}
      }
      else 
      {%>
         <tr><td>No Records Found</td>
         </tr>
      <%}
      }
      catch(Exception e){}
       
       %>
    
     </tbody>
    </table>
  </form>

</div>
	  </div>
		
	</div></div></div>
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
