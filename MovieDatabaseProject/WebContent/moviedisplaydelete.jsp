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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
position: absolute;
	top: 20%;
	left:30%;
	margin-right: 50px;
}

</style>
<h1>Delete Movie info from database</h1>
<table class="tb" border="1">
<tr>
<td>Movie ID</td>
<td>Movie Title</td>
<td>Movie Year</td>
<td>Movie Language</td>
<td>Director ID</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from movie";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("mov_id") %></td>
<td><%=resultSet.getString("mov_title") %></td>
<td><%=resultSet.getString("mov_year") %></td>
<td><%=resultSet.getString("mov_lang") %></td>
<td><%=resultSet.getString("dir_id") %></td>
<td><a href="delete.jsp?mov_id=<%=resultSet.getString("mov_id") %>"><button type="button" class="delete">Delete</button></a></td>
</tr>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>