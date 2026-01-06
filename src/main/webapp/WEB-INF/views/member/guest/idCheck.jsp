<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function chkComplete(mid, countChk){
		opener.document.getElementById("mid").value = mid;
		opener.document.getElementById("countChk").value = "true";
		window.close();
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${countChk}">
			<form name="idchk" method="post" action="">
				<input type="hidden" name="mid" value="${mid }">
				<input type="hidden" name="countChk" value="${countChk}">
				<p>사용 가능한 아이디입니다.</p>
				<input type="button" value="입력한 아이디 사용하기" onclick="chkComplete('${mid}','true')">
			</form>
	    </c:when>
	    <c:otherwise>
	        <script>alert("중복된 아이디"); window.close();</script>
	    </c:otherwise>
	</c:choose>
	
</body>
</html>