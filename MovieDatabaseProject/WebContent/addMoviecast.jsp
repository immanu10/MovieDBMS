<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%
String act_id=request.getParameter("act_id");
String mov_id=request.getParameter("mov_id");

String role=request.getParameter("role");


try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "myproject",
			"oracle123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into movie_cast(act_id,mov_id,role)values('"+act_id+"','"+mov_id+"','"+role+"')");
response.setHeader("refresh","5,admin.html");
}
catch(Exception e)
{
System.out.print(e);
response.setHeader("refresh","5,error.html");
e.printStackTrace();
}
%>