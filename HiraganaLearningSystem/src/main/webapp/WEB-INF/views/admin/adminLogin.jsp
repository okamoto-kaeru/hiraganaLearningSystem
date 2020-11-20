<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<header>
			<h1>개구리 선생님의 관리자 페이지</h1>
			<img class="pointer" src="images/kaeruClass.jpg" onclick="location.href='index'" height="90px" width="150px" style="position: absolute; top: 0px; right: 50px;">
			<hr color="lightgreen" width="100%">
		</header>
		<h1 style="color: purple">관리자 로그인</h1>
		<h2 style="margin-top: 0px;">${message}</h2>
		<form action="adminLogin" method="post" name="frm">
			<div style="position: absolute; top: 250px; left: 290px;">
				<table class="table center">
					<tr>
						<th>관리자 아이디</th>
						<td><input type="text" name="id" placeholder="관리자 id"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" placeholder="비밀번호"></td>
					</tr>
				</table>
				<input type="submit" class="button greenButton" value="관리자 로그인" style="margin-top: 30px;" onclick="return checkAdmin()">
			</div>
		</form>

<%@ include file="../footer.jsp" %>
