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
        String userId = request.getParameter("identity");
        String password = request.getParameter("Password");

        if (userId != null && password != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Hi");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Hi");
                PreparedStatement ps = con.prepareStatement("select * from staff_id_pass where ID = ? and pass = ?");
                ps.setString(1, userId);
                ps.setString(2, password);
                ResultSet resultSet = ps.executeQuery();
                System.out.println("Hi");
					
                if(resultSet.next())
                {
                	String id=resultSet.getString("id");
                	 System.out.println(id);
                	 if(id.equals("Sancheti@snjb")){
                	  response.sendRedirect("HodDashBoard.html");
                	 }
                	 else if(id.equals("Mahesh@snjb")){
                   	  response.sendRedirect("AccountantDashBoard.html");
                   	 }
                	 else if(id.equals("Nilesh@snjb")){
                      	  response.sendRedirect("LibraryDashBoard.html");
                      	 }
                	 else if(id.equals("Tated@snjb")){
                     	  response.sendRedirect("PrincipalDashBoard.html");
                     	 }
                	 else if(id.equals("Yogesh@snjb")){
                    	  response.sendRedirect("AluminiDashBoard.html");
                    	 }
                	 else{
                		 System.out.println("Invalid credentials. Please try again.");
                         out.println("<p style='color: red;'>Invalid credentials. Please try again.</p>");
                	 }
                	 
                }
                
                 else {
                    System.out.println("Invalid credentials. Please try again.");
                    out.println("<p style='color: red;'>Invalid credentials. Please try again.</p>");
                }

                resultSet.close();
                ps.close();
                con.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
