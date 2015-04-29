<!DOCTYPE html>
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



</head>
<body>
<jsp:include page="CustomerSidebar.jsp"/>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-6">


		<jsp:include page="customeroptions.jsp"/>  
	<h1>Send Query</h1>
 
					<form id="form1" method="post" action="SendQuery.jsp">
					 <div class="form-group">
              <label>From</label>
                                    <input class="form-control" name="from" type="text" id="textfield" size="48" value="<%=(String)session.getAttribute("user")%>" readonly />
                                </div>
                            <div class="form-group">
              <label>To</label>
                                    <input class="form-control" name="to" type="text" id="textfield2" size="48"  value="Administrator" readonly />
                                </div>
                          
                          <div class="form-group">
                                            <label>Query</label>
                                            <textarea class="form-control" name="query" id="textarea" cols="45" rows="5"></textarea>
                                        </div>
                          
                              <input type="submit" name="button" id="button" value="Send" class="btn btn-success"/>
                              
                      </form>
					
</div>
	  </div>
		
	</div>
</div>

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
