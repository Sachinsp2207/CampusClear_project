<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
    <style>
      
        
    </style>
    <script>
        function showNotification() {
            alert("Book Issued Updated");
        }
    </script>
</head>
<body>
    
        <%@ page import="java.sql.*" %>
        <%
       				 String prn = request.getParameter("PRN");
        			String bookname = request.getParameter("Issue");
        			String status="Not Collected";
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
                
                PreparedStatement ps=con.prepareStatement("update book_table set book_issued=?,Book_status=? where prn=?");
                ps.setString(1,bookname );
                ps.setString(2,status );
                ps.setString(3, prn );
                ps.executeUpdate();
                
                RequestDispatcher rd = request.getRequestDispatcher("BookTable.jsp");
                rd.include(request, response);
                String notificationMessage = "Book Issued Updated ";
                out.println("<script>showNotification('" + notificationMessage + "');</script>");
            %>    

</body>
</html>
