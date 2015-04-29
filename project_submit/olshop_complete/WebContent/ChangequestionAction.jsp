<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.dts.dae.dao.ProfileDAO,com.dts.dae.model.Profile,com.dts.dae.dao.SecurityDAO"%> 
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
  <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
  <%
  	String target="ChangeQuestion.jsp"; 
    try{
    		Profile rb=new Profile();
          String loginid=request.getParameter("username");
          System.out.println(loginid);
          session.setAttribute("username",loginid);
          String password=request.getParameter("password");
          int squestid=0;
          
           if(request.getParameter("ch")!=null)
          {
              rb.setSecretQuestionID(squestid);
              rb.setOwnSecretQuestion(request.getParameter("ownquest"));
          }
          else
          {
              squestid=Integer.parseInt(request.getParameter("squest"));
              rb.setSecretQuestionID(squestid);
              rb.setOwnSecretQuestion("Not Mentioned");
          }
          //String ownsquest=request.getParameter("ownquest");
          String sanswer=request.getParameter("sanswer");
          
          rb.setLoginID(loginid);
          rb.setPassword(password);
          rb.setSecretAnswer(sanswer);
          
          boolean flag=new SecurityDAO().changeQuestion(rb);
          
          if(flag) 
             target = target+"?status=Change Success"; 
          else  
              target = target+"?status=Change Failed"; 
        }catch(Exception e){}      
         response.sendRedirect(target);
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
