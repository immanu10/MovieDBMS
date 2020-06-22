<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<%
	String userid = request.getParameter("userid");
	session.putValue("userid", userid);
	String password = request.getParameter("password");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","myproject","oracle123");
	Statement st = con.createStatement();
	ResultSet rs = st
			.executeQuery("select * from users where userid='" + userid + "' and password='" + password + "'");
	try {
		rs.next();
		if (rs.getString("password").equals(password) && rs.getString("userid").equals(userid)) {
			response.sendRedirect("newsample.html");
		}
		
		else {
			out.print("invalid userid or password");
		
		}
	} catch (Exception e) {
		e.printStackTrace();
		response.setHeader("refresh","5,invalid.html");
	}
%>