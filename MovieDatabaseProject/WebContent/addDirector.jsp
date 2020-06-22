<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%
String dir_id=request.getParameter("dir_id");
String dir_fname=request.getParameter("dir_fname");
String dir_lname=request.getParameter("dir_lname");
String dir_gender=request.getParameter("dir_gender");


try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "myproject",
			"oracle123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into director(dir_id,dir_fname,dir_lname,dir_gender)values('"+dir_id+"','"+dir_fname+"','"+dir_lname+"','"+dir_gender+"')");
response.setHeader("refresh","5,admin.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>