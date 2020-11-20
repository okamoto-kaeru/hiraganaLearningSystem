<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 찾기</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/learningSystem.css">
<script type="text/javascript">
	function result(zipNum, sido, gugun, dong) {
		opener.document.frm.zipNum.value = zipNum;
		opener.document.frm.address1.value = sido + ' ' + gugun + ' ' + dong;
		self.close();
	}
</script>
</head>
<body>
	<div style="margin-left: 20px;">
		<h1>주소 찾기</h1>
		<form name="frm" action="findAddress" method="post">
			동: <input type="text" name="dong" placeholder="동을 입력해 주세요">
			<input type="submit" class="button pinkButton" value="검색">
		</form>
	</div>
		<hr color="lightgreen" width="100%">
		<c:if test="${!empty addressList}">
			<table class="table">
				<tr>
					<th>우편번호</th><th>주소</th>
				</tr>
				<c:forEach items="${addressList}" var="address">
					<tr>
						<td>${address.zipNum}</td>
						<td><a onclick="result('${address.zipNum}', '${address.sido}', '${address.gugun}', '${address.dong}')">${address.sido} ${address.gugun} ${address.dong}</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	
</body>
</html>