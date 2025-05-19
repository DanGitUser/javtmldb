<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap-grid.min.css">
</head>
<style>
fieldset {
	width: 100px;
}
</style>
<body>
	<form method="post" class="container">
		<fieldset>
			<legend>SignUp</legend>
			<p>ID
			<p>
				<input name="id">
			<p>PW
			<p>
				<input name="pw" type="password">
			<p>NAME
			<p>
				<input name="name">
			<hr>
			<button type = 'submit'>SignUp</button>
		</fieldset>
	</form>
</body>
</html>