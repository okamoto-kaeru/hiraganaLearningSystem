<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>

<h2>새 히라가나 단어 등록</h2>
<p style="color: red; font-size: 20px;">${message}</p>
<form action="insertQuiz" method="post" enctype="multipart/form-data" name="frm">
	<table class="table center" style="text-align: left;">
		<tr>
			<th>단어 아이디(일본어로 단어 입력)</th>
			<td><input type="text" name="hiraganaWordId"></td>
		</tr>
		<tr>
			<th>단어의 종류 입력</th>
			<td><input type="text" name="hiraganaWordKind"></td>
		</tr>
		<tr>
			<th>행</th>
			<td>
				<select name="hiraganaLine">
					<option value="hiraganaLine_a">あ행</option>
					<option value="hiraganaLine_ka">か행</option>
					<option value="hiraganaLine_sa">さ행</option>
					<option value="hiraganaLine_ta">た행</option>
					<option value="hiraganaLine_na">な행</option>
					<option value="hiraganaLine_ha">は행</option>
					<option value="hiraganaLine_ma">ま행</option>
					<option value="hiraganaLine_ya">や행</option>
					<option value="hiraganaLine_ra">ら행</option>
					<option value="hiraganaLine_wa">わ행</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="uploadWordImage"></td>
		</tr>
		<tr>
			<th>소리</th>
			<td><input type="file" name="uploadWordSound"></td>
		</tr>
	</table>
	<input class="button pinkButton" type="submit" value="저장" style="height: 30px; margin-top: 20px;" onclick="return adminHiraganaWordCheck()">
</form>

<%@ include file="../../footer.jsp" %>