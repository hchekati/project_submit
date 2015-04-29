<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.dts.olshop.model.FeedBackModel"%>
<%@page import="com.dts.olshop.dao.FeedbackDAO"%>
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
  
  <jsp:include page="CustomerSidebar.jsp"/>
  <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
  <%
  String status="CustomerOrderStatus.jsp?successmsg=FeedBack submission Failed";
  try{
  
  String loginname=(String)session.getAttribute("user");
  int brandid=Integer.parseInt(request.getParameter("brandid"));
  int categoryid=Integer.parseInt(request.getParameter("categoryid"));
  int itemid=Integer.parseInt(request.getParameter("itemid"));
  String feedbackdesc=request.getParameter("status");
  FeedBackModel feedBackModel=new FeedBackModel();
  feedBackModel.setLoginname(loginname);
 feedBackModel.setBrandid(brandid);
 feedBackModel.setCategoryid(categoryid);
 feedBackModel.setItemid(itemid);
 feedBackModel.setFeedbackdesc(feedbackdesc);
 feedBackModel.setItemid(itemid);
 boolean flag=new FeedbackDAO().FeedbackItems(feedBackModel);
 if(flag){
 status="CustomerOrderStatus.jsp?successmsg=FeedBack Submitted Successfully";
 }}catch(Exception e)
 {
 }
 RequestDispatcher rd=request.getRequestDispatcher(status);
 rd.forward(request,response);
 
   %> 
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
