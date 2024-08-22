<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">	
    <meta charset="ISO-8859-1">
    <title>Update Employee</title>
    
    
</head>
<body>
    
    <%
    String url_22rp04496 = "jdbc:mysql://localhost:3306/emp_22rp04496";
    String user_22rp04496 = "root"; 
    String pass_22rp04496 = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String empid_22rp04496 = request.getParameter("emp_id");
    String Ename_22rp04496 = request.getParameter("name");
    String dbo_22rp04496 = request.getParameter("dbo");
    double salary_22rp04496 = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url_22rp04496, user_22rp04496, pass_22rp04496);
        String sql_22rp04496 = "SELECT emp_name, date_of_birth, salary FROM employee WHERE emp_id = ?";
        pstmt = conn.prepareStatement(sql_22rp04496);
        pstmt.setString(1,empid_22rp04496 );
        rs = pstmt.executeQuery();

        if (rs.next()) {
           Ename_22rp04496 = rs.getString("emp_name");
            dbo_22rp04496= rs.getString("date_of_birth");
            salary_22rp04496 = rs.getDouble("salary");
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    if (request.getParameter("update") != null) {
        String newEname_22rp04496 = request.getParameter("emp_name");
        String newdbo_22rp04496 = request.getParameter("dbo");
        double newsalary_22rp04496 = Double.parseDouble(request.getParameter("salary"));

        try {
            conn = DriverManager.getConnection(url_22rp04496, user_22rp04496, pass_22rp04496);
            String sql_22rp04496 = "UPDATE employee SET emp_name = ?, date_of_birth = ?, salary = ? WHERE emp_id = ?";
            pstmt = conn.prepareStatement(sql_22rp04496);
            pstmt.setString(1,newEname_22rp04496 );
            pstmt.setString(2, newdbo_22rp04496);
            pstmt.setDouble(3, newsalary_22rp04496);
            pstmt.setString(4, empid_22rp04496);
            pstmt.executeUpdate();  
            response.sendRedirect("dashboard.jsp");
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    %>

    <form method="POST">
    <h1>UPDATE Employee</h1><hr><br>
        <label>Employee Name:</label>
        <input type="text" name="emp_name" value="<%= Ename_22rp04496 %>" required><br><br>

        <label > Date OF Birth:</label><br><br>
        <input type="date" name="dbo" value="<%= dbo_22rp04496 %>" required><br><br>

        <label> Salary:</label><br>
        <input type="text" name="salary" value="<%= salary_22rp04496 %>" required><br><br>

        <input type="hidden" name="productcode" value="<%= empid_22rp04496 %>">
        <button name="update">Update</button>
    </form>
</body>
</html>
