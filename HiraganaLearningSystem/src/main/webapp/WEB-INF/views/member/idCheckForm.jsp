<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID check</title>
<style type="text/css">
	body{
		color: green;
	}
</style>
<script type="text/javascript">
	function goSearch() {
		if(document.frm.memberId.value == "") {
			alert("검색할 아이디를 입력해 주세요.");
			document.frm.memberId.focus();
		}
		document.frm.action="idCheckForm?memberId=" +  "${memberId}";
		document.frm.submit();
	}
	
	function useThisId() {
		opener.frm.memberId.value = "${memberId}";
		opener.frm.memberIdChecked.value = "${memberId}";
		self.close();
	}
</script>
<link rel="stylesheet" href="css/learningSystem.css">
</head>
<body>
	<div style="margin-left: 20px; margin-top: 50px;">
		<form action="idCheckForm" name="frm" method="get">
			<input type="text" value="${memberId}" name="memberId">
			<input type="button" value="검색" class="button greenButton" onclick="goSearch()" style="margin-left: 8px; margin-top: 10px;"><br>
			<c:if test="${result == false}">
				<p style="margin-top: 30px; font-weight: bold; font-size: 20px;"><span style="font-size: 30px; color: purple;">${memberId}</span> 는 사용 가능한 아이디입니다.</p>
				<input type="button" class="button pinkButton" value="사용" onclick="useThisId()" style="width: 120px; margin-left: 80px;">
			</c:if>
			<c:if test="${result == true}">
				<script type="text/javascript">
		          opener.document.formm.id.value="";
		        </script>
				<p style="margin-top: 30px; font-weight: bold; font-size: 20px;"><span style="font-size: 30px; color: purple;">${memberId}</span> 는 이미 사용중인 아이디입니다.</p>
			</c:if>
		</form>
	</div>
</body>
</html>