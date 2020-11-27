<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div style="margin-bottom: 20px;">
	<%@ include file="productMenu.jsp" %>
	<div style="width: 80%; float: right;">
	<h1>상품정보</h1>
	<c:forEach items="${kindList}" var="product">
		<div style="margin-left: auto; margin-right: auto;">
			<a href="productDetail?pseq=${product.pseq}">
				<img src="images/productImages/${product.image}" width="200" height="200" style="margin-top: 30px;"><br>
			</a>
			<div style="width: 150px margin-right: auto; margin-left: auto">
				<a href="productDetail?pseq=${product.pseq}">
					${product.productName}<br>
					가격: ${product.price2}
				</a>
			</div>
		</div>
	</c:forEach>
	</div>
</div>


<%@ include file="../footer.jsp" %>