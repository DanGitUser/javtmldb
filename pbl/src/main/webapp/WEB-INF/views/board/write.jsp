<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>
<div class="container p-0">
        <main>
            <div class="small border-bottom border-3 border-black p-0 pb-2">
                <a href="#">
                   <div><span class="text-primary">전체</span> 카테고리</div>
                </a>
            </div>
            	
            <div class="small p-0 py-2 align-items-center">
                <input placeholder="제목" class="form-control" name="title" id="title">
            </div>
            <div class="pt-1 pb-2 p-0 py-5 ps-1 small border-bottom border-1 border-muted">
                	<textarea name="content" id="editor1" class="form-control resize-none"></textarea>
           	</div>
           	
           	<div class="d-grid my-2">
           		<div class="small my-1"><i class="fa-solid fa-paperclip"></i> File Upload</div>
				<label class="btn btn-info">Attach file <input type="file" name="f1" multiple class="d-none"></label>
			</div>
           		
            <div class="my-2">
                <button class="btn btn-secondary btn-sm">목록</button>
                <div class="float-end">
                    <button class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-pen-fancy"></i> 글쓰기</button>
                    <button class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-clipboard"></i> 스크랩</button>
                </div>
            </div>
            <input type="hidden" name="id" value="${member.id}" />
            <input type="hidden" name="cno" value="2" />
        </main>
    </div>
    <script>
        $(function() {
            CKEDITOR.replace('editor1', {
                height:400
            })
        });
    </script>
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
					for (let a in data) {						
					$(".container").append("<p>" + data[a].origin + "<p>");
					}
					
				}
			});
		});
	});
	</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>