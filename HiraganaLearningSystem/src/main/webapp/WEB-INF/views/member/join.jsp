<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
function postZip() {
	window.open("searchAddress",
				"_blank_1",
				"toolbar=no, menubar=no, scrollbars=no, resizable=no, width=400, height=350");
}
</script>
<main id="joinMain" style="display: inline-block">
	<form action="join" method="post" name="frm">
		<h2 style="color:green;">신규 가입</h2>
		<table style="color: graytext;">
			<caption style="color: red; font-size: 18px; text-align: center">입력 필수 항목</caption>
			<tr>
				<th>이름</th>
				<td><input type="text" name="memberName" id="fname" placeholder="이름"></td>
			</tr>
			<tr>
				<th>ID(닉네임)</th>
				<td><input type="text" name="memberId" id="id" placeholder="아이디"></td>
				<td>
					<input type="button" class="button greenButton" name="checkButton" value="중복확인" onclick="idCheck()" style="margin-left: 8px;">
					<input type="hidden" name="memberIdChecked">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" placeholder="비밀번호" name=pwd></td>
			</tr>
			<tr>
				<th>비밀번호(확인) </th>
				<td><input type="password" placeholder="비밀번호 확인" name=pwdCheck></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" placeholder="email" name="email"></td>
			</tr>
		</table>
		<table id="addInfo"  style="color: graytext; text-align: left; margin-top: 20px;">
			<caption align="left" style="color: blue">교재 주문하실 분은 입력해 주세요</caption>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="button" class="button blueButton" value="주소 검색" onclick="postZip()" style="width: 15em; margin-left: 8px;"></td>
			</tr>
			<tr>
				<th>우편번호 </th>
				<td><input type="text" name="zipNum" placeholder="우편번호" size="10em"></td>
			</tr>
			<tr>
				<th>주소 </th>
				<td><input type="text" name="address1" placeholder="oo시 oo구 oo동 oo" size="50em"></td>
			</tr>
			<tr>
				<th>동 이하 </th>
				<td><input type="text" name="address2" placeholder="상세 주소" size="50em"></td>
			</tr>
			<tr>
				<th>전화번호 </th>
				<td><input type="text" name="phone" placeholder="전화번호" size="20em"></td>
			</tr>
			<tr>
				<td colspan="2"  style="text-align: center;"><input class="button pinkButton center" type="button" value="입력내용 확인" onclick="join_save()" style="height: 30px;"></td>
			</tr>
		</table>
	</form>
</main>
<%@ include file="../footer.jsp" %>
