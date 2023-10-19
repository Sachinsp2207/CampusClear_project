<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details For Hod Remark</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: grey; /* Heading color - blue */
            color: #fff; /* Heading text color - white */
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* Even row color - light gray */
        }

        tr:nth-child(odd) {
            background-color: #ffffff; /* Odd row color - white */
        }

        tr:hover {
            background-color: #e0e0e0; /* Hovered row color - light gray */
        }

        h1 {
            text-align: center;
            color: darkred;
        }

        .forward-button {
            background-color: #3498db; /* Button color - blue */
            color: #fff; /* Button text color - white */
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
        .radio-container {
  display: inline-block;
  position: relative;
  padding-left: 30px; /* Adjust the size of the radio button */
  margin-right: 10px; /* Optional: Add some spacing between radio buttons */
  cursor: pointer;
}

.radio-container input[type="radio"] {
  display: none; /* Hide the default radio button */
}

.radio-checkmark {
  position: absolute;
  top: 0;
  left: 0;
  width: 20px; /* Adjust the size of the square */
  height: 20px; /* Adjust the size of the square */
  border: 2px solid #000; /* Border color of the square */
  background-color: transparent; /* Background color of the square */
}

.radio-container input[type="radio"]:checked + .radio-checkmark:after {
  content: "\2714"; /* Unicode character for a checkmark (✔) */
  font-size: 16px; /* Adjust the size of the checkmark */
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: #000; /* Color of the checkmark */
}

 input[type="text"],
 input[type="EnterPRN"] {
            width: 20%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"]
      
         {
            background-color: #4CAF50; /* Green background color */
            color: white; /* White text color */
            padding: 10px 20px; /* Padding around the text */
            border: none; /* No border */
            cursor: pointer; /* Cursor on hover */
            margin: 5px; /* Margin between buttons */
            border-radius: 5px; /* Rounded corners */
            font-size: 16px; /* Font size */
        }
        p{
        margin-left:30%;
        font-size:20px;
        color:red;
        
        }
    </style>
</head>
<body>
    <h1>Student Details For HOD</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Stream</th>
            <th>YOP</th>
            <th>PRN</th>
            <th>Seat No</th>
            <th>Exam Status</th>
            <th>Fees Status</th>
            <th>Book Dues</th>
            <th>Alumni Fees</th>
            <th>Library Deposit</th>
            <th>HOD Remark</th>
            <th>Principal Approval</th>
        </tr>

        <%@ page import="java.sql.*" %>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Driver Registered Success..!!");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8855/Clearance", "root", "Sachinsp@4");
                System.out.println("Connection Success..!!");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM studentdetails");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("<td>" + rs.getLong("contact") + "</td>");
                    out.println("<td>" + rs.getString("stream") + "</td>");
                    out.println("<td>" + rs.getInt("yop") + "</td>");
                   
                    out.println("<td>" + rs.getString("prn") + "</td>");
                    
                    out.println("<td>" + rs.getString("seatno") + "</td>");
                    out.println("<td>" + rs.getString("Exam_Status") + "</td>");
                    out.println("<td>" + rs.getString("fees_status") + "</td>");
                    out.println("<td>" + rs.getString("Book_Dues") + "</td>");
                    out.println("<td>" + rs.getString("Alumini_Fees") + "</td>");
                    out.println("<td>" + rs.getString("Library_Diposit") + "</td>");
                    out.println("<td>" + rs.getString("HOD_Remark") + "</td>");
                    out.println("<td>" + rs.getString("Principal_Aproval") + "</td>");
                    out.println("</tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
   
   		<form action="UpdateExam.jsp" method="post">
        <input type="text" placeholder="Enter PRN" name="PRN">
          <input type="text" placeholder="Pass /  Fail" name="Exam">
        <input type="submit" value="Update Exam Status As Hod" id="markExamStatus">  
    	</form>
    	
    	
    	<form action="HodRemark.jsp" method="post">
        <input type="text" placeholder="Enter PRN" name="PRN">
          <input type="text" placeholder="Allowed/Not Allowed" name="Remark">
        <input type="submit" value="HOD Remark" id="AluminiFees">  
    	</form>
     
   		
        <form action="HodDashBoard.html">
        <input type="submit" value="Back To Dashboard" name="hoddashboard" id="backToDashboard">
        </form>
    
    <script>
    document.getElementById("markFeesPaid").addEventListener("click", function () {
        // Redirect to the "Clearance.html" page when the button is clicked
        window.location.href = "Clearance.html";
    });
</script>
</body>
</html>
