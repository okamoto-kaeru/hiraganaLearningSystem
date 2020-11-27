<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
	<%@ include file="orderMenu.jsp" %>
	<div style="width: 80%; float: right">
		<h1>주문 상세 정보</h1>
		<table class="table center">
			<tr>
				<th>장바구니에 담은 날짜</th><th>주문번호</th><th>주문자</th><th>주문 금액</th><th>주문 상태</th>
			</tr>
			<tr>
				<td><fmt:formatDate value="${detailInfo.indate}" type="date"/></td>
				<td>${detailInfo.oseq}</td>
				<td>${detailInfo.memberName}</td>
		 	    <td><fmt:formatNumber pattern="₩#,###">${totalPrice}</fmt:formatNumber></td>
		 	    <td>
		 	    	<c:choose>
		 	    		<c:when test="${detailInfo.result == '1'}">발송 준비중</c:when>
		 	    		<c:otherwise><span style="color: red;">발송됨</span></c:otherwise>
		 	    	</c:choose>
		 	    </td>
		    </tr>
		</table>
		<hr>
		<table class="table center" style="margin-top: 30px;">
		    <tr>
				<th>상품명</th><th>수량</th><th>가격</th><th>발송 준비 상태</th>
			</tr>
		 <c:forEach items="${orderList}" var="item">
		 	<tr>
		 		<td>${item.productName}</td>
		 		<td>${item.quantity}</td>
		 		<td style="text-align: right;"><fmt:formatNumber pattern="₩#,###">${item.price2}</fmt:formatNumber></td>
		 		<td>
		 	    	<c:choose>
		 	    		<c:when test="${item.result == '1'}">발송 준비중</c:when>
		 	    		<c:when test="${detailInfo.result == '2'}"><span style="color: red;">발송됨</span></c:when>
		 	    		<c:otherwise><span style="color: blue;">준비됨</span></c:otherwise>
		 	    	</c:choose>
		 	    </td>
		 	</tr>
		 </c:forEach>
		    
		</table>
		<input class="button greenButton center" type="button" value="쇼핑하기" onclick="location.href='shopping'">
	</div>
</div>
<%@ include file="../footer.jsp" %>