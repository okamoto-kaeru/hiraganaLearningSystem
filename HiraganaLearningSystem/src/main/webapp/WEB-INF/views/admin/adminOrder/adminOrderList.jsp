<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<h2>주문 정보</h2>
<form action="adminOrderList">
	<input type="text" name="memberName">
	<input type="submit" class="button pinkButton" value="검색">
</form>

<c:choose>
	<c:when test="${empty orderList}">
		<h2>주문 리스트가 없습니다.</h2>
	</c:when>
	<c:otherwise>
		<form action="updateOrderDetail" method="get" name="frm">
			<table class="table center" style="margin-top: 30px; border-spacing: 1em 0.5em;">
				<tr>
					<th>주문자</th><th>주문번호</th><th>상품명</th><th>가격</th><th>수량</th><th>주문 날짜</th><th>발송 처리</th>
				</tr>
				<c:forEach items="${orderList}" var="order">
					<tr>
						<td>${order.memberName}</td>
						<td>${order.oseq}</td>
						<td>${order.productName}</td>
						<td><fmt:formatNumber pattern="₩#,###">${order.price2}</fmt:formatNumber></td>
						<td>${order.quantity}</td>
						<td><fmt:formatDate value="${order.indate}" type="date"/></td>
						<td>
							<c:choose>
								<c:when test="${order.result == '1'}">
									미처리 <input type="checkbox" name="odseq" value="${order.odseq}"><span style="color: red; font-size: 10px;">처리한다면, 체크하십시오.</span>
								</c:when>
								<c:otherwise>
									처리됨
								</c:otherwise>
							</c:choose>	
						</td>
					</tr>
				</c:forEach>
			</table>
				
			<div class="pagenation">
				<c:if test="${pageMaker.prev}">
					<a href="adminOrderList${pageMaker.makeQuery(pageMaker.startPage-1)}&memberName=${memberName}">[← 이전]&nbsp;</a>
				</c:if>

				<!-- [1][2][3]... 표시 부분 -->
				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}" var="index">
					<a href="adminOrderList${pageMaker.makeQuery(index)}&memberName=${memberName}">[${index}]</a>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<a href="adminOrderList${pageMaker.makeQuery(pageMaker.endPage+1)}&memberName=${memberName}">&nbsp;[다음 →]</a>
				</c:if>
			</div>
			<p>현재 페이지 : ${pageMaker.criteria.pageNumberNow}</p>
			
			<input type="button" class="button blueButton center" value="발송 처리하기" onclick="goUpdateOrderDetail()" style="margin-top: 15px;"> 
		</form>
	</c:otherwise>
</c:choose>


<%@ include file="../../footer.jsp" %>