<%@page import="java.sql.ResultSet"%>
<%@page import="com.connect.DBconnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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

             <%
            	Connection connection = DBconnection.getDBConnection();
            	PreparedStatement ps = connection.prepareStatement("SELECT * FROM `book`");
            	ResultSet rs =  ps.executeQuery();
            %>
				<table class="table">
					<thead>
						<tr>
							<th>Book Name</th>
							<th>Author</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
					<%
						while(rs.next())
						{
					%>
						<tr>
							<td><%=rs.getString("book_name") %></td>
							<td><%=rs.getString("author") %></td>
							<td><%=rs.getString("price") %></td>
							<td><%= rs.getString("quantity")%></td>
							<td><a href="/Ecommerce/AdminBook/updateBook.jsp?pk=<%= rs.getString("BookId")%>">Update</a></td>
							<td> <a href="/Ecommerce/deleteBook?pk=<%= rs.getString("BookId")%>">Delete</a></td>
						</tr>
					<%	
						}
					%>
					</tbody>
				</table>
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
