<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<script src="/script/pvalidation.js"></script>
<meta charset="UTF-8">
<title>도서 정보 수정</title>
</head>
<body>
	<div class="container py-4">
	<%@ include file="../../resources/header.jsp" %>
		<div class="card text-center py-3"><h3>등록도서 정보수정</h3>
			<form name="productInsert" method="post" action="/admin/product/productUpdate" enctype="multipart/form-data">
				<input type="hidden" name="pcode" value="${detail.pcode}">
				<table class="table table-striped table-bordered">
					<tr>
						<td>도서명</td>
						<td><input type="text" name="pname" class="form-control" value="${detail.pname}"></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input type="text" name="price" maxlength="6" class="form-control" value="${detail.price}"></td>
					</tr>
					<tr>
						<td>저자</td>
						<td><input type="text" name="author" class="form-control" value="${detail.author}"></td>
					</tr>
					<tr>
						<td>출판사</td>
						<td><input type="text" name="publisher" class="form-control" value="${detail.publisher}"></td>
					</tr>
					<tr>
						<td>출판일</td>
						<td><input type="text" name="releasedate" maxlength="10" class="form-control" value="${detail.releasedate.substring(0,10)}"></td>
					</tr>
					<tr>
						<td>상세정보</td>
						<td><textarea name="description" cols="50" rows="2" class="form-control">${detail.description}</textarea></td>
					</tr>
					<tr>
						<td>분류</td>
						<td><input type="text" name="category" value="${detail.category}" class="form-control"></td>
					</tr>
					<tr>
						<td>재고수</td>
						<td><input type="text" name="stock" maxlength="6" value="${detail.stock}" class="form-control"></td>
					</tr>
					<tr>
						<td>상태</td>
						<td>
							<input type="radio" name="condition" value="신규도서" class="form-check-input" <c:if test="${detail.condition == '신규도서'}">checked</c:if>> 신규도서
							<input type="radio" name="condition" value="중고도서" class="form-check-input" <c:if test="${detail.condition == '중고도서'}">checked</c:if>> 중고도서
							<input type="radio" name="condition" value="E-Book" class="form-check-input" <c:if test="${detail.condition == 'E-Book'}">checked</c:if>> E-Book
						</td>
					</tr>
					<tr>
						<td>이미지</td>
						<td>
							<input type="file" name="file" class="form-control">
							<input type="hidden" name="originname" value="${detail.imgname}">
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="등록" class="btn btn-secondary"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>