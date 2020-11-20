
// 카트에 있는 상품을 카트에서 삭제
function deleteFromCart() {
	var count = 0;
	// 장바구니에 상품이 없거나 한개일 경우 배열로 인식이 안되므로 배열의 길 값이 안들어감.
	if(document.frm.cseq.length == undefined) {
		// 1개 체크 됨
		if(document.frm.cseq.checked == true) {
			count++;
		}
	} else {
		for(var i = 0 ; i < document.frm.cseq.length ; i++) {
			if(document.frm.cseq[i].checked == true) {
				count++;
			}
		}	
	}
	if(count == 0) {
		alert("취소할 상품을 선택해 주세요.");
	} else {
		document.frm.action= "deleteCart";
		document.frm.submit();
	}	
}


// 장바구니에 있는 상품을 주문하기
function buy() {
	document.frm.action = "insertOrder";
	document.frm.submit();
}