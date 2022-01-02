<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Employee.jsp" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body
{
background: #a8b2ff;
}
.center {
  margin: auto;
  width: 50%;
  padding: 25px;
}
p
{
font-size:15px;
}
</style>

</head>
<body>
<%
String employee_id = session.getAttribute("employee_id").toString();
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
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM employee WHERE employee_id="+employee_id;  
resultSet = statement.executeQuery(sql); 
%>
	
<%while(resultSet.next())
{
%>
<div class="center">
<p>
ID:<input type="text" name="employee_id" id="employee_id" value="<%=resultSet.getString("employee_id") %>">
</p>
<p>
NAME:<input type="text" name="employee_name" id="employee_name" value="<%=resultSet.getString("employee_name") %>">
</p>
<p>
EMAIL:<input type="text" name="employee_email" id="employee_email" value="<%=resultSet.getString("employee_email") %>">
</p>
<p>
AGE:<input type="text" name="employee_age" id="employee_age" value="<%=resultSet.getString("employee_age") %>">
</p>
<p>
GENDER:<input type="text" name="employee_gender" id="employee_gender" value="<%=resultSet.getString("employee_gender") %>">
</p>
<p>
CONTACT NUMBER<input type="text" name="employee_contactno" id="employee_contactno" value="<%=resultSet.getString("employee_contactno") %>">
</p>
<p>
TEAM NAME:<input type="text" name="employee_dept" id="employee_dept" value="<%=resultSet.getString("employee_dept") %>">
</p>
<p>
DESIGNATION<input type="text" name="employee_designation" id="employee_designation" value="<%=resultSet.getString("employee_designation") %>">
</p>
<p>
CTC:<input type="text" name="employee_ctc" id="employee_ctc" value="<%=resultSet.getString("employee_ctc") %>">
</p>
<p>
JOINED DATE<input type="text" name="employee_dateofjoin" id="employee_dateofjoin" value="<%=resultSet.getString("employee_dateofjoin") %>">
</p>
<p>
BANK NAME<input type="text" name="bankname" id="bankname" value="<%=resultSet.getString("bankname") %>">
</p>
<p>
ACCOUNT NO:<input type="text" name="accountno" id="accountno" value="<%=resultSet.getString("accountno") %>">
</p>
<p>
IFSC CODE<input type="text" name="ifsccode" id="ifsccode" value="<%=resultSet.getString("ifsccode") %>">
</p>
<input type="submit" value="UPDATE">
</div>
<%
}
} 
catch (Exception e)
{
e.printStackTrace();
}
%>
</body>
</html>
