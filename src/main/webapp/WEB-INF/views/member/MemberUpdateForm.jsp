<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/resources/bootstrap.min.css" rel="stylesheet" />
<script src="/script/mvalidation.js"></script>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<div class="container py-4">
	<%@ include file="../resources/header.jsp" %>
		<div class="card text-center py-3"><h3>회원정보수정</h3>
			<form name="MemberInsert" method="post" action="/member/memberUpdate" class="need-validation">
				<table class="table table-striped table-bordered">
					<input type="hidden" name="mcode" value="${edit.mcode}">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="mid" value="${edit.mid}" readonly class="form-control is-invalid"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="mpwd" class="form-control is-invalid"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="mpwd2" class="form-control"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="mname" value="${edit.mname}" readonly class="form-control"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							남성 <input type="radio" name="mgender" value="남성" disabled="disabled" class="form-check-input" <c:if test="${edit.mgender == '남성'}">checked</c:if> > 
							여성 <input type="radio" name="mgender" value="여성" disabled="disabled" class="form-check-input" <c:if test="${edit.mgender == '여성'}">checked</c:if> >
						</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>
							<input type="text" name="mbirth1" maxlength="4" size="10" value="${mbirthA[0]}" readonly class="form-control-sm is-invalid">
							<select name="mbirth2" disabled="disabled" class="form-select-sm">
								<option value="01" <c:if test="${mbirthA[1] == '01'}">selected</c:if> >01</option>
								<option value="02" <c:if test="${mbirthA[1] == '02'}">selected</c:if> >02</option>
								<option value="03" <c:if test="${mbirthA[1] == '03'}">selected</c:if> >03</option>
								<option value="04" <c:if test="${mbirthA[1] == '04'}">selected</c:if> >04</option>
								<option value="05" <c:if test="${mbirthA[1] == '05'}">selected</c:if> >05</option>
								<option value="06" <c:if test="${mbirthA[1] == '06'}">selected</c:if> >06</option>
								<option value="07" <c:if test="${mbirthA[1] == '07'}">selected</c:if> >07</option>
								<option value="08" <c:if test="${mbirthA[1] == '08'}">selected</c:if> >08</option>
								<option value="09" <c:if test="${mbirthA[1] == '09'}">selected</c:if> >09</option>
								<option value="10" <c:if test="${mbirthA[1] == '10'}">selected</c:if> >10</option>
								<option value="11" <c:if test="${mbirthA[1] == '11'}">selected</c:if> >11</option>
								<option value="12" <c:if test="${mbirthA[1] == '12'}">selected</c:if> >12</option>
							</select>
							<input type="text" name="mbirth3" maxlength="2" size="10" value="${mbirthA[2].substring(0,2)}"  readonly class="form-control-sm is-invalid">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" name="memail1" value="${memailA[0]}" class="form-control-sm is-invalid"> @
							<select name="memail2" class="form-select-sm">
								<option value="">선택</option>
								<option value="naver.com" <c:if test="${memailA[1] == 'naver.com'}">selected</c:if> >naver.com</option>
								<option value="daum.net" <c:if test="${memailA[1] == 'daum.net'}">selected</c:if> >daum.net</option>
								<option value="google.com" <c:if test="${memailA[1] == 'google.com'}">selected</c:if> >google.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="mtel" value="${edit.mtel}" class="form-control is-invalid"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="maddr" value="${edit.maddr}" class="form-control is-invalid"></td>
					</tr>
				</table>
				<input type="button" value="가입" onclick="check()" class="btn btn-secondary">
			</form>
		</div>
	</div>
</body>
</html>