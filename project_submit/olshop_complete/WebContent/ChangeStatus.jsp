
<%@ page import="com.dts.dae.dao.ProfileDAO,com.dts.olshop.model.Inventory,com.dts.core.util.LoggerManager"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
     <%
         String target=request.getParameter("page")+"?header=list&area="+request.getParameter("area1");
      try{
            ProfileDAO aProfiledao = new ProfileDAO();
            String ch[] = request.getParameterValues("ch");
            
            for(int i=1;i<ch.length;i++)
            {
            
                aProfiledao.changeAccountStatus(ch[i].substring(0,ch[i].lastIndexOf(",")), Integer.parseInt(ch[i].substring(ch[i].lastIndexOf(",")+1,ch[i].length())));
            }
         }
         catch(Exception e)
         {
           LoggerManager.writeLogWarning(e);
         }
        response.sendRedirect(target);
                
     %>
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
