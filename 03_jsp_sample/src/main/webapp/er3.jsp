<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  if(exception.getClass() == ArithmeticException.class) {
	  out.println("<h3>Inputed Nubmers cannot be divided by 0</h3>");
  } else if (exception.getClass() == NumberFormatException.class) {
	  out.println("<h3>Input correct type</h3>");
  } else {
	  out.println("<h3>Unknow Error</h3>");	  
  }
%>
</body>
</html>