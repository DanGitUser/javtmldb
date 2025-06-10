<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {display: flex; justify-content: center}
	th {background-color: #eee}
	table, th, td {border: 1px solid; text-align: center}
	table {border-collapse: collapse; margin: 12px auto}
	th, td {padding: 16px}
	td > a {text-decoration: none; color: #000}
</style>
</head>
<body>
<h1>MVC로 구성한 화면</h1>
<table>
	<tr>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일시</th>
		<th>별점</th>
	</tr>
	<c:forEach items="${reviews}" var="r">
	<tr>
		<td><a href="review.jsp?rno=${r.rno}">${r.content}</a></td>
		<td>${r.writer}</td>
		<td>${r.regdate}</td>
		<td>${r.rating}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>