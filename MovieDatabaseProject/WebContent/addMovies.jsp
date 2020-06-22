<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%
String mov_id=request.getParameter("mov_id");
String mov_title=request.getParameter("mov_title");
String mov_year=request.getParameter("mov_year");
String mov_lang=request.getParameter("mov_lang");
String dir_id=request.getParameter("dir_id");


try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "myproject",
			"oracle123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into movie(mov_id,mov_title,mov_year,mov_lang,dir_id)values('"+mov_id+"','"+mov_title+"','"+mov_year+"','"+mov_lang+"','"+dir_id+"')");
response.setHeader("refresh","5,admin.html");
}
catch(Exception e)
{
System.out.print(e);
response.setHeader("refresh","5,error.html");
e.printStackTrace();
}
%>