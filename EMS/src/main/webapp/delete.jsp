<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee</title>
    
</head>
<body>
    <h1>Delete Employee</h1>
    <%
        String url = "jdbc:mysql://localhost:3306/emp_22rp04496";
        String user = "root"; 
        String pass = "";
        Connection conn = null;
        PreparedStatement pstmt = null;

        String productCode = request.getParameter("emp_id");
        String message = "";

        if (productCode != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pass);
                
                
                String sql = "DELETE FROM employee WHERE emp_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productCode);
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
               response.sendRedirect("dashboard.jsp");
                } else {
                	 out.println("<h3>Employee not found!</h3>");
                }
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
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
</body>
</html>
