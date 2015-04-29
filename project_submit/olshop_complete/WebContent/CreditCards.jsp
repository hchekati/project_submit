

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>olshop</title>

    <!-- Core CSS - Include with every page -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

   
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet">




<script language="javascript">
function validate()
{
   var temp = document.register;
   if(temp.name.value=="" || temp.cno.value=="" || temp.type.value=="" || temp.exp.value=="" || temp.cvv.value=="" || temp.addr.value==""|| temp.city.value==""|| temp.state.value==""|| temp.country.value==""|| temp.zip.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   
   return true;
}

</script>
  <script type="text/javascript" src="scripts/general.js"> </script>
   <script type="text/javascript" src="scripts/ts_picker.js"> </script>
</head>
<body>
<jsp:include page="CustomerSidebar.jsp"/>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-4">
 <%if(request.getParameter("status")!=null)
					     {%>
                       <font color="red"><b>    <%=request.getParameter("status")%></b></font>
						 <%}%>
<%if(request.getParameter("regs")!=null)
					     {%>
                       <font color="red"><b>    <%=request.getParameter("regs")%></b></font>
						 <%}%>
		<jsp:include page="customeroptions.jsp"/>  
	<h3>Credit Card Details</h3>
		

  <form id="ccform" action="CardsAction.jsp" method="post" name="card" onsubmit="return validate()" role="form">
					 <div class="form-group">
                                            <label>Credit Card Type</label>
                                            <select class="form-control" name="type">
                                                <option>VISA</option>
                              <option>MASTER</option>
                              <option>AmEx</option>
                              <option>DISCOVER</option>
                                            </select>
                                        </div>
                   
                      <div class="form-group">
                                    <input class="form-control" placeholder="Credit Card Number" type="text" name="cno" autofocus >
                                </div>
                                 <div class="form-group">
                                    <input class="form-control" placeholder="Name on Card" type="text" name="name" autofocus >
                                </div>
                               
                                <div class="form-group">
                                    <input class="form-control" placeholder="Card Expiration, MM/YY" type="text" name="exp" autofocus >
                                </div>
                       <div class="form-group">
                                    <input class="form-control" placeholder="CVV Numver" type="text" name="cvv" autofocus >
                                </div>
                                <label>Billing Address</label>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Street Address and Apt Number" type="text" name="addr" autofocus >
                                </div>
                       <div class="form-group">
                                    <input class="form-control" placeholder="City" type="text" name="city" autofocus >
                                </div>
                                
                          
                                         <div class="form-group">
                                    <input class="form-control" placeholder="State" type="text" name="state" autofocus >
                                </div>
                                  <div class="form-group">
                                    <input class="form-control" placeholder="Country" type="text" name="country" autofocus >
                                </div>     
                                <div class="form-group">
                                    <input class="form-control" placeholder="Zipcode" type="text" name="zip" autofocus >
                                </div>
                                
                               
                                        <div class="form-group">
                                        <input name="Input" type="submit" value="Confirm Order" class="btn btn-success"/>
                                        <a href="#" class="btn btn-default">Cancel Order</a> 
                        </div>
                          
                         
					
				</form>
                

				
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
