<%@ include file="admin.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Salary</title>
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

</style>
<script type="text/javascript">
function myFunction() {
	var todaydate = new Date();
	var year = todaydate.getFullYear();
	document.getElementById('year').value= year;
}
</script>
</head>
<body onload="myFunction()">
<div class="center">
<fieldset style="background:#a8b2ff;">
	<legend style="font-family:verdana; color: #3f2b96">GENERATE SALARY</legend>
	<form action="salary.jsp" method="POST">
	<label for="employeeid">Employee ID</label>
	<input type="text" name="employeeid"><br><br>
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
  </select><br><br>
  <label for="year">Year</label>
  <input type="text" name="year" id="year" value="">

<br><br>
<input type="submit" value="Submit" style="background:blue; color:white">
	</form>
</fieldset>
</div>
</body>
</html>