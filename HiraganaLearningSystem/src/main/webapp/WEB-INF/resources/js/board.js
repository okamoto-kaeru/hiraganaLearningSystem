function goWrite() {
	if(document.frm.title.value == "") {
		alert("제목을 입력해 주세요.");
		document.frm.title.focus();
		return false;
	} else if(document.frm.content.value == "") {
		alert("내용을 입력해 주세요.");
		document.frm.content.focus();
		return false;
	} else {
		return true;
	}
}


// 댓글을 입력 했는지 확인 후 저장
function repCheck() {
	if(document.frm.replyContent.value == "") {
		alert("댓글 내용을 입력해 주세요.");
		document.frm.replyContent.focus();
		return false;
	} else {
		return true;
	}
}


// 게시글 수정 내용을 입력했는지 확인 후 수정 처리
function goUpdateBoard() {
	if(document.frm.content.value == "") {
		alert("내용을 입력해 주세요.");
		ducumant.frm.content.focus();
	} else {
		document.frm.action="updateBoard";
		document.frm.submit();
	}
}