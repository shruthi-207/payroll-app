package com.payroll; 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/Dao")
public class Dao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String employee_id=request.getParameter("employee_id");
		String password=request.getParameter("pwd");
		String action=request.getParameter("action");
		String usertype=request.getParameter("usertype");
		if(action != null && action.equals("login"))
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","");
				String s="SELECT * FROM login WHERE employee_id=? and password=? and usertype=?";
				PreparedStatement pstmt=con.prepareStatement(s);
				pstmt.setString(1, employee_id);
				pstmt.setString(2, password);
				pstmt.setString(3, usertype);
				ResultSet rs=pstmt.executeQuery();
				rs.next();	
				if((rs.getString("employee_id")!=null) && (rs.getString("Password").equals(password)) && (rs.getString("usertype").equals("Admin")) && (usertype.equals("Admin")))
				{
					response.sendRedirect("adminpage.jsp");
				}
				else if((rs.getString("employee_id")!=null) && (rs.getString("Password").equals(password)) && (usertype.equals("Employee")))
				{
					HttpSession session = request.getSession();
				 	session.setAttribute("employee_id",employee_id);
					response.sendRedirect("employeeind.jsp");
				}	
			}
			catch(Exception e) {
				System.out.println(e);
				response.sendRedirect("login.html");
			}
		}  
		        
		}
}
	








