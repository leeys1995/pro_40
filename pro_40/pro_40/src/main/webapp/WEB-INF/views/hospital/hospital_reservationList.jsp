<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
<header>
	<div class="topnav">
		<ul>
			<li><a href="../member/login">로그인</a></li>
			<li><a href="../member/insert">회원가입</a></li>
			<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
		</ul>
	</div>
	<div class="navigation">
		<h1 class="logo">
			<a href="../hospital/hospital_view?idx=<%=idx%>"><img height="100px"
				src="/resources/upload/hosp/banner/${h_banner }" alt="모집사진"></a>
		</h1>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="about.do">병원소개</a></li>
					<li><a href="about.do">진료안내</a></li>
					<li><a href="hospital_board?idx=<%=idx%>&page=1">공지</a></li>
					<li><a href="hospital_board_cal?idx=<%=idx%>">예약</a></li>
					<li><a href="../hospital/hospital_modify?idx=<%=idx%>">홈페이지 <br> 수정</a></li>
					<li><a href="../hospital/reservation?idx=<%=idx%>">예약관리</a></li>

				</ul>
			</nav>
		</div>
	</div>
</header>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">예약관리 시스템</h2>
		
	</div>

	<div class="content-body">
		<table class="qatable">
			<caption class="readonly">공지사항 표</caption>
			<colgroup>
				<col width="6%">
				<col width="48%">
				<col width="10%">
				<col width="15%">
				<col width="11%">
				<col width="10%">
			</colgroup>
			<tbody>
				<tr>
					<th>번호</th>
					<th>년도</th>
					<th>월</th>
					<th>일</th>
					<th>시간</th>
					<th>삭제</th>
				</tr>

				
				<c:if test="${!empty list }">
				 <c:forEach items="${list }" var="res">
						<tr>
						<td>${listcount}</td>
						<td>${res.year }</td>
						<td>${res.month }</td>
						<td>${res.day }</td>
						<td>${res.reservation_time}</td>
						<td><a href="hospitalReservationDelete?idx=${res.idx }&year=${res.year}&month=${res.month}&
						day=${res.day}&reservation_time=${res.reservation_time}" class="btn-write">삭제</a></td>
					</tr>
					<c:set var="listcount" value="${listcount-1}" />
				</c:forEach>
				</c:if>
				

				<c:if test="${empty list }">
						<tr>
						<td colspan="5">데이터가 존재하지 않습니다.</td>
					
					</tr>

				</c:if>
			</tbody>
		</table>
	</div>


	<div class="paging">
		<ul>
			
			<li><div>${listpage }</div></li>
			
		</ul>



		<a href="hospital_reservation_write?idx=<%=idx %>" class="btn-write">예약시간추가</a>



	</div>

</div>

<div class="footer">
	<footer>
		<p>&copy; JANGSU. All &nbsp;&nbsp;&nbsp;Rights Reserved.</p>
	</footer>
	<!-- &copy; &nbsp; &gt; > &lt;< -->
</div>



















