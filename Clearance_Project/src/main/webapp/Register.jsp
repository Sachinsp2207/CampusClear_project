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
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String stream = request.getParameter("stream");
            String yop = request.getParameter("yop");
            String prn = request.getParameter("prn");
            String lastExamSeatNo = request.getParameter("lastExamSeatNo");
            String purchase = request.getParameter("purchase");

            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection   con = DriverManager.getConnection("jdbc:mysql://localhost:8855/clearance","root","Sachinsp@4");
                PreparedStatement ps = con.prepareStatement("insert into request(name, email, contact, stream, yop, prn,seatno,req) values (?, ?, ?, ?, ?, ?, ?, ?)");

                // Set parameters for the prepared statement
                ps.setString(1, fullName);
                ps.setString(2, email);
                ps.setString(3, contact);
                ps.setString(4, stream);
                ps.setString(5, yop);
                ps.setString(6, prn);
                ps.setString(7, lastExamSeatNo);
                ps.setString(8, purchase);
                ps.execute();
                System.out.println("Value inserted");
                RequestDispatcher rd = request.getRequestDispatcher("ThankYou.html");
    		    rd.include(request, response);
    		    response.setContentType("text/html");
            
        %>
    </div>
</body>
</html>
