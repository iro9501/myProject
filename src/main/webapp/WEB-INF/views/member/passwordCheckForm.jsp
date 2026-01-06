<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<script src="/script/pwdchk.js"></script>
<meta charset="UTF-8">
<title>비밀번호 확인 폼</title>
</head>
<body>
	<div class="container py-4">
		<div class="card text-center py-3"><h3>비밀번호 확인</h3>
			<p> 회원정보 수정과 회원 탈퇴를 위해 비밀번호를 입력하세요.
			<form name="passwordCheckForm" method="post" action="/member/passwordCheck" onsubmit="return pwdchk()">
				<input type="hidden" name="mcode" value="${dto.mcode}">
				<input type="hidden" name="memail" value="${dto.memail}">
				<input type="hidden" name="mbirth" value="${dto.mbirth}">
				<input type="hidden" name="mode" value="${mode}">
				<p> 비밀번호 : <input type="password" name="mpwd">
				<p> 비밀번호 확인 : <input type="password" name="mpwd2">
				<p> <input type="submit" value="전송" class="btn btn-secondary">
				<input type="button" value="뒤로가기" onclick="history.back()" class="btn btn-primary">
			</form>
		</div>
	</div>
	<c:if test="${not empty msg}">
		<p style="color:red;font-weight:bold">${msg}</p>
	</c:if>
</body>
</html>