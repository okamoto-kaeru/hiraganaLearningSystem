<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>
<h1>게시판</h1>

<table class="table center boardTable" style="width: 100%;">
	<tr>
		<th class="center" colspan="2" style="font-size: 2em;">${board.title}</th>
	</tr>
	<tr>
		<td colspan="2" style="text-align: left; white-space: prewrap; background-color: ivory; font-size: 1.3em;">${board.content}</td>
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
	<tr>
		<td colspan="2"><input type="button" class="button blueButton" value="삭제" onclick="location.href='deleteBoardAdmin?bseq=${board.bseq}'"></td>
	</tr>
</table>
<table id="replyTable" class="table boardTable center" style="width: 80%;">
	<tr>
		<th colspan="2">댓글</th>
	</tr>
	<c:choose>
		<c:when test="${!empty rep}">
			<c:forEach items="${rep}" var="reply">
				<tr>
					<td colspan="2" style="text-align: left; white-space: prewrap; background-color: ivory; padding: 20px;">${reply.replyContent}<br><br>
						<span style="text-align: left; font-size: 13px; background-color: #ebffd5;">
							작성자: ${reply.replyId}
						</span>
						<span style="float: right; text-align: right; font-size: 12px; background-color: #ebffd5;">
							작성일: <fmt:formatDate value="${reply.replyDate}" pattern="yyyy년 MM월 dd일 -- HH시 mm분"/>
						</span>
						<div style="width: 100%; text-align: center;">
							<input type="button" class="button blueButton" value="댓글 삭제" onclick="location.href='deleteReplyAdmin?bseq=${board.bseq}&replySeq=${reply.replySeq}&replyId=${reply.replyId}'">
						</div>
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
<div class="pagenation">
	<c:if test="${pageMaker.prev}">
		<a href="getBoardAdmin${pageMaker.makeQuery(pageMaker.startPage-1)}&bseq=${board.bseq}">[← 이전]&nbsp;</a>
	</c:if>

	<!-- [1][2][3]... 표시 부분 -->
	<c:forEach begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}" var="index">
		<a href="getBoardAdmin${pageMaker.makeQuery(index)}&bseq=${board.bseq}">[${index}]</a>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a href="getBoardAdmin${pageMaker.makeQuery(pageMaker.endPage+1)}&bseq=${board.bseq}">&nbsp;[다음 →]</a>
	</c:if>
</div>

<%@ include file="../../footer.jsp" %>