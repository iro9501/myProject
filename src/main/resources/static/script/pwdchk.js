function pwdchk(){
	let chk = document.passwordCheckForm;
	let mpwd = chk.mpwd;
	let mpwd2 = chk.mpwd2;
	
	if (mpwd.value != mpwd2.value){
		alert("비밀번호 확인 미일치");
		mpwd.value == "";
		mpwd2.value == "";
		mpwd.focus();
		return false;
	}
}