<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="css/learningSystem.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div style="margin-left: 20px;">
		<h1>아이디 찾기 결과</h1>
		<hr color="lightgreen" width="100%">
		<c:choose>
			<c:when test="${!empty idMessage}">
				<p style="color: red; font-weight: bold; font-size: 20px;">${idMessage}</p>
			</c:when>
			<c:otherwise>
				<p style="font-weight: bold; font-size: 20px;">찾으신 아이디는 <span style="color: purple; font-size: 30px;"> ${memberId} </span> 입니다.</p>
			</c:otherwise>
		</c:choose>	
	</div>
</body>
</html>