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

</head>



<body>

<jsp:include page="CustomerSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-6">
<h1>Solution</h1>

		<jsp:include page="customeroptions.jsp"/> 
	
  
					<form id="form1" method="post" action="ReplySolution.jsp">
					
					<%
					      int queryid = Integer.parseInt(request.getParameter("id"));
					      CoreHash aCoreHash = new CoreHash();
	     				  try{
            				 
             				Query aQuery = new QueryDAO().getSolution(queryid);  
            				  
         					 
					 %>
					  <div class="form-group">
                          <label>From</label>
                                    <input class="form-control" name="from" type="text" id="textfield" size="48" value="<%=aQuery.getCustomerID()%>" readonly/>
                                </div>
                                <div class="form-group">
                          <label>To</label>
                                    <input class="form-control" name="to" type="text" id="textfield2" size="48"  value="Administrator" readonly />
                                </div>
                          
                         
                          <div class="form-group">
                                            <label>Query</label>
                                            <textarea class="form-control" name="query" id="textarea" cols="45" rows="5" readonly="readonly"><%=aQuery.getDescription() %></textarea>
                                        </div>
                            
                          <div class="form-group">
                          <label>Send Date</label>
                                    <input class="form-control" type="text" name="query2" id="query" readonly value="<%=DateWrapper.parseDate(aQuery.getQueryDate1())%>"/>
                                </div>
                         
                        <div class="form-group">
                          <label>Reply Date</label>
                                    <input class="form-control" name="textfield" type="text" id="textfield3" size="48" readonly="readonly" value="<%=DateWrapper.parseDate(aQuery.getSolutionDate1())%>"/>
                                </div>
                          
                        <div class="form-group">
                                            <label>Solution</label>
                                            <textarea class="form-control" name="query2" id="query" cols="45" rows="5" readonly><%=aQuery.getSolution()%></textarea>
                                        </div>
                          
                              <input type="button" name="button" id="button" value="back" onclick="javascript:history.back(-1)" class="btn btn-success" />
                              
                      <%}
                      catch(Exception e)
                      {
                         LoggerManager.writeLogWarning(e);
                      } %>
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
