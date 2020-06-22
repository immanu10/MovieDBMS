<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";

String userid = "myproject";
String password = "oracle123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Ratings</title>
</head>
<body>
<style>
* {
  box-sizing: border-box;
}

/* Style the body */
body {
  font-family: Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	background: url(Backimg.jpg);
	background-size: cover;
	color:white;
	text-align:center;

}
.tb
{
  float:left;
  margin-left:38%;
}

</style>
<h1>Fans Ratings</h1>

<table class="tb" border="1">
	<tr>
	<td>MovieID</td>
	<td>AVG Rating</td>
	<td>Sum Rating</td>
	<td>No of Rating</td>
	
	
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from fanrating";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("mov_id") %></td>
<td><%=resultSet.getString("rate_avg") %></td>
<td><%=resultSet.getString("rate_sum") %></td>
<td><%=resultSet.getString("rate_count") %></td>


</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>