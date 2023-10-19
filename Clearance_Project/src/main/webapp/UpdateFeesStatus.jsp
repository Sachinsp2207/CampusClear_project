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
            alert("Fees  Updated");
        }
    </script>
</head>
<body>
    
        <%@ page import="java.sql.*" %>
        <%
       				 String prn = request.getParameter("PRN");
        			String fees = request.getParameter("Fees");
        			
        			long f = Long.parseLong(fees);
        			long comp=0;
        			long dues=0;
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
              	 Statement s= con.createStatement();
              	PreparedStatement ps=con.prepareStatement("select completedFees,pendingFees from feestable where prn=?");
              	ps.setString(1,prn);
              	ResultSet rs=ps.executeQuery();
              	 if(rs.next()){
              		 long Fees=rs.getLong("completedFees");
              		 long Dues=rs.getLong("pendingFees");
              		 dues=Dues-f;
              		 comp=f+Fees;
              	 }
              	 System.out.println(dues);
              	 System.out.println(comp);
              	
                PreparedStatement pss=con.prepareStatement("update feestable set completedFees=?,pendingFees=? where prn=?");
                pss.setLong(1,comp);
                pss.setLong(2,dues);
                pss.setString(3, prn );
                int rup=pss.executeUpdate();
                
                RequestDispatcher rd = request.getRequestDispatcher("FeesTable.jsp");
                rd.include(request, response);
                if (rup > 0) {
                    // Exam status updated successfully
                    String notificationMessage = "Fees Updated";
                    out.println("<script>showNotification('" + notificationMessage + "');</script>");
                }
            %>    

</body>
</html>
