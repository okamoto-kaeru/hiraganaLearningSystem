<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<table class="table" style="margin-top: 50px; text-align: center; border: 1px solid #ccc;">
	<tr>
		<th colspan="2">상품번호</th>
	</tr>
	<tr>
		<td colspan="2">${product.pseq}</td>
	</tr>
	<tr>
		<td>
			<img src="images/productImages/${product.image}" width="300" height="300">
		</td>
	
	
		<td>
			<table class="table center">
				<tr>
					<th>상품명</th>
					<td>${product.productName}</td>
				</tr>
				<tr>
					<th>종류</th>
					<td>${product.kind}</td>
				</tr>
				<tr>
					<th>원가</th>
					<td><fmt:formatNumber pattern="₩#,###">${product.price1}</fmt:formatNumber></td>
				</tr>
				<tr>
					<th>판매가</th>
					<td><fmt:formatNumber pattern="₩#,###">${product.price2}</fmt:formatNumber></td>
				</tr>
				<tr>
					<th>이익</th>
					<td><fmt:formatNumber pattern="₩#,###">${product.price3}</fmt:formatNumber></td>
				</tr>
				<tr>
					<th>설명</th>
					<td>${product.content}</td>
				</tr>
				<tr>
					<th>사용유무</th>
					<td>
						<c:choose>
							<c:when test="${product.useyn == 'y'}">
								사용
							</c:when>
							<c:otherwise>
								사용안함
							</c:otherwise>
						</c:choose>	
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<div style="margin-top: 20px;">
	<input type="button" class="button blueButton center" value="정보 수정" onclick="location.href='updateProduct?pseq=${product.pseq}'">
	<input type="button" class="button greenButton center" value="상품 리프트" onclick="location.href='adminProduct'" style="margin-left: 10px;">
</div>
<%@ include file="../../footer.jsp" %>