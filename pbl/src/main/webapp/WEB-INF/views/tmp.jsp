<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="common/head.jsp" %>
</head>
<body>
	<form method="post">
		<div class="item">
			<input type="text" name="uuid" placeholder="uuid" id="uuid">
			<input type="text" name="origin" placeholder="origin" id="origin">
			<input type="text" name="image" placeholder="image" id="image">
			<input type="text" name="path" placeholder="path" id="path">
			<input type="text" name="odr" placeholder="odr" id="odr">
		</div>
		<div class="item">
			<input type="text" name="uuid" placeholder="uuid" id="uuid">
			<input type="text" name="origin" placeholder="origin" id="origin">
			<input type="text" name="image" placeholder="image" id="image">
			<input type="text" name="path" placeholder="path" id="path">
			<input type="text" name="odr" placeholder="odr" id="odr">
		</div>
		<input type="hidden" name="encodedStr" value="">
		<button>Submit</button>
	</form>
	<script>
		$(function() {
			$("form").submit(function() {
				event.preventDefault();
				const data = [];
				
				$(".item").each(function() {
					const obj = {};
					$(this).find('input').each(function() {
						obj[$(this).attr("name")] = this.value;
					})
					data.push(obj);
				})
				$("[name='encodedStr']").val(JSON.stringify(data));
				this.submit();
			})
		})
	</script>
</body>
</html>