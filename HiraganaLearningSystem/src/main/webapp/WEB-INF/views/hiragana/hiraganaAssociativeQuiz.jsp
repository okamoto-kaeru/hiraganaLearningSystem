<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(window).on('load', function() {
	
	var hiraganaVOArr = [];
	var whatQuiz;
	// ajax를 이용해서 controller에서 hiraganaLineList가져오기
	$.ajax({
		type: 'GET',
		headers: {
			Accept: "application/json; charset=UTF-8",
			"Content-type": "application/json; charset=UTF-8"
		},
		url: 'hiraganaQuiz',
		data : { hiraganaLine : '${hiraganaLine}',
				 whatQuiz : '${whatQuiz}' },
		success: function(map) {
			console.log(map.hiraganaLineList);
			console.log(map.whatQuiz);
			whatQuiz = map.whatQuiz;
			hiraganaVOArr = map.hiraganaLineList;
		},
		error: function() {
			alert("failed to data receive!");
		}
	});
	
	var imagesButtonArr = [$('#image1'), $('#image2'), $('#image3'), $('#image4'), $('#image5')]
	
	var timerID;
	var count = 0;
	var judge = $('#judge');
	
	var answerArr = new Array(10);		// 학습자의 답
	var collectAnswerArr = new Array(10);	// 정답
	var resultOX = new Array(10);	// 결과 ox
	var amountOfCollectAnswer = 0;   // to show the score
	var countDown = 11;  // doTest()에서 쓰는 countdown변수 선언
	var answer; // answer를 담을 변수 선언
	
	// 히라가나 퀴즈 구현
	function doTest() {	
		makeAnswer();
		
		countDown = 11;
		var id = setInterval(function() {
			if(countDown == 1) {
				clearInterval(id);
				countDown--;
				$('#countDown').text(countDown);
				answerArr[count] = "images/quiz/timeup.png";
				resultOX[count] = "images/quiz/wrong.png";	// x를 담는다
				judge.attr('src', "images/quiz/wrong.png");
				answering();
			} else {
				countDown--;
				$('#countDown').text(countDown);
			}
		}, 1000);
		
		
		// 정답을 클릭하면 이미지를 o로 설정.
		imagesButtonArr[answer].on('click', function() {
			clearInterval(id);
			answerArr[count] = $(this).attr('src');		// 학습자가 고른 답을 answerArr에 담는다.
			resultOX[count] = "images/quiz/collect.png";	// o를 담는다
			judge.attr('src', "images/quiz/collect.png");
			amountOfCollectAnswer++;
			$(this).addClass("selected");
			answering();
		});
		
		// 정답 아니면 이미지를 x로 설정.
		for(var i = 0 ; i < imagesButtonArr.length ; i++) {
			if(i != answer) {
				imagesButtonArr[i].on('click', function() {
					clearInterval(id);
					answerArr[count] = $(this).attr('src');		// 학습자가 고른 답을 answerArr에 담는다.
					resultOX[count] = "images/quiz/wrong.png";	// x를 담는다
					judge.attr('src', "images/quiz/wrong.png");
					$(this).addClass("selected");
					answering();
				});
			}
		}
	};
	
	// 퀴즈 결과를 표시 + 퀴즈 성적을 하나씩 준비
	function answering() {
		$('.imageButton').off();
		clearInterval(timeID);	// 퀴즈 음성을 멈춘다.
		judge.slideDown(500);			// 이미지가 내려온다.
		$('#showResult tr:last').after('<tr><td>' + (count + 1) + '</td>' 
									+ '<td><img src="images/hiraganaTextImages/' + collectAnswerArr[count].hiraganaImage + '" style="width: 40; height: 50;"></td>'
									+'<td><img src="' + answerArr[count] + '" style="width: 40; height: 50;"></td>'
									+'<td><img src="' + resultOX[count] + '" style="width: 50; height: 50;"></td></tr>');
		count++;
		$('#nextQuiz').show();
		if(count == 10) {
			$('#nextQuiz').attr('value', '성적 확인');
		}
	}
	
	
	var timeID;
	// 답을 정한다.
	function makeAnswer() {
		// o, x를 숨긴다.
		$('#judge').hide();
		
		// 히라가나 객체 순서를 썩는다
		for(var i = 0 ; i < 5 ; i++) {
			var num = Math.floor(Math.random() * 5);
			var temp = hiraganaVOArr[i];
			hiraganaVOArr[i] = hiraganaVOArr[num];
			hiraganaVOArr[num] = temp;
		}
		
		// 각 이미지를 배치
		
		if(whatQuiz == "hiraganaAssociativeQuiz") {
			for(var i = 0 ; i < 5 ; i++) {
				imagesButtonArr[i].attr('src', 'images/hiraganaAssociativeImages/' + hiraganaVOArr[i].hiraganaAssociativeImage);
			}
		} else {
			for(var i = 0 ; i < 5 ; i++) {
				imagesButtonArr[i].attr('src', 'images/hiraganaTextImages/' + hiraganaVOArr[i].hiraganaImage);
			}
		}
		
		
		// 정답을 고른다
		answer = Math.floor(Math.random() * 5);
		// 정답을 collectAnswerArr에 담는다.
		collectAnswerArr[count] = hiraganaVOArr[answer];
		
		
		// 문제를 음성으로 낸다.
		$('#quizSrc').attr('src', 'sounds/hiraganaSounds/' + hiraganaVOArr[answer].hiraganaSound);
			$('#quizSound').get(0).load();
			$('#quizSound').get(0).play();
			
		timeID = setInterval(function() {
			$('#quizSrc').attr('src', 'sounds/hiraganaSounds/' + hiraganaVOArr[answer].hiraganaSound);
			$('#quizSound').get(0).load();
			$('#quizSound').get(0).play();
			if(countDown == 0) {
				clearInterval(timeID);
			}
		}, 4000);
		
	}
	
	
	
	/*--------------------------------- start 버튼을 클릭할 때 기능 ---------------------------------*/
	$('#start').one('click', function() {
		var audio = $('#hiraganaBGSound');
		audio.prop('volume', 0.4);
		audio.get(0).play();
		
		// 설명화면을 제거
		$('#explain').fadeOut(500);
		$('#caution').fadeOut(500);
		$('#whatLine').fadeOut(500);
		$('#start').hide();
		
		doTest();
	});
	
	/*--------------------------------- 다음 문제 버튼을 클릭하면 다음 문제가 나온다. ---------------------------------*/
	$('#nextQuiz').on('click', function() {
		$('.imageButton').removeClass('selected');
		if(count < 10) {
			$('#nextQuiz').hide();
			$('#countDown').text('시작!');
			$('#amountOfQuiz').text(count + 1 + '번째 문제');
			doTest();
		} else {
			$('#score').attr('value', amountOfCollectAnswer * 10)
			$('#showResult tr:last').after('<tr><th colspan="2">점수</th><td colspan="2" style="font-size: 2.5em; color: orange;">' + (amountOfCollectAnswer * 10) + ' 점</td></tr>');
			$('.jsModal').fadeIn();
		}
	});
});

// ajax 읽기가 끝나면 스타트 버튼이 나옴
$(document).ajaxComplete(function() {
	$('#start').fadeIn(300);
});
</script>    

<%@ include file="../header.jsp" %>

<!-- 히라가나 퀴즈 화면 -->
<div class="test" style="height: 510px; position: relative; top: 30px; border: 1px solid #ccc; padding-top: 20px; padding-bottom: 20px;">
<span id="amountOfQuiz" style="font-size: 35px; margin-left: 50px; position: absolute; top: 10px; left: -30px; color: #6af702">첫번째 문제</span><span id="countDown" style="font-size: 5em; margin-left: 50px; position: absolute; top: 10px; right: 30px; color: #5151ff">시작!</span>
	<img id="image1" width="200" height="250" class="pointer imageButton" style="position: relative; right: 50px;">
	<img id="image2" width="200" height="250" class="pointer imageButton" style="position: relative; left: 50px;"><br>
	<img id="image3" width="200" height="250" class="pointer imageButton" style="position: relative; right: 100px;">
	<img id="image4" width="200" height="250" class="pointer imageButton" style="position: relative;">
	<img id="image5" width="200" height="250" class="pointer imageButton" style="position: relative; left: 100px;">
</div>

<!-- o, x 이미지 -->
<img id="judge" class="center" width="400px" height="400px" style="position: absolute; top: 210px; left: 278px; display: none;">

<!-- hiragana 퀴즈에 메인 이미지 -->
<c:choose>
	<c:when test='${whatQuiz == "hiraganaAssociativeQuiz"}'>
		<img id="explain" src="images/linkImages/hiraganaQuizAssociateExplain.png" width="960px" height="580px" style="position: absolute; top: 130px;">
	</c:when>
	<c:otherwise>
		<img id="explain" src="images/linkImages/hiraganaQuizTextExplain.png" width="960px" height="580px" style="position: absolute; top: 130px;">
	</c:otherwise>
</c:choose>

<!-- 무순 행인지 표시 -->
<span id="whatLine" style="position:absolute; font-size: 8em; top: 500px; left: 30px; color: rgb(125, 12, 240);">${whatLine}행</span>


<!-- audio -->
<audio id="hiraganaBGSound" loop>
	<source src="sounds/hiraganaSounds/hiraganaBGSong.mp3" type="audio/mpeg">
</audio>
<audio id="quizSound">
	<source id="quizSrc" src="" type="audio/mpeg">
</audio>

<!-- 스타트 버튼, 다음 문제 버튼 -->
<input type="button" class="button greenButton center" id="start" value="공부 시작" style="margin-top: 50px; height: 50px; display: none; font-size: 2em;">
<span id="message"></span><input type="button" class="button greenButton center" id="nextQuiz" value="다음 문제" style="margin-top: 50px; margin-bottom: 30px; height: 50px; display: none; font-size: 2em;">
<p id="caution" style="color: red;">*음성이 나옵니다.</p>

<!-- 성적 확인 시 modal 표시 -->
<div class="modal jsModal">
	<div class="modalBackGround">
		<div class="modalContent">
			<h2>성적</h2>
			<table class="table" id="showResult" style="text-align: center;">
				<tr>
					<th>문제 번호</th><th>정답</th><th>당신의 답</th><th>결과</th>
				</tr>
			</table>
			<form method="get" name="frm">	<!-- 성적을 기록하는 hidden -->
				<input type="hidden" name="hiraganaLine" id="hiraganaLine" value="${hiraganaLine}">
				<input type="hidden" name="memberId" id="memberId" value="${memberId}">
				<input type="hidden" name="whatQuiz" id="whatQuiz" value="${whatQuiz}">
				<input type="hidden" id="score" name="score">
				<input type="button" class="button blueButton center" onclick="goNewGradeAndOneMoreTime()" value="다시 하기" style="margin-top: 20px; height: 50px;">
				<c:choose>
					<c:when test='${whatQuiz == "hiraganaAssociativeQuiz"}'>
						<input type="button" class="button greenButton center" onclick="goNewGradeAndGoHiraganaTextQuiz()" value="다음 단계로 가기" style="margin-top: 20px; height: 50px;">
					</c:when>
					<c:otherwise>
						<input type="button" class="button greenButton center" onclick="goNewGradeAndGoHiraganaWrite()" value="다음 단계로 가기" style="margin-top: 20px; height: 50px;">
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp" %>