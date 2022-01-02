<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="admin.html" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
</head>
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
<body>
<div class="center">
<fieldset>
<form action="insertemp.jsp" method="post">
	<label for="name">NAME : </label>
	<input type="text" name="name" id="name"><br><br>
	<label for="email">EMAIL : </label>
	<input type="email" name="email" id="email"><br><br>
	<label for="age">AGE : </label><input type="number" name="age" id="age"><br><br>
	<label for="gender">GENDER :</label>
<select name="gender" id="gender">
  <option value="male">Male</option>
  <option value="female">Female</option>
  <option value="others">Others</option>
</select>

<label for="contact">CONTACT NUMBER : </label><input type="tel" name="contact" id="contact"><br><br>

<label for="team">DEPARTMENT : </label><input type="text" name="team" id="team"><br><br>

<label for="grade">GRADE : </label><input type="text" name="grade" id="grade"><br><br>

<label for="designation">DESIGNATION : </label><input type="text" name="designation" id="designation"><br><br>

<label for="ctc">CTC : </label><input type="text" name="ctc" id="ctc"><br><br>

<label for="dof">DATE OF JOIN : </label><input type="date" name="dof" id="dof"><br><br>

<label for="bank_name">BANK NAME : </label><input type="text" name="bank_name" id="bank_name"><br><br>

<label for="account_number">ACCOUNT NUMBER :</label><input type="number" name="account_number" id="account_number"><br><br>

<label for="ifsc_code">IFSC CODE : </label><input type="text" name="ifsc_code" id="ifsc_code"><br><br>

<input type="submit" name="submit" value="Submit" class="btn btn-info">
</form>
</fieldset>
</div>
</body>
</html>