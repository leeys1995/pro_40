<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet" type="text/css">

<style>
	.container {width:1100px; margin:0 auto;}

.text_center {text-align:center; margin-top:100px;} 
.text_center p {font-size:40px; color:#000; line-height:1.4;}
.text_center .support_text {color:#0067b3; font-size:25px;}


.greeting_cont {overflow:hidden;}
.greeting_cont .text_wrap {line-height:1.8; letter-spacing:-1px;}
.greeting_cont .text_wrap p {margin-bottom:27px;}
.greeting_cont .text_wrap .sign {font-size:18px; padding-top:72px;}
.footer {clear:both;background:#42464d; padding-top:80px; padding-bottom:65px; margin-top:60px;}
.footer .address {font-style:normal; color:#ababb1; margin-bottom:20px;}
.footer .address .title {font-size:14px; margin-bottom:8px; color:#fff;}
.footer  .copyright {color:#fff;}

</style>
  
<title>Insert title here</title>
</head>
<body>
 <!-- 
 웹문서 만들기 기본 공식
 1. 요소를 어떻게 묶을 것인가? 그룹만들기
 2. 그룹안에 적절한 태그 사용
 3. class 이름 붙이고 css 적용
 -->
	

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
				<a href="hospital_view?idx=${hosp.idx }"><img
						src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
				</div>
				
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="hospital_about?idx=${hosp.idx }">병원소개</a></li>
							<li><a href="hospital_guidance?idx=${hosp.idx }">진료안내</a></li>
							<li><a href="/hospital_board/hospital_board?idx=${hosp.idx }&page=1">공지</a></li>
							<li><a href="hospital_reservation?idx=${hosp.idx }">예약</a></li>							
							<li><a href="hospital_controller?idx=${hosp.idx }">홈페이지 <br> 관리</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>

	<div class="line"></div>

	<div class="sitewrap">
		<span class="fa fa-close" id="close" style="cursor: pointer"></span>
		<div class="inner">
			<span class="map">홈페이지소개</span> <span class="map">공지사항</span> <span
				class="map">병원</span> <span class="map">기업</span> <span class="map">검색</span>
			<span class="map">회원가입</span> <span class="map">로그인</span>
		</div>
	</div>

	<div class="container">
		<div class="text_center">
				<p><span class="support_text">${hosp.h_name }</span><br/>
<strong>진료 안내</strong></p>
				<span class="col_bar"></span>
		</div>
		<div class="greeting_cont">
			<img src="/resources/upload/hosp/doctor_photo/${hosp.d_photo }" alt="" style="float:left; padding:0px 40px; width:500px; height:500px;">
			<div class="text_wrap"><p>${hosp.d_mager }</p></div>
		</div>
	</div>
	<!-- end contents -->
	
	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
	</script>
	

<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">병원</p>
				<br>
				<p>주소 : ${hosp.h_addr1 } ${hosp.h_addr2 }/고객센터: ${hosp.h_tel } 	사업자등록번호: ${hosp.h_code }</p>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights reserved.</p>
		</div>
</footer>
</body>
</html>