<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h1>마이 페이지</h1>

<div>
<h2>공부 정보</h2>

</div>

<div>
	<h2>주문 정보</h2>
	<table class="center mypageInfo" style="float: left; position: relative; left: 100px;">
		<tr>
			<th>${cart}</th>
		</tr>
		<tr>
			<td><a href="cartList">장바구니 보기</a></td>
		</tr>
	</table>
	<table class="center mypageInfo"  style="float: right; position: relative; right: 100px;">
		<tr>
			<th>${order}</th>
		</tr>
		<tr>
			<td><a href="orderList">주문내역 보기</a></td>
		</tr>
	</table>
</div>

<div>
<h2>내가 쓴 글 정보</h2>
<p>
	${board}<br>
	<c:choose>
		<c:when test="${!empty boardList}">
			<a href="goMyBoard?boardList=${boardList}">내가 쓴 글 보기</a>
		</c:when>
		<c:otherwise>
			<a href="boardMain">게시판으로 가기</a>
		</c:otherwise>
	</c:choose>
</p>

</div>

<%@ include file="../footer.jsp" %>