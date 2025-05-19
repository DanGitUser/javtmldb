<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap-grid.min.css">
</head>
<style>
	legend {text-align: center}	
	p {text-align: center}
	input {align: center}
	label {text-align: center}
</style>
<body>
	<form method="post" class="container">
		<fieldset>
			<legend class="my-5">SignUp</legend>
			<p>
				<label for="id" class="form-label">ID</label>
			</p>
			<input name="id" id="id" class="form-control mb-5">
			<p>
				<label for="pw" class="form-label">PW</label>
			</p>
			<input name="pw" type="password" class="form-control mb-5">
			<p>
				<label for="name" class="form-label">NAME</label>
			</p>
				<input name="name" id="name" class="form-control mb-5">
			<div class="d-grid">
				<button type='submit' class="btn btn-outline-info btn-block">SignUp</button>
			</div>				
		</fieldset>
	</form>
</body>
</html>