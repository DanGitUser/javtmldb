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
            <form method="post" action="modify" onsubmit="return confirm('Confirm Modification?')">
                <div class="small border-bottom border-3 border-black p-0 pb-2">
                    <a href="#">
                        <div><span class="text-primary">전체</span> 카테고리</div>
                	</a>
            	</div>
            	<div class="small p-0 py-2 align-items-center">
                	<input placeholder="title" class="form-control" name="title" id="title" value="${board.title}">
            	</div>
            	<div class="pt-1 pb-2 p-0 py-5 ps-1 small border-bottom border-1 border-muted">
                	<textarea name="content" id="editor1" class="form-control resize-none">${board.content}</textarea>
           		</div>
            	<div class="pt-2">
                	<button class="btn btn-secondary btn-sm">목록</button>
                	<div class="float-end">
                    	<button class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-pen-to-square"></i> 수정</button>
                	</div>
            	</div>
            	<input type="hidden" name="id" value="${member.id}" />
            	<input type="hidden" name="bno" value="${board.bno}" />
            	<input type="hidden" name="cno" value="${cri.cno}" />
            	<input type="hidden" name="page" value="${cri.page}" />
            	<input type="hidden" name="amount" value="${cri.amount}" />
            	<input type="hidden" name="type" value="${cri.type}" />
            	<input type="hidden" name="keyword" value="${cri.keyword}" />
        	</form>
        </main>
    </div>
        <script>
        $(function() {
            CKEDITOR.replace('editor1', {
                height:400
            })
        });
    </script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>