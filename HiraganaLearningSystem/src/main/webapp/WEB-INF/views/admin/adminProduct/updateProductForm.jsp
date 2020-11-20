<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<form action="updateProduct" method="post" enctype="multipart/form-data" name="frm">
	<table class="table" style="margin-top: 50px; text-align: center; border: 1px solid #ccc;">
		<tr>
			<th colspan="2">상품번호</th>
		</tr>
		<tr>
			<td colspan="2">${product.pseq}<input type="hidden" name="pseq" value="${product.pseq}"></td>
		</tr>
		<tr>
			<td>
				<img src="images/productImages/${product.image}" width="300" height="300">
				<input type="hidden" name="oldFileImage" value="${product.image}">
			</td>
		
		
			<td>
				<table class="table center">
					<tr>
						<th>상품명</th>
						<td><input type="text" name="productName" value="${product.productName}"></td>
					</tr>
					<tr>
						<th>종류</th>
						<td><input type="text" name="kind" value="${product.kind}"></td>
					</tr>
					<tr>
						<th>원가</th>
						<td><input type="number" name="price1" value="${product.price1}"></td>
					</tr>
					<tr>
						<th>판매가</th>
						<td>
							<input type="number" name="price2" value="${product.price2}">
							<input type="hidden" name="price3">
						</td>
					</tr>
					<tr>
						<th>설명</th>
						<td><textarea name="content" rows="8" cols="50" style="white-space: prewrap;">${product.content}</textarea></td>
					</tr>
					<tr>
						<th>사용유무</th>
						<td>
							<c:choose>
								<c:when test="${product.useyn == 'y'}">
									<input type="checkbox" name="useyn" value="y" checked="checked">사용
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="useyn" value="y">사용
								</c:otherwise>
							</c:choose>	
						</td>
					</tr>
					<tr>
						<th>이미지를 수정할 경우</th>
						<td><input type="file" name="productImage"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<input class="button pinkButton center" type="submit" value="수정" onclick="return adminProductCheck()" style="margin-top: 20px;">
</form>
<%@ include file="../../footer.jsp" %>