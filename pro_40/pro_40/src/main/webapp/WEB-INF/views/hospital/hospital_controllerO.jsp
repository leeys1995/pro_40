<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
<head>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">

<style>
	.btn-write{float:left;}

	table{width:400px; margin:0 auto;}

</style>
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
			<a href="../hospital/hospital_view?idx=<%=idx%>"><img 
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
		<h2 class="sub-title">홈페이지 총 관리 페이지</h2>
		
		
		</div>
		 <table>
		 <tr>
		<td><a href="hospital_modify?idx=${hosp.idx }" class="btn-write">홈페이지 수정</a></td>
		<td><a href="reservation?idx=${hosp.idx }" class="btn-write">예약관리</a></td>
		<td><a href="/hospital_board/hospital_board_write?idx=${hosp.idx }" class="btn-write">공지사항 글쓰기</a></td>
		
		</tr>
		</table>
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