<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<script src="/script/mvalidation.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="container py-4">
	<%@ include file="../../resources/header.jsp" %>
		<div class="card text-center py-3"><h3>회원가입</h3>
			<form name="MemberInsert" method="post" action="/member/guest/memberInsert">
				<table class="table table-striped table-bordered">
					<tr>
						<td class="text-end">아이디</td>
						<td>
							<input type="text" name="mid" id="mid" class="form-control">
							<input type="button" value="중복검사" class="btn btn-secondary" onclick="window.open('/member/guest/idCheck?mid='+document.getElementById('mid').value)">
							<input type="hidden" name="countChk" id="countChk" value="false">
						</td>
					</tr>
					<tr>
						<td class="text-end">비밀번호</td>
						<td><input type="password" name="mpwd" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">비밀번호 확인</td>
						<td><input type="password" name="mpwd2" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">이름</td>
						<td><input type="text" name="mname" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">성별</td>
						<td>
							남성 <input type="radio" name="mgender" value="남성" checked class="form-check-input"> 
							여성 <input type="radio" name="mgender" value="여성" class="form-check-input">
						</td>
					</tr>
					<tr>
						<td class="text-end">생일</td>
						<td>
							<input type="text" name="mbirth1" maxlength="4" size="10" placeholder="생년(숫자4자)" class="form-control-sm">
							<select name="mbirth2" class="form-select-sm">
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<input type="text" name="mbirth3" maxlength="2" size="10" placeholder="생일(숫자2자)" class="form-control-sm">
						</td>
					</tr>
					<tr>
						<td class="text-end">이메일</td>
						<td>
							<input type="text" name="memail1" placeholder="이메일 주소입력" class="form-control-sm"> @
							<select name="memail2" class="form-select-sm">
								<option value="">선택</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="google.com">google.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="text-end">전화번호</td>
						<td><input type="text" name="mtel" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">주소</td>
						<td><input type="text" name="maddr" class="form-control"></td>
					</tr>
				</table>
				<input type="button" value="가입" onclick="check()" class="btn btn-secondary">
			</form>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			let mid = document.getElementById('mid');
			let countChk= document.getElementById('countChk');
			  // mid값이 바뀔 때마다 실행
			mid.addEventListener('input', () => {
			  // countChk 필드에 현재 입력값 반영 
				countChk.value = "false";
			});
		});
	</script>
</body>
</html>