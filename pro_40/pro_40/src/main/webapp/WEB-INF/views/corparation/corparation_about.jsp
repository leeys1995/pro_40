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
					<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h1 class="logo">
					<a href="corparation_view?idx=${corp.idx }"><img height="100px"
						src="/resources/upload/corp/banner/${corp.c_banner }" alt="모집사진"></a>
				</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="corparation_about?idx=${corp.idx }">기업소개</a></li>
							<li><a href="corparation_guidance?idx=${corp.idx }">제품소개</a></li>
							<li><a href="/corparation_board/corparation_board?idx=${corp.idx }&page=1">공지</a></li>
							<li><a href="/corparation_board/product?idx=${corp.idx }&page=1">제품문의</a></li>							
							<li><a href="corparation_modify?idx=${corp.idx }">홈페이지 <br> 수정</a></li>


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
				<p><span class="support_text">${corp.c_name }은</span><br/>
<strong>${corp.c_history }</strong></p>
				<span class="col_bar"></span>
		</div>
		<div class="greeting_cont">
			<img src="/resources/upload/hosp/hospital_photo/${corp.c_photo }" alt="" style="float:left; padding:0px 40px; width:500px; height:500px;">
			<div class="text_wrap"><p>
				${corp.p_intro }
			</p><strong class="sign">${corp.c_name } &nbsp 기 업 장</strong></div>
		</div>
	</div>
	<!-- end contents -->
	<br>
	<br>
	
	
	<div class="container clearfix">
			<address class="address">
				<p class="title">오시는 길</p>
				 ${corp.c_come }
			</address>
		
		</div>
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
				<p class="title">기업</p>
				주소 : ${corp.c_addr1 } ${corp.c_addr2 }/고객센터: ${corp.c_tel } 	사업자등록번호: ${corp.c_code }
			</address>
			<p class="copyright">Copyright &copy ${corp.c_name }. All rights reserved.</p>
		</div>
</footer>
</body>
</html>