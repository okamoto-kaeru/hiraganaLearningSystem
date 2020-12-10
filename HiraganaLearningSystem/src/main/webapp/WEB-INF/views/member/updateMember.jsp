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
		<table class="table center joinFormTable" style="color: graytext; margin-bottom: 0.3rem;">
			<caption style="color: red; font-size: 0.2rem; text-align: center">입력 필수 항목</caption>
			<tr>
				<th>이름</th>
				<td>&nbsp;<input type="text" name="memberName" value="${member.memberName}"></td>
			</tr>
			<tr>
				<th>ID(닉네임)</th>
				<td>&nbsp;<input type="text" name="memberId" value="${member.memberId}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>&nbsp;<input type="password" placeholder="비밀번호" name=pwd></td>
			</tr>
			<tr>
				<th>비밀번호(확인) </th>
				<td>&nbsp;<input type="password" placeholder="비밀번호 확인" name=pwdCheck></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>&nbsp;<input type="email" placeholder="email" name="email" value="${member.email}"></td>
			</tr>
		</table>
		
		<span style="color: red; font-size: 0.2rem;">교재 주문하실 분은 입력해 주세요</span><br>
		<span style="color: red; font-size: 0.1rem;">
			교제사기 기능은 web작성 연습을 위해 만든 겁니다. <br> 개인 정보 보호하기 위해 진짜 주소, 전화번호는 입력하지 마세요!<br>
		</span><br>
		<input type="button" class="button blueButton" value="주소 검색" onclick="postZip()" style="width: 2rem; margin-left: 0.08rem; height: 0.35rem;"><br>
		<div class="detailInfoDiv">
			<label class="detailInfoLabel" for="zipNum">우편번호</label><br><input type="text" class="detailInfo" id="zipNum" name="zipNum" placeholder="우편번호" style="width: 30%;" value="${member.zipNum}"><br>
			<label class="detailInfoLabel" for="address1">주소</label><br><input class="detailInfo" type="text" id="address1" name="address1" placeholder="oo시 oo구 oo동 oo" style="width: 90%;" value="${member.address1}"><br>
			<label class="detailInfoLabel" for="address2">동 이하</label><br><input type="text" class="detailInfo" id="address2" name="address2" placeholder="상세 주소" style="width: 90%;" value="${member.address2}"><br>
			<label class="detailInfoLabel" for="phone">전화번호</label><br><input type="text" class="detailInfo" id="phone" name="phone" placeholder="전화번호" style="width: 50%;" value="${member.phone}"><br>
		</div>
		<input class="button pinkButton center" type="button" value="회원 정보 수정" onclick="updateMemberInfo()" style="height: 0.4rem; margin: 0.1rem;">
	</form>
</main>
<%@ include file="../footer.jsp" %>
