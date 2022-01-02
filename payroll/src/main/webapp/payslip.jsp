<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="payslipindex.jsp" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payslip</title>
<style>
* {
  box-sizing: border-box;
  
}
.column {
  
  width: 50%;
  padding: 20px;
  height: 400px; 
  font-size: 18px;
  background-color:cornsilk;
}

.row:after {
  content: "";
  display: table;
  background-color:#a8b2ff;
  clear: both;
}
 .center {
  margin-left:auto;
  width: 50%;
  padding: 25px;
}
body{
background-color:#a8b2ff;
}
p
{
font-family:verdana;
}

</style>
</head>
<body>
<%
String employee_id = session.getAttribute("employee_id").toString();
String month=request.getParameter("month");
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
PreparedStatement pstmt=null;
PreparedStatement pstmt1=null;
ResultSet resultSet = null;
ResultSet resultSet1 = null;
%>

<h2 align="center"><font><strong>Salary Payslip</strong></font></h2>
<br>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="SELECT * FROM monthsalary where employee_id=? and month=?";
pstmt=connection.prepareStatement(sql);
pstmt.setString(1,employee_id);
pstmt.setString(2,month);
resultSet = pstmt.executeQuery();
String sql1="SELECT * FROM annsalary where employee_id=?";
pstmt1=connection.prepareStatement(sql1);
pstmt1.setString(1,employee_id);
resultSet1 = pstmt1.executeQuery();
while(resultSet.next())
{
%>

<%while(resultSet1.next())
{%>
<div class="center">
<div class="row">
  <div class="column" >
    <h2>Details</h2>
   	 	<p>Grade</p><p>CTC</p><p>Basic</p><p>Allowance</p><p>Deduction</p><p>Gross Pay</p><p>Net Pay</p>	
  </div>
   <div class="column" >
    <h2>Description</h2>
<p><%=resultSet1.getString("Grade") %></p>
<p><%=resultSet1.getString("CTC") %></p>
<%} %>
<p><%=resultSet.getString("Basic") %></p>
<p><%=resultSet.getString("Allowance") %></p>
<p><%=resultSet.getString("Deductions") %></p>
<p><%=resultSet.getString("Grossmonth") %></tp>
<p><%=resultSet.getString("Netmonth") %></p>
   </div>
 </div>
 </div>
<br>
<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>