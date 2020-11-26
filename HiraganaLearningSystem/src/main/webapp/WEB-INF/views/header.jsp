<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/learningSystem.css">
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript" src="js/product.js"></script>
<script type="text/javascript" src="js/board.js"></script>
<script type="text/javascript" src="js/hiragana.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<title>개구리 선생님의 일본어 교실</title>
</head>
<body>
	<div id="container">
		<header>
			<img class="pointer" id="headerLogo" src="images/kaeruClass.jpg" onclick="location.href='index'" height="100px" width="200px">
			<nav id="headerNav">
				<ul>
					<c:choose>
						<c:when test="${empty loginUser}">
							<li><a href="login">로그인</a> ( </li>
							<li><a href="login">학습자</a></li>
							<li> | </li>
							<li><a href="adminLogin">admin</a></li>
							<li> ) / </li>
							<li><a href="join">회원가입</a></li>
							<li> / </li>
						</c:when>
						<c:otherwise>
							<li>${loginUser.memberId} 님</li>
							<li><a href="logout">로그아웃</a></li>
							<li> / </li>
						</c:otherwise>
					</c:choose>
					<li><a href="hiraganaHome">공부하기</a></li>
					<li> / </li>
					<li><a href="mypage">마이 페이지</a></li>
					<li> / </li>
					<li><a href="shopping">교재사기</a></li>
					<li> / </li>
					<li><a href="boardMain">게시판</a></li>
				</ul>
			</nav>
			<hr color="lightgreen" width="100%">
		</header>