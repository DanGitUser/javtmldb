<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MAIN PAGE</h1>
	<% if(session.getAttribute("member") == null)  { %>
	<p><a href = "signup">SignUp</a></p>
	<p><a href = "signin">LogIn</a></p>
	<% } else { %>
	<p>$Welcome {member.name}</p>
	<p><a href = "signout">LogOut</a></p>
	<% } %>
</body>
</html>