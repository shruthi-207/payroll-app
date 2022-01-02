<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Employee.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payslip</title>
<style>
body{
 background:#a8b2ff;
 }
 .center {
  margin: auto;
  width: 50%;
  padding: 25px;
}
</style>
</head>
<body>
<div class="center">
<form action="payslip.jsp" method="post">
<label for="month" >Select Month</label>
<select name="month" id="month" style="margin-left:20px">
  <option value="January">January</option>
  <option value="February">February</option>
  <option value="March">March</option>
  <option value="April">April</option>
   <option value="May">May</option>
  <option value="June">June</option>
  <option value="July">July</option>
  <option value="August">August</option>
   <option value="September">September</option>
  <option value="October">October</option>
  <option value="November">November</option>
  <option value="December">December</option>
  </select><br><br>
  <input type="submit" name="submit" value="Submit" class="btn btn-info">
</form>
</div>
</body>
</html>