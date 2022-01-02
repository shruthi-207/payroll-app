<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="Addemp.jsp" %> 
      <%@page import="java.sql.*" %>
      <%@page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add employee</title>
</head>
<body>
<%@page import="java.sql.*,java.text.SimpleDateFormat" %>
<%Connection con=null;
String dbname="payroll";
String url="jdbc:mysql://localhost:3306/"+dbname;
String uname="root";
String pass="shruthi"; 
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection(url,uname,pass);
String sql="insert into employee(employee_name,employee_email,employee_age,employee_gender,employee_contactno,employee_dept,employee_ctc,employee_designation,employee_grade,employee_dateofjoin,bankname,accountno,ifsccode) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
ps.setString(1,request.getParameter("name"));
ps.setString(2,request.getParameter("email"));
ps.setInt(3,Integer.parseInt(request.getParameter("age")));
ps.setString(4,request.getParameter("gender"));
ps.setLong(5,Long.parseLong(request.getParameter("contact")));
ps.setString(6,request.getParameter("team"));
ps.setInt(7,Integer.parseInt(request.getParameter("grade")));
ps.setString(8,request.getParameter("designation"));
ps.setFloat(9,Float.parseFloat(request.getParameter("ctc")));
ps.setDate(10,Date.valueOf(request.getParameter("dof")));
ps.setString(11,request.getParameter("bank_name"));
ps.setString(12,request.getParameter("account_number"));
ps.setString(13,request.getParameter("ifsc_code"));
int i=ps.executeUpdate();
if(i==1)
	out.println("<script type = \"text/javascript\">");
out.println("alert(\"Employee added successfully\")");
out.println("</script>");
%>
</body>
</html>