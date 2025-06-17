<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%--
	<%@ %> : directive 지시어
	<% %> : scriptlet 스크립트 구문
	<%! !%> : declare 선언부
	<%= %> : expression 표현식
	
	contentType : 브라우저 에서 해석될 MIME TYPE
	(When Charset is not included, defaults to iso-8859-1)
	
	pageEncoding : declares which charset a file is to be saved as.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=new Date()%></h2>
	<h3><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></h3>
	<%!
	  static int si = 10;
	  int m() {
		  for(int i = 1; i > 100; i++) {
			  
		  }
		  return m();
	  }
	%>
	<h3><%=m() + m()%></h3>
</body>
</html>