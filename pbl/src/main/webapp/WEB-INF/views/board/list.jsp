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
            <div class="clearfix py-0">
                <a href="board_write.html" class="btn btn-primary btn-sm  float-end"><i class="fa-solid fa-pen-fancy"></i> 글쓰기</a>
            </div>
            <div class="list-group">
                <div class="list-group-item">
                    <div class="row text-center align-items-center small text-muted">
                        <div class="col-1 small">글번호</div>
                        <div class="col-1 small">카테고리</div>
                        <div class="col text-start small">제목</div>
                        <div class="col-1 small">날짜</div>
                        <div class="col-1 small">조회수</div>
                    </div>
                </div>
                <a href="board_view.html" class="list-group-item  list-group-item-secondary">
                    <div class="row text-center align-items-center small text-muted">
                        <div class="col-1 small">1</div>
                        <div class="col-1 small">경고</div>
                        <div class="col text-start fw-bold text-black">TEST TITLE : notice</div>
                        <div class="col-1 small">2025.06.13</div>
                        <div class="col-1 small">조회수</div>
                    </div>
                </a>
                <c:forEach items="${boards}" var="board">
                <a href="view?bno=${board.bno}" class="list-group-item list-group-item-action">
                    <div class="row text-center align-items-center small text-muted">
                        <div class="col-1 small">${board.bno}</div>
                        <div class="col-1 small">${board.cno}</div>
                        <div class="col text-start text-black">${board.title}
                        	<span class="small text-danger fw-bold">1</span>
                        </div>
                        <div class="col-1 small"><span>
                        <fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
						<fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
                        </span></div>
                        <div class="col-1 small"><span class="small">${board.cnt}</span></div>
                    </div>
                </a>
                </c:forEach>
        </main>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>