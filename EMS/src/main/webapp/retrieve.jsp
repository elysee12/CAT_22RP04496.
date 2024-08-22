<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.btn button{
   width:200px;
   height:50px;
}

</style>
<link rel="stylesheet" type="text/css" href="dash.css">
<link rel="stylesheet" type="text/css" href="style.css">
    <title>Employee Search</title>
</head>
<body>
   <div class="btn"><button><a href="dashboard.jsp">Back To dashboard</a></button></div>
    
    <form method="get" action="">
    <b>Enter Employee Name you want to Retrieve</b><hr>
        <input type="text" name="emp_name" placeholder="Enter Employee Name" required>
        <button type="submit">Search</button>
    </form>
    
    <p><b>List of Retrieved Employees!</b></p><hr><br>
    
    <table border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Date OF Birth</th>
            <th>Salary</th>
        </tr>
        <%
        String url_22rp04496 = "jdbc:mysql://localhost:3306/emp_22rp04496";
        String user_22rp04496 = "root"; 
        String pass_22rp04496 = "";
        String name_22rp04496 = request.getParameter("emp_name");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            conn = DriverManager.getConnection(url_22rp04496, user_22rp04496, pass_22rp04496);
            
            String sql_22rp04496;
            if (name_22rp04496 != null && !name_22rp04496.isEmpty()) {
                sql_22rp04496 = "SELECT * FROM employee WHERE emp_name = ?";
                pstmt = conn.prepareStatement(sql_22rp04496);
                pstmt.setString(1, name_22rp04496);
            } else {
                sql_22rp04496 = "SELECT * FROM employee";
                pstmt = conn.prepareStatement(sql_22rp04496);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id_22rp04496 = rs.getInt("emp_id");
                String ename_22rp04496 = rs.getString("emp_name");
                String dbo_22rp04496 = rs.getString("date_of_birth");
                int salary_22rp04496 = rs.getInt("salary");
    %>
                <tr>
                    <td><%= id_22rp04496 %></td>
                    <td><%= ename_22rp04496 %></td>
                    <td><%= dbo_22rp04496 %></td>
                    <td><%=salary_22rp04496 %></td>
                </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>
    </table>
</body>
</html>
