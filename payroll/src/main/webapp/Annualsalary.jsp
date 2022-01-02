<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ include file="Addsalary.jsp" %>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</head>
<body>
<% 
String eid=request.getParameter("employeeid");
String cttc=request.getParameter("ctc");
String grad=request.getParameter("grade");
String button=request.getParameter("Add salary");
String button1=request.getParameter("Modify salary");
Integer grade=Integer.parseInt(grad);
double ctc=0,basic=0,hra=0,lta=0,epf=0,tax=0;
int food=0,med=0,giftvoucher=0,conv=0;
ctc=Double.parseDouble(cttc);
if(grade==1)
{
	basic=(45/100.0)*ctc;
	hra=(30/100.0)*basic;
	lta=(7/100.0)*basic;
	epf=(12/100.0)*basic;
	tax=(15/100.0)*basic;
	food=30000;
	med=15000;
	giftvoucher=10000;
	conv=19200;
}
else if(grade==2)
{
	basic=(45/100.0)*ctc;
	hra=(30/100.0)*basic;
	lta=(5/100.0)*basic;
	epf=(12/100.0)*basic;
	tax=(10/100.0)*basic;
	food=20000;
	med=15000;
	giftvoucher=5000;
	conv=15000;
}
else if(grade==3)
{
	basic=(45/100.0)*ctc;
	hra=(30/100.0)*basic;
	lta=(3/100.0)*basic;
	epf=(12/100.0)*basic;
	tax=(5/100.0)*basic;
	food=10000;
	med=15000;
	giftvoucher=2000;
	conv=10000;
}
double allowance=hra+lta+conv+food+med+giftvoucher;
double tot=basic+hra+lta+epf+tax+food+conv+giftvoucher;
double bal=ctc-tot;
double ctcper=ctc/100.0;
double fbpper=bal/ctcper;
double deductions=epf+tax;
double fbp=(fbpper/100)*ctc;
double grossyear=tot+fbp;
double netyear=(tot+fbp)-epf-tax;
double grossmonth=(tot+fbp)/12;
double netmonth=((tot+fbp)-epf-tax)/12;

try
{
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","shruthi");
    if(button.equals("Add Salary"))
    {
    Statement stmt = conn.createStatement();
    int result = stmt.executeUpdate("INSERT INTO `annsalary`(`employee_id`, `Grade`, `CTC`, `Basic`, `HRA`, `LTA`, `Conveyance`, `Food`, `Medical`, `Allowance`, `Grossyear`, `EPF`, `Incometax`, `Netyear`, `FBP`, `giftvoucher`,`Deductions`) VALUES ('"+eid+"','"+grade+"','"+ctc+"','"+basic+"','"+hra+"','"+lta+"','"+conv+"','"+food+"','"+med+"','"+allowance+"','"+grossyear+"','"+epf+"','"+tax+"','"+netyear+"','"+fbp+"','"+giftvoucher+"','"+deductions+"')");
    if (result > 0){
    	out.println("<script type = \"text/javascript\">");
    	out.println("alert(\"Salary Added successfully\")");
    	out.println("</script>");
      }	 
    else
    {
    	out.println("<script type = \"text/javascript\">");
    	out.println("alert(\"Insertion failed\")");
    	out.println("</script>");
    }
	}
else if(button1.equals("Modify Salary"))
{
	 PreparedStatement ps;
	 String sql="Update annsalary set Grade=?,CTC=?,Basic=?,HRA=?,LTA=?,Conveyance=?,Food=?,Medical=?,Allowance=?,Grossyear=?,EPF=?,IncomeTax=?, Netyear=?, FBP=?,giftvoucher=?,deductions=? where employee_id="+eid;
	 ps = conn.prepareStatement(sql);
	 	ps.setInt(1,grade);
		ps.setDouble(2,ctc); 
		ps.setDouble(3, basic);
		ps.setDouble(4, hra);
		ps.setDouble(5, lta);
		ps.setInt(6, conv);
		ps.setInt(7, food);
		ps.setDouble(8, med);
		ps.setDouble(9, allowance);
		ps.setDouble(10, grossyear);
		ps.setDouble(11,epf);
		ps.setDouble(12,tax);
		ps.setDouble(13,netyear);
		ps.setDouble(14,fbp);
		ps.setDouble(15,giftvoucher);
		ps.setDouble(16, deductions);
		int i = ps.executeUpdate();
		if(i>0)
		{
			out.println("<script type = \"text/javascript\">");
	    	out.println("alert(\"Salary updated successfully\")");
	    	out.println("</script>");
	      }	 
	    else
	    {
	    	out.println("<script type = \"text/javascript\">");
	    	out.println("alert(\"Updation failed\")");
	    	out.println("</script>");
	    }
	conn.close();
    response.sendRedirect("Modifysalary.jsp");
}
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
</html>