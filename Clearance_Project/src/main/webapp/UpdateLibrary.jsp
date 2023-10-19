<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
    <style>
      
        
    </style>
    <script>
        function showNotification() {
            alert("Library Deposit  Updated");
        }
    </script>
</head>
<body>
    
        <%@ page import="java.sql.*" %>
        <%
       				 String prn = request.getParameter("prn");
        			String dep = request.getParameter("Deposit");
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
                
                PreparedStatement ps=con.prepareStatement("update studentdetails set Library_Diposit=? where prn=?");
                ps.setString(1,dep );
                ps.setString(2, prn );
                int rup=ps.executeUpdate();
                
                RequestDispatcher rd = request.getRequestDispatcher("SRTForAccountant.jsp");
                rd.include(request, response);
                if (rup > 0) {
                    // Exam status updated successfully
                    String notificationMessage = "Exam Status Updated";
                    out.println("<script>showNotification('" + notificationMessage + "');</script>");
                }
            %>    

</body>
</html>
