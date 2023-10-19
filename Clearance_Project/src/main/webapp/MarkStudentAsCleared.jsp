<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Login</title>
   
</head>
<body>
    <%
        String prn = request.getParameter("PRN");

    System.out.println(prn);
    Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Registered Sucesss..!!");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance","root","Sachinsp@4");
	System.out.println("Connection Success..!!");
	PreparedStatement ps=con.prepareStatement("delete  from request where prn=?");
	ps.setString(1, prn);
	ps.executeUpdate();
	System.out.println("Values Deleted..!!");
	response.sendRedirect("RequestTable.jsp");  
    %>
</body>
</html>
