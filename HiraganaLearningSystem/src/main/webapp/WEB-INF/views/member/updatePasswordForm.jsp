<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="css/learningSystem.css">
<script type="text/javascript" src="js/member.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div style="margin-left: 20px;">
		<h1>비밀번호 찾기 결과</h1>
		<hr color="lightgreen" width="100%">
		<c:choose>
			<c:when test="${!empty passwordMessage}">
				<p style="color: red; font-weight: bold; font-size: 20px;">${passwordMessage}</p>
			</c:when>
			<c:otherwise>
				<div style="text-align: center;">
					<h2>새 비밀번호를 설정합니다.</h2>
					<form name="frm" action="updatePassword" method="post">
						<table class="table center">
							<tr>
								<th>비밀번호</th>
								<td>
									<input type="password" placeholder="비밀번호" name=pwd>
									<input type="hidden" name="memberId" value="${memberId}">
								</td>
							</tr>
							<tr>
								<th>비밀번호(확인) </th>
								<td><input type="password" placeholder="비밀번호 확인" name=pwdCheck></td>
							</tr>
							<tr>
								<td colspan="2"  style="text-align: center;"><input class="button pinkButton center" type="button" value="비밀번호 변경" onclick="goUpdatePassword()" style="height: 30px;"></td>
							</tr>
						</table>
					</form>
				</div>
			</c:otherwise>
		</c:choose>	
	</div>
</body>
</html>