<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
<header>
	<div class="topnav">
		<ul>
			<li><a href="login.do">로그인</a></li>
			<li><a href="member.do">회원가입</a></li>
			<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
		</ul>
	</div>
	<div class="navigation">
		<h1 class="logo">
			<a href="../hospital/hospital_view?idx=${idx }"><img height="100px"
				src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
		</h1>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="about.do">병원소개</a></li>
					<li><a href="about.do">진료안내</a></li>
					<li><a href="hospital_board?idx=${idx }&page=1">공지</a></li>
					<li><a href="/corparation/corparation">예약</a></li>


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
			<form name="input" method="post" action="hospital_reservation_write">
			
			 		<input type="hidden" name="idx" value="${idx }">
			 	
						
					<tr>
						<th>날짜</th>
						<td><input type="date" name="date">	
						</td>
					</tr>	
					<tr>
						<th>시간</th>
						<td><input type="text" name="time">※ 24시간 형식으로 작성해주세요 <br>
						(  EX)10:00,13:00, 15:00, 15:30 )
						</td>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="예약시간등록" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="뒤로가기" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>

<script>
	function send() {
		
		if(input.date.value=="") {
			alert("날짜를 선택해주세요");
			input.date.focus();
			return;
		}
		if(input.time.value=="") {
			alert("시간을 입력해주세요");
			input.time.focus();
			return;
		}
		
	
	
		alert("등록합니다.");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<div class="footer">
	<footer>
		<p>&copy; JANGSU. All &nbsp;&nbsp;&nbsp;Rights Reserved.</p>
	</footer>
	<!-- &copy; &nbsp; &gt; > &lt;< -->
</div>















