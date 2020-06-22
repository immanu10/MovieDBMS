<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String userid=request.getParameter("userid");
String password=request.getParameter("password");
try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "myproject",
				"oracle123");
		Statement st = conn.createStatement();
		int i = st.executeUpdate("insert into users(fname,lname,email,userid,password)values('" + fname + "','"
				+ lname + "','" + email + "','" + userid + "','" + password + "')");
	response.setHeader("refresh","5,index.html");

	} catch (Exception e) {
		
		response.setHeader("refresh","5,invalidreg.html");
		System.out.print(e);
		e.printStackTrace();
	}
%>