// 관리자로써 로그인할 때 입력 사항을 확인 
function checkAdmin() {
	if(document.frm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.frm.id.focus();
		return false;
	} else if(document.frm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.frm.pwd.focus();
		return false;
	} else {
		return true;
	}
}


// 새 상품 등록시 입력 사항을 확인
function adminProductCheck() {
	if(document.frm.productName.value == "") {
		alert("상품명을 입력해 주세요.");
		document.frm.productName.focus();
		return false;
	} else if(document.frm.kind.value == "") {
		alert("상품의 종류를 입력해 주세요.");
		document.frm.kind.focus();
		return false;
	} else if(document.frm.price1.value == "") {
		alert("원가를 입력해 주세요.");
		document.frm.price1.focus();
		return false;
	} else if(document.frm.price2.value == "") {
		alert("판매가를 입력해 주세요.");
		document.frm.price2.focus();
		return false;
	} else if(document.frm.content.value == "") {
		alert("상품 설명을 입력해 주세요.");
		document.frm.content.focus();
		return false;
	} else {
		document.frm.price3.value = document.frm.price2.value - document.frm.price1.value;
		return true;
	}
}




/*상품 발송 처리*/ 
function goUpdateOrderDetail() {
	var count = 0;
	if(document.frm.odseq.length == undefined) {
		if(document.frm.odseq.checked == true) {
			count++;
		}
	} else {
		for(var i = 0 ; i < document.frm.odseq.length ; i++) {
			if(document.frm.odseq[i].checked == true) {
				count++;
			}
		}
	}
	
	if(count == 0) {
		alert("주문 처리 체크가 안되어 있습니다.");
	} else {
		document.frm.submit();
	}
}


/* 히라가나 단어 등록의 필요한 정보 입력 확인 */
function adminHiraganaWordCheck() {
	if(document.frm.hiraganaWordId.value == "") {
		alert("단어 아이디를 입력해 주세요.");
		document.frm.hiraganaWordId.focus();
		return false;
	} else if(document.frm.hiraganaWordKind.value == "") {
		alert("히라가나 단어를 입력해 주세요.");
		document.frm.hiraganaWordKind.focus();
		return false;
	} else if(document.frm.hiraganaLine.value == "") {
		alert("히라가나 행을 입력해 주세요.");
		document.frm.hiraganaLine.focus();
		return false;
	} else {
		return true;
	}
}

function deleteHiraganaWord() {
	document.frm.action= "deleteHiraganaWord";
	document.frm.submit();
}