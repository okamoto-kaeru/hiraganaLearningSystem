<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#study').on('click', function() {
			$('#tabNav a').removeClass();
			$(this).addClass("tabFocus");
			$('#tabBody div').hide();
			$('#tab1').show();
		});
		
		$('#order').on('click', function() {
			$('#tabNav a').removeClass();
			$(this).addClass("tabFocus");
			$('#tabBody div').hide();
			$('#tab2').show();
		});
		
		$('#board').on('click', function() {
			$('#tabNav a').removeClass();
			$(this).addClass("tabFocus");
			$('#tabBody div').hide();
			$('#tab3').show();
		});
	});
</script>

<h1 style="color: black; background-color: #ceffdf;">${loginUser.memberId} 님 페이지</h1>
<div id="tabNav" style="font-size: 0.3rem;">
	<a class="tabFocus" id="study" href="#" style="margin-right: 0.1rem;">공부 정보</a>
	<a href="#" id="order">주문 정보</a>
	<a href="#" id="board" style="margin-left: 0.1rem;">게시판 정보</a>
</div>
<div id="tabBody">
	<div id="tab1">
		<table class="table center pcMypageTable">
			<tr>
				<th  style="width: 33%;">성적</th>
				<th style="width: 33%;">마지막에 공부한 내용</th>
				<td rowspan="2" style="width: 33%;"><a href="hiraganaSelectMethods?hiraganaLine=${hiraganaLine}" style="font-size: 0.4rem;">${hiraganaLine} 공부하기</a></td>
			</tr>
			<tr>
				<td><a href="showGrade" style="font-size: 0.3rem;">성적보기</a></td>
				<td style="color: orange; font-size: 0.3rem;">
					${hiraganaLine}
					<c:choose>
						<c:when test="${kind == 'hiraganaAssociativeQuiz'}">
							<img class="pointer mypageImages" src="images/linkImages/hiraganaQuizAssociate.png" onclick="location.href='hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaAssociativeQuiz'">
						</c:when>
						<c:when test="${kind == 'hiraganaTextQuiz'}">
							<img class="pointer mypageImages" src="images/linkImages/hiraganaQuizText.png" onclick="location.href='hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaTextQuiz'">
						</c:when>
						<c:otherwise>
							<img class="pointer mypageImages" src="images/linkImages/hiraganaQuizWord.png" onclick="location.href='hiraganaWordQuizForm?hiraganaLine=${hiraganaLine}'">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<table class="table center spMypageTable">
			<tr>
				<th>성적</th>
				<td><a href="showGrade" style="font-size: 0.3rem;">성적보기</a></td>
			</tr>
			<tr>
				<th>마지막에 공부한 내용</th>
				<td style="color: orange; font-size: 0.3rem;">
					${hiraganaLine}
					<c:choose>
						<c:when test="${kind == 'hiraganaAssociativeQuiz'}">
							<img class="pointer mypageImages" src="images/linkImages/hiraganaQuizAssociate.png" onclick="location.href='hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaAssociativeQuiz'">
						</c:when>
						<c:when test="${kind == 'hiraganaTextQuiz'}">
							<img class="pointer mypageImages" src="images/linkImages/hiraganaQuizText.png" onclick="location.href='hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaTextQuiz'">
						</c:when>
						<c:otherwise>
							<img class="pointer mypageImages" src="images/linkImages/hiraganaQuizWord.png" onclick="location.href='hiraganaWordQuizForm?hiraganaLine=${hiraganaLine}'">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td><a href="hiraganaSelectMethods?hiraganaLine=${hiraganaLine}" style="font-size: 0.4rem;">${hiraganaLine} 공부<br>선택 화면으로 가기</a></td>
			</tr>
		</table>
	</div>
	<div id="tab2" style="display: none;">
		<table class="table center pcMypageTable">
			<tr>
				<th style="width: 33%;">장바구니</th>
				<th style="width: 33%;">주문 상태</th>
				<td rowspan="2" style="width: 33%;"><img class="pointer mypageImages" src="images/linkImages/orderListAll.png" onclick="location.href='orderListAll'"></td>
			</tr>
			<tr>
				<td>
					<c:choose>
						<c:when test="${cart}">
							${cartInfo}<br><br>　→　<a href="cartList"">장바구니 보기</a>
						</c:when>
						<c:otherwise>
							장바구니에 상품이 없습니다.
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${order}">
							<a href="orderList">발송을 기다리는 <br><span style='color: orange; font-size: 0.2rem'>상품이 있습니다</span><br> →　주문내역 보기</a>
						</c:when>
						<c:otherwise>
							발송을 기다리는 상품이 없습니다.
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<table class="table center spMypageTable">
			<tr>
				<th>장바구니</th>
				<td>
					<c:choose>
						<c:when test="${cart}">
							${cartInfo}<br><br>　→　<a href="cartList"">장바구니 보기</a>
						</c:when>
						<c:otherwise>
							장바구니에 상품이 없습니다.
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>주문 상태</th>
				<td>
					<c:choose>
						<c:when test="${order}">
							<a href="orderList">발송을 기다리는 <br><span style='color: orange; font-size: 0.2rem'>상품이 있습니다</span><br> →　주문내역 보기</a>
						</c:when>
						<c:otherwise>
							발송을 기다리는 상품이 없습니다.
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td><img class="pointer mypageImages" src="images/linkImages/orderListAll.png" onclick="location.href='orderListAll'"></td>
			</tr>
		</table>
	</div>
	<div id="tab3" style="display: none;">
		<table class="table center pcMypageTable" style="width: 50%;">
			<c:choose>
				<c:when test="${board}">
					<tr>
						<th>내가 쓴 글</th><td rowspan="2"><img class="pointer mypageImages" src="images/linkImages/goBoard.png" onclick="location.href='goMyBoard?memberId=${memberId}'"></td>
					</tr>
					<tr>
						<td>
							<a href="goMyBoard?memberId=${memberId}">내가 쓴 <span style='color: orange; font-size: 0.2rem'>글이 있습니다</span><br> →　내가 쓴 글 보기</a>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th>내가 쓴 글</th><td rowspan="2"><img class="pointer mypageImages" src="images/linkImages/goBoard.png" onclick="location.href='boardMain'"></td>
					</tr>
					<tr>
						<td>
							내가 쓴 글이 없습니다<br> →　<a href="boardMain">게시판으로 가기</a>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<table class="table center spMypageTable">
			<c:choose>
				<c:when test="${board}">
					<tr>
						<th>내가 쓴 글</th>
						<td>
							<img class="pointer mypageImages" src="images/linkImages/goBoard.png" onclick="location.href='goMyBoard?memberId=${memberId}'"><br>
							<a href="goMyBoard?memberId=${memberId}">내가 쓴 <span style='color: orange; font-size: 0.2rem'>글이 있습니다</span><br> →　내가 쓴 글 보기</a>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th>내가 쓴 글</th>
						<td>
							<img class="pointer mypageImages" src="images/linkImages/goBoard.png" onclick="location.href='boardMain'"><br>
							내가 쓴 글이 없습니다<br> →　<a href="boardMain">게시판으로 가기</a>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>
<%@ include file="../footer.jsp" %>