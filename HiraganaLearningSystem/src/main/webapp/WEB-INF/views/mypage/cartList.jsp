<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
	<div style="width: 15%; margin-top: 80px;float: left">
	<%@ include file="orderMenu.jsp" %>
	</div>
	<div style="width: 85%; margin-top: 30px;float: right">
		<h1>장바구니 정보</h1>
	    <c:choose>
		    <c:when test="${!empty cartList}">
			    <form method="post" name="frm">
			    	<table class="table center" style="margin-bottom: 20px;">
			    	  	<tr>
				    		<th>상품명</th><th>수량</th><th>가격</th><th>장바구니에 담은 날짜</th><th>삭제 항목</th>
				    	</tr>
					    <c:forEach items="${cartList}" var="item">
					    	<tr>
					    		<td>${item.productName}</td>
					    		<td>${item.quantity}</td>
					    		<td style="text-align: right;"><fmt:formatNumber pattern="₩#,###">${item.price2}</fmt:formatNumber></td>
					    		<td><fmt:formatDate value="${item.indate}" type="date"/></td>
					    		<td><input type="checkbox" name="cseq" value="${item.cseq}"></td>
					    	</tr>
					    </c:forEach>
					    <tr>
					    	<th colspan="2" style="text-align: right; background-color: orange;">합계 금액</th>
					    	<td style="text-align: right; background-color: orange;"><fmt:formatNumber pattern="₩#,###">${totalPrice}</fmt:formatNumber></td>
					    	<td colspan="2" style="text-align: right;"><input class="button glayButton" type="button" value="장바구내에서 삭제" onclick="deleteFromCart()"></td>
					    </tr>
			    	</table>
			    	<input class="button greenButton" type="button" value="쇼핑을 계속하기" onclick="location.href='shopping'" style="margin-left: 20px;">
			    	<input class="button pinkButton" type="button" value="주문하기" onclick="buy()" style="margin-left: 20px;">
			    </form>
		    </c:when>
	    	<c:otherwise>
	    		<h3>장바구니에 상품이 없습니다.</h3>
	    	</c:otherwise>
	    </c:choose>
	 </div>
</div>
<%@ include file="../footer.jsp" %>