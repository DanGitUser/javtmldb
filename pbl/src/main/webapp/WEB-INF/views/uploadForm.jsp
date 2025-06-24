<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/head.jsp" %>
</head>
<body>
	<div class="container">
		<div class="d-grid my-2 attach-area">
			<label class="btn btn-info">Attach file <input type="file" multiple class="d-none" id="f1"></label>
			<ul class="list-group my-3 attatch-list">
  				<li class="list-group-item d-flex align-items-center justify-content-between">First item <i class="fa-regular fa-circle-xmark float-end text-danger"></i></li>
  				<li class="list-group-item d-flex align-items-center justify-content-between">Second item <i class="fa-regular fa-circle-xmark float-end text-danger"></i></li>
  				<li class="list-group-item d-flex align-items-center justify-content-between">Third item <i class="fa-regular fa-circle-xmark float-end text-danger"></i></li>
			</ul>

			<div class="row justify-content-around w-75 mx-auto attach-thumb">
				<div class="my-2 col-sm-4 col-lg-2"><div style="height: 150px" class="my-2 bg-primary" ><i class="fa-regular fa-circle-xmark float-end text-danger mx-auto"></i></div></div>
				<div class="my-2 col-sm-4 col-lg-2"><div style="height: 150px" class="my-2 bg-info" ><i class="fa-regular fa-circle-xmark float-end text-danger mx-auto"></i></div></div>
				<div class="my-2 col-sm-4 col-lg-2"><div style="height: 150px" class="my-2 bg-warning" ><i class="fa-regular fa-circle-xmark float-end text-danger mx-auto"></i></div></div>
				<div class="my-2 col-sm-4 col-lg-2"><div style="height: 150px" class="my-2 bg-secondary" ><i class="fa-regular fa-circle-xmark float-end text-danger mx-auto"></i></div></div>
				<div class="my-2 col-sm-4 col-lg-2"><div style="height: 150px" class="my-2 bg-success" ><i class="fa-regular fa-circle-xmark float-end text-danger mx-auto"></i></div></div>
			</div>
		</div>
	</div>
	<script>
	$(function() {

		// return true, false
		function validateFiles(files) {
			const MAX_COUNT = 5;
			const MAX_FILE_SIZE = 10 * 1024 * 1024;
			const MAX_TOTAL_SIZE = 50 * 1024 * 1024;
			const BLOCK_EXT= ['exe', 'sh', 'jsp', 'java', 'class', 'html', 'js']
			
			if (files.length > MAX_COUNT) {
				alert('Maximum of 5 files');
				return false;
			}

			let totalSize = 0;
			const isValid = files.every(f => {
				const ext = f.name.split(".").pop().toLowerCase(); // extension call
				totalSize += f.size;
				return !BLOCK_EXT.includes(ext) && f.size <= MAX_FILE_SIZE;
			}) && totalSize <= MAX_TOTAL_SIZE;

			if (!isValid) {
				alert('invalid file type [exe, sh, jsp, java, class, html, js]\nFile size limit of 50MB');
			}
			return isValid;
		}
		$("#f1").change(function () {
			event.preventDefault();
			const formData = new FormData();
			
			console.log(formData);
			const files = this.files;
			for (let i = 0; i < files.length; i++) {
				formData.append("f1", files[i]);
			}

			const valid = validateFiles([...files])
			if (!valid) {
				return;
			}
			
			$.ajax({
				url : '${cp}/upload',
				method : 'Post',
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					console.log(data);
					for (let a of data) {						
					// $(".container").append("<p>" + data[a].origin + "<p>");
					`<li class="list-group-item d-flex align-items-center justify-content-between"
						data-uuid="\${a.uuid}"
						data-orign="\${a.orign}"
						data-image="\${a.image}"
						data-path="\${a.path}"
						data-odr="\${a.odrs}"
					>
						<a href="${cp}/download">\${a.origin}</a>
						<i class="fa-regular fa-circle-xmark float-end text-danger"></i>
					</li>`;
					}
					$(".attach-list").html(str);
				}
			});
		});
	});
	</script>
</body>
</html>