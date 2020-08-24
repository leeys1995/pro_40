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
			<li><a href="/" ">홈으로</a>
		</ul>
	</div>
	<div class="navigation">
		<div style="height:100px; width:200px;">
			<a href="../hospital/hospital_view?idx=${idx }"><img 
				src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
		</div>
		<div class="nav">
			<nav>
				<ul class="navi">
				<li><a href="hospital_about?idx=<%=idx%>">병원소개</a></li>
							<li><a href="hospital_guidance?idx=<%=idx%>">진료안내</a></li>
							<li><a href="/hospital_board/hospital_board?idx=<%=idx%>&page=1">공지</a></li>
												
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
</body>
<script>
	
	
	function home(){
		
		history.back();
	}
</script>

<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">병원</p>
				<p>주소 : ${hosp.h_addr1 } ${hosp.h_addr2 }/고객센터: ${hosp.h_tel } 	사업자등록번호: ${hosp.h_code }</p><br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights reserved.</p>
		</div>
</footer>















