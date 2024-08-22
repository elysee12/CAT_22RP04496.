<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMS</title>

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<h1>EMPLOYEE MANAGEMENT SYSTEM</h1><br>
   <form method="POST">
   	<h2>Insert new Employee</h2>
		  <hr>
	<input type="text" name="name" placeholder="Enter  Employee Name Here"><br><br>
	<input type="date" name="dbo" placeholder="Enter  Date OF Birth Here"><br><br>
	<input type="number" name="salary" placeholder="Enter  Salary Here"><br><br>
   	<button  name="submit">INSERT</button>
   </form>
   </div>
    <%
            if (request.getParameter("submit") != null) {
                String name_22rp04496 = request.getParameter("name");
                String dbo_22rp04496 = request.getParameter("dbo");
                String salary_22rp04496 = request.getParameter("salary");
                
                String url_22rp04496 = "jdbc:mysql://localhost:3306/emp_22rp04496";
                String user_22rp04496 = "root"; 
                String pass_22rp04496 = "";

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url_22rp04496, user_22rp04496, pass_22rp04496);
                    
                   
                    String sql_22rp04496 = "INSERT INTO employee (emp_name,date_of_birth,salary) VALUES (?,?,?)";
                    pstmt = conn.prepareStatement(sql_22rp04496);
                    pstmt.setString(1, name_22rp04496);
                    pstmt.setString(2, dbo_22rp04496);
                    pstmt.setString(3, salary_22rp04496);
                   
                    pstmt.executeUpdate();

                    
                    response.sendRedirect("dashboard.jsp");
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            }
        %>
        
</body>
</html>