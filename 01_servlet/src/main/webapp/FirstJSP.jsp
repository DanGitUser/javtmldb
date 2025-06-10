<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSP style</h2>
	<h2>JSP style edit</h2>
	<% String name = "Leeroy"; %>
	<%
	for(int i = 1; i <= 10; i++) {
		out.print("<p>" + i);
	}
	%>
	<h3><%=name%></h3>
</body>
</html>