<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<table id="indexTable" style="border-spacing: 60px;">
	<tr>
	    <td style="color: purple;">처음은 동영상을 보고 <br>연상법으로 외워 봅시다!</td>
		<td><a href="goHiraganaMovie?hiraganaLine=${hiraganaLine}"><img src="images/linkImages/goMovie.png" height=250px width=400px></a></td>
	</tr>
	<tr>
	    <td style="color: purple;">2</td>
		<td>
			<a href="hiraganaTestForm?hiraganaLine=${hiraganaLine}"><img src="images/linkImages/hiraganaQuizAssociate.png" height=250px width=400px></a>
			<span style="color: red;">*로그인 필수</span>
		</td>
	</tr>
	<tr>
	    <td style="color: purple;"></td>
	    <td>
	        <a href="#"><img src="images/linkImages/hiraganaQuizText.png" height=250px width=400px></a>
	        <span style="color: red;">*로그인 필수</span>
	    </td>
	</tr>
	<tr>
	    <td style="color: purple;"></td>
		<td><a href="#"><img src="images/linkImages/goWrite.png" height=250px width=400px></a></td>
    </tr>
    <tr>
        <td style="color: purple;"></td>
        <td><a href="#"><img src="images/linkImages/hiraganaQuizWord.png" height=250px width=400px></a></td>
	</tr>
</table>

<%@ include file="../footer.jsp" %>