<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h1 style="margin-top: 0.4rem;">히라가나 학습</h1>
<p style="color: green;">
	히라가나에는 46자의 기본 글자가 있습니다.<br>
	순서대로 공부하시는 것을 권장합니다!
</p>
<div style="margin-top: 0.13rem;">
	<form action="hiraganaSelectMethods" method="get">
		<select name="hiraganaLine" id="hiraganaSelectBox" class="button" style="font-size: 0.3rem; border: 1px solid lime;">
			<option value="あ행">① あ행</option>
			<option value="か행">② か행</option>
			<option value="さ행">③ さ행</option>
			<option value="た행">④ た행</option>
			<option value="な행">⑤ な행</option>
			<option value="は행">⑥ は행</option>
			<option value="ま행">⑦ ま행</option>
			<option value="や행">⑧ や행</option>
			<option value="ら행">⑨ ら행</option>
			<option value="わ행">⑩ わ행 + ん</option>
		</select>
		<input type="submit" class="button pinkButton" value="시작!" style="font-size: 0.18rem; margin-left: 0.1rem;">
	</form>
</div>
<%@ include file="../footer.jsp" %>