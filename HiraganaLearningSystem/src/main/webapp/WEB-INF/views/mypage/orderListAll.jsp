<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
	<div style="width: 15%; margin-top: 80px;float: left">
	<%@ include file="orderMenu.jsp" %>
	</div>
	<div style="width: 83%; margin-top: 30px;float: right">
		<h1>주문 정보</h1>
		
		<c:choose>
		 <c:when test="${!empty orderList}">
		 	<table class="table center">
			 	  	<tr>
			  		<th>주문번호</th><th>주문 일자</th><th>상품명</th><th>가격</th><th>발송 상태</th><th>주문 상세</th>
			  	</tr>
			   <c:forEach items="${orderList}" var="item">
				   	<tr>
				   		<td>${item.oseq}</td>
				   		<td><fmt:formatDate value="${item.indate}" type="date"/></td>
				   		<td>${item.productName}</td>
				   		<td style="text-align: right;"><fmt:formatNumber pattern="₩#,###">${item.price2}</fmt:formatNumber></td>
				   		<td>
				   			<c:choose>
				   				<c:when test="${item.result == '1'}">
				   					<span style="color: blue;">발송 대기중</span>
				   				</c:when>
				   				<c:otherwise>
				   					발송 처리됨
				   				</c:otherwise>
				   			</c:choose>
				   		</td>
				   		<td><a href="orderDetail?oseq=${item.oseq}">조회</a></td>
				   	</tr>
			    </c:forEach>
		 	</table>
		  <input class="button greenButton center" type="button" value="쇼핑을 계속하기" onclick="location.href='shopping'">
		 </c:when>
			<c:otherwise>
				<h3>주문 하신 상품이 없습니다.</h3>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<%@ include file="../footer.jsp" %>