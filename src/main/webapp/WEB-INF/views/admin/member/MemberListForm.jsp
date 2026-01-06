<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<div class="container py-4">
	<%@ include file="../../resources/header.jsp" %>
		<div class="card text-center py-3"><h3>회원목록</h3>
			<table class="table table-striped table-bordered">
					<tr>
						<td>번호</td>
						<td>아이디</td>
						<td>이름</td>
						<td>전화</td>
						<td>이메일</td>
						<td>가입일</td>
					</tr>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.mcode}</td>
						<td><a href="/member/memberDetail?mcode=${dto.mcode}">${dto.mid}</a></td>
						<td>${dto.mname}</td>
						<td>${dto.mtel}</td>
						<td>${dto.memail}</td>
						<td>${dto.mregdate.substring(0,10)}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>