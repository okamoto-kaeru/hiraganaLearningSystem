<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="css/learningSystem.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script type="text/javascript">
function goFindId() {
	if(document.frm.memberName.value == "") {
		alert("이름을 입력해 주세요.");
		document.frm.memberName.focus();
	} else if(document.frm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.frm.email.focus();
	} else {
		document.frm.submit();
	}
}
</script>
</head>
<body>
	<h1>아이디를 잊으신 분</h1>
	<form name="frm" action="findId" method="post">
		<table class="table center" style="margin-bottom: 20px;">
			<tr>
				<th>이름</th>
				<td><input type="text" name="memberName"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="button" class="button greenButton" value="아이디 검색" onclick="goFindId()"></td>
			</tr>
		</table>
</form>
</body>
</html>