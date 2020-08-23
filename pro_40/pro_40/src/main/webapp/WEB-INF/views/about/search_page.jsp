<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 2020/08/21 수정 -->

<!-- Header -->
<jsp:include page="../header.jsp" />

<head>
<meta charset="UTF-8">
<title>Search Page</title>
</head>
<body>

<div class="contain">
	<h2 class="sub-title">検索</h2>

	<!-- View -->
	<c:if test="${!empty list }">
		<ul class="sub-content">
			<!-- 병원 페이지 출력 -->
			<c:forEach var="search" items="${list }">
				<c:if test="${search.tblname eq 'hosp' }">
					<li class="li2">
						<a href="/hospital/hospHits?idx=${search.idx }">
							<img src="/resources/upload/hosp/hospital_photo/${search.h_photo }" alt="写真">
						</a>
						<p class="p26">
							<a href="/hospital/hospHits?idx=${search.idx }">
								<span class="gallery-title">${search.h_name }</span>
							</a>
						</p>
					</li>
				</c:if>
				<!-- 기업 페이지 출력 -->
				<c:if test="${search.tblname eq 'corp' }">
					<li class="li2">
						<a href="/corparation/corpHits?idx=${search.idx }">
							<img src="/resources/upload/hosp/hospital_photo/${search.h_photo }" alt="写真">
						</a>
						<p class="p26">
							<a href="/corparation/corpHits?idx=${search.idx }">
								<span class="gallery-title">${search.h_name }</span>
							</a>
						</p>
					</li>
				</c:if>
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
	
</div>
</body>

<!-- Footer -->
<%@ include file="../footer.jsp"%>