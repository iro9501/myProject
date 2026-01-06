// 제출 시 유효성 검사 함수
function check(){
	let MemIn = document.MemberInsert;
	let mid = MemIn.mid;
	let countChk = MemIn.countChk;
	let mpwd = MemIn.mpwd;
	let mpwd2 = MemIn.mpwd2;
	let mname = MemIn.mname;
	let mbirth1 = MemIn.mbirth1;
	let mbirth3 = MemIn.mbirth3;
	let memail1 = MemIn.memail1;
	let memail2 = MemIn.memail2;
	let mtel = MemIn.mtel;
	let maddr = MemIn.maddr;
	
	
	let reg_mpwd = /^[A-Za-z0-9]{8,20}$/;
	let reg_mname = /^[가-힣]+$/;
	let reg_mbirth = /^\d+$/;
	let reg_mtel = /^0\d{1,2}-\d{3,4}-\d{4}$/
	
	if (mid.value == ""){
		alert("아이디 입력 필요");
		mid.select();
		return false;
	}
	
	if (countChk.value == "false"){
		alert("아이디 중복검사 필요");
		mid.select();
		return false;
	}
	
	if (mpwd.value != mpwd2.value){
		alert("비밀번호 확인");
		mpwd.value="";
		mpwd2.value="";
		mpwd.focus();
		return false;
	}
	
	if (!mpwd.value.match(reg_mpwd)){
		alert("비밀번호는 8~20자리 영문 및 숫자로 입력");
		mpwd.value="";
		mpwd2.value="";
		mpwd.focus();
		return false;
	}
	
	if ((!mname.value.match(reg_mname))){
		alert("이름은 한글로 입력");
		mname.select();
		return false;
	}
	
	if (mbirth1.value.length != 4 || !mbirth1.value.match(reg_mbirth)){
		alert("생년은 4자리 숫자로 입력");
		mbirth1.select();
		return false;
	}
	
	if (mbirth3.value.length != 2 || !mbirth3.value.match(reg_mbirth)){
		alert("생일은 2자리 숫자로 입력");
		mbirth3.select();
		return false;
	}
	
	if (memail2.value == "" || memail1.value == ""){
		alert("이메일 주소 입력");
		memail1.select();
		return false;
	}
	
	if (!mtel.value.match(reg_mtel)){
		alert("전화번호를 하이폰을 포함해서 입력");
		mtel.select();
		return false;
	}
	
	if (maddr.value == ""){
		alert("주소 입력");
		maddr.select();
		return false;
	}
	
	MemIn.submit();
}