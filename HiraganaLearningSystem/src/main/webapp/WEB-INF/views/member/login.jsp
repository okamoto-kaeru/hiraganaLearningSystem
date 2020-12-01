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
		<div class="center" style="margin-top: 20%;">
			<div style="width: 40%; float: left;">
				<img class="pointer" src="images/kaeruClass.jpg" id="mainLogo" alt="메인 페이지로 이동" onclick="location.href='index'" width="250px" height="150px">
			</div>
			<div style="width: 38%; float: left; margin-top: 30px;">
				<table>
					<tr>
						<td>
							<input type="text" name="memberId" placeholder="ID" required style="padding: 10px; width: 250px;"><br>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="pwd" placeholder="Password" required style="padding: 10px; width: 250px;">
						</td>
					</tr>
				</table>
			</div>
			<div style="width: 10%; float: left;">
				<input type="button" name="new_user" class="button pinkButton" onclick="location.href='join'" value="신규가입"	 style="width: 120px;">
				<input type="submit" class="button orangeButton" value="로그인" style="height: 100px; width: 120px; ">
			</div>
		</div>
	</form>
	<div class="clear"></div>
	<p style="font-size: 13px;">
		<a onclick="findIdForm()">아이디를 잊으셨나요?</a>
		<a onclick="findPasswordForm()" style="margin-left: 20px;">비밀번호를 잊으셨나요?</a>
	</p>
</div>
	<h3 style="color: red;">${message}</h3>


<%@ include file="../footer.jsp" %>