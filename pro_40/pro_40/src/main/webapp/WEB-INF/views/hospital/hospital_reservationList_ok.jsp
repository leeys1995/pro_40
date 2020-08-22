<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
<head>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
</head>

<body>

<div class="header">
<header>
	<div class="topnav">
		<ul>
			<li><a href="../member/login">로그인</a></li>
			<li><a href="../member/insert">회원가입</a></li>
			<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
		</ul>
	</div>
	<div class="navigation">
			<div style="height:100px; width:200px;">
			<a href="../hospital/hospital_view?idx=<%=idx%>"><img
				src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
		</div>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="hospital_about?idx=<%=idx%>">병원소개</a></li>
							<li><a href="hospital_guidance?idx=<%=idx%>">진료안내</a></li>
							<li><a href="/hospital_board/hospital_board?idx=<%=idx%>&page=1">공지</a></li>
							<li><a href="hospital_reservation?idx=<%=idx%>">예약</a></li>							
							<li><a href="hospital_modify?idx=<%=idx%>">홈페이지 <br> 수정</a></li>
							<li><a href="reservation?idx=<%=idx%>">예약관리</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
</div>
<div class="line"></div>
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
					<th>성명</th>
					<th>년도</th>
					<th>월</th>
					<th>날짜</th>
					<th>시간</th>
					
				</tr>

				
				<c:if test="${!empty list }">
				 <c:forEach items="${list }" var="res">
						<tr>
						<td>${listcount }</td>
						<td><a href="hospital_reservationPro2?idx=${res.idx }&year=${res.year}&month=${res.month}
						&day=${res.day}&reservation_time=${res.reservation_time}">${res.name }</a></td>
						<td>${res.year }</td>
						<td>${res.month}</td>
						<td>${res.day}</td>
						<td>${res.reservation_time}</td>
					
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



	</div>

</div>
</body>
<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">병원</p>
				<p>주소 : ${hosp.h_addr1 } ${hosp.h_addr2 }/고객센터: ${hosp.h_tel } 	사업자등록번호: ${hosp.h_code }</p><br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights reserved.</p>
		</div>
</footer>


















