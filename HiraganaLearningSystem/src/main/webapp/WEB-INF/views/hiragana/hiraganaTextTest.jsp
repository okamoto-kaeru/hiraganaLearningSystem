<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var hiraganaVOArr = [];
	// ajax를 이용해서 controller에서 hiraganaLineList가져오기
	$.ajax({
		type: 'GET',
		headers: {
			Accept: "application/json; charset=UTF-8",
			"Content-type": "application/json; charset=UTF-8"
		},
		url: 'hiraganaQuiz',
		data : { hiraganaLine : '${hiraganaLine}' },
		success: function(result) {			
			hiraganaVOArr = result;
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
	
	function doTest() {	
		
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
		for(var i = 0 ; i < 5 ; i++) {
			imagesButtonArr[i].attr('src', hiraganaVOArr[i].hiraganaAssociativeImage);
		}
		
		// 정답을 고른다
		var answer = Math.floor(Math.random() * 5);
		// 정답을 collectAnswerArr에 담는다.
		collectAnswerArr[count] = hiraganaVOArr[answer];
		
		
		// 문제를 음성으로 낸다.
		$('#hiraganaSound source').attr('src', '/sounds/hiraganaSounds/' + hiraganaVOArr[answer].hiraganaSound);
		
		// countdown변수 선언
		var countDown = 11;
		var id = setInterval(function() {
			if(countDown == 1) {
				clearInterval(id);
				countDown--;
				$('#countDown').text(countDown);
				answerArr[count] = "images/quiz/wrong.png";
				resultOX[count] = "images/quiz/wrong.png";	// x를 담는다
				judge.attr('src', "images/quiz/wrong.png");
				answering();
			} else {
				if(countDown == 10 || countDown == 6 || countDown == 3) {
					$('#hiraganaSound').get(0).play();
					console.log($('#hiraganaSound source').attr('src'));
				}
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
	
	function answering() {
		$('.imageButton').off();
		judge.slideDown(1000);			// 이미지가 내려온다.
		$('#showResult tr:last').after('<tr><td>' + (count + 1) + '</td>' 
									+ '<td><img src="' + collectAnswerArr[count].hiraganaImage + '" style="width: 40; height: 50;"></td>'
									+'<td><img src="' + answerArr[count] + '" style="width: 40; height: 50;"></td>'
									+'<td><img src="' + resultOX[count] + '" style="width: 50; height: 50;"></td></tr>');
		count++;
		$('#nextQuiz').show();
		if(count == 10) {
			$('#nextQuiz').attr('value', '성적 확인');
		}
	}
	
	
	// start 버튼을 클릭할 때 기능
	$('#start').one('click', function() {
		$('#hiraganaBGSound').get(0).play();
		// 설명화면을 제거
		$('#explain').fadeOut(500);
		$('#start').hide();
		doTest();
	});
	
	// 다음 문제 버튼을 클릭하면 다음 문제가 나온다.
	$('#nextQuiz').on('click', function() {
		$('.imageButton').removeClass('selected');
		if(count < 10) {
			$('#nextQuiz').hide();
			$('#countDown').text('시작!');
			$('#amountOfQuiz').text(count + 1 + '번째 문제');
			doTest();
		} else {
			$('#showResult tr:last').after('<tr><th colspan="3">점수</th><td style="font-size: 3em; color: orange;">' + (amountOfCollectAnswer * 10) + ' 점</td></tr>');
			$('.jsModal').fadeIn();
		}
	});
});

</script>    

<%@ include file="../header.jsp" %>

<!-- 히라가나 퀴즈 화면 -->
<div class="test" style="position: relative; top: 30px; border: 1px solid #ccc; padding-top: 20px; padding-bottom: 20px;">
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
<img id="explain" src="images/linkImages/hiraganaQuizAssociateExplain.png" width="960px" height="580px" style="position: absolute; top: 130px;">

<!-- 스타트 버튼, 다음 문제 버튼 -->
<audio id="hiraganaBGSound">
	<source src="sounds/hiraganaSounds/hiraganaBGSong.mp3" type="audio/mpeg">
</audio>
<audio id="hiraganaSound">
	<source src="" type="audio/mpeg">
</audio>
<input type="button" class="button greenButton center" id="start" value="공부 시작" style="margin-top: 50px; height: 30px;">
<span id="message"></span><input type="button" class="button greenButton center" id="nextQuiz" value="다음 문제" style="margin-top: 50px; height: 30px; display: none;">

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
			<input type="button" class="button blueButton center" onclick="location.href='hiraganaTestForm?hiraganaLine=${hiraganaLine}'" value="다시 하기" style="margin-top: 50px; height: 30px;">
			<input type="button" class="button greenButton center" onclick="location.href='hiraganaWrite'" value="다음 단계로 가기" style="margin-top: 50px; height: 30px;">
		</div>
	</div>
</div>

<%@ include file="../footer.jsp" %>