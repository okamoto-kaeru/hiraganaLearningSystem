<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<h2>히라가나 단어 수정</h2>
<p style="color: red; font-size: 20px;">${message}</p>
<form action="updateHiraganaWord" method="post" enctype="multipart/form-data" name="frm">
	<table class="table center" style="text-align: left;">
		<tr>
			<th>단어 아이디(일본어로 단어 입력)</th>
			<td>
				<input type="hidden" name="hiraganaWordSeq" value="${word.hiraganaWordSeq}">
				<input type="text" name="hiraganaWordId" value="${word.hiraganaWordId}">
			</td>
		</tr>
		<tr>
			<th>단어의 종류 입력</th>
			<td><input type="text" name="hiraganaWordKind" value="${word.hiraganaWordKind}"></td>
		</tr>
		<tr>
			<th>행</th>
			<td>
				<select name="hiraganaLine">
					<option value="hiraganaLine_a" <c:if test="${word.hiraganaLine=='hiraganaLine_a'}">selected="selected"</c:if>>あ행</option>
					<option value="hiraganaLine_ka" <c:if test="${word.hiraganaLine == 'hiraganaLine_ka'}">selected="selected"</c:if>>か행</option>
					<option value="hiraganaLine_sa" <c:if test="${word.hiraganaLine == 'hiraganaLine_sa'}">selected="selected"</c:if>>さ행</option>
					<option value="hiraganaLine_ta" <c:if test="${word.hiraganaLine == 'hiraganaLine_ta'}">selected="selected"</c:if>>た행</option>
					<option value="hiraganaLine_na" <c:if test="${word.hiraganaLine == 'hiraganaLine_na'}">selected="selected"</c:if>>な행</option>
					<option value="hiraganaLine_ha" <c:if test="${word.hiraganaLine == 'hiraganaLine_ha'}">selected="selected"</c:if>>は행</option>
					<option value="hiraganaLine_ma" <c:if test="${word.hiraganaLine == 'hiraganaLine_ma'}">selected="selected"</c:if>>ま행</option>
					<option value="hiraganaLine_ya" <c:if test="${word.hiraganaLine == 'hiraganaLine_ya'}">selected="selected"</c:if>>や행</option>
					<option value="hiraganaLine_ra" <c:if test="${word.hiraganaLine == 'hiraganaLine_ra'}">selected="selected"</c:if>>ら행</option>
					<option value="hiraganaLine_wa" <c:if test="${word.hiraganaLine == 'hiraganaLine_wa'}">selected="selected"</c:if>>わ행</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>원래 이미지</th>
			<td>
				<img src="images/hiraganaWordImages/${word.hiraganaWordImage}" height="200" width="200">
				<input type="hidden" name="hiraganaWordImage" value="${word.hiraganaWordImage}">
			</td>
		</tr>
		<tr>
			<th>이미지를 수정할려면 파일을 업로드 하세요</th>
			<td><input type="file" name="uploadWordImage"></td>
		</tr>
		<tr>
			<th>원래 소리</th>
			<td><input type="text" name="hiraganaWordSound" value="${word.hiraganaWordSound}" readonly="readonly"></td>
		</tr>
		<tr>
			<th>소리를 수정할려면 파일을 업로드 하세요</th>
			<td><input type="file" name="uploadWordSound"></td>
		</tr>
	</table>
	<input class="button pinkButton" type="submit" value="저장" style="height: 30px; margin-top: 20px;" onclick="return adminHiraganaWordCheck()">
	<input class="button blueButton" type="button" value="삭제" style="height: 30px; margin-top: 20px;" onclick="deleteHiraganaWord()">
</form>

<%@ include file="../../footer.jsp" %>