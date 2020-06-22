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
  margin-left:435px;
}
</style>

<h1>Movie Details!!</h1>

<table class="tb" border="1">
	<tr>
	<td>Movie Id</td>
	<td>Movie Name</td>
	<td>Movie year</td>
	<td>Movie language</td>
	<td>Director id</td>
	
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from movie";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("mov_id") %></td>
<td><%=resultSet.getString("mov_title") %></td>
<td><%=resultSet.getString("mov_year") %></td>
<td><%=resultSet.getString("mov_lang") %></td>
<td><%=resultSet.getString("dir_id") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>