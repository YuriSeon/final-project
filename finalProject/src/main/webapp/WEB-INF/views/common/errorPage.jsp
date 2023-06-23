<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%@include file="menubar.jsp" %>
		
		<div align="center">
		<img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
		<h1 align="center">${errorMsg}</h1>
		</div>
		<jsp:include page="footer.jsp"/>
</body>
</html>