<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h1>게시판</h1>
<input class="button orangeButton center" type="button" name="writeBoard" value="새글 작성" onclick="location.href='writeBoard'" style="width: 50%"><br>

<c:forEach items="${boardList}" var="item">
	<div style="border: 1px solid #ccc;">
		<table class="table center" style="width: 100%; table-layout: fixed;">
			<tr>
				<th class="center" colspan="2" style="font-size: 2em;"><a href="getBoard?bseq=${item.bseq}">${item.title}</a></th>
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
		<a href="boardMain${pageMaker.makeQuery(pageMaker.startPage-1)}">[← 이전]&nbsp;</a>
	</c:if>

	<!-- [1][2][3]... 표시 부분 -->
	<c:forEach begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}" var="index">
		<a href="boardMain${pageMaker.makeQuery(index)}">[${index}]</a>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a href="boardMain${pageMaker.makeQuery(pageMaker.endPage+1)}">&nbsp;[다음 →]</a>
	</c:if>
</div>
<p>현재 페이지 : ${pageMaker.criteria.pageNumberNow}</p>
<%@ include file="../footer.jsp" %>