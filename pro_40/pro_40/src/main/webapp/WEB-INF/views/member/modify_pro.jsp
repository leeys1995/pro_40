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
					alert("정보 수정에 성공 했습니다.");
					location.replace("/");
				</script>
		</c:when>

		<c:when test="${row==0 }">
			<script>
					alert("수정실패 \n 다시시도해 주세요.....");
					history.back();
				</script>
		</c:when>
	</c:choose>

</body>
</html>