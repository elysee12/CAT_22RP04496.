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
	<h1>EMPLOYEE MANAGEMENT SYSTEM</h1>

   <form method="POST">
   	<h2><center>SIGNUP</center></h2>
		  <hr><br>
	<input type="text" name="username" placeholder="Enter  User Name Here"><br><br>
	<input type="email" name="email" placeholder="Enter  Email Here"><br><br>
	<input type="password" name="password" placeholder="Enter Password Here"><br><br>
   	<button  name="submit">SignUp</button>
   </form>
   
    <%
            if (request.getParameter("submit") != null) {
                String username_22rp04496 = request.getParameter("username");
                String email_22rp04496 = request.getParameter("email");
                String password_22rp04496 = request.getParameter("password");

                
                
                String url = "jdbc:mysql://localhost:3306/emp_22rp04496";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url, user, pass);
                    
                   
                    String sql = "INSERT INTO hr (username, email, password) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, username_22rp04496);
                    pstmt.setString(2, email_22rp04496);
                    pstmt.setString(3, password_22rp04496); 
                    pstmt.executeUpdate();

                    out.println("<h3>Signup Successful!</h3>");
                    response.sendRedirect("index.jsp");
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