<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<script src="/script/pvalidation.js"></script>
<meta charset="UTF-8">
<title>도서등록</title>
</head>
<body>
	<div class="container py-4">
	<%@ include file="../../resources/header.jsp" %>
		<div class="card text-center py-3"><h3>도서등록</h3>
			<form name="productInsert" method="post" action="/admin/product/productInsert" enctype="multipart/form-data" onsubmit="return check()">
				<input type="hidden" name="originname" value="">
				<table class="table table-striped table-bordered">
					<tr>
						<td class="text-end">도서명</td>
						<td><input type="text" name="pname" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">가격</td>
						<td><input type="text" name="price" maxlength="6" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">저자</td>
						<td><input type="text" name="author" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">출판사</td>
						<td><input type="text" name="publisher" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">출판일</td>
						<td><input type="text" name="releasedate" maxlength="10" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">상세정보</td>
						<td><textarea name="description" cols="50" rows="2" class="form-control"></textarea></td>
					</tr>
					<tr>
						<td class="text-end">분류</td>
						<td><input type="text" name="category" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">재고수</td>
						<td><input type="text" name="stock" maxlength="6" class="form-control"></td>
					</tr>
					<tr>
						<td class="text-end">상태</td>
						<td>
							<input type="radio" name="condition" value="신규도서" checked class="form-check-input"> 신규도서
							<input type="radio" name="condition" value="중고도서" class="form-check-input"> 중고도서
							<input type="radio" name="condition" value="E-Book" class="form-check-input"> E-Book
						</td>
					</tr>
					<tr>
						<td class="text-end">이미지</td>
						<td><input type="file" name="file" class="form-control"></td>
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