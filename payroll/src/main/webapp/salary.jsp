<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="salaryindex.jsp" %>
 <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Salary</title>
<style>
 body{
 background:#a8b2ff;
 }
 .center {
  margin: auto;
  width: 50%;
  padding: 25px;
}
table
{
 border: 2px solid rgb(72,70,202);
  border-color:rgb(72,70,202);
}
</style>
</head>
<body >
<%
String id = request.getParameter("employeeid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/payroll";
String userid = "root";
String password = "shruthi";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select employee_name,employee_ctc,employee_grade,accountno from employee where employee_id="+id;
rs = statement.executeQuery(sql);
rs.next();
System.out.println("From db:"+rs.getString("employee_name")+" "+rs.getDouble("employee_ctc")+" "+rs.getString("accountno")+" ");
}catch(Exception e)
{
	response.sendRedirect("salaryindex.jsp");
	System.out.println(e);
}
%>
<h1>Employee Details</h1><br><br>
<div class="center">
<table >
<tr><th>Employee Name</th><th><%=rs.getString("employee_name") %></th></tr>
<tr><th>CTC</th><th><%=rs.getDouble("employee_ctc") %></th></tr>
<tr><th>Grade</th><th><%=rs.getInt("employee_grade") %></th></tr>
<tr><th>Account No</th><th><%=rs.getString("accountno")%></th></tr>
</table><br><br>

<form action="salarycalc.jsp" method="POST">
<%Double ctc= rs.getDouble("employee_ctc") ;
String year=request.getParameter("year");
String mon=request.getParameter("month");
Integer grade=rs.getInt("employee_grade");
session.setAttribute("Eid",id);
session.setAttribute("Month", mon);
session.setAttribute("Year",year);
%>
<input type="submit" value="Generate Salary" style="background:blue; color:white; align:center">
</form>
</div>
</body>
</html>