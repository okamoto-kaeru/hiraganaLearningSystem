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
<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<title>개구리 선생님의 일본어 교실</title>
<script type="text/javascript">
$(document).ready(function() {
	const hum = $('#hamburger, .close');
	const nav = $('.sp-nav');
	hum.on('click', function() {
		nav.toggleClass('toggle');
	});
});
</script>
</head>
<body>
	<div id="container">
		<header>
			<img class="pointer" id="headerLogo" src="images/kaeruClass.jpg" onclick="location.href='index'">
			<nav id="headerNavPc">
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
					<li><a href="goMypage">마이 페이지</a></li>
					<li> / </li>
					<li><a href="shopping">교재사기</a></li>
					<li> / </li>
					<li><a href="boardMain">게시판</a></li>
				</ul>
			</nav>
			
			<nav class="sp-nav">
				<ul>
					<c:choose>
						<c:when test="${empty loginUser}">
							<li><a href="login">학습자 로그인</a></li>
							<li><a href="adminLogin">admin 로그인</a></li>
							<li><a href="join">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li>${loginUser.memberId} 님</li>
							<li><a href="logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="hiraganaHome">공부하기</a></li>
					<li><a href="goMypage">마이 페이지</a></li>
					<li><a href="shopping">교재사기</a></li>
					<li><a href="boardMain">게시판</a></li>
					<li class="close"><span>닫기</span></li>
				</ul>
			</nav>
			
			<div id="hamburger">
				<span></span>
			</div>
			<hr color="lightgreen" width="100%">
		</header>