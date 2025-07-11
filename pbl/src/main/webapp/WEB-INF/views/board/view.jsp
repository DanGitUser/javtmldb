<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/dayjs.min.js" integrity="sha512-FwNWaxyfy2XlEINoSnZh1JQ5TRRtGow0D6XcmAWmYCRgvqOUTnzCxPc9uF35u5ZEpirk1uhlPVA19tflhvnW1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/locale/ko.min.js" integrity="sha512-ycjm4Ytoo3TvmzHEuGNgNJYSFHgsw/TkiPrGvXXkR6KARyzuEpwDbIfrvdf6DwXm+b1Y+fx6mo25tBr1Icg7Fw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/plugin/relativeTime.min.js" integrity="sha512-MVzDPmm7QZ8PhEiqJXKz/zw2HJuv61waxb8XXuZMMs9b+an3LoqOqhOEt5Nq3LY1e4Ipbbd/e+AWgERdHlVgaA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>
<div class="container p-0">
	<main>
        	
		<div class="small border-bottom border-3 border-black p-0 pb-2">
			<a href="#">
				<div><span class="text-primary">${board.cno}</span> 카테고리</div>
            </a>
		</div>
		<div class="small p-0 py-2">
			<span class="px-2 border-end border-1">잡담</span>
            <span class="px-2">${board.title}</span>
            <div class="float-end small">
            	<span class="text-muted"><i class="fa-solid fa-eye"></i> ${board.cnt}</span>
            	<span class="text-muted"><i class="fa-regular fa-comment-dots"></i> 2</span>
       		</div>
        </div>
  		<div class="p-0 py-2 bg-light small border-top borrder-2 border-muted">
   			<span class="px-2">${board.id}</span>
        	<a href="#" class="text-muted small">board.html</a>
        	<span class="float-end text-muted small me-3">${board.regdate}</span>
    	</div>
        <div class="p-0 border-bottom border-muted"></div>
        <div class="p-0 py-5 ps-1 small border-bottom border-1 border-muted">
        	${board.content}
       	</div>
      	<div>
       		<a href="list?${cri.qs2}" class="btn btn-secondary btn-sm"><i class="fa-solid fa-list-ul"></i> 목록</a>
            <a href="modify?bno=${board.bno}&${cri.qs2}" class="btn btn-warning btn-sm"><i class="fa-solid fa-pen-to-square"></i> 수정</a>
            <a href="remove?bno=${board.bno}&${cri.qs2}" class="btn btn-danger btn-sm" onclick="return confirm('Delete Post?')"><i class="fa-solid fa-trash-can"></i> 삭제</a>
            <div class="float-end">
             	<button class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-share-nodes"></i> 공유</button>
             	<button class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-clipboard"></i> 스크랩</button>
   			</div>
		</div>
            
     	<!-- Comments -->
     	<!-- comments button -->
     	<div class="small p-0 py-2 border-top border-bottom border-1 border-muted mt-4 clearfix align-items-center d-flex">
     		<div class="col">
				<span class="px-1 text-primary"><i class="fa-solid fa-comment-dots"></i> Reply</span>
     		</div>
     		<div class="col text-end">
     		<c:if test="${empty member}">
     			<a class="small text-primary" href="${cp}/member/login">Sign-In to comment</a>
     		</c:if>
     		<c:if test="${not empty member}">
				<button class="btn-write-form btn btn-sm btn-primary"> Comment</button>
     		</c:if>
     		</div>
       	</div>
       	
      	<ul class="list-group list-group-flush mt-3 reviews"></ul>   
       	<div class="d-grid">
       		<button class="btn btn-primary btn-block btn-reply-more d-none">Load More...</button>
       	</div>  	
 	</main>
</div>
<!-- The Modal -->
<div class="modal fade" id="reviewModal">
	<div class="modal-dialog">
		<div class="modal-content">
          	<!-- Modal Header -->
          	<div class="modal-header">
            	<h4 class="modal-title">Review Form</h4>
            	<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          	</div>
          	<!-- Modal body -->
          	<div class="modal-body">
            	<form action="/action_page.php">
              	<div class="mb-3 mt-3">
                	<label for="content" class="form-label"><i class="fa-solid fa-comment text-primary"></i> Comment</label>
                	<textarea class="form-control resize-none" id="content" placeholder="Enter content" name="content" rows="5"></textarea>
              	</div>
              	<div class="mb-3">
                	<label for="writer" class="form-label"><i class="fa-solid fa-user text-primary"></i> Writer</label>
                	<input type="text" class="form-control" id="writer" placeholder="Enter writer name" name="writer" value="${member.id}" disabled="disabled">
              	</div>
            	</form>
          	</div>
          	<!-- Modal footer -->
          	<div class="modal-footer">
              	<button type="submit" class="btn btn-primary btn-sm btn-write-submit">Write</button>
              	<button type="submit" class="btn btn-warning btn-sm btn-modify-submit">Modify</button>
              	<button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
    <script>
        dayjs.extend(window.dayjs_plugin_relativeTime);
        dayjs.locale('ko');
        const dayForm = 'YYYY-MM-DD HH:mm:ss';
        
        $(function () {
        	const bno = '${board.bno}';
            const url = '${cp}'+ '/reply/';
            const modal = new bootstrap.Modal($("#reviewModal").get(0), {});
            
            // makeReplyLi(reply) 
            function makeReplyLi(r) {
            	return `
                <li class="list-group-item ps-5 profile-img" data-rno="\${r.rno}">
                    <p class="small text-secondary">                       
                        <span class="me-3">\${r.id}</span>
                        <span class="mx-3">\${dayjs(r.regdate, dayForm).fromNow()}</span>
                    </p>
                    <p class="small .ws-pre-line">\${r.content}</p>
                    <button class="btn btn-danger btn-sm float-end btn-remove-submit">삭제</button>
                    <button class="btn btn-warning btn-sm float-end mx-3 btn-modify-form">수정</button>
                </li>
                        `;
            }
            
            function list(bno, lastRno) {
            	lastRno = lastRno ? ('/' + lastRno) : '';
            	let reqUrl = url + 'list/' + bno + lastRno;
                $.ajax({
                    url : reqUrl,
                    success: function (data) {
                        if (!data || data.length === 0) {
                        	if ($(".reviews li").length == 0) {	
                        		$(".reviews").html('<li class="list-group-item text-center text-muted">No Comments</li>');
							} else {
								$(".btn-reply-more").prop("disabled", true).test("No More Comments to Load");
							}
                        	return;
                        }
                        $(".btn-reply-more").removeClass("d-none");
                        let str = ''; 
                        for (let r of data) {
                            console.log(r);
                            str += makeReplyLi(r);
                        }
                        $(".reviews").append(str);
                    }
                });
            }
            list(bno);

            // 글쓰기 폼 활성화 btn-write-form
            $(".btn-write-form").on("click", function () {
                console.log("글쓰기 폼");
                $("#reviewModal form").get(0).reset();
                $("#reviewModal .modal-footer button").show().eq(1).hide();
                modal.show();
            });
            
            // 글쓰기 버튼 이밴트 btn-write-submit
            $(".btn-write-submit").click(function () {
                const result = confirm("등록 하시겠습니까?");
                if(!result) return;

                const content = $("#content").val().trim();
                const id = $("#writer").val().trim();

                const obj = {content, id, bno};
                console.log(obj);
                console.log("글쓰기 전송");

                $.ajax({
                    url,
                    method : 'POST',
                    data : JSON.stringify(obj),
                    success : function (data) {
                        if(data.result) {
                            modal.hide();
                            data.reply.regdate = dayjs().format(dayform);
                            const strLi = makeReplyLi(data.reply);
                            $(".reviews").prepend(strLi);
                        }
                    }
                });
            });
            
            // 글수정 폼 활성화 btn-modify-form
            $(".reviews").on("click", ".btn-modify-form", function () {
                console.log("글수정 전송");
                const rno = ($(this).closest("li").data("rno"));
                $.getJSON(url + rno, function (data) {
                    $("#reviewModal .modal-footer button").show().eq(0).hide();
                    $("#content").val(data.content);
                    $("#writer").val(data.id);
                    $("#reviewModal").data("rno", rno);
                    console.log(data);
                    modal.show();
                });     
            });
            
            // 글수정 버튼 이밴트 btn-modify-submit
            $(".btn-modify-submit").click(function () {
                const result = confirm("수정 하시겠습니까?");
                if(!result) return;

                const rno = $("#reviewModal").data("rno");
                console.log(rno);
                // console.log("글수정 폼");

                const content = $("#content").val().trim();
                const id = $("#writer").val().trim();

                const obj = {content, id, rno};

                $.ajax({
                    url : url + rno,
                    method : 'PUT',
                    data : JSON.stringify(obj),
                    success : function (data) {
                        if(data.result) {
                            modal.hide();
                           	$getJSON(url + rno, function(data) {
                           		console.log(data);
                           		const strLi = makeReplaceLi(data);
                           		
                           		const $li = $(`.reviews li[data-rno='\${rno}']`);
                           		$li.replaceWith(strLi);
                           	})
                        }
                    }
                });
            });
            
            // 글삭제 버튼 이밴트 btn-remove-submit
            $(".reviews").on("click", ".btn-remove-submit", function () {
                
                const result = confirm("삭제 하시겠습니까?")
                if (!result) return; // return false;
                
                const $li = $(this).closest("li")
                const rno = $li.data("rno");
                console.log("글삭제");
                $.ajax({
                    url : url + rno,
                    method : 'DELETE',
                    success : function (data) {
                        if(data.result) {
                        	$li.remove();
                        }
                    }
                });
            }); 
            
            //
            $(".btn-reply-more").click(function() {
            	// Bring the cno of the last comment of the current list
            	const lastRno = $(".reviews li:last").data("rno");
            	console.log(lastRno);
            	list(bno, lastRno);
            	
            });
        });

    </script>
</body>
</html>