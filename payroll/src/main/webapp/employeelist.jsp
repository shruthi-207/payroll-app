<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ include file="admin.html" %>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
  
}
.column:after {
  float: left;
  width: 20%;
  padding: 10px;
  color:black;
  height: 700px; 
  background-color:#a8b2ff;
}
.row{
  content: "";
  display: table;
  color:black;
  background-color:#a8b2ff;
  clear: both;
}
p
{
color:black;
}
body{
background-color:#a8b2ff;
}
</style>
</head>
<body>
<% String driverName = "com.mysql.jdbc.Driver";
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
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT employee_id,employee_name,employee_dept,employee_designation,employee_contactno,employee_email from employee";  
resultSet = statement.executeQuery(sql);%>
<br><br>
<h2 style="text-align:center">Employee Details</h2>
<table align="center"  cellpadding="8" cellspacing="8" border="2">
<tr bgcolor="#DED887">
<td><b>ID</b></td>
<td><b>NAME</b></td>
<td><b>EMAIL</b></td>
<td><b>CONTACT NUMBER</b></td>
<td><b>DEPARTMENT</b></td>
<td><b>DESIGNATION</b></td>
</tr>
<% 
while(resultSet.next())
{
%>
  <tr bgcolor="cornsilk">
    <td><%=resultSet.getString("employee_id") %></td>
    <td><%=resultSet.getString("employee_name") %></td>
    <td><%=resultSet.getString("employee_email") %></td>
    <td><%=resultSet.getString("employee_contactno") %></td>
    <td><%=resultSet.getString("employee_dept") %></td>
    <td><%=resultSet.getString("employee_designation") %></td>
  </tr>
<%
}
} 
catch (Exception e)
{
e.printStackTrace();
}

%>
</table>
</body>
</html>