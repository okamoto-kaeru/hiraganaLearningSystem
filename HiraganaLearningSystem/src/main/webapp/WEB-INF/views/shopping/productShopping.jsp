<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div style="margin: 20px, 0;">
    <%@ include file="productMenu.jsp" %>
	<div style="width: 80%; float: right">
	<h2 style="text-align: center; color: orange;">신상품</h2>
		<div id="newProductImages">
			<c:forEach items="${newProductList}" var="newItem">
				<div style="display: inline-block; margin-left: 10px; border: 1px solid #ccc;">
					<a href="productDetail?pseq=${newItem.pseq}">
						<img src="images/productImages/${newItem.image}" width="100" height="100" >
						<h3>${newItem.productName}</h3>
						<p>${newItem.price2}</p>
					</a>
				</div>
			</c:forEach>
		</div>
		
	<h2>Best 상품</h2>
		<div id="bestProductImages">
			<c:forEach items="${bestProductList}" var="bestItem">
				<div style="display: inline-block; margin-left: 10px; border: 1px solid #ccc;">
					<a href="productDetail?pseq=${bestItem.pseq}">
						<img class="productImages" src="images/productImages/${bestItem.image}"  width="100" height="100">
						<h3>${bestItem.productName}</h3>
						<p>${bestItem.price2}</p>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>