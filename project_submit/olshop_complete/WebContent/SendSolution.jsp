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
<h1>Send Reply</h1>

		<jsp:include page="Adminoptions.jsp"/>  

					<form id="form1" method="post" action="ReplySolution.jsp">
					<input type="hidden" name="queryid" value="<%=request.getParameter("id") %>"/>
					<%
					      int queryid = Integer.parseInt(request.getParameter("id"));
					      CoreHash aCoreHash = new CoreHash();
	     				  try{
            				 
             				Query aQuery = new QueryDAO().getQuery(queryid); 
            				  
         					 
					 %>
					  <table>
                        <tr>
                         
              <td><div class="form-group">
              <label>From</label>
                                    <input class="form-control" value="<%=aQuery.getCustomerID()%>" readonly id="textfield" size="48" type="text" name="form" >
                                </div>
                            
                         </td>
                        </tr>
                        <tr>
                          
                          <td>
                          <div class="form-group">
                          <label>To</label>
                                    <input class="form-control" name="to" type="text" id="textfield2" size="48"  value="Administrator" readonly >
                                </div>
                            
                          </td>
                        </tr>
                        <tr>
                          
                          <td>
                          <div class="form-group">
                                            <label>Query</label>
                                            <textarea class="form-control" rows="3" name="query" id="textarea" cols="45" rows="5" readonly="readonly"><%=aQuery.getDescription() %></textarea>
                                        </div>
                          
                                                    
                         </td>
                        </tr>
                        <tr>
                        <td>
                         <div class="form-group">
                          <label>Query Date</label>
                                    <input class="form-control"type="text" name="query2" id="query" readonly value="<%=DateWrapper.parseDate(aQuery.getQueryDate1())%>"/>
                                </div>
                          </td>
                        </tr>
                        <tr>
                        <td>
                        <div class="form-group">
                          <label>Reply Date</label>
                                    <input class="form-control"name="textfield" type="text" id="textfield3" size="48" readonly="readonly" value="<%=DateWrapper.parseDate(new Date())%>"/>
                                </div>
                          </td>
                        </tr>
                        <tr>
                          <td><div class="form-group">
                                            <label>Solution</label>
                                            <textarea class="form-control" name="solution" id="query" cols="45" rows="5" ></textarea>
                                        </div></td>
                          
                        </tr>
                        <tr>
                          <td>
                            <div align="center">
                              <input type="submit" name="button" id="button" value="Reply" class="btn btn-success" />
                              </div>
                          </td>
                        </tr>
                      </table>
                      <%}
                      catch(Exception e)
                      {
                         LoggerManager.writeLogWarning(e);
                      } %>
                      </form>
					<br/>
                    
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
