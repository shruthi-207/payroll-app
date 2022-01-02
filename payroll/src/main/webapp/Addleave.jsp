<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="admin.html" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add leave</title>

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
			 form {
  width: 80%;
  margin: 0 auto;
}
body{
 background:#a8b2ff;
 }
 .center {
  margin: auto;
  width: 50%;
  padding: 25px;
}


label+input,label+select {
  width: 30%;
  margin: 0 30% 0 4%;
}
input[type=submit]{
	margin-left: 180px;
}
</style>
</head>
<body>
<div class="center">
<form action="insertleave.jsp" method="POST">
<label for="employeeid">Employee ID</label>
	<input type="text" name="employeeid"><br><br>
<label for="reason">Reason: </label>
<select name="reason" id="reason">
<option value="casual">Casual Leave</option>
<option value="maternity">Maternity Leave</option>
<option value="sick">Sick Leave</option>
<option value="lta">leave travel allowance</option>
</select>
<br><br>
<label for="month">Month</label>
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
  </select>
<br><br>
<label for="fromdate">From date:</label>
  <input type="date" id="=fromdate" name="fromdate">
  <br><br>
  <label for="todate">To date :</label>
  <input type="date" id="todate" name="todate">
  <br><br>
 No of Days: <input type="number" name="noofdays" id="noofdays"><br><br><br>
<input type="submit" name="submit" value="Submit" class="btn btn-info">
</form>
</div>
</body>
</html>