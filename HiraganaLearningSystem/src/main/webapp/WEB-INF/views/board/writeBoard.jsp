<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h1>새글 작성</h1>
<form name="frm" action="writeBoard" method="post">
	<table class="table center" style="text-align: left;">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" placeholder="제목을 입력해 주세요" size="30em"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" placeholder="내용을 입력해 주세요" rows="8" cols="80"></textarea></td>
		</tr>
	</table>
	<input class="button greenButton center" type="submit" value="작성" onclick="return goWrite()">
</form>

<%@ include file="../footer.jsp" %>