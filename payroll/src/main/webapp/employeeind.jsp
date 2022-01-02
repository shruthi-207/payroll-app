<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="Employee.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee</title>
</head>
    <title>Employee</title>
    <body style=background-color: darkblue ">
<% 
if(session.getAttribute("employee_id")!=null){
String employee_id=(String) session.getAttribute("employee_id");
%>
            <h3>Welcome!! </h3>
            Check your payslips and your salary related allowances at your ease.
            <br>
            <h2>
                MAKING LIVES SIMPLER!!!
            </h2>
            <div style="margin-left:20px">
            <img src="https://www.commbox.io/wp-content/uploads/2019/10/32-1-1024x597.jpg" width="600" height="400">
                <img src="https://static.businessworld.in/article/article_extra_large_image/1598082827_j1CeH4_upskilling_employees_in_the_world_of_digital_transformation_how_to_retain_and_engage_your_workforce_1024x574.png" width="600" height="400">
                <br><Br><br>
                </div>
        <div>
           <h3 align="center"> Access all your details by a single click!!! </h3>
            <h1>
                Hurry Up and check now!!
            </h1>
        </div>
<%
}else{
response.sendRedirect("login.html");
} 
%>
</body>
</html>