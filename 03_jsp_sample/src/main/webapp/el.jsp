<%@page import="domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h2><%=page==this%></h2>
  <h3><%=request.getSession() == session %></h3>
  <h3><%=request.getServletContext() == application %></h3>
  <%

    // 영역곅체
    // page, request, session, application
    pageContext.setAttribute("value", 10);
    request.setAttribute("value", 20);
    session.setAttribute("value", 30);
    application.setAttribute("value", 40);
    
  %>
  <h3>${value}</h3>
  <h3>${sessionScope.value}</h3>
  
  <%
    request.setAttribute("myValue", new Member());
  %>
  <h3>Normal Expression: <%=((Member)request.getAttribute("myValue")).getName() %></h3>
  <h3>Expression Language: ${myValue.name}</h3>
  <h3>${'1'+"2"}</h3>
  <h3>${5 / 2}</h3>
  <h3>${myValue.name eq '새똥이'}</h3>
  <h3>${myValue.name != '새똥이'}</h3>
  <h3>${myValue.name ne '새똥이'}</h3>
  <h3>${10 < 20}</h3>
  <h3>${5 mod 2}</h3>
  <h3>${empty ''}</h3>
  <h3>${empty null}</h3>
</body>
</html>