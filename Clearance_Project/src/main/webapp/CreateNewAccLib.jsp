<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
  
</head>
<body>
    <div class="container">
        <h2 class="header">Registration Form</h2>
        <% 
        
        	String prn = request.getParameter("prn");
  			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection   con = DriverManager.getConnection("jdbc:mysql://localhost:8855/clearance","root","Sachinsp@4");
            PreparedStatement ps = con.prepareStatement("select * from studentdetails where prn=?");
            ps.setString(1, prn);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	
                String name = rs.getString("name");
                String email = rs.getString("email");
                long cont = rs.getLong("contact");
                String stream = rs.getString("stream");
                
                PreparedStatement pss = con.prepareStatement("insert into book_table(prn,name,email,contact,stream,book_issued,Book_status) values (?, ?, ?, ?, ?, ?, ?)");

                // Set parameters for the prepared statement
                pss.setString(1, prn);
                pss.setString(2, name);
                pss.setString(3, email);
                pss.setLong(4, cont);
                pss.setString(5, stream);
                pss.setString(6,"NA");
                pss.setString(7,"NA");
                
                pss.execute();
                System.out.println("Value inserted");
            }
                RequestDispatcher rd = request.getRequestDispatcher("BookTable.jsp");
    		    rd.include(request, response);
    		    response.setContentType("text/html");
               %>
    </div>
</body>
</html>
