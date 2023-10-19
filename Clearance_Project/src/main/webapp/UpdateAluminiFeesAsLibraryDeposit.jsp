<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
    <style>
      
        
    </style>
    <script>
        function showNotification() {
            alert(" Lib Dep Updated As Alumini Fees");
        }
    </script>
</head>
<body>
    
        <%@ page import="java.sql.*" %>
        <%
       				 String prn = request.getParameter("prn");
        			String forStud = request.getParameter("Deposit");
        			String forAl = request.getParameter("AlFTable");
        			String transMsg="Lib Dip Con To Alumini Fees";
        			String al="Paid";
        			
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
                
                PreparedStatement ps=con.prepareStatement("update studentdetails set Library_Diposit=?,Alumini_Fees=? where prn=?");
                ps.setString(1,forStud );
                ps.setString(2, al );
                ps.setString(3, prn );
                ps.executeUpdate();
                con.close();
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
                
                
                PreparedStatement pss=conn.prepareStatement("update aluminifees set AluminiFeesStatus=?,Transactionid=? where prn=?");
                pss.setString(1,forAl );
                pss.setString(2, transMsg);
                pss.setString(3, prn );
                int rup=pss.executeUpdate();
                
                RequestDispatcher rd = request.getRequestDispatcher("SRTForAccountant.jsp");
                rd.include(request, response);
                if (rup > 0) 
                {
                String notificationMessage = "Lib Dep Updated As Alumini Fees ";
                out.println("<script>showNotification('" + notificationMessage + "');</script>");
                }
                conn.close();
            %>    

</body>
</html>
