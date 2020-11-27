<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div>
	<div style="width: 15%; margin-top: 80px;float: left">
	<%@ include file="orderMenu.jsp" %>
	</div>
	<div style="width: 85%; margin-top: 30px;float: right">
		<h1>주문 내역</h1>
		<table class="table center">
		  	<tr>
				<th>상품명</th><th>수량</th><th>가격</th><th>장바구니에 담은 날짜</th>
			</tr>
		 <c:forEach items="${orderList}" var="item">
		 	<tr>
		 		<td>${item.productName}</td>
		 		<td>${item.quantity}</td>
		 		<td style="text-align: right;"><fmt:formatNumber pattern="₩#,###">${item.price2}</fmt:formatNumber></td>
		 		<td><fmt:formatDate value="${item.indate}" type="date"/></td>
		 	</tr>
		 </c:forEach>
			<tr>
				<th colspan="2" style="text-align: right; background-color: orange;">합계 금액</th>
				<td style="text-align: right; background-color: orange;"><fmt:formatNumber pattern="₩#,###">${totalPrice}</fmt:formatNumber></td>
			</tr>
		</table>
		<p style="text-align: center; text-weight: bold; color: red; font-size: 20px;">주문 처리가 완료 되었습니다.</p>
		<input class="button greenButton center" type="button" value="쇼핑하기" onclick="location.href='shopping'">
	</div>
</div>
    
<%@ include file="../footer.jsp" %>