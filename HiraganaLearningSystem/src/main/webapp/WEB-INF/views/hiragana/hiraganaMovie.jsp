<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h1>동영상을 보고 외웁시다!</h1>
<iframe class="center movieFlame" src="${movie}" 
		frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media;
		gyroscope; picture-in-picture" allowfullscreen style="margin-top: 0.3rem;"></iframe>


<input type="button" class="button greenButton center" value="외웠어요! 다음 단계로 가요!" style="font-size: 0.2rem; height: 0.5rem; width: 50%; margin-top: 0.2rem;" onclick="location.href='hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaAssociativeQuiz'">
<p style="color: red;">* 로그인하셔야 다음 단계로 갈 수 있습니다.</p>
<div style="width: 35%; position: relative; left: 65%;">
	<a href="hiraganaSelectMethods?hiraganaLine=${hiraganaLine}" style="font-size: 0.3rem;">${hiraganaLine} 공부<br> 선택 화면으로 가기</a>
</div>
<%@ include file="../footer.jsp" %>