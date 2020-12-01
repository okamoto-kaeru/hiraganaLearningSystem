<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var jsonData = $.ajax({
        	type: 'POST',
    		headers: {
    			Accept: "application/json; charset=UTF-8",
    			"Content-type": "application/json; charset=UTF-8"
    		},
        	url: "gradeGraph",
        	data : { memberId : '${memberId}'},
        	success: function(map) {
        		console.log(jsonData)
    		},
    		error: function() {
    			console.log(${memberId});
    			alert("failed to data receive!");
    		}
        }).responseText;

        var options = {
          chart: {
            title: '각 퀴즈 10번의 성적',
            subtitle: '각 행의 연상법 1글자, 히라가나 1글자, 단어형 퀴즈 성적',
          },
          bars: 'vertical',
          vAxis: {format: 'decimal'},
          height: 400,
          colors: ['#1b9e77', '#d95f02', '#7570b3']
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(jsonData, google.charts.Bar.convertOptions(options));
      }
    </script>
<title>개구리 선생님의 일본어 교실</title>
<link rel="stylesheet" href="css/learningSystem.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

</head>
<body>
	<div id="container">
		<header>
			<img class="pointer" id="headerLogo" src="images/kaeruClass.jpg" onclick="location.href='index'" height="100px" width="200px">
			<nav id="headerNav">
				<ul>
					<c:choose>
						<c:when test="${empty loginUser}">
							<li><a href="login">로그인</a> ( </li>
							<li><a href="login">학습자</a></li>
							<li> | </li>
							<li><a href="adminLogin">admin</a></li>
							<li> ) / </li>
							<li><a href="join">회원가입</a></li>
							<li> / </li>
						</c:when>
						<c:otherwise>
							<li>${loginUser.memberId} 님</li>
							<li><a href="logout">로그아웃</a></li>
							<li> / </li>
						</c:otherwise>
					</c:choose>
					<li><a href="hiraganaHome">공부하기</a></li>
					<li> / </li>
					<li><a href="goMypage">마이 페이지</a></li>
					<li> / </li>
					<li><a href="shopping">교재사기</a></li>
					<li> / </li>
					<li><a href="boardMain">게시판</a></li>
				</ul>
			</nav>
			<hr color="lightgreen" width="100%">
		</header>
		
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>


<%@ include file="../footer.jsp" %>