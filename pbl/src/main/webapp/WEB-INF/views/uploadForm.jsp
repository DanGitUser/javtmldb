<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/head.jsp" %>
</head>
<body>
	<div class="container">
		<form method="post" enctype="multipart/form-data" id="uploadForm">
			<div class="d-grid my-2">
				<label class="btn btn-info">Attach file <input type="file" name="f1" multiple class="d-none"></label>
			</div>
			<button class="btn btn-primary btn">Submit</button>
		</form>
	</div>
	<script>
	$(function() {
		$("#uploadForm").submit(function () {
			event.preventDefault();
			const formData = new FormData(this);
			console.log(formData);
			
			$.ajax({
				url : '${cp}/upload',
				method : 'Post',
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					console.log(data);
					for (let a in data) {						
					$(".container").append("<p>" + data[a].origin + "<p>");
					}
				}
			})
		});
	});
	</script>
</body>
</html>