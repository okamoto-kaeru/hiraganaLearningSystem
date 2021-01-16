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
					<option value="あ행">あ행</option>
					<option value="か행">か행</option>
					<option value="さ행">さ행</option>
					<option value="た행">た행</option>
					<option value="な행">な행</option>
					<option value="は행">は행</option>
					<option value="ま행">ま행</option>
					<option value="や행">や행</option>
					<option value="ら행">ら행</option>
					<option value="わ행">わ행</option>
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