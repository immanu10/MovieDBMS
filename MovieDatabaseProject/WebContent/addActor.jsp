<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%
String act_id=request.getParameter("act_id");
String act_fname=request.getParameter("act_fname");
String act_lname=request.getParameter("act_lname");
String act_gender=request.getParameter("act_gender");


try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "myproject",
			"oracle123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into actor(act_id,act_fname,act_lname,act_gender)values('"+act_id+"','"+act_fname+"','"+act_lname+"','"+act_gender+"')");
response.setHeader("refresh","5,admin.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>