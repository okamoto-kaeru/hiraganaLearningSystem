<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script type="text/javascript">
	function putCart() {
		document.frm.action="putCart";
		document.frm.submit();
	}
	
	
	function payNow() {
		document.frm.action="payNow";
		document.frm.submit();
	}
</script>

<div style="margin: 0.2rem 0;">
	<%@ include file="productMenu.jsp" %>
	<div style="width: 80%; float: right; margin-bottom: 0.2rem;">
		<h1>상품 상세 정보</h1>
		<form name="frm">
			<table class="center" id="detailTable" style="text-align: center; font-size: 0.25rem; margin-bottom: 0.2rem;">
				<tr>
					<td><img class="poroductDetailImage" src="images/productImages/${productVO.image}"></td>
				</tr>
				<tr>
					<th><span style="color: #00cc00; font-size: 0.4rem;">${productVO.productName}</span></th>
				</tr>
				<tr>
					<td>가격: ${productVO.price2}</td>
				</tr>
				<tr>
					<td>${productVO.content}</td>
				</tr>
				<tr>
					<td>수량: 
						<input type="number" name="quantity" value=1 min=1 id="quantity">
						<input type="hidden" name="pseq" value="${productVO.pseq}">
					</td>
					
				</tr>
			</table>
			<input class="button orangeButton" type="button" value="장바구니에 담기" name="cart" onclick="putCart()">
			<input class="button greenButton" type="button" value="쇼핑 계속하기"  name="shopping" onclick="location.href='shopping'">
		</form>
	</div>
</div>
<%@ include file="../footer.jsp" %>