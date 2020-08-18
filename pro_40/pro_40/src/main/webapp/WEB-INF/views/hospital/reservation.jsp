<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
					<li><a href="../hospital/hospital_reservation?idx=<%=idx%>">예약</a></li>
					<li><a href="../hospital/hospital_modify?idx=<%=idx%>">홈페이지 <br> 수정</a></li>
					<li><a href="../hospital/reservation?idx=<%=idx%>">예약관리</a></li>

				</ul>
			</nav>
		</div>
	</div>
</header>
<style>
	.btn-write{float:left;}

	table{width:400px; margin:0 auto;}

</style>
<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">예약 시스템</h2>
		
		
		</div>
		 <table>
		 <tr>
		<td><a href="hospital_reservationList_ok?idx=${idx }" class="btn-write">예약자 확인</a></td>
		<td><a href="hospital_reservationList?idx=${idx }" class="btn-write">예약 시간 관리</a></td>
		</tr>
		</table>
</div>


<%@ include file="../footer.jsp"%>