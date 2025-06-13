<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="새똥이" src="img.jsp" width="100px">
	<form>
		<select name="year">
		<% for(int i = 1900; i <= 2025; i++) { 
				if (i == 2025) {
					out.println("<option selected>" + i + "</option>");
				} else { 
					out.println("<option>" + i + "</option>");
				}
			}
		%>
		</select>
		<select name="month">
		<% for(int i = 1; i <= 12; i++) { %>
			<option><%=i%></option>
		<% } %>
		</select>
		<select name="date">
		<% for(int i = 1; i <= 30; i++) { %>
			<option><%=i%></option>
		<% } %>
		</select>
		<button>Send</button>
	</form>
	<%
		String year = request.getParameter("year");
	if (year == null) {
		return;
	}
	
	int y = Integer.parseInt(year);
	if (2025 - y < 20) {
		out.println("Underage");
	} else {
		out.println("Adult");
	}
	%>
</body>
</html>