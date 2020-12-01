<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<table class="table" id="indexTable" style="border-spacing: 60px;">
	<tr>
	    <td style="font-size: 1.5em; text-align: left;">① 처음은 동영상을 보고 <br> <span style="color: pink; font-size: 1.5em;">연상법</span>으로 외워 봅시다!</td>
		<td><a href="goHiraganaMovie?hiraganaLine=${hiraganaLine}"><img src="images/linkImages/goMovie.png" height=250px width=400px></a></td>
	</tr>
	<tr>
	    <td style="font-size: 1.5em; text-align: left;">② <span style="color: #88ff88; font-size: 1.5em;">퀴즈</span>를 통해서<br> 연상법 그림을 외워 봅시다!</td>
		<td>
			<a href="hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaAssociativeQuiz"><img src="images/linkImages/hiraganaQuizAssociate.png" height=250px width=400px></a>
			<span style="color: red;">*로그인 필수</span>
		</td>
	</tr>
	<tr>
	    <td style="font-size: 1.5em; text-align: left;">③ 이제 <span style="color: #9fdefd; font-size: 1.5em;">히라가나</span>를<br> 외워 봅시다!</td>
	    <td>
	        <a href="hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaTextQuiz"><img src="images/linkImages/hiraganaQuizText.png" height=250px width=400px></a>
	        <span style="color: red;">*로그인 필수</span>
	    </td>
	</tr>
    <tr>
        <td style="font-size: 1.5em; text-align: left;">④ 단어형 퀴즈를 풀고<br> <span style="color: #ff8040; font-size: 1.5em;">완전히</span> 외워 봅시다!</td>
        <td>
        	<a href="hiraganaWordQuizForm?hiraganaLine=${hiraganaLine}"><img src="images/linkImages/hiraganaQuizWord.png" height=250px width=400px></a>
        	<span style="color: red;">*로그인 필수</span>
        </td>
	</tr>
</table>

<%@ include file="../footer.jsp" %>