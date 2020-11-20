<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<h2>게시판 정보</h2>
<form action="adminBoardList">
	<input type="text" name="memberId">
	<input type="submit" class="button pinkButton" value="검색" style="margin-bottom: 20px;">
</form>

<c:choose>
	<c:when test="${empty boardList}">
		<h2>찾으신 게시글이 없습니다.</h2>
	</c:when>
	<c:otherwise>
		<c:forEach items="${boardList}" var="item">
			<div style="border: 1px solid #ccc;">
				<table class="table center" style="width: 100%; table-layout: fixed;">
					<tr>
						<th class="center" colspan="2" style="font-size: 2em;"><a href="getBoardAdmin?bseq=${item.bseq}">${item.title}</a></th>
					</tr>
					<tr>
						<td class="center" id="boardContent" colspan="2">${item.content}</td>
					</tr>
					<tr>
						<td style="text-align: left;">
							작성자: ${item.writerId}
						</td>
						<td style="text-align: right; font-size: 13px;">
							작성일: <fmt:formatDate value="${item.writeDate}" pattern="yyyy년 MM월 dd일 -- HH시 mm분"/>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
		
		<div class="pagenation">
			<c:if test="${pageMaker.prev}">
				<a href="adminBoardList${pageMaker.makeQuery(pageMaker.startPage-1)}&writerId=${writerId}">[← 이전]&nbsp;</a>
			</c:if>

			<!-- [1][2][3]... 표시 부분 -->
			<c:forEach begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}" var="index">
				<a href="adminBoardList${pageMaker.makeQuery(index)}&writerId=${writerId}">[${index}]</a>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<a href="adminBoardList${pageMaker.makeQuery(pageMaker.endPage+1)}&writerId=${writerId}">&nbsp;[다음 →]</a>
			</c:if>
		</div>
		<p>현재 페이지 : ${pageMaker.criteria.pageNumberNow}</p>
		
	</c:otherwise>
</c:choose>


<%@ include file="../../footer.jsp" %>