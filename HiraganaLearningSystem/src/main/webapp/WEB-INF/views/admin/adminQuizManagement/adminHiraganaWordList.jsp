<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<h2>상품 정보</h2>
<form action="hiraganaWordList">
	<input type="text" name="hiraganaWordKind" placeholder="단어 종류를 넣고 검색">
	<input type="submit" class="button pinkButton adminSearch" value="검색">
</form>
<div style="text-align: right; margin-top: -50px;">
	<input type="button" class="button orangeButton" value="새 단어 등록" onclick="location.href='insertHiraganaWord'">
</div>
<table class="table center" style="margin-top: 30px;">
	<tr>
		<th>단어 아이디</th><th>단어를 히라가나로 입력</th><th>행</th>
	</tr>
	<c:forEach items="${hiraganaWordList}" var="word">
		<tr>
			<td>${word.hiraganaWordId}</td>
			<td>${word.hiraganaWordKind}</td>
			<td>${word.hiraganaLine}</td>
			<td><a href="updateHiraganaWord?hiraganaWordSeq=${word.hiraganaWordSeq}">정보 수정</a></td>
		</tr>
	</c:forEach>
</table>

<div class="pagenation">
	<c:if test="${pageMaker.prev}">
		<a href="hiraganaWordList${pageMaker.makeQuery(pageMaker.startPage-1)}&hiraganaWordKind=${hiraganaWordKind}">[← 이전]&nbsp;</a>
	</c:if>

	<!-- [1][2][3]... 표시 부분 -->
	<c:forEach begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}" var="index">
		<a href="hiraganaWordList${pageMaker.makeQuery(index)}&hiraganaWordKind=${hiraganaWordKind}">[${index}]</a>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a href="hiraganaWordList${pageMaker.makeQuery(pageMaker.endPage+1)}&hiraganaWordKind=${hiraganaWordKind}">&nbsp;[다음 →]</a>
	</c:if>
</div>
<p>현재 페이지 : ${pageMaker.criteria.pageNumberNow}</p>
			
<%@ include file="../../footer.jsp" %>