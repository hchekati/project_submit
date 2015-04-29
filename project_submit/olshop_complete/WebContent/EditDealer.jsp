<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.dae.model.*,com.dts.dae.dao.*,com.dts.core.util.CoreHash,java.util.*"%>
<%@page import="com.dts.core.util.DateWrapper"%>

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




 <script type="text/javascript" src="scripts/general.js"> </script>
   <script type="text/javascript" src="scripts/ts_picker.js"> </script>
<script language="javascript">
function validate()
{
   var temp = document.register;
   if(temp.fname.value=="" || temp.lname.value=="" || temp.bdate.value=="" || temp.loginname.value=="" || temp.password.value=="" || temp.sanswer.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   if(temp.ch.checked && temp.ownquest.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   return true;
}
function check()
{
    var form = document.register;
    if(!form.ch.checked){
          form.ownquest.disabled=true;
          form.squest.disabled=false;
    }
    else{
          form.ownquest.disabled=false;
          form.squest.disabled=true;
    }
}
</script>
</head>
<body>

<div id="menu">
	<ul>
	 <jsp:include page="Adminoptions.jsp"/>  
	</ul>
</div>
<div id="wrapper">
  <div id="col-two1">
	  <div class="boxed">
		<h2 class="title">Welcome to CSM</h2>
      
			<h3 align="right">
	    <a align="right"><script language="JavaScript" type="text/javascript">
      </script></a></h3>
<div class="content">
  <%
     String dealerlogin = request.getParameter("id");
     CoreHash dCoreHash = (CoreHash)session.getAttribute("dealers");
     Profile profile = (Profile)dCoreHash.get(dealerlogin); 
%>
  <table width="654" border="0">
<tr>
                    <td width="648">
	  <fieldset>
					<legend><span class="style3">Update Dealer</span></legend>
                    <br />
                    <form name="register" method="post" action="UpdateDealerAction.jsp">
                    <input type="hidden" name="loginname" value="<%=dealerlogin%>"/>
                    <input type="hidden" name="tpage" value="<%=request.getParameter("tpage")%>"/>
                      <table border="0" align="center">
                        <tr>
                          <td class="style3 tiny"><span class="style3"><strong>First Name </strong></span></td>
                          <td><input type="text" name="fname" class="textfield" value="<%=profile.getFirstName() %>"/>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style13">Last Name </span></td>
                          <td><input type="text" name="lname" class="textfield" value="<%=profile.getLastName() %>"/>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style13">Birth Date </span></td>
                          <td><input type="text" name="bdate" readonly="readonly" value="<%=DateWrapper.parseDate(profile.getBirthDate1())%>"/>
                            <a href="javascript:show_calendar('document.register.bdate', document.register.bdate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a> </td>
                        </tr>
                        <tr>
                          <td class="style13">House No</td>
                          <td><input type="text" name="hno" class="textfield" value="<%=profile.getHno() %>"/></td>
                        </tr>
                        <tr>
                          <td class="style13">Street</td>
                          <td><input type="text" name="street" class="textfield" value="<%=profile.getStreet() %>"/></td>
                        </tr>
                        <tr>
                          <td><span class="style13">City</span></td>
                          <td><select name="city">
                              <option><%=profile.getCity()%></option>
                              <option>Hyderabad</option>
                              <option>Mumbai</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style13">State</span></td>
                          <td><select name="state">
                              <option><%=profile.getState() %>
                              <option>Andhra pradesh</option>
                              <option>Maharashtra</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style13">Country</span></td>
                          <td><select name="country">
                            <option><%=profile.getCountry() %></option>
                              <option>India</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td class="style13">Pincode</td>
                          <td><input type="text" name="pincode" class="textfield" value="<%=profile.getPincode() %>"/></td>
                        </tr>
                        <tr>
                          <td class="style13">Contact No</td>
                          <td><input type="text" name="phoneno" class="textfield" value="<%=profile.getPhoneNo() %>"/></td>
                        </tr>
                        <tr>
                          <td class="style13">Email</td>
                          <td><input type="text" name="email" class="textfield" value="<%=profile.getEmail() %>"/></td>
                        </tr>
                        <tr>
                          <td height="11" colspan="2"></td>
                        </tr>
                        <tr>
                          <td colspan="2"><div align="center">
                              <input name="Input" type="submit" value="Update" />&nbsp;<input name="Input" type="button" value="Back" onclick="javascript:history.back(-1);"/>
                          </div></td>
                        </tr>
                      </table>
                    </form>
					</fieldset>
				
			
		      </td>
          </tr>
        </table>
</div>
	  </div>
		
  </div>
</div>
<div id="footer">
	
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
