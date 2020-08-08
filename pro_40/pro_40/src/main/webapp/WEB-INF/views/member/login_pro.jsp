<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${row==1 }">

			<script>
					alert("로그인 성공했습니다.${user.userid}님 환형합니다.");
					location.replace("/");
				</script>
		</c:when>

		<c:when test="${row==0 }">
			<script>
					alert("ID 또는 PW를 확인하고, \n 다시 로그인 해주세요.");
					history.back();
				</script>
		</c:when>
	</c:choose>

</body>
</html>