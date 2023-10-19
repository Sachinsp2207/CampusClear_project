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
        
        <%
        	String prn = request.getParameter("prn");
    	    String fullName = request.getParameter("fullName");
        	String email = request.getParameter("email");
        	 String cont = request.getParameter("contact");
            String stream = request.getParameter("stream");
            String compx = request.getParameter("feescomp");
           
            long contact=Long.parseLong(cont);
            long comp=Long.parseLong(compx);         
            long total = 80000;
            long dues=total-comp;

            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection   con = DriverManager.getConnection("jdbc:mysql://localhost:8855/clearance","root","Sachinsp@4");
                PreparedStatement ps = con.prepareStatement("insert into feestable(prn,name,email,contact,stream,completedFees,pendingFees,total) values (?, ?, ?, ?, ?, ?, ?, ?)");

                // Set parameters for the prepared statement
                ps.setString(1, prn);
                ps.setString(2, fullName);
                ps.setString(3, email);
                ps.setLong(4, contact);
                ps.setString(5, stream);
                ps.setLong(6, comp);
                ps.setLong(7, dues);
                ps.setLong(8,  total);
                ps.execute();
                System.out.println("Value inserted");
                RequestDispatcher rd = request.getRequestDispatcher("BookTable.jsp");
    		    rd.include(request, response);
    		    response.setContentType("text/html");
            
        %>
    </div>
</body>
</html>
