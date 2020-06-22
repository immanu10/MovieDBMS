<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String userid=request.getParameter("userid");
String mov_id=request.getParameter("mov_id");
String rating=request.getParameter("rating");



try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "myproject",
			"oracle123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into rating(userid,mov_id,rev_star)values('"+userid+"','"+mov_id+"','"+rating+"')");
response.setHeader("refresh","5,rating.html");
}
catch(Exception e)
{
	out.println("Invalid USERID or Movie ID!Please try Rating again <a href='rating.html'>Rate Again</a> to continue.");
System.out.print(e);
e.printStackTrace();
}
%>

