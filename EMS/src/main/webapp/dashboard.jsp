<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<head>
<style type="text/css">
.logout button{
margin-left: 100px;
}

</style>
<link rel="stylesheet" type="text/css" href="dash.css">
	<title>EmployeeRecorded</title>
	
</head>
<body>
<h1>DASHBOARD</h1>
<div class="logout"><button><a href="logout.jsp">Log out</a></button></div>
<br><br>
		<button><a href="employee.jsp" style="text-decoration:none;">Add New Employee</a></button>
		<button><a href="retrieve.jsp" style="text-decoration:none;">Retrieve</a></button>
		<hr>
	<center>
		<p><b>
	     List of Recorded Employee!	
	</b></p>
<table border="1">
	<tr>
		<th>Employee ID</th>
		<th>Employee Name</th>
		<th>Date Of Birth</th>
		<th>Salary </th>
		<th colspan="2">ACTION</th>
	</tr>
	<%
	String url_22rp04496 = "jdbc:mysql://localhost:3306/emp_22rp04496";
    String user_22rp04496 = "root"; 
    String pass_22rp04496 = "";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            conn = DriverManager.getConnection(url_22rp04496, user_22rp04496, pass_22rp04496);
            stmt = conn.createStatement();
            String sql_22rp04496 = "Select*from employee";
            rs = stmt.executeQuery(sql_22rp04496);

            while (rs.next()) {
                int id_22rp04496 = rs.getInt("emp_id");
                String name_22rp04496 = rs.getString("emp_name");
                String dbo_22rp04496 = rs.getString("date_of_birth");
                int salary_22rp04496 = rs.getInt("salary");
    %>
                <tr>
                    <td><%= id_22rp04496 %></td>
                    <td><%= name_22rp04496 %></td>
                    <td><%= dbo_22rp04496 %></td>
                    <td><%=salary_22rp04496 %></td>
                    <td><a href="update.jsp?emp_id=<%= id_22rp04496 %>">Update</a></td>
                     <td><a href="delete.jsp?emp_id=<%= id_22rp04496 %>">Delete</a></td>
                </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>