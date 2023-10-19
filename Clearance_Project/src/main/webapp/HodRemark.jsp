<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
    <style>
      
        
    </style>
    <script>
        function showNotification() {
            alert("Hod Remark Updated");
        }
    </script>
</head>
<body>
    
        <%@ page import="java.sql.*" %>
        <%
       				 String prn = request.getParameter("PRN");
        			String rem = request.getParameter("Remark");
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
                
                PreparedStatement ps=con.prepareStatement("update studentdetails set HOD_Remark=? where prn=?");
                ps.setString(1,rem );
                ps.setString(2, prn );
                ps.executeUpdate();
                
                RequestDispatcher rd = request.getRequestDispatcher("SRTForHOD.jsp");
                rd.include(request, response);
                String notificationMessage = "Exam Status Updated ";
                out.println("<script>showNotification('" + notificationMessage + "');</script>");
            %>    

</body>
</html>
