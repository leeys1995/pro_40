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
					alert("情報修正に成功しました。");
					location.replace("/");
				</script>
		</c:when>

		<c:when test="${row==0 }">
			<script>
					alert("修正失敗 \n もう一度ご確認ください。.....");
					history.back();
				</script>
		</c:when>
	</c:choose>

</body>
</html>