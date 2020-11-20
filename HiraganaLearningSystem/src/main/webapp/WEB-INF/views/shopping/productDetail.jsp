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

<h1>교재 사기</h1>
<div style="margin-top: -20px;">
	<%@ include file="productMenu.jsp" %>
	<div style="width: 80%; float: right">
		<h1>상품 상세 정보</h1>
		<form name="frm">
			<table id="detailTable" style="text-align: center; margin-left: auto; margin-right: auto; font-size: 25px;">
				<tr>
					<td><img src="images/productImages/${productVO.image}" width="300" height="300"></td>
				</tr>
				<tr>
					<th><span style="color: #00cc00; font-size: 40px;">${productVO.productName}</span></th>
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