<html>
<%
if(session.getAttribute("role")==null || session.getAttribute("user")==null)
{
   RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp?ls=Session Expired");
   rd.forward(request,response);
}
else if(!(((String)session.getAttribute("role")).equals("customer")))
{
    RequestDispatcher rd = request.getRequestDispatcher("LoginForm.jsp?ls=You are not authorised user");
    rd.forward(request,response);
}      
%>

<script language="JavaScript">
<!--
function mmLoadMenus() {
  if (window.mm_menu_1224101012_0) return;
window.mm_menu_1224101012_0 = new Menu("root",150,25,"Georgia, Times New Roman, Times, serif",12,"#993333","#333366","#B6B6B6","#E7D398","left","middle",3,0,500,-5,7,true,false,true,0,true,false);
   mm_menu_1224101012_0.addMenuItem("Brands","location='userViewBrands.jsp?header=view'");
   mm_menu_1224101012_0.addMenuItem("Category","location='userViewCategories.jsp?header=view'");
   mm_menu_1224101012_0.addMenuItem("Items","location='userViewItems.jsp?header=view'");
   mm_menu_1224101012_0.fontWeight="bold";
   mm_menu_1224101012_0.hideOnMouseOut=true;
   mm_menu_1224101012_0.bgColor='#DCF8C0';
   mm_menu_1224101012_0.menuBorder=0;
   mm_menu_1224101012_0.menuLiteBgColor='#DCF8C0';
   mm_menu_1224101012_0.menuBorderBgColor='';
window.mm_menu_1224101649_0 = new Menu("root",150,25,"Georgia, Times New Roman, Times, serif",12,"#993333","#333366","#B6B6B6","#E7D398","left","middle",3,0,500,-5,7,true,false,true,0,true,false);
   mm_menu_1224101649_0.addMenuItem("Send Query","location='Queries.jsp'");
   mm_menu_1224101649_0.addMenuItem("View Query Status","location='ViewQueryStatus.jsp'"); 
   mm_menu_1224101649_0.fontWeight="bold";
   mm_menu_1224101649_0.hideOnMouseOut=true;
   mm_menu_1224101649_0.bgColor='#DCF8C0';
   mm_menu_1224101649_0.menuBorder=3;
   mm_menu_1224101649_0.menuLiteBgColor='#DCF8C0';
   mm_menu_1224101649_0.menuBorderBgColor='#FFFFFF';
window.mm_menu_1224101802_0 = new Menu("root",150,25,"Georgia, Times New Roman, Times, serif",12,"#993333","#333366","#B6B6B6","#E7D398","left","middle",3,0,500,-5,7,true,false,true,0,true,false);
   mm_menu_1224101802_0.addMenuItem("View All Dealers","location='ViewDealers.jsp?header=list'");
   mm_menu_1224101802_0.addMenuItem("View Dealers By Area","location='ViewDealersbyArea.jsp?header=list'");
   mm_menu_1224101802_0.addMenuItem("View Active Dealers","location='ViewActiveDealers.jsp?header=list'");
   mm_menu_1224101802_0.addMenuItem("View Inactive Dealers","location='ViewInActiveDealers.jsp?header=list'");
   mm_menu_1224101802_0.fontWeight="bold";
   mm_menu_1224101802_0.hideOnMouseOut=true;
   mm_menu_1224101802_0.bgColor='#DCF8C0';
   mm_menu_1224101802_0.menuBorder=3;
   mm_menu_1224101802_0.menuLiteBgColor='#DCF8C0';
   mm_menu_1224101802_0.menuBorderBgColor='#FFFFFF';
   
window.mm_menu_1224101903_0 = new Menu("root",150,25,"Georgia, Times New Roman, Times, serif",12,"#993333","#333366","#B6B6B6","#E7D398","left","middle",3,0,500,-5,7,true,false,true,0,true,false);
   mm_menu_1224101903_0.addMenuItem("View All Orders","location='CustomerOrderStatus.jsp'");
   mm_menu_1224101903_0.addMenuItem("View Orders by Date","location='ViewOrdersByDate.jsp'");
   mm_menu_1224101903_0.fontWeight="bold";
   mm_menu_1224101903_0.hideOnMouseOut=true;
   mm_menu_1224101903_0.bgColor='#DCF8C0';
   mm_menu_1224101903_0.menuBorder=3;
   mm_menu_1224101903_0.menuLiteBgColor='#DCF8C0';
   mm_menu_1224101903_0.menuBorderBgColor='#FFFFFF';
   
window.mm_menu_1224122939_0 = new Menu("root",150,25,"Georgia, Times New Roman, Times, serif",12,"#993333","#333366","#B6B6B6","#E7D398","left","middle",3,0,500,-5,7,true,false,true,0,true,false);
   mm_menu_1224122939_0.addMenuItem("Change&nbsp;Password","location='ChangePassword.jsp?role=admin'");
   mm_menu_1224122939_0.addMenuItem("Change&nbsp;Question","location='ChangeQuestion.jsp?role=admin'"); 
   mm_menu_1224122939_0.fontWeight="bold";
   mm_menu_1224122939_0.hideOnMouseOut=true;
   mm_menu_1224122939_0.bgColor='#DCF8C0';
   mm_menu_1224122939_0.menuBorder=0;
   mm_menu_1224122939_0.menuLiteBgColor='#DCF8C0';
   mm_menu_1224122939_0.menuBorderBgColor='#777777';

mm_menu_1224101903_0.writeMenus();

} // mmLoadMenus()
//-->
</script>


<script language="JavaScript" src="scripts/mm_menu.js"></script>
<script language="JavaScript1.2">mmLoadMenus();</script>
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.style2 {color: #B6B6B6}

-->
</style>
<body>


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