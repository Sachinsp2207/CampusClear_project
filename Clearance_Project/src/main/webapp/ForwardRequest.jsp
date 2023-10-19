<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
        function showNotification() {
            alert("Request Forworded To DashBoards");
        }
    </script>
</head>
<body>
<div class="container">
    
    <%
    String prn = request.getParameter("PRN");
    String exam = "null";
    String Fees = "null";
    String Book = "null";
    String alumini = "null";
    String libdep = "null";
    String HR = "null";
    String PA = "null";
	int r=0;
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/clearance", "root", "Sachinsp@4");
    PreparedStatement ps = con.prepareStatement("select * from request where prn=?");
    ps.setString(1, prn);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
    	r++;
        String name = rs.getString("name");
        String email = rs.getString("email");
        long cont = rs.getLong("contact");
        String stream = rs.getString("stream");
        int yop = rs.getInt("yop");
        String seat = rs.getString("seatNo");

        PreparedStatement pss = con.prepareStatement("insert into studentdetails(name,email,contact,stream,yop,Exam_Status,prn,seatno,fees_status,Book_Dues,Alumini_Fees,Library_Diposit,HOD_Remark,Principal_Aproval)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        // Set parameters for the prepared statement
        pss.setString(1, name);
        pss.setString(2, email);
        pss.setLong(3, cont);
        pss.setString(4, stream);
        pss.setInt(5, yop);
        pss.setString(6, exam);
        pss.setString(7, prn);
        pss.setString(8, seat);
        pss.setString(9, Fees);
        pss.setString(10, Book);
        pss.setString(11, alumini);
        pss.setString(12, libdep);
        pss.setString(13, HR);
        pss.setString(14, PA);
        pss.execute();
        System.out.println("Value inserted");
		
        PreparedStatement psss = con.prepareStatement("insert into aluminifees(prn,name,AluminiFeesStatus,Transactionid)values(?,?,?,?)");
        psss.setString(1, prn);
        psss.setString(2, name);
        psss.setString(3, "Unpaid");
        psss.setString(4, "Not Marked");
        psss.execute();
        System.out.println("Value inserted");
        // Set the content type before including the ThankYou.html page
        response.setContentType("text/html");
        if (r > 0) {
            // Exam status updated successfully
            String notificationMessage = "Exam Status Updated";
            out.println("<script>showNotification('" + notificationMessage + "');</script>");
        }
    } else {
        // Handle the case where no rows were reed for the given PRN
       out.println("Enter Valid PRN: ");
    }
        RequestDispatcher rd = request.getRequestDispatcher("RequestTable.jsp");
        rd.include(request, response);
        

    %>
</div>
</body>
</html>
