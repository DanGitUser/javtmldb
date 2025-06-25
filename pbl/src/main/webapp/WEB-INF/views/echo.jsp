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
	<div class="container my-2">
        <textarea id="chatBox" readonly class="form-control resize-none " rows="10"></textarea>
        <form action="" id="inputForm" class="input-group mt-3">
            <input class="form-control" placeholder="message"><button class="btn btn-primary">SEND</button>
        </form>
    </div>
    <script>
        let socket;

        $(function() {
            socket = new WebSocket(`ws://\${location.host}${cp}/echo`);

            socket.onopen = () => console.log("connected to server");
            socket.onmessage = function() {
                console.log(event.data);
            }
            socket.onerror = () => console.log("failed to connect to server");
            
            $("#inputForm").submit(function() {
                event.preventDefault();
                socket.send($(this).find("input").val());
                $(this).find("input").val("");
            })
        });
    </script>
</body>
</html>