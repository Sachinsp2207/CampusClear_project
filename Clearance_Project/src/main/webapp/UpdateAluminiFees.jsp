<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fees Status Update</title>
    <style>
      
        
    </style>
    <script>
        function showNotification() {
            alert("Alumini Fees  Updated");
        }
    </script>
</head>
<body>
    
        <%@ page import="java.sql.*" %>
        <%
       				 String prn = request.getParameter("PRN");
        			String update = request.getParameter("AlStatus");
        			String ID = request.getParameter("Tid");
        			
        			
        	
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
             
                PreparedStatement ps=con.prepareStatement("update aluminifees set AluminiFeesStatus=?,Transactionid=? where prn=?");
                ps.setString(1,update);
                ps.setString(2,ID);
                ps.setString(3, prn );
                int rup=ps.executeUpdate();
                
                RequestDispatcher rd = request.getRequestDispatcher("AluminiFessTable.jsp");
                rd.include(request, response);
                if (rup > 0) {
                    // Exam status updated successfully
                    String notificationMessage = "Fees Updated";
                    out.println("<script>showNotification('" + notificationMessage + "');</script>");
                }
            %>    

</body>
</html>
