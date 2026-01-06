<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>관리자 메뉴</title>
</head>
<body>
	<header class="p-3 m-4 border-bottom">
		<div class="d-flex justify-content-between">
			<div>
				<a href="/" type="button" class="btn btn-sm btn-secondary">Home</a>
			</div>
		<c:choose>
		    <c:when test="${not empty pageContext.request.userPrincipal}">
		        <c:choose>
		            <c:when test="${pageContext.request.userPrincipal.name == 'admin'}">
		                <div>
							<a href="/logout" type="button" class="btn btn-sm">로그아웃</a>
							<a href="/admin/member/memberList" type="button" class="btn btn-sm btn-success">회원목록</a>
							<a href="/product/productList" type="button" class="btn btn-sm btn-primary">도서목록</a>
						</div>
		            </c:when>
		            <c:otherwise>
		                <div>
							<a href="/logout" type="button" class="btn btn-sm">로그아웃</a>
							<a href="/member/myDetail?mid=${pageContext.request.userPrincipal.name}" type="button" class="btn btn-sm btn-success">내정보</a>
							<a href="/product/productList" type="button" class="btn btn-sm btn-primary">도서목록</a>
						</div>
		            </c:otherwise>
       			</c:choose>
			</c:when>
			<c:otherwise>
				<div>
					<a href="/loginForm" type="button" class="btn btn-sm btn-success">로그인</a>
			        <a href="/guest/writeForm" type="button" class="btn btn-sm btn-primary">회원가입</a>
		        </div>
			</c:otherwise>
		</c:choose>
		</div>
	</header>
</body>
</html>