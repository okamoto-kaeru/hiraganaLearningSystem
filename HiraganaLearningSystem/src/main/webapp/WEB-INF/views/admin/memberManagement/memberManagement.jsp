<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<h2>회원 정보</h2>
<form action="memberList">
	<input type="text" name="memberName">
	<input type="submit" class="button pinkButton" value="검색">
</form>

<table class="table center" style="margin-top: 30px; border-spacing: 1em 0.5em;">
	<tr>
		<th>아이디</th><th>이름</th><th>등록일</th><th>이메일</th><th>전화번호</th><th>주소</th><th>사용유무</th>
	</tr>
	<c:forEach items="${memberList}" var="member">
		<tr>
			<td>${member.memberId}</td>
			<td>${member.memberName}</td>
			<td><fmt:formatDate value="${member.regdate}" type="date"/></td>
			<td>${member.email}</td>
			<td>${member.phone}</td>
			<td>${member.address}</td>
			<td>
				<c:choose>
					<c:when test="${member.useyn == 'y'}">
						<a href="updateMember?useyn=y&memberId=${member.memberId}">사용</a>
					</c:when>
					<c:otherwise>
						<a href="updateMember?useyn=n&memberId=${member.memberId}">사용안함</a>
					</c:otherwise>
				</c:choose>	
			</td>
		</tr>
	</c:forEach>
</table>

<div class="pagenation">
				<c:if test="${pageMaker.prev}">
					<a href="memberList${pageMaker.makeQuery(pageMaker.startPage-1)}&memberName=${memberName}">[← 이전]&nbsp;</a>
				</c:if>

				<!-- [1][2][3]... 표시 부분 -->
				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}" var="index">
					<a href="memberList${pageMaker.makeQuery(index)}&memberName=${memberName}">[${index}]</a>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<a href="memberList${pageMaker.makeQuery(pageMaker.endPage+1)}&memberName=${memberName}">&nbsp;[다음 →]</a>
				</c:if>
			</div>
			<p>현재 페이지 : ${pageMaker.criteria.pageNumberNow}</p>
<%@ include file="../../footer.jsp" %>