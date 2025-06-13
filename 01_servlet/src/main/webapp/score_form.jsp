<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input name="kor">
		<input name="math">
		<input name="eng">
		<button>Send</button>
	</form>
	<%
		String kor = request.getParameter("kor");
		String math = request.getParameter("math");
		String eng = request.getParameter("eng");
	if (kor != null && math != null && eng != null) {
		int total = Integer.parseInt(kor) + Integer.parseInt(math) + Integer.parseInt(eng);
		double avg = total / 3.0;
	%>
	<p><%=total%></p>
	<p><%=avg%></p>
	<%
	}
	%>
</body>
</html>