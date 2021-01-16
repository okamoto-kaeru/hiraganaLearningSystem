<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="center" style="text-align: center;">
	<form name="login" method="POST" action="login">
		<!-- 로그인 화면에 오기 전 화면 정보 저장 -->
		<input type="hidden" name="jump" value="${jump}">
		<input type="hidden" name="pseq" value="${pseq}">
		<input type="hidden" name="bseq" value="${bseq}">
		<input type="hidden" name="hiraganaLine" value="${hiraganaLine}">
		<input type="hidden" name="whatQuiz" value="${whatQuiz}">
		<div class="center" id="loginPage">
			<h1>로그인</h1>
			<div id="loginLogoDiv">
				<img class="pointer" src="images/kaeruClass.jpg" id="mainLogo" alt="메인 페이지로 이동" onclick="location.href='index'">
				<input type="button" id="responseJoinButton" name="new_user" class="button pinkButton" onclick="location.href='join'" value="신규가입">
			</div>
			<div class="tableDiv">
				<table class="responseTableBlock">
					<tr>
						<td>
							<input type="text" class="inputForm" name="memberId" placeholder="ID" required><br>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" class="inputForm" name="pwd" placeholder="Password" required>
						</td>
					</tr>
				</table>
			</div>
			<div id="loginButtonDiv">
				<input type="button" id="goJoinButton" name="new_user" class="button pinkButton" onclick="location.href='join'" value="신규가입">
				<input type="submit" id="loginButton" class="button orangeButton" value="로그인">
			</div>
		</div>
	</form>
	<div class="clear"></div>
	<p style="font-size: 13px; color: cornflowerblue;">
		<a href="#" onclick="findIdForm()">아이디를 잊으셨나요?</a>
		<a href="#" onclick="findPasswordForm()" style="margin-left: 0.2rem;">비밀번호를 잊으셨나요?</a>
	</p>
</div>
	<h3 style="color: red;">${message}</h3>


<%@ include file="../footer.jsp" %>