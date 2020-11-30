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
<p style="color: pink; position: relative; top: 30px; font-size: 1.5em;">${message}</p>
<main id="joinMain" style="display: inline-block">
	<form action="updateMemberInfo" method="post" name="frm">
	<input type="hidden" name="url" value="${url}">
		<h2 style="color:green;">회원 정보 갱신</h2>
		<table style="color: graytext;">
			<caption style="color: red; font-size: 18px; text-align: center">입력 필수 항목</caption>
			<tr>
				<th>이름</th>
				<td><input type="text" name="memberName" value="${member.memberName}"></td>
			</tr>
			<tr>
				<th>ID(닉네임)</th>
				<td><input type="text" name="memberId" value="${member.memberId}" readonly="readonly"></td>
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
				<td><input type="email" placeholder="email" name="email" value="${member.email}"></td>
			</tr>
		</table>
		<table id="addInfo"  style="color: graytext; text-align: left; margin-top: 20px;">
			<caption align="left" style="color: blue">교재 주문하실 분은 입력해 주세요</caption>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="button" class="button blueButton" value="주소 검색" onclick="postZip()" style="width: 15em; margin-left: 8px;"></td>
			</tr>
			<tr>
				<th>우편번호 </th>
				<td><input type="text" name="zipNum" placeholder="우편번호" size="10em" value="${member.zipNum}"></td>
			</tr>
			<tr>
				<th>주소 </th>
				<td><input type="text" name="address1" size="50em" value="${member.address1}"></td>
			</tr>
			<tr>
				<th>동 이하 </th>
				<td><input type="text" name="address2" size="50em" value="${member.address2}"></td>
			</tr>
			<tr>
				<th>전화번호 </th>
				<td><input type="text" name="phone" size="20em" value="${member.phone}"></td>
			</tr>
			<tr>
				<td colspan="2"  style="text-align: center;"><input class="button pinkButton center" type="button" value="회원 정보 수정" onclick="updateMemberInfo()" style="height: 30px;"></td>
			</tr>
		</table>
	</form>
</main>
<%@ include file="../footer.jsp" %>
