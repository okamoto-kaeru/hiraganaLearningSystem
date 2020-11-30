<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(window).on('load', function() {
	
	var hiraganaWordList = [];
	// ajax를 이용해서 controller에서 hiraganaLineList가져오기
	$.ajax({
		type: 'GET',
		headers: {
			Accept: "application/json; charset=UTF-8",
			"Content-type": "application/json; charset=UTF-8"
		},
		url: 'hiraganaWordQuiz',
		data : { hiraganaLine : '${hiraganaLine}' },
		success: function(hiraganaWordListJSON) {
			console.log(hiraganaWordListJSON);
			hiraganaWordList = hiraganaWordListJSON;
		},
		error: function() {
			alert("failed to data receive!");
		}
	});
	
		
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
				$('#wrongImage').slideDown(500);			// x이미지가 내려온다.
				countDown--;
				$('#countDown').text(countDown);
				answerArr[count] = "시간 초과";
				resultOX[count] = "images/quiz/wrong.png";	// x를 담는다
				answering();
			} else {
				countDown--;
				$('#countDown').text(countDown);
			}
		}, 1000);
		
		
		// 답하기를 클릭하면 동작하는 기능
		$('#answerButton').on('click', function() {
			clearInterval(id);
			if($('#inputWord').text() == "") {
				answerArr[count] = "답을 안 했어요...";		// 학습자가 고른 답을 answerArr에 담는다.
			} else {
				answerArr[count] = $('#inputWord').text();		// 학습자가 고른 답을 answerArr에 담는다.
			}
			
			if(hiraganaWordList[answer].hiraganaWordId == $('#inputWord').text()) {	// 정답이면
				$('#collectAnswerSound').get(0).play();
				$('#collectImage').slideDown(500);			// o이미지가 내려온다.
				resultOX[count] = "images/quiz/collect.png";	// o를 담는다
				amountOfCollectAnswer++;
				answering();
			} else {	// 답이 틀리면
				$('#wrongAnswerSound').get(0).play();
				$('#wrongImage').slideDown(500);			// x이미지가 내려온다.
				resultOX[count] = "images/quiz/wrong.png";	// x를 담는다
				answering();
			}
			
		});
	};
	
	// 퀴즈 결과를 표시 + 퀴즈 성적을 하나씩 준비
	function answering() {
		$('#answerButton').off();
		$('#hiraganaInput img').off();
		clearInterval(timeID);	// 퀴즈 음성을 멈춘다.
		$('#showResult tr:last').after('<tr><td>' + (count + 1) + '</td>' 
									+ '<td><span style="font-size: 30px;">' + collectAnswerArr[count] + '</span></td>'
									+'<td><span style="font-size: 30px;">' + answerArr[count] + '</td>'
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
		$('.judge').hide();
		
		// 히라가나 객체 순서를 썩는다
		for(var i = 0 ; i < hiraganaWordList.length ; i++) {
			var num = Math.floor(Math.random() * hiraganaWordList.length);
			var temp = hiraganaWordList[i];
			hiraganaWordList[i] = hiraganaWordList[num];
			hiraganaWordList[num] = temp;
		}

		
		// 정답을 고른다
		answer = Math.floor(Math.random() * hiraganaWordList.length);
		// 정답을 collectAnswerArr에 담는다.
		collectAnswerArr[count] = hiraganaWordList[answer].hiraganaWordId;
		// 이미지를 배치
		$('#wordImage').attr('src', 'images/hiraganaWordImages/' + hiraganaWordList[answer].hiraganaWordImage);		
		
		// 문제를 음성으로 낸다.
		$('#quizSrc').attr('src', 'sounds/hiraganaWordSounds/' + hiraganaWordList[answer].hiraganaWordSound);
			$('#quizSound').get(0).load();
			$('#quizSound').get(0).play();
			
		timeID = setInterval(function() {
			$('#quizSrc').attr('src', 'sounds/hiraganaWordSounds/' + hiraganaWordList[answer].hiraganaWordSound);
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
		
		// 키보드 대신 버튼 표시 각 행을 공부할 때, 공부한 글자만 나옴
		if($('#hiraganaLine').attr('value') == 'あ행') {
			$('.hiraganaLine_a').fadeIn(500);
		} else if($('#hiraganaLine').attr('value') == 'か행') {
			$('.hiraganaLine_a').add($('.hiraganaLine_ka')).fadeIn(500);
		} else if($('#hiraganaLine').attr('value') == 'さ행') {
			$('.hiraganaLine_a').add($('.hiraganaLine_ka')).add($('.hiraganaLine_sa')).fadeIn(500);
		} else if($('#hiraganaLine').attr('value') == 'た행') {
			$('.hiraganaLine_a').add($('.hiraganaLine_ka')).add($('.hiraganaLine_sa')).add($('.hiraganaLine_ta')).fadeIn(500);
		} else if($('#hiraganaLine').attr('value') == 'な행') {
			$('.hiraganaLine_a').add($('.hiraganaLine_ka')).add($('.hiraganaLine_sa')).add($('.hiraganaLine_ta')).add($('.hiraganaLine_na')).fadeIn(500);
		} else if($('#hiraganaLine').attr('value') == 'は행') {
			$('#hiraganaInput img').not($('.hiraganaLine_wa')).not($('.hiraganaLine_ra')).not($('.hiraganaLine_ya')).not($('.hiraganaLine_ma')).fadeIn(500);
		} else if($('#hiraganaLine').attr('value') == 'ま행') {
			$('#hiraganaInput img').not($('.hiraganaLine_wa')).not($('.hiraganaLine_ra')).not($('.hiraganaLine_ya')).fadeIn(500);
		} else if($('#hiraganaLine').attr('value') == 'や행') {
			$('#hiraganaInput img').not($('.hiraganaLine_wa')).not($('.hiraganaLine_ra')).fadeIn(500);
		} else if($('#hiraganaLine').attr('value') == 'ら행') {
			$('#hiraganaInput img').not($('.hiraganaLine_wa')).fadeIn(500);
		} else {
			$('#hiraganaInput img').fadeIn(500);
		}
		console.log($('#hiraganaLine').attr('value'));
		$('#start').hide();
		
		doTest();
	});
	
	/*--------------------------------- 다음 문제 버튼을 클릭하면 다음 문제가 나온다. ---------------------------------*/
	$('#nextQuiz').on('click', function() {
		$('#inputWord').text('');
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

// 다시하기 버튼을 누르면 성적을 저장하고 다시 이 페이지로 이동
function gradeAndHiraganaWordOneMoreTime() {
	document.frm.action="gradeAndHiraganaWordOneMoreTime";
	document.frm.submit();
}

// 단어형 퀴즈가 끝나고 다른행 가기 버튼을 클릭하면, hiraganaHome로 화면 이동
function gradeAndGoHiraganaHome() {
	document.frm.action="gradeAndGoHiraganaHome";
	document.frm.submit();
}
</script>    

<%@ include file="../header.jsp" %>

<!-- 히라가나 퀴즈 화면 -->
<div class="test" style="height: 250px; position: relative; top: 10px; padding-top: 10px; padding-bottom: 10px;">
	<span id="amountOfQuiz" style="font-size: 35px; margin-left: 50px; position: absolute; top: 10px; left: -30px;">문제 1</span>
	<button class="button pinkButton quizButton" onclick="$('#inputWord').text('')" style="left: 2%">다시 입력</button>
	<span id="countDown" style="font-size: 5em; margin-left: 50px; position: absolute; top: 10px; right: 30px; color: #5151ff">시작!</span>
	<button class="button orangeButton quizButton" id="answerButton" style="right: 2%">답하기</button>
	<img id="wordImage" width="267px" height="150px">
		<div>
			<span id="inputWord" style="text-align: center; font-size: 5em; color: orange;"></span>
		</div>
</div>

<!-- 히라가나 입력 버튼 표시 -->
<table class="center" id="hiraganaInput" style="text-align: center;">
	<!-- あ단 -->
	<tr>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_96.png" class="hiraganaLine_wa" onclick="$('#inputWord').append('ん')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_91.png" class="hiraganaLine_wa" onclick="$('#inputWord').append('わ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_81.png" class="hiraganaLine_ra" onclick="$('#inputWord').append('ら')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_71.png" class="hiraganaLine_ya" onclick="$('#inputWord').append('や')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_61.png" class="hiraganaLine_ma" onclick="$('#inputWord').append('ま')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_51.png" class="hiraganaLine_ha" onclick="$('#inputWord').append('は')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_41.png" class="hiraganaLine_na" onclick="$('#inputWord').append('な')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_31.png" class="hiraganaLine_ta" onclick="$('#inputWord').append('た')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_21.png" class="hiraganaLine_sa" onclick="$('#inputWord').append('さ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_11.png" class="hiraganaLine_ka" onclick="$('#inputWord').append('か')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_1.png" class="hiraganaLine_a" onclick="$('#inputWord').append('あ')"></td>
	</tr>
	<!-- い단 -->
	<tr>		
		<td></td>
		<td></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_82.png" class="hiraganaLine_ra" onclick="$('#inputWord').append('り')"></td>
		<td></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_62.png" class="hiraganaLine_ma" onclick="$('#inputWord').append('み')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_52.png" class="hiraganaLine_ha" onclick="$('#inputWord').append('ひ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_42.png" class="hiraganaLine_na" onclick="$('#inputWord').append('に')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_32.png" class="hiraganaLine_ta" onclick="$('#inputWord').append('ち')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_22.png" class="hiraganaLine_sa" onclick="$('#inputWord').append('し')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_12.png" class="hiraganaLine_ka" onclick="$('#inputWord').append('き')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_2.png" class="hiraganaLine_a" onclick="$('#inputWord').append('い')"></td>
	</tr>
	<!-- う단 -->
	<tr>		
		<td></td>
		<td></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_83.png" class="hiraganaLine_ra" onclick="$('#inputWord').append('る')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_73.png" class="hiraganaLine_ya" onclick="$('#inputWord').append('ゆ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_63.png" class="hiraganaLine_ma" onclick="$('#inputWord').append('む')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_53.png" class="hiraganaLine_ha" onclick="$('#inputWord').append('ふ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_43.png" class="hiraganaLine_na" onclick="$('#inputWord').append('ぬ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_33.png" class="hiraganaLine_ta" onclick="$('#inputWord').append('つ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_23.png" class="hiraganaLine_sa" onclick="$('#inputWord').append('す')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_13.png" class="hiraganaLine_ka" onclick="$('#inputWord').append('く')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_3.png" class="hiraganaLine_a" onclick="$('#inputWord').append('う')"></td>
	</tr>
	<!-- え단 -->
	<tr>		
		<td></td>
		<td></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_84.png" class="hiraganaLine_ra" onclick="$('#inputWord').append('れ')"></td>
		<td></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_64.png" class="hiraganaLine_ma" onclick="$('#inputWord').append('め')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_54.png" class="hiraganaLine_ha" onclick="$('#inputWord').append('へ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_44.png" class="hiraganaLine_na" onclick="$('#inputWord').append('ね')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_34.png" class="hiraganaLine_ta" onclick="$('#inputWord').append('て')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_24.png" class="hiraganaLine_sa" onclick="$('#inputWord').append('せ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_14.png" class="hiraganaLine_ka" onclick="$('#inputWord').append('け')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_4.png" class="hiraganaLine_a" onclick="$('#inputWord').append('え')"></td>
	</tr>
	<!-- お단 -->
	<tr>		
		<td></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_95.png" class="hiraganaLine_wa" onclick="$('#inputWord').append('を')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_85.png" class="hiraganaLine_ra" onclick="$('#inputWord').append('ろ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_75.png" class="hiraganaLine_ya" onclick="$('#inputWord').append('よ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_65.png" class="hiraganaLine_ma" onclick="$('#inputWord').append('も')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_55.png" class="hiraganaLine_ha" onclick="$('#inputWord').append('ほ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_45.png" class="hiraganaLine_na" onclick="$('#inputWord').append('の')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_35.png" class="hiraganaLine_ta" onclick="$('#inputWord').append('と')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_25.png" class="hiraganaLine_sa" onclick="$('#inputWord').append('そ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_15.png" class="hiraganaLine_ka" onclick="$('#inputWord').append('こ')"></td>
		<td><img src="images/hiraganaTextImages/hiraganaTextImage_5.png" class="hiraganaLine_a" onclick="$('#inputWord').append('お')"></td>
	</tr>
</table>

<!-- o, x 이미지 -->
<img id="collectImage" class="center judge" src="images/quiz/collect.png" width="400px" height="400px" style="position: absolute; top: 25%; left: 50%; transform: translate(-50%, 0); display: none;">
<img id="wrongImage" class="center judge" src="images/quiz/wrong.png" width="400px" height="400px" style="position: absolute; top: 25%; left: 50%; transform: translate(-50%, 0); display: none;">

<!-- hiragana word 퀴즈에 메인 이미지 -->
<img id="explain" src="images/linkImages/hiraganaQuizAssociateExplain.png" width="960px" height="580px" style="position: absolute; top: 130px;">


<!-- 무순 행인지 표시 -->
<span id="whatLine" style="position:absolute; font-size: 8em; top: 500px; left: 30px; color: rgb(125, 12, 240);">${hiraganaLine}</span>


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

<!-- 스타트 버튼, 다음 문제 버튼 -->
<input type="button" class="button greenButton center" id="start" value="공부 시작" style="position: absolute; left: 50%; top: 85%; transform: translate(-50%, -50%); height: 90px; display: none; font-size: 2em;">
<span id="message"></span><input type="button" class="button greenButton center" id="nextQuiz" value="다음 문제" style="font-size: 2em; width: 600px; height: 80px; position: absolute; top: 70%; left: 50%; transform: translate(-50%, 0px); display: none;">
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
				<input type="hidden" id="hiraganaLine" name="hiraganaLine" value="${hiraganaLine}">
				<input type="hidden" name="memberId" value="${memberId}">
				<input type="hidden" name="whatQuiz" value="${whatQuiz}">
				<input type="hidden" id="score" name="score">
				<input type="button" class="button blueButton center" onclick="gradeAndHiraganaWordOneMoreTime()" value="다시 하기" style="margin-top: 20px; height: 50px;">
				<input type="button" class="button greenButton center" onclick="gradeAndGoHiraganaHome()" value="다른행 공부하기" style="margin-top: 20px; height: 50px;">
			</form>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp" %>