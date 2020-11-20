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
<script type="text/javascript" src="js/admin.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<title>개구리 선생님의 관리자 페이지</title>
</head>
<body>
	<div id="container" style="text-align: center">
		<header style="margin-bottom: 30px;">
			<h1>개구리 선생님의 관리자 페이지</h1>
			<nav style="position: absolute; top: 80px; right: 10px;">
				<a href="memberList">회원 정보</a> / 
				<a href="adminProduct">상품 정보</a> / 
				<a href="adminOrderList">주문 정보</a> / 
				<a href="adminBoardList">게시판 정보</a> / 
				<a href="*">학습 정보</a> / 
				<a href="adminLogout">로그아웃</a>
			</nav>
			<hr color="lightgreen" width="100%" style="margin-top: 50px;">
		</header>