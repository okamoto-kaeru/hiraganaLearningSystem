<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h1>게시판</h1>

	<table class="table center" style="width: 100%;">
		<tr>
			<th class="center" colspan="2" style="font-size: 2em;">${board.title}</th>
		</tr>
		<tr>
			<td colspan="2" style="text-align: left; white-space: prewrap;">${board.content}</td>
		</tr>
		<tr>
			<td style="text-align: left;">
				<span style="text-align: left; font-size: 13px; background-color: #ebffd5;">
					작성자: ${board.writerId}
				</span>
				<span style="float: right; text-align: right; font-size: 12px; background-color: #ebffd5;">
					작성일: <fmt:formatDate value="${board.writeDate}" pattern="yyyy년 MM월 dd일 -- HH시 mm분"/>
				</span>
			</td>
		</tr>
		<c:if test="${!empty loginUser && board.writerId == loginUser.memberId}">
			<tr>
				<td colspan="2"><input type="button" class="button blueButton" value="글 수정 / 삭제" onclick="location.href='modifyBoard?bseq=${board.bseq}'"></td>
			</tr>
		</c:if>
	</table>
	<table id="replyTable">
		<tr>
			<th colspan="2">댓글</th>
		</tr>
		<c:choose>
			<c:when test="${!empty rep}">
				<c:forEach items="${rep}" var="reply">
					<tr>
						<td colspan="2" style="text-align: left; white-space: prewrap;">${reply.replyContent}<br> 
							<span style="text-align: left; font-size: 13px; background-color: #ebffd5;">
								작성자: ${reply.replyId}
							</span>
							<span style="float: right; text-align: right; font-size: 12px; background-color: #ebffd5;">
								작성일: <fmt:formatDate value="${reply.replyDate}" pattern="yyyy년 MM월 dd일 -- HH시 mm분"/>
							</span>
							<c:if test="${!empty loginUser && reply.replyId == loginUser.memberId}">
								<div style="width: 100%; text-align: center;">
									<input type="button" class="button blueButton" value="댓글 삭제" onclick="location.href='deleteReply?bseq=${board.bseq}&replySeq=${reply.replySeq}'">
								</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>아직 댓글이 없읍니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
<div style="margin-top: 20px;">
	<form name="frm" method="post" action="repWrite">
		<textarea rows="10" cols="80" name="replyContent" placeholder="댓글 쓰기"></textarea><br>
		<input type="hidden" name="bseq" value="${board.bseq}">
		<input type="submit" class="button orangeButton" name="reply" value="댓글 작성" onclick="return repCheck()">
	</form>
</div>
<%@ include file="../footer.jsp" %>