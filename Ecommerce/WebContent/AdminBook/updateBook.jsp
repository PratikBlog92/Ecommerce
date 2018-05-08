<%@page import="com.connect.DBconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Startmin - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/startmin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div id="wrapper">

    <!-- Navigation -->
	<jsp:include page="/AdminBook/Reuse/navbar.jsp"></jsp:include>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Page Title</h1>
                </div>
            </div>

            <!-- ... Your content goes here ... -->
            
            <%
            try{
            	
            
            		//1.getting pk
            		String pk = request.getParameter("pk");
            		
            		if(pk != null)
            		{
            		
            		
		            		//2. search related data from db
		            		Connection conn = DBconnection.getDBConnection();
		            		PreparedStatement ps = conn.prepareStatement("SELECT * FROM `book` WHERE `BookId` = ?");
		            		ps.setString(1, pk);
		            		ResultSet rs = ps.executeQuery();
		            		            		
		            		//3. put that data in form
		            		while(rs.next())
		            		{
		            		
		            		%>
		            			<form action="/Ecommerce/update" method="post">
		            			<input type="hidden" name="BookId" value="<%= rs.getString("BookId")%>"> 
		            			<label>Name</label><br>
		            			<input type="text" name="bname" class="form-control" placeholder="Insert Book" value="<%=rs.getString("book_name")%>">
		            			<label>Author</label><br>
		            			<input type="text" name="author" class="form-control" placeholder="Insert Authorname" value="<%=rs.getString("author")%>">
		            			<label>Price</label><br>
		            			<input type="number" name="price" class="form-control" placeholder="Insert Price" value="<%=rs.getString("price")%>">
		            			<label>Quantity</label><br>
		            			<input type="number" name="quant" class="form-control" placeholder="Insert Quantity" value="<%=rs.getString("quantity")%>">
		            			
		            			<input type="Submit" value="Submit" class="btn">
		            			
		            		</form>
		            		
		            		<%
		            		}
		            		//4. update data from db
            
            		}
            }catch(Exception e)
            {
            	e.printStackTrace();
            }
            %>

        </div>
    </div>

</div>

<!-- jQuery -->
<script src="js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="js/startmin.js"></script>

</body>
</html>
