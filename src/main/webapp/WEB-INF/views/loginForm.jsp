<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
		
	<div class="container py-4">
		<div class="card text-center py-3 col-md-4">
			<sec:authorize access="isAuthenticated()">  <!-- 로그인 인증 부분의 간략한 처리방법 -->
			<a href="/logout">로그아웃</a>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
			<h3>로그인</h3>
			<form name="loginForm" method="post" action="/j_spring_security_check">
				<table class="table table-striped table-bordered">
					<tr>
						<td>아이디 : </td>
						<td><input type="text" name="j_username"></td>
					</tr>
					<tr>
						<td>비밀번호 : </td>
						<td><input type="password" name="j_password"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="로그인">
							<input type="button" value="회원가입" onclick="location.href='/member/guest/memberInsertForm'">
						</td>
					</tr>
				</table>
			</form>
			</sec:authorize>
		</div>
	</div>
</body>
</html>