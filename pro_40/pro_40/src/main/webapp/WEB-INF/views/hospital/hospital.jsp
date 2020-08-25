<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../header.jsp"%>
<style>
.sub-content {
	width: 1200px;
	
}

.sub-content1 {
	width: 1200px;
	height: 300px;
}

.sub-content .li2 {
	width: 350px;
	height: 300px;
	padding: 20px;
}


</style>
<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">病院</h2>
		<div class="sub-search">
			<form name="input" method="post" action="hospital?page=1">
				<select name="search" class="sel">
					<option value="h_name"
						<c:if test="${pageVO.search=='h_name'}">selected</c:if>>病院名</option>
					<option value="h_addr1"
						<c:if test="${pageVO.search=='h_addr1'}">selected</c:if>>地域</option>
					<option value="d_mager"
						<c:if test="${pageVO.search=='d_mager'}">selected</c:if>>診療科目</option>
				</select>
				<c:if test="${empty pageVO.key }">
					<input type="text" name="key" class="text">
				</c:if>
				<c:if test="${!empty pageVO.key }">
					<input type="text" name="key" class="text" value="${pageVO.key }">
				</c:if>
				<a href="javascript:send()"><input type="button" value="検索"
					class="btn"></a>
			</form>
		</div>
	</div>
	<c:if test="${!empty list }">
		<ul class="sub-content">

			<c:forEach var="hosp" items="${list }">
				<li class="li2"><a href="hospHits?idx=${hosp.idx }"><img
						src="/resources/upload/hosp/hospital_photo/${hosp.h_photo }"
						alt="모집사진"></a>
					<p class="p26">
						<a href="hospHits?idx=${hosp.idx }"> <span
							class="gallery-title">${hosp.h_name }</span>
						</a> <span class="hit">조회수 : ${hosp.h_readcnt }</span>
					</p></li>
			</c:forEach>

		</ul>
	</c:if>
	<c:if test="${empty list }">
		<ul class="sub-content1">

			<li class="li2"> <img src="/resources/images/littledeep_hospital_file_style1.png">
				データが存在できません。
			</li>
		</ul>
	</c:if>

	<div class="paging">
		<ul>
			<li style="padding: 0 30px;"><a href="${prev }"><img
					src="/images/i_prev.gif"></a></li>
			<li><a href="#">${page }</a></li>
			<li style="padding: 0 30px;"><a href="${next }"><img
					src="/images/i_next.gif"></a></li>
		</ul>
		<c:if test="${!empty user }">
		<a href="hospital_write" class="btn-write">書く</a>
		</c:if>
	</div>

</div>

<script>
	function send() {
		if (input.key.value == "") {
			alert("検索する単語を入力してください。");
			input.cont.focus;
			return;
		}

		input.submit();
	}
</script>

<%@ include file="../footer.jsp"%>















