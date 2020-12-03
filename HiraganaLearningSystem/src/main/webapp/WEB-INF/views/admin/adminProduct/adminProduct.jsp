<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<h2>상품 정보</h2>
<form action="adminProduct">
	<input type="text" name="productName" placeholder="상품 이름을 넣고 검색">
	<input type="submit" class="button pinkButton adminSearch" value="검색">
</form>
<div style="text-align: right;">
	<input type="button" class="button orangeButton" value="새 상품 추가" onclick="location.href='insertProduct'">
</div>
<table class="table center" style="margin-top: 30px;">
	<tr>
		<th>상품번호</th><th>등록일</th><th>상품명</th><th>원가</th><th>판매가</th><th>사용유뮤</th>
	</tr>
	<c:forEach items="${productList}" var="item">
		<tr>
			<td>${item.pseq}</td>
			<td><fmt:formatDate value="${item.regdate}" type="date"/></td>
			<td><a href="adminProductDetail?pseq=${item.pseq}">${item.productName}</a></td>
			<td><fmt:formatNumber pattern="₩#,###">${item.price1}</fmt:formatNumber></td>
			<td><fmt:formatNumber pattern="₩#,###">${item.price2}</fmt:formatNumber></td>
			<td>
				<c:choose>
					<c:when test="${item.useyn == 'y'}">
						사용
					</c:when>
					<c:otherwise>
						사용안함
					</c:otherwise>
				</c:choose>	
			</td>
		</tr>
	</c:forEach>
</table>

<div class="pagenation">
	<c:if test="${pageMaker.prev}">
		<a href="adminProduct${pageMaker.makeQuery(pageMaker.startPage-1)}&productName=${productName}">[← 이전]&nbsp;</a>
	</c:if>

	<!-- [1][2][3]... 표시 부분 -->
	<c:forEach begin="${pageMaker.startPage}"
		end="${pageMaker.endPage}" var="index">
		<a href="adminProduct${pageMaker.makeQuery(index)}&productName=${productName}">[${index}]</a>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<a href="adminProduct${pageMaker.makeQuery(pageMaker.endPage+1)}&productName=${productName}">&nbsp;[다음 →]</a>
	</c:if>
</div>
<p>현재 페이지 : ${pageMaker.criteria.pageNumberNow}</p>
			
<%@ include file="../../footer.jsp" %>