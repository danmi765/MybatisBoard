/* 비밀번호 변경 유효성 체크 */
function modiPasswordCheck(){
	
	if($("#userpswCheck").val()  == ""){
		alert("현재 비밀번호를 입력해 주세요.");
		modiPasswordFrm.userpswCheck.focus();
		return false;
	}else

	if($("#newUserpsw").val()  == ""){
		alert("새로운 비밀번호를 입력해 주세요.");
		modiPasswordFrm.newUserpsw.focus();
		return false;
	}else

	if($("#newUserpswCheck").val()  == ""){
		alert("새로운 비밀번호를 한번 더 입력해 주세요.");
		modiPasswordFrm.newUserpswCheck.focus();
		return false;
	}else{
	
		document.modiPswfrm.submit();
	}
}