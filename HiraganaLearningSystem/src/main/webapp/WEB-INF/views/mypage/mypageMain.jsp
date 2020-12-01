<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#study').on('click', function() {
			$('#tabBody div').hide();
			$('#tab1').show();
		});
		
		$('#order').on('click', function() {
			$('#tabBody div').hide();
			$('#tab2').show();
		});
		
		$('#board').on('click', function() {
			$('#tabBody div').hide();
			$('#tab3').show();
		});
	});
</script>

<h1 style="color: black; background-color: #ceffdf;">${loginUser.memberId} 님 페이지</h1>
<div id="tabNav">
	<a id="study" href="#" style="margin-right: 10px;">공부 정보</a>
	<a href="#" id="order">주문 정보</a>
	<a href="#" id="board" style="margin-left: 10px;">게시판 정보</a>
</div>
<div id="tabBody">
	<div id="tab1">
		<c:choose>
			<c:when test="${grade}">
				<table class="table center">
					<tr>
						<th  style="width: 33%;">성적</th>
						<th style="width: 33%;">마지막에 공부한 내용</th>
						<td rowspan="2" style="width: 33%;"><a href="hiraganaSelectMethods?hiraganaLine=${hiraganaLine}" style="font-size: 2.5em;">${hiraganaLine} 공부하기</a></td>
					</tr>
					<tr>
						<td><a href="showGrade" style="font-size: 2.5em;"">성적보기</a></td>
						<td style="color: orange; font-size: 2em;">
							${hiraganaLine}
							<c:choose>
								<c:when test="${kind == 'hiraganaAssociativeQuiz'}">
									<img class="pointer" src="images/linkImages/hiraganaQuizAssociate.png" width="150" height="100" onclick="location.href='hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaAssociativeQuiz'">
								</c:when>
								<c:when test="${kind == 'hiraganaTextQuiz'}">
									<img class="pointer" src="images/linkImages/hiraganaQuizText.png" width="150" height="100" onclick="location.href='hiraganaAssociativeQuizForm?hiraganaLine=${hiraganaLine}&whatQuiz=hiraganaTextQuiz'">
								</c:when>
								<c:otherwise>
									<img class="pointer" src="images/linkImages/hiraganaQuizWord.png" width="150" height="100" onclick="location.href='hiraganaWordQuizForm?hiraganaLine=${hiraganaLine}'">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<p style="font-size: 2em;">아직 공부를 안했습니다.</p>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="tab2" style="display: none;">
		<table class="table center">
			<tr>
				<th style="width: 33%;">장바구니</th>
				<th style="width: 33%;">주문 상태</th>
				<td rowspan="2" style="width: 33%;"><img class="pointer" src="images/linkImages/orderListAll.png" onclick="location.href='orderListAll'" width="150" height="100"></td>
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
							<a href="orderList">발송을 기다리는 <span style='color: orange; font-size: 1.5em'>상품이 있습니다</span><br> →　주문내역 보기</a>
						</c:when>
						<c:otherwise>
							발송을 기다리는 상품이 없습니다.
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>
	<div id="tab3" style="display: none;">
		<table class="table center" style="width: 50%;">
			<c:choose>
				<c:when test="${board}">
					<tr>
						<th>내가 쓴 글</th><td rowspan="2"><img class="pointer" src="images/linkImages/goBoard.png" width="150" height="100" onclick="location.href='goMyBoard?memberId=${memberId}'"></td>
					</tr>
					<tr>
						<td>
							<a href="goMyBoard?memberId=${memberId}">내가 쓴 <span style='color: orange; font-size: 1.5em'>글이 있습니다</span><br> →　내가 쓴 글 보기</a>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th>내가 쓴 글</th><td rowspan="2"><img class="pointer" src="images/linkImages/goBoard.png" width="150" height="100" onclick="location.href='boardMain'"></td>
					</tr>
					<tr>
						<td>
							내가 쓴 글이 없습니다<br> →　<a href="boardMain">게시판으로 가기</a>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>
<%@ include file="../footer.jsp" %>