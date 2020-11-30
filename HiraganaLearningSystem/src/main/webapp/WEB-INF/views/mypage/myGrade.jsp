<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses', 'Profit'],
          ['2014', 1000, 400, 200],
          ['2015', 1170, 460, 250],
          ['2016', 660, 1120, 300],
          ['2017', 1030, 540, 350]
        ]);

        var options = {
          chart: {
            title: 'Company Performance',
            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
<title>개구리 선생님의 일본어 교실</title>
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