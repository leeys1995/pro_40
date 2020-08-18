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
					<li><a href="../hospital/hospital_reservation?idx=<%=idx%>">예약</a></li>
					<li><a href="../hospital/hospital_modify?idx=<%=idx%>">홈페이지 <br> 수정</a></li>
					<li><a href="../hospital/reservation?idx=<%=idx%>">예약관리</a></li>

				</ul>
			</nav>
		</div>
	</div>
</header>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 갤러리</h2>
	</div>
	
	<div class="write-form">
		<table summery="갤러리 글쓰기 테이블 입니다">
			<caption class="readonly">갤러리 입력폼</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
					
					
					<tr>
						<th>날자</th>
						<td>
							${res.year }년 ${res.month }월 ${res.day }일
						</td>
					</tr>
					
					<tr>
						<th>시간</th>
						<td>		
						 ${res.reservation_time }
						
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${res.name }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${res.tel }</td>
					</tr>	
					
					<tr>
						<th>진료희망사항</th>
						<td><textarea name="disease" readonly >${res.disease }</textarea></td>
					</tr>	
					

					
					<tr>
						<td colspan="2">
						
							<a href="javascript:home()"><input type="button" value="뒤로가기" class="btn-reset"></a>
						</td>
					</tr>
					
				
			</tbody>
		</table>
	</div>
		
</div>

<script>
	
	
	function home(){
		
		history.back();
	}
</script>

<%@ include file="../footer.jsp" %>















