<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Employee.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
  
}

.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 700px; 
  font-size: 20px;
  
  background-color:cornsilk;
}

.row:after {
  content: "";
  display: table;
  background-color:#a8b2ff;
  clear: both;
}
body{
background-color:#a8b2ff;
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
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM employee WHERE employee_id="+employee_id;  
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
%>
<div class="row">
  <div class="column" >
    <h2>Employee Details</h2>
   	 	<p>ID</p><p>NAME</p><p>EMAIL</p><p>AGE</p><p>GENDER</p><p>CONTACT NUMBER</p><p>DEPARTMENT</p><p>DESIGNATION</p>  
   	 	<p>CTC</p><p>DATE OF JOIN</p><p>BANK NAME</p><p>ACCOUNT NUMBER</p><p>IFSC CODE</p> 	
  </div>

  <div class="column" >
    <h2>Description</h2>
    <p><%=resultSet.getString("employee_id") %></p>
    <p><%=resultSet.getString("employee_name") %></p>
    <p><%=resultSet.getString("employee_email") %></p>
    <p><%=resultSet.getString("employee_age") %></p>
    <p><%=resultSet.getString("employee_gender") %></p>
    <p><%=resultSet.getString("employee_contactno") %></p>
    <p><%=resultSet.getString("employee_dept") %></p>
    <p><%=resultSet.getString("employee_designation") %></p>
    <p><%=resultSet.getString("employee_ctc") %></p>
     <p><%=resultSet.getString("employee_dateofjoin") %></p>
    <p><%=resultSet.getString("bankname") %></p>
    <p><%=resultSet.getString("accountno") %></p>
    <p><%=resultSet.getString("ifsccode") %></p>
     </div>
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