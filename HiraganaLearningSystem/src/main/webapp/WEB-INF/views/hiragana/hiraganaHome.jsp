<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h1 style="margin-top: 50px;">히라가나 학습</h1>
<p style="color: green;">
	히라가나에는 46자의 기본 글자가 있습니다.<br>
	순서대로 공부하시는 것을 권장합니다!
</p>
<div style="margin-top: 20px;">
	<form action="hiraganaSelectMethods" method="get">
		<select name="hiraganaLine" id="hiraganaSelectBox" class="button" style="font-size: 1.5em; border: 1px solid lime;">
			<option value="hiraganaLine_a">① あ행</option>
			<option value="hiraganaLine_ka">② か행</option>
			<option value="hiraganaLine_sa">③ さ행</option>
			<option value="hiraganaLine_ta">④ た행</option>
			<option value="hiraganaLine_na">⑤ な행</option>
			<option value="hiraganaLine_ha">⑥ は행</option>
			<option value="hiraganaLine_ma">⑦ ま행</option>
			<option value="hiraganaLine_ya">⑧ や행</option>
			<option value="hiraganaLine_ra">⑨ ら행</option>
			<option value="hiraganaLine_wa">⑩ わ행 + ん</option>
		</select>
		<input type="submit" class="button pinkButton" value="시작!" style="font-size: 18px; height: 3em; margin-left: 10px; text-weight: 20;">
	</form>
</div>
<%@ include file="../footer.jsp" %>