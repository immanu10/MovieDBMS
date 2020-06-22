<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String mov_id=request.getParameter("mov_id");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "myproject", "oracle123");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM movie WHERE mov_id ="+mov_id);
response.setHeader("refresh","5,admin.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>