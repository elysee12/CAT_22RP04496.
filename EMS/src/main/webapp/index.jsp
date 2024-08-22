<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>EMS</title>
</head>
<body><div class="content">
	<h1>EMPLOYEE MANAGEMENT SYSTEM</h1><br>
   <form method="POST">
   	<h2>Signin</h2>
		  <hr>
	<input type="text" name="username" placeholder="Enter  User Name Here"><br><br>
	<input type="password" name="password" placeholder="Enter Password Here"><br><br>
   	<button  name="submit">LogIn</button>
   	<p>I don't Have Any Account <a href="signup.jsp">SignUp Here</a></p>
 
   </form>
   </div>
   <%
            if (request.getParameter("submit") != null) {
                String username_22rp04496 = request.getParameter("username");
                String password_22rp04496 = request.getParameter("password");

                String url_22rp04496 = "jdbc:mysql://localhost:3306/emp_22rp04496";
                String user_22rp04496 = "root"; 
                String pass_22rp04496 = "";

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                 
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url_22rp04496, user_22rp04496, pass_22rp04496);
                    
                   
                    String sql_22rp04496 = "SELECT * FROM hr WHERE username = ? AND password = ?";
                    pstmt = conn.prepareStatement(sql_22rp04496);
                    pstmt.setString(1, username_22rp04496);
                    pstmt.setString(2, password_22rp04496);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        out.println("<p>Welcome, " + username_22rp04496 + "!</p>");
                        response.sendRedirect("dashboard.jsp");
                        
                    } else {
                        out.println("<h3>Invalid username  or password!</h3>");
                    }
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            }
        %>
</body>
</html>