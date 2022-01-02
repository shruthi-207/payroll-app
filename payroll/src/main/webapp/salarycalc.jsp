<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %> <%@ include file="admin.html" %>
 <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Salary</title>
<style>
.center {
  margin: auto;
  width: 40%;
  padding: 25px;
  background: cornsilk;
}
body
{
background:#a8b2ff;
}
</style>
</head>
<body>
<%
String eid=session.getAttribute("Eid").toString(); 
String month=session.getAttribute("Month").toString();
String year=session.getAttribute("Year").toString();
double basic=0,allowance=0,grossmonth=0,netmonth=0,deductions=0;
int leave=0;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","shruthi");
    System.out.println(month);
    String sql="Select noofdays from addleave where month=? and year= ?";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,month);
    pstmt.setString(2,year);
    rs = pstmt.executeQuery();
    while(rs.next())
    {
    leave=leave+rs.getInt("noofdays");
   }
    
    String SQL="Select basic,allowance,Grossyear,netyear,deductions from annsalary where employee_id="+eid;
    stmt=conn.createStatement();
    rs=stmt.executeQuery(SQL);
    rs.next();
    basic=rs.getDouble("Basic")/12;
    allowance=rs.getDouble("Allowance")/12;
    grossmonth=rs.getDouble("Grossyear")/12;
    deductions=rs.getDouble("Deductions")/12;
    netmonth=rs.getDouble("Netyear")/12;
    int result = stmt.executeUpdate("INSERT INTO `monthsalary`(`employee_id`, `Basic`, `Allowance`, `Grossmonth`, `Netmonth`,`Deductions`,`month`,`year`,`leavetaken`) VALUES ('"+eid+"','"+basic+"','"+allowance+"','"+grossmonth+"','"+netmonth+"','"+deductions+"','"+month+"','"+year+"','"+leave+"')");
        if (result > 0){
        	out.println("<script type = \"text/javascript\">");
        	out.println("alert(\"Salary Generated successfully\")");
        	out.println("</script>");
          }	
        else
        {
        	out.println("<script type = \"text/javascript\">");
        	out.println("alert(\"Error in generating salary\")");
        	out.println("</script>");
        }
}     
	catch(Exception e)
    {
    	System.out.println(e);
    }		

%>
<br><br>
<h2 style="margin-left:35%">Employee Salary Details</h2><br><br>
<% 
try{
stmt=conn.createStatement();
String sql="Select employee_id,Basic,Allowance,Grossmonth,Deductions,Netmonth,month from monthsalary where employee_id= "+eid;
rs=stmt.executeQuery(sql);
rs.next();
}catch(Exception e)
{
	System.out.println(e);
}
%>
<div class="center">
<h2><%=rs.getString("month") %></h2>
<table >
<tr><th>Employee ID</th><th>&ensp;&ensp;<%=rs.getInt("employee_id")%></th><tr>
<tr><th>Basic</th><th>&ensp;&ensp;<%=rs.getDouble("basic")%></th></tr>
<tr><th>Allowance</th><th>&ensp;&ensp;<%=rs.getDouble("allowance") %></th></tr>
<tr><th>Gross</th><th>&ensp;&ensp;<%=rs.getDouble("grossmonth")%></th></tr>
<tr><th>Deductions</th><th>&ensp;&ensp;<%=rs.getDouble("deductions") %></th></tr>
<tr><th>Net Pay(Total)</th><th>&ensp;&ensp;<%=rs.getDouble("netmonth")%></th></tr>
</table>
</div>
</body>
</html>