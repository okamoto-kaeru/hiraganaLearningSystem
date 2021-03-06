<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

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
	
	
	var imagesButtonArr = [$('#image1'), $('#image2'), $('#image3')]
	
	var count = 0;
	
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
				$('#wrongAnswerSound').get(0).play();
				$('#wrongImage').slideDown(500);			// 이미지가 내려온다.
				countDown--;
				$('#countDown').text(countDown);
				answerArr[count] = "images/quiz/timeup.png";
				resultOX[count] = "images/quiz/wrong.png";	// x를 담는다
				answering();
			} else {
				countDown--;
				$('#countDown').text(countDown);
			}
		}, 1000);
		
		
		// 정답을 클릭하면 이미지를 o로 설정.
		imagesButtonArr[answer].on('click', function() {
			clearInterval(id);
			$('#collectAnswerSound').get(0).play();
			$('#collectImage').slideDown(500);			// o이미지가 내려온다.
			answerArr[count] = $(this).attr('src');		// 학습자가 고른 답을 answerArr에 담는다.
			resultOX[count] = "images/quiz/collect.png";	// o를 담는다
			amountOfCollectAnswer++;
			$(this).addClass("selected");
			answering();
		});
		
		// 정답 아니면 이미지를 x로 설정.
		for(var i = 0 ; i < imagesButtonArr.length ; i++) {
			if(i != answer) {
				imagesButtonArr[i].on('click', function() {
					clearInterval(id);
					$('#wrongAnswerSound').get(0).play();
					$('#wrongImage').slideDown(500);			// x이미지가 내려온다.
					answerArr[count] = $(this).attr('src');		// 학습자가 고른 답을 answerArr에 담는다.
					resultOX[count] = "images/quiz/wrong.png";	// x를 담는다
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
		$('#showResult tr:last').after('<tr><td>' + (count + 1) + '</td>' 
									+ '<td><img src="images/hiraganaTextImages/' + collectAnswerArr[count].hiraganaImage + '" style="width: 0.4rem; height: 0.5rem;"></td>'
									+'<td><img src="' + answerArr[count] + '" style="width: 0.4rem; height: 0.5rem;"></td>'
									+'<td><img src="' + resultOX[count] + '" style="width: 0.5rem; height: 0.5rem;"></td></tr>');
		count++;
		$('#nextQuiz').show();
		if(count == 10) {
			$('#nextQuiz').attr('value', '성적 확인');
		}
	}
	
	var prevAnswer = "";
	var timeID;
	// 답을 정한다.
	function makeAnswer() {
		// o, x를 숨긴다.
		$('.judge').hide();
		
		// 히라가나 객체 순서를 썩는다
		for(var i = 0 ; i < 3 ; i++) {
			var num = Math.floor(Math.random() * 3);
			var temp = hiraganaVOArr[i];
			hiraganaVOArr[i] = hiraganaVOArr[num];
			hiraganaVOArr[num] = temp;
		}
		
		// 각 이미지를 배치
		
		if(whatQuiz == "hiraganaAssociativeQuiz") {
			for(var i = 0 ; i < 3 ; i++) {
				imagesButtonArr[i].attr('src', 'images/hiraganaAssociativeImages/' + hiraganaVOArr[i].hiraganaAssociativeImage);
			}
		} else {
			for(var i = 0 ; i < 3 ; i++) {
				imagesButtonArr[i].attr('src', 'images/hiraganaTextImages/' + hiraganaVOArr[i].hiraganaImage);
			}
		}
		
		
		// 정답을 고른다.  같은 문제가 연속으로 안나오게 한다.
		do {
			answer = Math.floor(Math.random() * 3);
		} while(prevAnswer == hiraganaVOArr[answer])
			
		prevAnswer = hiraganaVOArr[answer];
		
		// 정답을 collectAnswerArr에 담는다.
		collectAnswerArr[count] = hiraganaVOArr[answer];
		
		
		// 문제를 음성으로 낸다.
		$('#quizSrc').attr('src', 'sounds/hiraganaSounds/' + hiraganaVOArr[answer].hiraganaSound);
			$('#quizSound').get(0).load();
			$('#quizSound').get(0).play();
			
		timeID = setInterval(function() {
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
		$('.testScreen').fadeIn(300);
		
		// 설명화면을 제거
		$('#explain').fadeOut(500);
		$('#caution').fadeOut(500);
		$('#hiraganaLine').fadeOut(500);
		$('#start').hide();
		
		doTest();
	});
	
	/*--------------------------------- 다음 문제 버튼을 클릭하면 다음 문제가 나온다. ---------------------------------*/
	$('#nextQuiz').on('click', function() {
		$('.imageButton').removeClass('selected');
		if(count < 10) {
			$('#nextQuiz').hide();
			$('#countDown').text('시작!');
			$('#amountOfQuiz').text('문제 ' + (count + 1));
			doTest();
		} else {
			$('#score').attr('value', amountOfCollectAnswer * 10)
			$('#showResult tr:last').after('<tr><th colspan="2">점수</th><td colspan="2" style="font-size: 2.5em; color: orange;">' + (amountOfCollectAnswer * 10) + ' 점</td></tr>');
			$('.jsModal').fadeIn();
		}
	});
});

//ajax 읽기가 끝나면 스타트 버튼이 나옴
$(document).ajaxComplete(function() {
	$('#start').fadeIn(300);
});


//동영상 다시보기 버튼을 누르면 성적을 저장하고 동영상 페이지로 이동
function goNewGradeAndGoMovie() {
	document.frm.action = "goNewGradeAndGoMovie";
	document.frm.submit();
}

//다시하기 버튼을 누르면 성적을 저장하고 다시 이 페이지로 이동
function gradeAndHiraganaWordOneMoreTime() {
	document.frm.action="gradeAndHiraganaWordOneMoreTime";
	document.frm.submit();
}

//단어형 퀴즈가 끝나고 다른행 가기 버튼을 클릭하면, hiraganaHome로 화면 이동
function gradeAndGoHiraganaHome() {
	document.frm.action="gradeAndGoHiraganaHome";
	document.frm.submit();
}
</script>    


<!-- 히라가나 퀴즈 화면 -->
<div class="testScreen quizDiv" style="height: 5.1rem; position: relative; top: 0.3rem; padding-top: 0.2rem; padding-bottom: 0.2rem;  display: none;">
<span id="amountOfQuiz" style="font-size: 0.35rem; margin-left: 0.5rem; position: absolute; top: 0.1rem; left: -0.3rem;">문제 1</span><span id="countDown" style="font-size: 0.5rem; margin-left: 0.5rem; position: absolute; top: 0.1rem; right: 0.3rem; color: #5151ff">시작!</span>
	<img id="image1" class="pointer imageButton" style="position: relative; top: 1.5rem; left: -0.3rem;">
	<img id="image2" class="pointer imageButton" style="position: relative; top: 1.5rem; ">
	<img id="image3" class="pointer imageButton" style="position: relative; top: 1.5rem; right: -0.3rem;">
</div>

<!-- o, x 이미지 -->
<img id="collectImage" class="center judge" src="images/quiz/collect.png" style="position: absolute; top: 25%; left: 50%; transform: translate(-50%, 0); display: none;">
<img id="wrongImage" class="center judge" src="images/quiz/wrong.png" style="position: absolute; top: 25%; left: 50%; transform: translate(-50%, 0); display: none;">


<div class="quizMain" style="margin-top: 2%;">
	<!-- hiragana 퀴즈에 메인 이미지 -->
	<c:choose>
		<c:when test='${whatQuiz == "hiraganaAssociativeQuiz"}'>
			<img id="explain" src="images/linkImages/hiraganaQuizAssociateExplain.png">
		</c:when>
		<c:otherwise>
			<img id="explain" src="images/linkImages/hiraganaQuizTextExplain.png">
		</c:otherwise>
	</c:choose>
	
	<!-- 무순 행인지 표시 -->
	<span id="hiraganaLine" style="font-size: 1.1rem; top: 80%; left: -30%; color: rgb(125, 12, 240);">${hiraganaLine}</span>
	
	<div>
		<!-- 스타트 버튼, 다음 문제 버튼 -->
		<input type="button" class="button greenButton center" id="start" value="공부 시작" style="position: relative; height: 0.9rem; display: none; font-size: 0.3rem; translate: transformX(-50%);">
		<span id="message"></span><input type="button" class="button greenButton center" id="nextQuiz" value="다음 문제" style="font-size: 0.3rem; width: 6rem; height: 0.8rem; position: relative; display: none; translate: transformX(-50%);">
		<p id="caution" style="color: red; position: relative; font-size: 0.22rem;">*음성이 나옵니다.</p>
	</div>
</div>

<!-- audio -->
<audio id="hiraganaBGSound" preload="auto" loop>
	<source src="sounds/quizSounds/hiraganaBGSong.mp3" type="audio/mpeg">
</audio>
<audio id="quizSound">
	<source id="quizSrc" src="" type="audio/mpeg">
</audio>
<audio id="collectAnswerSound" preload="auto">
	<source id="collectAnswerSrc" src="sounds/quizSounds/collectSound.mp3" type="audio/mpeg">
</audio>
<audio id="wrongAnswerSound" preload="auto">
	<source id="wrongAnswerSrc" src="sounds/quizSounds/wrongSound.mp3" type="audio/mpeg">
</audio>

<!-- 성적 확인 시 modal 표시 -->
<div class="modal jsModal">
	<div class="modalBackGround">
		<div class="modalContent">
			<h2>성적</h2>
			<table class="table center" id="showResult" style="text-align: center;">
				<tr>
					<th>문제 번호</th><th>정답</th><th>당신의 답</th><th>결과</th>
				</tr>
			</table>
			<form method="get" name="frm">	<!-- 성적을 기록하는 hidden -->
				<input type="hidden" name="hiraganaLine" value="${hiraganaLine}">
				<input type="hidden" name="memberId" value="${memberId}">
				<input type="hidden" name="whatQuiz" value="${whatQuiz}">
				<input type="hidden" id="score" name="score">
				<input type="button" class="button orangeButton center modalButton" onclick="goNewGradeAndGoMovie()" value="다시 동영상 보기">
				<input type="button" class="button blueButton center modalButton" onclick="goNewGradeAndOneMoreTime()" value="다시 하기"><br>
				<c:choose>
					<c:when test='${whatQuiz == "hiraganaAssociativeQuiz"}'>
						<input type="button" class="button greenButton center modalButton" onclick="goNewGradeAndGoHiraganaTextQuiz()" value="다음 단계로 가기">
					</c:when>
					<c:otherwise>
						<input type="button" class="button greenButton center modalButton" onclick="goNewGradeAndGoHiraganaWordQuiz()" value="다음 단계로 가기">
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp" %>