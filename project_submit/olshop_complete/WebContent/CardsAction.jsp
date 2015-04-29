<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.dts.olshop.dao.CardsDAO,com.dts.olshop.model.Cards"%> 
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




	<body><% System.out.println("in reg act"); %>
		<br>
		<%
			String target="searchgrid.jsp?regs=Purchase Failed"; 
				try{
				 Cards cc = new Cards(); 
				 String ln=(String)session.getAttribute("user");
				 cc.setLName(ln);
				 cc.setType(request.getParameter("type"));
		      cc.setCName(request.getParameter("name"));
		      cc.setCNo(request.getParameter("cno"));
		      cc.setCVV(request.getParameter("cvv"));
		      cc.setExp(request.getParameter("exp"));
		      cc.setStreet(request.getParameter("addr"));
		      cc.setCity(request.getParameter("city"));
		      cc.setState(request.getParameter("state"));
		      cc.setCountry(request.getParameter("country"));
		      cc.setZipcode(request.getParameter("zip"));
		      
		        boolean flag=new CardsDAO().creditcards(cc);
		        
		        if(flag) 
		           target = "searchgrid.jsp?ls=Purchase Successful"; 
		        else  
		            target = "CreditCards.jsp?regs=Purchase Failed, Please enter the card details again"; 
		            }catch(Exception e){}
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
