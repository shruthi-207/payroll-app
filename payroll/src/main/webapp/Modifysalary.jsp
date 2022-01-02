<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="admin.html" %> 
    <html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Salary</title>
</head>
<style>
.center {
  margin: auto;
  width: 50%;
  padding: 40px;
}
body
{
background : #a8b2ff;
}
table, tr,td
{
border: 2px solid black;
}
</style>
<body>
<div class="center">
<fieldset style="background:#a8b2ff;">
	<legend style="font-family:verdana; color: #3f2b96">MODIFY EMPLOYEE SALARY</legend>
<form action="Annualsalary.jsp" method="POST">
	<label for="employeeid">Enter Employee ID</label>
	<input type="text" name="employeeid"><br><br>
	<label for="ctc">Enter Modified CTC</label>
	<input type="text" name="ctc"><br><br>
	<label for="grade">Enter Modified Grade</label>
	<input type="text" name="grade"><br><br>
	<input type="submit" name="Modify salary" value="Modify Salary" style="background:blue; color:white" >
	</form>
	</fieldset><br><br>
	<table>
	<tr>
	<th style="text-align:center">Grade Table</th>
	</tr>
	<tr>
	<th>CTC less than 450000</th>
	<th>&ensp;&ensp;Grade 3</th>
	<tr>
	<tr>
	<th>CTC between 450000 to 700000</th>
	<th>&ensp;&ensp;Grade 2</th><tr>
	<tr>
	<th>CTC greater than 700000</th>
	<th>&ensp;&ensp;Grade 1</th><tr>
	</table>
	</div>
	
</body>
</html>