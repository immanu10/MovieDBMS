<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin login check</title>
</head>
<body>
  <%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    if((username.equals("manoj")&&password.equals("adminmanoj")))
    {
    	response.sendRedirect("admin.html");
    }else
    {
    	out.println("unauthorised ADMIN!Please try again <a href='adminlogin.html'>adminLogin</a> to continue.");
    }
  %>

</body>
</html>