<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h1>동영상을 보고 외웁시다!</h1>
<iframe width="560" height="315" class="center" src="${movie}" 
		frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media;
		gyroscope; picture-in-picture" allowfullscreen style="margin-top: 30px;"></iframe>


<input type="button" class="button greenButton center" value="외웠어요! 다음 단계로 가요!" style="font-size: 20px; height: 50px; width: 20em; margin-top: 20px;" onclick="location.href='hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaAssociativeQuiz'">
<p style="color: red;">* 로그인하셔야 다음 단계로 갈 수 있습니다.</p>
<%@ include file="../footer.jsp" %>