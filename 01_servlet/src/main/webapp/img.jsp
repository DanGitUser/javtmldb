<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="image/jpg"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String src = "C:\\Users\\tj\\Desktop\\KakaoTalk_20250521_170228359.jpg";
	File file = new File(src);
	FileInputStream fis = new FileInputStream(file);
	byte[] bytes = fis.readAllBytes();
	
	OutputStream os = response.getOutputStream();
	os.write(bytes);
	
	fis.close();
%>