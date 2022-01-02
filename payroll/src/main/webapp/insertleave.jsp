<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Addleave.jsp" %> 
      <%@page import="java.sql.*" %>
      <%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<% 
String eid=request.getParameter("employeeid");
String fromdate=request.getParameter("fromdate");
String todate=request.getParameter("todate");
String month=request.getParameter("month");
String noofdays=request.getParameter("noofdays");
Date d=new Date();
int year=d.getYear()+1900;
try
{
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","shruthi");
    Statement stmt = conn.createStatement();
    int result = stmt.executeUpdate("INSERT INTO `addleave`(`employee_id`, `fromdate`, `todate`, `noofdays`, `month`, `year`) VALUES ('"+eid+"','"+fromdate+"','"+todate+"','"+noofdays+"','"+month+"','"+year+"')");
    System.out.println(result);
    if (result > 0){
    	out.println("<script type = \"text/javascript\">");
    	out.println("alert(\"Leave Added successfully\")");
    	out.println("</script>");
      }	
}
catch(Exception e)
{
	System.out.println(e);
}
    %>