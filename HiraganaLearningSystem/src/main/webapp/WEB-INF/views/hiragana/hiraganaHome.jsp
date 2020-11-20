<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h1>히라가나를 공부 합시다.</h1>
<p style="color: green;">
	히라가나 기본글자는 46글자가 있습니다.<br>
	한글의 가나다라...와 같이 순서가 있습니다.<br>
	순서대로 공부하시는 것을 권장합니다!
</p>
<div style="margin-top: 20px;">
	<form action="hiraganaSelectMethods" method="get">
		<select name="hiraganaLine" id="hiraganaSelectBox" class="button" style="font-size: 1.5em; border: 1px solid lime;">
			<option value="hiraganaLine_a">あ행</option>
			<option value="hiraganaLine_ka">か행</option>
			<option value="hiraganaLine_sa">さ행</option>
			<option value="hiraganaLine_ta">た행</option>
			<option value="hiraganaLine_na">な행</option>
			<option value="hiraganaLine_ha">は행</option>
			<option value="hiraganaLine_ma">ま행</option>
			<option value="hiraganaLine_ya">や행</option>
			<option value="hiraganaLine_ra">ら행</option>
			<option value="hiraganaLine_wa">わ행 + ん</option>
		</select>
		<input type="submit" class="button pinkButton" value="을 공부해요!" style="height: 3em; margin-left: 10px; text-weight: 20;">
	</form>
</div>
<%@ include file="../footer.jsp" %>