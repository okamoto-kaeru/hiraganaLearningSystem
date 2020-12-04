<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<table class="responseTable" id="indexTable" style="border-spacing: 60px;">
	<tr>
		<td><img class="pointer" src="images/linkImages/goStudy.png" height=250px width=400px onclick="location.href='hiraganaHome'"></td>
		<td><img class="pointer" src="images/linkImages/goMypage.png" height=250px width=400px onclick="location.href='goMypage'"></td>
	</tr>
	<tr>
		<td><img class="pointer" src="images/linkImages/goShopping.png" height=250px width=400px onclick="location.href='shopping'"></td>
		<td><img class="pointer" src="images/linkImages/goBoard.png" height=250px width=400px onclick="location.href='boardMain'"></td>
	</tr>
</table>

<%@ include file="footer.jsp" %>