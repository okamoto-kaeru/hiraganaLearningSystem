<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h1>게시판</h1>

<table class="table center boardTable" style="width: 100%;">
	<tr>
		<th class="center" colspan="2" style="font-size: 2em;">${board.title}</th>
	</tr>
	<tr>
		<td colspan="2" style="text-align: left; background-color: ivory; font-size: 1.3em;">${board.content}</td>
	</tr>
	<tr>
		<td style="text-align: left;">
			<span style="text-align: left; font-size: 0.13rem; background-color: #ebffd5;">
				작성자: ${board.writerId}
			</span>
			<span style="float: right; text-align: right; font-size: 0.12rem; background-color: #ebffd5;">
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
<table id="replyTable" class="table boardTable center" style="width: 80%;">
	<tr>
		<th colspan="2">댓글</th>
	</tr>
	<c:choose>
		<c:when test="${!empty rep}">
			<c:forEach items="${rep}" var="reply">
				<tr>
					<td colspan="2" style="text-align: left; white-space: prewrap; background-color: ivory; padding: 0.2rem;">${reply.replyContent}<br><br>
						<span style="text-align: left; font-size: 0.13rem; background-color: #ebffd5;">
							작성자: ${reply.replyId}
						</span>
						<span style="float: right; text-align: right; font-size: 0.12rem; background-color: #ebffd5;">
							작성일: <fmt:formatDate value="${reply.replyDate}" pattern="yyyy년 MM월 dd일 -- HH시 mm분"/>
						</span>
						<c:if test="${!empty loginUser && reply.replyId == loginUser.memberId}">
							<div style="width: 100%; text-align: center;">
								<input type="button" class="button blueButton" value="댓글 삭제" onclick="location.href='deleteReply?bseq=${board.bseq}&replySeq=${reply.replySeq}'">
							</div>
						</c:if>
						<hr>
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
		<a href="getBoard${pageMaker.makeQuery(pageMaker.startPage-1)}&bseq=${board.bseq}">[← 이전]&nbsp;</a>
	</c:if>

	<!-- [1][2][3]... 표시 부분 -->
	<c:forEach begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}" var="index">
		<a href="getBoard${pageMaker.makeQuery(index)}&bseq=${board.bseq}">[${index}]</a>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a href="getBoard${pageMaker.makeQuery(pageMaker.endPage+1)}&bseq=${board.bseq}">&nbsp;[다음 →]</a>
	</c:if>
</div>
<p>현재 페이지 : ${pageMaker.criteria.pageNumberNow}</p>
<div style="margin-top: 0.2rem; margin-bottom: 0.3rem;">
	<c:choose>
		<c:when test="${!empty loginUser}">
			<form name="frm" method="post" action="repWrite">
				<textarea rows="10" cols="100" name="replyContent" placeholder="댓글 쓰기"></textarea><br>
				<input type="hidden" name="bseq" value="${board.bseq}">
				<input type="submit" class="button orangeButton" name="reply" value="댓글 작성" onclick="return repCheck()">
			</form>
		</c:when>
		<c:otherwise>
			로그인 후에 댓글 작성하실 수 있습니다. <input type="button" class="button orangeButton" value="로그인 화면 가기" onclick="location.href='login?jump=getBoard&bseq=${board.bseq}'">
		</c:otherwise>
	</c:choose>
</div>
<%@ include file="../footer.jsp" %>