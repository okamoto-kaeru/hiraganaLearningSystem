function idCheck() {
	if(document.frm.memberId.value == "") {
		alert("아이디를 입력해 주세요.");
		document.frm.memberId.focus();
		return;
	}
	
	var url="idCheckForm?memberId=" + document.frm.memberId.value;
	window.open(url,
				"_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=250");
}


function join_save() {	
	if(document.frm.memberName.value == "") {
		alert("이름을 입력해 주세요.");
		document.frm.memberName.focus();
	} else if(document.frm.memberId.value == "") {
		alert("아이디를 입력해 주세요.");
		document.frm.memberId.focus();
	} else if(document.frm.memberIdChecked.value == "") {
		alert("아이디 중복체크를 해주세요.");
		document.frm.checkButton.focus();
	} else if(document.frm.memberIdChecked.value != document.frm.memberId.value) {
		alert("중복체크한 아이디하고 입력아이디가 일치하지 않습니다. 다시 중복체크를 해주세요.");
		document.frm.checkButton.focus();
	} else if(document.frm.pwd.value == "") {
		alert("암호를 입력해 주세요.");
		document.frm.pwd.focus();
	} else if(document.frm.pwdCheck.value != document.frm.pwd.value) {
		alert("암호가 일치하지 않습니다.");
		document.frm.pwd.focus();
	} else if(document.frm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.frm.email.focus();
	} else {
		document.frm.submit();
	}
}


// 우편번호 찾기
function postZip() {
	window.open("searchAddress",
				"_blank_1",
				"toolbar=no, menubar=no, scrollbars=no, resizable=no, width=800px, height=400px");
}


// id 찾기 윈도우 open
function findIdForm() {
	window.open("findIdForm",
					"_blank_1",
					"toolbar=no, menubar=no, scrollbars=no, resizable=no, width=500px, height=300px");
}

// Password 찾기 윈도우 open
function findPasswordForm() {
	window.open("findPasswordForm",
					"_blank_1",
					"toolbar=no, menubar=no, scrollbars=no, resizable=no, width=800px, height=400px");
}



// password변경
function goUpdatePassword() {
	if(document.frm.pwd.value == "") {
		alert("암호를 입력해 주세요.");
		document.frm.pwd.focus();
	} else if(document.frm.pwdCheck.value != document.frm.pwd.value) {
		alert("암호가 일치하지 않습니다.");
		document.frm.pwd.focus();
	} else {
		document.frm.submit();
	}
}


// 회원 정보 수정
function updateMemberInfo() {	
	if(document.frm.memberName.value == "") {
		alert("이름을 입력해 주세요.");
		document.frm.memberName.focus();
	} else if(document.frm.pwd.value == "") {
		alert("암호를 입력해 주세요.");
		document.frm.pwd.focus();
	} else if(document.frm.pwdCheck.value != document.frm.pwd.value) {
		alert("암호가 일치하지 않습니다.");
		document.frm.pwd.focus();
	} else if(document.frm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.frm.email.focus();
	} else {
		document.frm.submit();
	}
}