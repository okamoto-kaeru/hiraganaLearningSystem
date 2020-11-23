<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main style="display: inline-block;">
	<form name="login" method="POST" action="login">
		<table style="margin-right: auto; margin-left: auto; margin-top: 150px;">
			<tr>
				<td rowspan="3">
					<a href="index" title="메인 페이지로 가기"><img src="images/kaeruClass.jpg" id="mainLogo" alt="메인 페이지로 이동"></a>
					<!-- 로그인 화면에 오기 전 화면 정보 저장 -->
					<input type="hidden" name="jump" value="${jump}">
					<input type="hidden" name="pseq" value="${pseq}">
					<input type="hidden" name="hiraganaLine" value="${hiraganaLine}">

				</td>
				<td colspan="2">
					<input type="button" name="new_user" class="button pinkButton" onclick="location.href='join'" value="신규가입"	 style="width: 120px; float: right;">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="memberId" placeholder="ID" required style="padding: 10px; width: 250px;"><br>
				</td>
				<td rowspan="2">
					<input type="submit" class="button orangeButton" value="로그인" style="margin-left: 20px; height: 100px; width: 120px; ">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pwd" placeholder="Password" required style="padding: 10px; width: 250px;">
				</td>
			</tr>
		</table>
	</form>
	<p style="font-size: 13px;">
		<a class="pointer" onclick="findIdForm()">아이디를 잊으셨나요?</a>
		<a class="pointer" onclick="findPasswordForm()" style="margin-left: 20px;">비밀번호를 잊으셨나요?</a>
	</p>
</main>
	<h3 style="color: red;">${message}</h3>


<%@ include file="../footer.jsp" %>