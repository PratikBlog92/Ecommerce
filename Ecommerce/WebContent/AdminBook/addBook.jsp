
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
                    <h1 class="page-header">Insert Book</h1>
                </div>
            </div>

            <!-- ... Your content goes here ... -->
            <%
            	Connection connection = DBconnection.getDBConnection();
            	PreparedStatement ps = connection.prepareStatement("SELECT `category` FROM `category`");
            	ResultSet rs =  ps.executeQuery();
            %>
            <div class="row">
            	<div class="col-md-4"></div>
            	<div class="col-md-4">
            		
            		<form action="">
            			<input type="text" name="bname" class="form-control" placeholder="Insert Book" required>
            			<select name="cat" class="form-control">
            				<option>Insert Category</option>
            			<%
            				while(rs.next())
            				{   
         				
            			%>
            				<option value="<%=rs.getString("category") %>"><%=rs.getString("category") %></option>
            			<%            			
            				}
            			%>
            			</select>            			
            			<input type="text" name="author" class="form-control" placeholder="Insert Authorname">
            			<input type="number" name="price" class="form-control" placeholder="Insert Price">
            			<input type="number" name="quant" class="form-control" placeholder="Insert Quantity">
            			
            			<input type="Submit" value="Submit" class="btn">
            			
            		</form>
            	
            	</div>
            	<div class="col-md-4"></div>
            </div>
            <%
            	if(request.getParameter("bname") != null)
            	{
            		String bname =	request.getParameter("bname");
            		String cat =	request.getParameter("cat");
            		String author =	request.getParameter("author");
            		String price =	request.getParameter("price");
            		String quant =	request.getParameter("quant");
            		
            		PreparedStatement ps1 = connection.prepareStatement("INSERT INTO `book`( `book_name`, `author`, `price`, `quantity`, `category`) VALUES (?,?,?,?,?)");
            		
            		ps1.setString(1, bname);
            		ps1.setString(2, author);
            		ps1.setString(3, price);
            		ps1.setString(4, quant);
            		ps1.setString(5, cat);
            		
            		ps1.executeUpdate();
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
