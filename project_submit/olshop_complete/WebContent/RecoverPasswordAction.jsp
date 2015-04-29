<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.dae.model.Profile,com.dts.dae.dao.SecurityDAO,com.dts.core.util.LoggerManager" %>
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
  <%
  	String target = "RecoverPassword.jsp?status=Entries not Matched... Try Again";;
      try{
          Profile rb=new Profile();
          String loginid=request.getParameter("username");
          String sanswer=request.getParameter("sanswer");
          rb.setLoginID(loginid);
          rb.setSecretAnswer(sanswer);
          int squestid=0;
          String password="";
           if(request.getParameter("ch")!=null)
          {
              rb.setSecretQuestionID(squestid);
              rb.setOwnSecretQuestion(request.getParameter("ownquest"));
              password=new SecurityDAO().recoverPasswordByOWNQuestion(rb);
          }
          else
          {
              squestid=Integer.parseInt(request.getParameter("squest"));
              rb.setSecretQuestionID(squestid);
              rb.setOwnSecretQuestion("Not Mentioned");
              password=new SecurityDAO().recoverPasswordByExistQuestion(rb);
          }
          if(password.equals("") || password==null)
              target="RecoverPassword.jsp?status=Entries not Matched... Try Again";
          else
             target="LoginForm.jsp?ls=Password is "+password;
        }
        catch(Exception e)
        {
           LoggerManager.writeLogSevere(e);
        }
        RequestDispatcher rd = request.getRequestDispatcher(target);
        rd.forward(request,response);
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
