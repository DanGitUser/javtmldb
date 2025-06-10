<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="calc_result.jsp">
		<input name="num1">
		<input name="num2">
		<button>Send</button>
		<button formaction="calcServ">To Servlet</button>
	</form>
	<h3><%=request.getParameter("v") %></h3>
</body>
</html>