<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<form action="insertProduct" method="post" enctype="multipart/form-data" name="frm">
	<table class="table center" style="text-align: left;">
		<tr>
			<th>상품명</th>
			<td><input type="text" name="productName" size="35em"></td>
		</tr>
		<tr>
			<th>종류</th>
			<td><input type="text" name="kind"></td>
		</tr>
		<tr>
			<th>원가</th>
			<td><input type="number" name="price1"></td>
		</tr>
		<tr>
			<th>판매가</th>
			<td>
				<input type="number" name="price2">
				<input type="hidden" name="price3">
			</td>
		</tr>
		<tr>
			<th>설명</th>
			<td><textarea name="content" rows="8" cols="60"></textarea></td>
		</tr>
		<tr>
			<th>사용유무</th>
			<td>
				<input type="checkbox" name="useyn" value="y" checked="checked">사용
			</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="productImage"></td>
		</tr>
	</table>
	<input type="submit" value="저장" onclick="return adminProductCheck()">
</form>
<%@ include file="../../footer.jsp" %>