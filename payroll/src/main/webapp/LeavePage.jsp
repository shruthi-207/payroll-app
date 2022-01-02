<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Employee.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave</title>
<style>
		h1{
			text-align: center;
			 background: linear-gradient(to right, #a8c0ff, #3f2b96);
			 color: white;
			 margin-bottom: -1px;
			 }
			 h2{
			 text-align:center;
			 }
body
{
background:#a8b2ff;
}

</style>
</head>
<body>

<%
String employee_id=(String) session.getAttribute("employee_id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "payroll";
String userId = "root";
String password = "shruthi";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Leave Report</strong></font></h2>
<br><br>
<table align="center" cellpadding="8" cellspacing="8" border="1">
<tr bgcolor="#DEB887">
<td><b>MONTH</b></td>
<td><b>No of days</b></td>
<td><b>FROM DATE<b></td>
<td><b>TO DATE</b></td>
</tr>
<%
try{ 
	Integer no=0;
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM addleave where employee_id="+employee_id;
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
	no=no+resultSet.getInt("noofdays");
%>
<tr bgcolor="cornsilk">
<td><%=resultSet.getString("month") %></td>
<td><%=resultSet.getString("noofdays") %></td>
<td><%=resultSet.getString("fromdate") %></td>
<td><%=resultSet.getString("todate") %></td>
</tr><br>
<% 
}
out.println("<h2>Total Leave Days in the Current year: "+no+"</h2>");
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>