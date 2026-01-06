<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>도서 상세</title>
</head>
<body>
	<div class="container py-4">
	<%@ include file="../resources/header.jsp" %>
		<div class="card text-center py-3"><h3>도서 상세</h3>
			<table class="table table-striped table-bordered">
				<tr>
					<td rowspan="5"><img src="/bookimages/${detail.imgname}" style="width:250px; height:350px" /></td>
					<td>도서번호</td>
					<td>${detail.pcode}</td>
					<td>분류</td>
					<td>${detail.category}</td>
					<td>등록일</td>
					<td>${detail.pregdate.substring(0,10)}</td>
				</tr>
				<tr>
					<td>도서명</td>
					<td colspan="3">${detail.pname}</td>
					<td>저자</td>
					<td>${detail.author}</td>
				</tr>
				<tr>
					<td>출판사</td>
					<td>${detail.publisher}</td>
					<td>출판일</td>
					<td>${detail.releasedate.substring(0,10)}</td>
					<td>상태</td>
					<td>${detail.condition}</td>
				</tr>
				<tr>
					<td colspan="6">${detail.description}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${detail.price}원</td>
					<td>재고수</td>
					<td>${detail.stock}</td>
					<td colspan="2">
						<c:choose>
				            <c:when test="${pageContext.request.userPrincipal.name == 'admin'}">
				                <a href="/admin/product/productUpdateForm?pcode=${detail.pcode}" type="button" class="btn btn-primary">수정</a> / 
								<a href="/admin/product/productDelete?pcode=${detail.pcode}" type="button" class="btn btn-danger">삭제</a>
				            </c:when>
				
				            <c:otherwise>
				                <a href="#" type="button" class="btn btn-primary">주문하기</a>
				            </c:otherwise>
				        </c:choose>
					</td>
				</tr>
			</table>
		</div>
		<a href="/product/productList" type="button" class="btn btn-secondary">도서목록으로</a>
	</div>
</body>
</html>