<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
    <style>
      
        
    </style>
    <script>
        function showNotification() {
            alert("Alumini Status Updated");
        }
    </script>
</head>
<body>
    
        <%@ page import="java.sql.*" %>
        <%
       				 String prn = request.getParameter("PRN");
        			String msg = request.getParameter("AlFees");
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
                
                PreparedStatement ps=con.prepareStatement("update studentdetails set Alumini_Fees=? where prn=?");
                ps.setString(1,msg );
                ps.setString(2, prn );
                int r=ps.executeUpdate();
                
                RequestDispatcher rd = request.getRequestDispatcher("SRTForAlumini.jsp");
                rd.include(request, response);
                if(r>0){
                String notificationMessage = "Alumini Status Updated ";
                out.println("<script>showNotification('" + notificationMessage + "');</script>");
                }
            %>    

</body>
</html>
