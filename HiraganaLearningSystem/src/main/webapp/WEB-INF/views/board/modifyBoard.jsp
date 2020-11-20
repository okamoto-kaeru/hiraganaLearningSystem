<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h1>글 수정, 삭제 페이지</h1>
	<form name="frm" method="post">
		<table class="table center" style="width: 100%; text-align: left;">
			<tr>
				<th>제목: </th>
				<td><input type="text" name="title" value="${board.title}" style="font-size: 2em;"></td>
			</tr>
			<tr>
				<th>내용: </th>
				<td style="white-space: prewrap;">
					<textarea rows="8" cols="100" name="content">${board.content}</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;">
					작성자: ${board.writerId}
				</td>
				<td style="text-align: right; font-size: 13px;">
					작성일: <fmt:formatDate value="${board.writeDate}" pattern="yyyy년 MM월 dd일 -- HH시 mm분"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="hidden" name="bseq" value="${board.bseq}">
					<input type="button" class="button greenButton" value="글 수정" onclick="goUpdateBoard()">
					<input type="button" class="button redButton" value="삭제" onclick="location.href='deleteBoard?bseq=${board.bseq}'">
				</td>
			</tr>
		</table>
	</form>
<%@ include file="../footer.jsp" %>