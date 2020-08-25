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
					alert("ログインに成功 しました。${user.userid}様");
					location.replace("/");
				</script>
		</c:when>

		<c:when test="${row==0 }">
			<script>
					alert("IDまたはPWを確認して, \n もう一度ログインしてください。");
					history.back();
				</script>
		</c:when>
	</c:choose>

</body>
</html>