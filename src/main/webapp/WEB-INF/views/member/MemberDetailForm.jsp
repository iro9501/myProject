<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>회원 상세정보</title>
</head>
<body>
	<div class="container py-4">
	<%@ include file="../resources/header.jsp" %>
		<div class="card text-center py-3">
			<table class="table table-striped table-bordered">
				<tr>
					<td>번호</td>
					<td>${detail.mcode}</td>
					<td>가입일</td>
					<td>${detail.mregdate}</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${detail.mid}</td>
					<td>이메일</td>
					<td>${detail.memail}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${detail.mname}</td>
					<td>성별</td>
					<td>${detail.mgender}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${detail.mbirth.substring(0,10)}</td>
					<td>연락처</td>
					<td>${detail.mtel}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="3">${detail.maddr}</td>
				</tr>
			</table>
		</div>
		<a href="/member/passwordCheckForm?mcode=${detail.mcode}&mode=update" type="button" class="btn btn-primary">정보수정</a>
		<a href="/member/passwordCheckForm?mcode=${detail.mcode}&mode=delete" type="button" class="btn btn-danger">탈퇴</a>
	</div>
</body>
</html>