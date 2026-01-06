<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>도서목록</title>
</head>
<body>
	<div class="container py-4">
	<%@ include file="../resources/header.jsp" %>
		<div class="card text-center py-3"><h3>도서목록</h3>
			<c:choose>
				<c:when test="${pageContext.request.userPrincipal.name == 'admin'}">
                	<p class="text-end"><a href="/admin/product/productInsertForm" class="btn btn-secondary">도서등록</a>
           		</c:when>
           	</c:choose>
			<c:forEach var="dto" items="${list}">
				<table class="table table-striped table-bordered">
					<tr>
						<td rowspan="7"><img src="/bookimages/${dto.imgname}" style="width:250px; height:350px" /></td>
						<td>도서번호 : ${dto.pcode}</td>
					</tr>
					<tr>
						<td>${dto.pname}</td>
					</tr>
					<tr>
						<td>${dto.author}</td>
					</tr>
					<tr>
						<td>${dto.publisher} || ${dto.releasedate.substring(0,10)}  </td>
					</tr>
					<tr>
						<td>${dto.description.substring(0,60)}...</td>
					</tr>
					<tr>
						<td>${dto.price}원</td>
					</tr>
					<tr>
						<td><a href="/product/productDetail?pcode=${dto.pcode}" type="button" class="btn btn-primary">상세보기</a></td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>